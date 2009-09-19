

class SponsorController {
    
    def tagService

    def index = {
        redirect action:"list", params:params 
    }

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

        if(sponsorInstance.save(flush:true)) {

            println "we are saved!"

            flash.message = "Sponsor ${sponsorInstance.id} created"
            println "redirecting"

            redirect action:"show", id:sponsorInstance.id
        }
        else {
            render view:'create', model:[sponsorInstance:sponsorInstance]
        }
    }
}
