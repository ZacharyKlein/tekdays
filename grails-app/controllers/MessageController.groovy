

class MessageController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
       
        def list
        def count
        def event = TekEvent.get(params.id)
        if (event){
            list = Message.findAllByEvent(event, params)
            count = Message.countByEvent(event)
        }
        else{
            list = Message.list(params)
            count = Message.count()
        }
        render(view:'ajaxList', 
               model:[messageInstanceList: list, messageInstanceTotal: count, 
                      event: event])
    }

    def show = {
        def messageInstance = Message.get( params.id )

        if(!messageInstance) {
            flash.message = "Message not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ messageInstance : messageInstance ] }
    }

    def delete = {
        def messageInstance = Message.get( params.id )
        if(messageInstance) {
            try {
                messageInstance.delete()
                flash.message = "Message ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Message ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Message not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def messageInstance = Message.get( params.id )

        if(!messageInstance) {
            flash.message = "Message not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ messageInstance : messageInstance ]
        }
    }

    def update = {
        def messageInstance = Message.get( params.id )
        if(messageInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(messageInstance.version > version) {
                    
                    messageInstance.errors.rejectValue("version", "message.optimistic.locking.failure", "Another user has updated this Message while you were editing.")
                    render(view:'edit',model:[messageInstance:messageInstance])
                    return
                }
            }
            messageInstance.properties = params
            if(!messageInstance.hasErrors() && messageInstance.save()) {
                flash.message = "Message ${params.id} updated"
                redirect(action:show,id:messageInstance.id)
            }
            else {
                render(view:'edit',model:[messageInstance:messageInstance])
            }
        }
        else {
            flash.message = "Message not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def messageInstance = new Message()
        messageInstance.properties = params
        return ['messageInstance':messageInstance, 'eventId':params.eventId]
    }

    def save = {
        def messageInstance = new Message(params)

        if(!messageInstance.hasErrors() && messageInstance.save()) {
            flash.message = "Message ${messageInstance.id} created"
            redirect(action:list,id:messageInstance.event.id, messageId:messageInstance.id)
        }
        else {
            render(view:'create',model:[messageInstance:messageInstance])
        }
    }

    def showDetail = {
        def messageInstance = Message.get(params.id)
        if (messageInstance) {
            render(template:"details", model:[messageInstance:messageInstance])
        }
        else {
            render "No message found with id: ${params.id}"
        }
    }

    def reply = {
	println "entering reply action"
        def parent = Message.get(params.id)
	def event = parent.event
	println event
	println event.id
        def messageInstance = new Message(parent:parent, event:event,  
                                          subject:"RE: $parent.subject")
        render(view:'create', model:['messageInstance':messageInstance, 'eventId':event.id])
    }

}
