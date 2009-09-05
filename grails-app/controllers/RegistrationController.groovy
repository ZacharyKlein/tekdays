

class RegistrationController {
    
    def index = {
        redirect action:"list", params:params 
    }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        def list = Registration.list()
        list.each{println it.event}
        println "params entering registration list action are: " + params
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        def event = TekEvent.get(params._eventId)
        [ registrationInstanceList: Registration.findAllByEvent(event, params) ]
    }

    def show = {
        def registrationInstance = Registration.get( params.id )

        if(!registrationInstance) {
            flash.message = "Registration not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            [ registrationInstance : registrationInstance ]
        }
    }

    def delete = {
        def registrationInstance = Registration.get( params.id )
        if(registrationInstance) {
            try {
                registrationInstance.delete(flush:true)
                flash.message = "Registration ${params.id} deleted"
                redirect(action:"list")
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Registration ${params.id} could not be deleted"
                redirect(action:"show",id:params.id)
            }
        }
        else {
            flash.message = "Registration not found with id ${params.id}"
            redirect(action:"list")
        }
    }

    def edit = {
        def registrationInstance = Registration.get( params.id )

        if(!registrationInstance) {
            flash.message = "Registration not found with id ${params.id}"
            redirect action:'list'
        }
        else {
            return [ registrationInstance : registrationInstance ]
        }
    }

    def update = {
        def registrationInstance = Registration.get( params.id )
        if(registrationInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(registrationInstance.version > version) {
                    
                    registrationInstance.errors.rejectValue("version", "registration.optimistic.locking.failure", "Another user has updated this Registration while you were editing.")

                    render view:'edit', model:[registrationInstance:registrationInstance]
                    return
                }
            }
            registrationInstance.properties = params
            if(!registrationInstance.hasErrors() && registrationInstance.save()) {
                flash.message = "Registration ${params.id} updated"

                redirect action:'show', id:registrationInstance.id
            }
            else {
                render view:'edit', model:[registrationInstance:registrationInstance]
            }
        }
        else {
            flash.message = "Registration not found with id ${params.id}"
            redirect action:'list'
        }
    }

    def create = {
        println params
        def registrationInstance = new Registration()
        registrationInstance.properties = params
        def eventId = params.id
        return ['registrationInstance':registrationInstance, 'eventId': eventId]
    }

    def save = {
        def registrationInstance = new Registration(params)
        registrationInstance.confirmed = false
        if(registrationInstance.save(flush:true)) {
            def eventId = registrationInstance.event.id
            flash.message = "Thanks for registering!"
            render view:'thanks', model:[ registrationInstance : registrationInstance ]
        }
        else {
            render view:'create', model:[registrationInstance:registrationInstance]
        }
    }

    def thanks = {
        println "params are: " + params
        def registrationInstance = Registration.get( params.id )
        [ registrationInstance : registrationInstance ]
    }

}
