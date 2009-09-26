import java.text.SimpleDateFormat

class TekEventController {

    def authenticateService    
    def taskService
    def tagService
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

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
	    def tekEventInstance
	    if (params.nickname){
		    tekEventInstance = TekEvent.findByTwitterId(params.nickname)
	    }
	    else
          tekEventInstance = TekEvent.get( params.id )

        if(!tekEventInstance) {
	        if (params.nickname)
                flash.message = "TekEvent not found with id ${params.id}"
            else
                flash.message = "TekEvent not found with nickname ${params.nickname}"
            redirect(action:list)
        }
        else { return [ tekEventInstance : tekEventInstance ] }
    }
//END:show
//START:volunteer
    def volunteer = {
	    def event = TekEvent.get(params.id)
        event.addToVolunteers(authenticateService.userDomain())
        event.save()
	    render "Thank you for volunteering!"
    }
//END:volunteer
    def delete = {
        def tekEventInstance = TekEvent.get( params.id )
        if(tekEventInstance) {
            try {
                tekEventInstance.delete()
                flash.message = "TekEvent ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "TekEvent ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "TekEvent not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def tekEventInstance = TekEvent.get( params.id )

        if(!tekEventInstance) {
            flash.message = "TekEvent not found with id ${params.id}"
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
                        "Another user has updated this TekEvent " +
                            "while you were editing.")
                    render(view:'edit',model:[tekEventInstance:tekEventInstance])
                    return
                }
            }
            tekEventInstance.properties = params
            tagService.saveTag(params.tag.name, tekEventInstance)
            if(!tekEventInstance.hasErrors() && tekEventInstance.save()) {
                flash.message = "TekEvent ${params.id} updated"
                redirect(action:show,id:tekEventInstance.id)
            }
            else {
                render(view:'edit',model:[tekEventInstance:tekEventInstance])
            }
        }
        else {
            flash.message = "TekEvent not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def tekEventInstance = new TekEvent()
        def tagInstance = new Tag()
        tekEventInstance.properties = params
        return ['tekEventInstance':tekEventInstance, 'tagInstance':tagInstance]
    }

    def save = {
        def tekEventInstance = new TekEvent(params)
        println "This is the params.startDate: " + params.startDate + ". Its class is: " + params.startDate.class
        /*def d = new SimpleDateFormat("dd/MM/yy").parse(params.startDate)
        println d
        println d.class 
        tekEventInstance.startDate = d*/
        println "After the tekEventInstance startDate property was set to 'd', the tekEventInstance.startDate is " + tekEventInstance.startDate + ", and its class is " + tekEventInstance.startDate.class + ", so you're not doing anything wrong, and it's all YUI's fault."
        
        tagService.saveTag(params.tag.name, tekEventInstance)

        if(!tekEventInstance.hasErrors() && tekEventInstance.save()){
            flash.message = "TekEvent ${tekEventInstance.id} created"
            //START_HIGHLIGHT
            taskService.addDefaultTasks(tekEventInstance)
            //END_HIGHLIGHT
            redirect(action:show,id:tekEventInstance.id)
        }
        else {
            render(view:'create',model:[tekEventInstance:tekEventInstance])
        }
    }

}
