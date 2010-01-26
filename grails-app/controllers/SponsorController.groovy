import org.springframework.security.providers.UsernamePasswordAuthenticationToken as AuthToken
import org.springframework.security.context.SecurityContextHolder as SCH
import grails.converters.JSON

class SponsorController {

    def authenticateService
    def daoAuthenticationProvider
    def linkService
    def tagService
    def tekUserService

    def index = { redirect action:"list", params:params }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ sponsorInstanceList: Sponsor.list( params ), sponsorInstanceTotal: Sponsor.count() ]
    }

    def show = {

        def sponsorInstance = Sponsor?.findBySlug( params.slug )

        if(!sponsorInstance) {
            flash.message = "Sponsor not found with slug ${params.slug}"
            redirect(action:list)
        }
        else {
            [ sponsorInstance : sponsorInstance ]
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
        def sponsorInstance = Sponsor.get( params.id )

        if(!sponsorInstance) {
            flash.message = "Sponsor not found with id ${params.id}"
            redirect action:'list'
        }
        else {
            return [ sponsorInstance : sponsorInstance ]
        }
    }

    def update = {
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
            tagService.saveTag(params.tag.name, sponsorInstance)
            if(!sponsorInstance.hasErrors() && sponsorInstance.save()) {
                flash.message = "Sponsor ${params.id} updated"

                redirect action:'show', id:sponsorInstance.id
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

        def fileName = params.logo.originalFilename
        def loFile = params.logo
        println "the loFile is ${loFile}"

        def sponsorInstance = new Sponsor(params)
        def sponsorRep

        tagService.saveTag(params.tagList, sponsorInstance)

        if(!sponsorInstance.validate()) {
            sponsorInstance.discard()
            flash.message = "Invalid Sponsor details"
            render view:'create', model:[sponsorInstance:sponsorInstance]
            return
        }


        if(authenticateService.userDomain()) {
            sponsorRep = authenticateService.userDomain()

        if(!loFile.isEmpty()){
            def thisIsATest = sponsorInstance.logoLocation
            println "right now, thisIsATest is " + thisIsATest
            if((thisIsATest) && (params.logo)){
                def oldAvatar = new File(thisIsATest).delete()
            }
            sponsorInstance.fp = "web-app/images/logos/${params.name}/${fileName}"
            sponsorInstance.logoLocation = "web-app/images/logos/${params.name}/${fileName}"
            sponsorInstance.logoName = fileName
            def location = new File(sponsorInstance.logoLocation)
            if(!location.exists()){
               location.mkdirs()
            }
            loFile?.transferTo(location)
        }

            sponsorInstance.slug = sponsorInstance.name.toLowerCase().encodeAsHyphen()
            println "i can has sponsorInstance.name? ${ 1 == 2 }"
            println "sponsorInstance.name is ${sponsorInstance.name}"
            sponsorInstance.save()
            sponsorInstance.rep = sponsorRep

            println "about to redirect from sponsor save to show. sponsorInstance.slug is ${sponsorInstance.slug}"
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
                    redirect(controller:'sponsor', action:show, params:[id:sponsorInstance.id])
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

    def displayLogo = {
        def sponsor = Sponsor.get(params.id)
        response.contentType = "image/jpeg"
        response.contentLength = sponsor?.logo.length
        response.outputStream.write(sponsor?.logo)
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

