class MessageController {
    
    def index = { redirect(action:forum,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def forum = {
        
        println "entering forum action"
        println params

        def event = TekEvent.get(params.id)
        def forumTopics = event.messages.findAll{!it.parent}.sort{m1, m2 -> m1.dateCreated <=> m2.dateCreated}

        println event

        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        
        [forumTopics: forumTopics, count: forumTopics.size()]
        
      
    }
    
    def topic = {
      
        println "Entering topic action"
        println params
        def topic = Message.get(params.id) 
        def posts = Message.findAllByParent(topic)
        
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        
        println topic
        println posts
        
        [topic: topic, posts: posts, count: posts.size()]
        
      
    }

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
        println "entering create action"
        println params
        def messageInstance = new Message()
        messageInstance.properties = params
        def event = TekEvent.get(params.id)
        println event
        
        return ['messageInstance':messageInstance, 'eventId':event.id, event:event]
    }

    def save = {
        println "entering save action"
        println params
        def messageInstance = new Message(params)
        def event = TekEvent.findById(params.eventId)
        println event
        messageInstance.event = event
        messageInstance.dateCreated = new Date()
        if(!messageInstance.hasErrors() && messageInstance.save()) {
            flash.message = "Message ${messageInstance.id} created"
            redirect(action:topic, params:['eventId':event.id, id:messageInstance.id, event:event])
        }
        else {
            render(view:'create',model:[messageInstance:messageInstance, eventId:event.id, event:event])
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
    println params
    def parent = Message.get(params.topic)
	def event = parent.event
    def author = TekUser.findById(params.author.id)

	println event
	println event.id

    def reply = new Message(params)
    reply.subject = "RE:" + parent.subject
    reply.event = event
    reply.parent = parent
    reply.author = author
    reply.dateCreated = new Date()

    if(!reply.hasErrors() && reply.save()) {
        flash.message = "Reply ${reply.id} created"
        println event.id
        redirect(action:topic, params:['eventId':event.id, id:parent.id])
    }
    else {
        println reply.errors.allErrors.each() {println it}
        render(view:'topic',model:[reply:reply, topic:parent, eventId:event.id, id:reply.id,])
    }
        
}
}
