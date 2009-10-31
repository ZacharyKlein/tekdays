import java.text.SimpleDateFormat

class TekEventController {

    def authenticateService
    def taskService
    def tagService
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    /*def startFlow = {
        basic {
            on "next".to ""

        }


    }*/

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ tekEventInstanceList: TekEvent.list( params ),
          tekEventInstanceTotal: TekEvent.count() ]
    }
    def search = {
        if(params.query){
            def events = TekEvent.search(params.query).results
            [events : events]
        }
    }
    def show = {
	    def tekEventInstance = TekEvent.findByName(params.name.decodeHyphen())
        if(!tekEventInstance) {
            flash.message = "Couldn't find that event."
            redirect(action:list)
        }
        else { return [ tekEventInstance : tekEventInstance ] }
    }

    def volunteer = {
	    def event = TekEvent.get(params.id)
        event.addToVolunteers(authenticateService.userDomain())
        event.save()
	    render "Thank you for volunteering!"
    }

    def delete = {
        def tekEventInstance = TekEvent.get( params.id )
        if(tekEventInstance) {
            try {
                tekEventInstance.delete()
                flash.message = "Deleted event."
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Event could not be deleted."
                redirect(action:show,name:tekEventInstance.name.encodeAsHyphen())
            }
        }
        else {
            flash.message = "Couldn't find that event."
            redirect(action:list)
        }
    }

    def edit = {
        def tekEventInstance = TekEvent.findByName( params.name.decodeHyphen() )

        if(!tekEventInstance) {
            flash.message = "Couldn't find ${params.name.decodeHyphen()}."
            redirect(action:list)
        }
        else {
            return [ tekEventInstance : tekEventInstance ]
        }
    }

    def update = {
        def tekEventInstance = TekEvent.get( params.id )
        if(tekEventInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(tekEventInstance.version > version) {

                    tekEventInstance.errors.rejectValue("version",
                        "tekEvent.optimistic.locking.failure",
                        "Another user has updated this event " +
                            "while you were editing.")
                    render(view:'edit',model:[tekEventInstance:tekEventInstance])
                    return
                }
            }
            tekEventInstance.properties = params
            tagService.saveTag(params.tag.name, tekEventInstance)
            if(!tekEventInstance.hasErrors() && tekEventInstance.save()) {
                flash.message = "Event updated."
                redirect(action:show,name:tekEventInstance.name.encodeAsHyphen())
            }
            else {
                render(view:'edit',model:[tekEventInstance:tekEventInstance])
            }
        }
        else {
            flash.message = "Couldn't find that event."
            redirect(action:edit,name:params.name.encodeAsHyphen())
        }
    }

    def create = {
        def tekEventInstance = new TekEvent()
        def tagInstance = new Tag()
        tekEventInstance.properties = params
        return ['tekEventInstance':tekEventInstance, 'tagInstance':tagInstance]
    }

    def save = {
        params.startDate = new Date().parse('MM/dd/yyyy',
	                                     params.startDate)

        def tekEventInstance = new TekEvent(params)
        println "tekEventInstance.name is " + tekEventInstance.name

        tagService.saveTag(params.tag.name, tekEventInstance)

        if(!tekEventInstance.hasErrors() && tekEventInstance.save()){
            taskService.addDefaultTasks(tekEventInstance)
            redirect(action:show,name:tekEventInstance?.name?.encodeAsHyphen())
        }
        else {
            render(view:'create',model:[tekEventInstance:tekEventInstance])
        }
    }

}

