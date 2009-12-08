import org.springframework.security.providers.UsernamePasswordAuthenticationToken as AuthToken
import org.springframework.security.context.SecurityContextHolder as SCH

class SponsorController {

    def authenticateService
    def daoAuthenticationProvider
    def linkService
    def burningImageService
    def tagService


    def index = { redirect action:"list", params:params }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ sponsorInstanceList: Sponsor.list( params ), sponsorInstanceTotal: Sponsor.count() ]
    }

    def show = {

        def sponsorInstance = Sponsor.get( params.id )

        if(!sponsorInstance) {
            flash.message = "Sponsor not found with id ${params.id}"
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

        def sponsorInstance = new Sponsor(params)
        println sponsorInstance
        println params.tag.name
        println "about to call tagService.saveTag"
        tagService.saveTag(params.tag.name, sponsorInstance)
        println "made it back!"

        if(sponsorInstance.validate()) {
            println "we are saved!"
        }
        else {
            flash.message = "Invalid Sponsor details"
            sponsorInstance.discard()
            render view:'create', model:[sponsorInstance:sponsorInstance]
            return
        }

	println "time to set the sponsorRep"
	def sponsorRep

        if(authenticateService.userDomain()) {
	    println "okay, using current user..."

            sponsorRep = authenticateService.userDomain() 
            sponsorInstance.save()
            sponsorInstance.rep = sponsorRep
            println sponsorInstance.properties

            flash.message = "Sponsor ${sponsorInstance.name} created"
            println "redirecting"
            
            redirect action:"show", id:sponsorInstance.id
            return
        }

        else {
	    println "okay, we're making a new sponsorRep..."

            /*KLUDGE!!!
            This section is simply c&p from tekUserController.groovy.
            Just an ugly hack to make things work until we can think of a better method. I've got a life!*/

            sponsorRep = new TekUser(params['rep'])

            println "checking captcha..."
            if (params.captcha.toUpperCase() != session.captcha) {
                println 'Code did not match.'
                flash.message = "Access code did not match"
                sponsorRep.discard()
                sponsorInstance.discard()
                render(view:'create', model:[sponsorInstance:sponsorInstance, sponsorRep:sponsorRep])
                return
            }

            println "checking passwords..."
            println params.rep.passwd + ' vs ' + params.rep.confirmpassword
            if(params.rep.passwd != params.rep.confirmpassword) {
                println 'Passwords did not match.'
                flash.message = "Passwords did not match"
                sponsorRep.discard()
                sponsorInstance.discard()
                render(view:'create', model:[sponsorInstance:sponsorInstance, sponsorRep:sponsorRep])
                return
            }

            sponsorRep.passwd = authenticateService.encodePassword(params.rep.passwd)
            linkService.verifyLinks(sponsorRep)

            if(!sponsorRep.hasErrors() && sponsorRep.save()) {

                sponsorInstance.save()

                def role = Role.findByAuthority("ROLE_USER")
                role.addToPeople(sponsorRep)
                sponsorRep.enabled = true

                println "User saved; saving avatar..."
                def avFile = params.avatar
                println "this is the avFile" + avFile

                /* println "avFile's properties are " + properties
                burningImageService.loadImage(avFile).resultDir("web-app/images/avatars").execute ('thumbnail',
                {it.scaleAccurate(90, 100) }) */

                if(avFile != null) {
                    def location = "web-app/images/avatars/${sponsorRep.username}-avatar.jpg"
                    def saveLocation = new File(location); saveLocation.mkdirs()
                    avFile.transferTo(saveLocation)
                    println "Avatar is saved..."
                }
                else {
                    println "No avatar"
                }

                println "setting up authtoken..."
                def auth = new AuthToken(sponsorRep.username, params.rep.passwd)
                def authtoken = daoAuthenticationProvider.authenticate(auth)
                SCH.context.authentication = authtoken

                sponsorRep.properties.each { println it }
                flash.message = "Your account was created."
                println flash.message

                sponsorRep.properties.each { println it }
                sponsorInstance.rep = sponsorRep
                redirect(controller:'tekUser', action:show, params:[id:sponsorRep.id])
                return
            }

            else {
                println "something went wrong"
                flash.message = "Invalid user data"
                sponsorRep.errors.allErrors.each { println it }
                render(view:'create', model:[sponsorInstance:sponsorInstance, sponsorRep:sponsorRep])
                return
            }
            /*END_KLUDGE*/

        }
    }

    def displayLogo = {
        def sponsor = Sponsor.get(params.id)
        response.contentType = "image/jpeg"
        response.contentLength = sponsor?.logo.length
        response.outputStream.write(sponsor?.logo)
    }

}

