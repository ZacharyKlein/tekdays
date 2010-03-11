import org.springframework.security.providers.UsernamePasswordAuthenticationToken as AuthToken
import org.springframework.security.context.SecurityContextHolder as SCH
import grails.converters.JSON

class SponsorController {

    def authenticateService
    def daoAuthenticationProvider
    def linkService
    def tagService
    def tekUserService
    def fileUploadService

    def index = { redirect action:"list", params:params }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ sponsorInstanceList: Sponsor.list( params ), sponsorInstanceTotal: Sponsor.count() ]
    }

    def show = {

        def sponsorInstance = Sponsor?.findBySlug( params.slug )
        def user = TekUser.get(authenticateService.userDomain()?.id)
        def organizerEvents
        if(user)
          organizerEvents = TekEvent.findAllByOrganizer(user)

        if(!sponsorInstance) {
            flash.message = "Sponsor not found with ${params.slug}"
            redirect(action:list)
        }
        else {
            [ sponsorInstance : sponsorInstance, organizerEvents : organizerEvents ]
        }
    }

    def delete = {
        def sponsorInstance = Sponsor.get( params.id )
        if(sponsorInstance) {
            try {
                sponsorInstance.delete(flush:true)
                flash.message = "Sponsor ${params.id} deleted"
                redirect(action:"list")
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Sponsor ${params.id} could not be deleted"
                redirect(action:"show",id:params.id)
            }
        }
        else {
            flash.message = "Sponsor not found with id ${params.id}"
            redirect(action:"list")
        }
    }

    def edit = {
        println "entering edit action...."
        println "params in sponsor edit are " + params
        def sponsorInstance = Sponsor.findBySlug( params.slug )

        if(!sponsorInstance) {
            flash.message = "Sponsor not found with id ${params.slug}"
            redirect action:'list'
        }
        else {
            return [ sponsorInstance : sponsorInstance ]
        }
    }

    def update = {
        println "entering update action $params"
        def sponsorInstance = Sponsor.get( params.id )
        if(sponsorInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(sponsorInstance.version > version) {

                    sponsorInstance.errors.rejectValue("version", "sponsor.optimistic.locking.failure", "Another user has updated this Sponsor while you were editing.")

                    render view:'edit', model:[sponsorInstance:sponsorInstance]
                    return
                }
            }

            sponsorInstance.properties = params

            if(params.logo){
                fileUploadService.uploadSponsorLogo(params.logo, sponsorInstance.id)
            }
            if(params.banner){
                fileUploadService.uploadSponsorBanner(params.banner, sponsorInstance.id)
            }
            if(params.tagList) tagService.saveTag(params.tag?.name, sponsorInstance)

            if(!sponsorInstance.hasErrors() && sponsorInstance.save()) {
                flash.message = "Sponsor ${params.id} updated"
                redirect(controller:'sponsor', action:show, params:[slug:sponsorInstance.slug])
            }
            else {
                render view:'edit', model:[sponsorInstance:sponsorInstance]
            }
        }
        else {
            flash.message = "Sponsor not found with id ${params.id}"
            redirect action:'list'
        }
    }

    def create = {
        def sponsorInstance = new Sponsor()
        def tagInstance = new Tag()
        sponsorInstance.properties = params
        return ['sponsorInstance':sponsorInstance, 'tagInstance':tagInstance]
    }


    def save = {
        println "entering sponsor save action"
        println params

        def sponsorInstance = new Sponsor(params)
        def sponsorRep
        sponsorInstance.slug = sponsorInstance.name.toLowerCase().encodeAsHyphen()

        if(params.tagList) tagService.saveTag(params.tagList, sponsorInstance)

        if(!sponsorInstance.validate()) {
            sponsorInstance.discard()
            flash.message = "Invalid Sponsor details"
            render view:'create', model:[sponsorInstance:sponsorInstance]
            return
        }

        if(authenticateService.userDomain()) {
            sponsorRep = authenticateService.userDomain()

            sponsorInstance.save()
            sponsorInstance.rep = sponsorRep

            flash.message = "Sponsor ${sponsorInstance.name} created"
            redirect(action: show, params:[slug: sponsorInstance.slug])
            return
        }

        else {
	    println "okay, we're making a new sponsorRep..."
            sponsorRep = new TekUser()

                if(!tekUserService.checkCaptcha(params.captcha.toUpperCase(), session.captcha)) {
                    flash.message = "Access code is invalid"
                    sponsorInstance.discard()
                    render(view:'create', model:[sponsorInstance:sponsorInstance, sponsorRep:sponsorRep])
                    return
                }

                if(!tekUserService.checkPasswd(params.rep.passwd, params.rep.confirmpassword)) {
                    flash.message = "Passwords did not match"
                    sponsorInstance.discard()
                    render(view:'create', model:[sponsorInstance:sponsorInstance, sponsorRep:sponsorRep])
                    return
                }

                sponsorRep.properties = params['rep']
                sponsorRep.passwd = authenticateService.encodePassword(params.rep.passwd)
                linkService.verifyLinks(sponsorRep)

                if(!sponsorRep.hasErrors() && sponsorRep.save()) {
                    sponsorInstance.save()
                    def role = Role.findByAuthority("ROLE_USER")
                    role.addToPeople(sponsorRep)
                    sponsorRep.enabled = true
                    println "setting up authtoken..."
                    println sponsorRep.username + " " + params.rep.passwd
                    def auth = new AuthToken(sponsorRep.username, params.rep.passwd)
                    def authtoken = daoAuthenticationProvider.authenticate(auth)
                    SCH.context.authentication = authtoken

                    flash.message = "Your account was created."
                    println flash.message



                    sponsorInstance.rep = sponsorRep
                    fileUploadService.uploadSponsorBanner(params.banner, sponsorInstance.id)
                    fileUploadService.uploadSponsorLogo(params.logo, sponsorInstance.id)

                    redirect(controller:'sponsor', action:show, params:[slug:sponsorInstance.slug])
                    return
                 }

                else {
                    println "something went wrong"
                    flash.message = "Invalid user data"
                    sponsorRep.errors.allErrors.each { println it }
                    render(view:'create', model:[sponsorInstance:sponsorInstance, sponsorRep:sponsorRep])
                    return
                }
        }
    }

    def autoTags = {
        println "entering autoTags action..."
        def queryTerm = params.query

        def matchingTags = Tag.findAllByNameIlike("${queryTerm}%")

        def tagList = matchingTags.collect { tag ->
            [id: tag.id, name: tag.name]
        }

        def jsonResult = [ tagList: tagList ]

        render jsonResult as JSON
    }

}

