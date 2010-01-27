

class TaskController {

    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        println "task controller list action $params"
        def event = TekEvent.findBySlug(params.slug)
        def taskInstanceList = Task.findAllByEvent(event)
        [ taskInstanceList: taskInstanceList, taskInstanceTotal: taskInstanceList.size(), event:event ]
    }

    def show = {
        def taskInstance = Task.get( params.id )
        def event = TekEvent.get(taskInstance.event.id)
        def allTasks = Task.findAllByEvent(event)
        def eventid = taskInstance.event.id

        if(!taskInstance) {
            flash.message = "No task found with id: ${params.id}"
            redirect(action:list)
        }
        else { return [ taskInstance : taskInstance, allTasks : allTasks ] }
    }

    def delete = {
        def taskInstance = Task.get( params.id )
        def taskEvent = taskInstance.event
        println "in task delete, taskEvent is " + taskEvent
        if(taskInstance) {
            try {
                taskInstance.delete()
                flash.message = "Task deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Task could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "No task found with id ${params.id}"
            redirect(action:list, name:taskEvent?.slug)
        }
    }

    def edit = {
        def taskInstance = Task.get( params.id )
        def event = TekEvent.get(taskInstance.event.id)
        def allTasks = Task.findAllByEvent(event)

        if(!taskInstance) {
            flash.message = "No task found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ taskInstance : taskInstance, allTasks : allTasks ]
        }
    }

    def update = {
        def taskInstance = Task.get( params.id )
        if(taskInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(taskInstance.version > version) {

                    taskInstance.errors.rejectValue("version", "task.optimistic.locking.failure", "Another user has updated this Task while you were editing.")
                    render(view:'edit',model:[taskInstance:taskInstance])
                    return
                }
            }
            taskInstance.properties = params
            if(!taskInstance.hasErrors() && taskInstance.save()) {
                flash.message = "Task updated"
                redirect(action:show,id:taskInstance.id)
            }
            else {
                render(view:'edit',model:[taskInstance:taskInstance])
            }
        }
        else {
            flash.message = "No task found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def taskInstance = new Task()
        def event = TekEvent.findBySlug(params.slug)
        def associatedUsers = event?.findAssociatedUsers()
        println "in task create, the event is: " + event
        def allTasks = Task.findAllByEvent(event)
        taskInstance.properties = params
        taskInstance.event = TekEvent.get(params.id)
        // def associatedUsers = event?.findAssociatedUsers()
        println "in task create action. params are " + params
        // def event = TekEvent.get(params.id)
        // println "event is: " + taskInstance.event
        // taskInstance.event = event
        return ['taskInstance':taskInstance, 'associatedUsers':associatedUsers, 'allTasks':allTasks, 'event':event]
    }

    def save = {
        println "in task save action. params are " + params
        
        if(params.dueDate){ 
            def df = new java.text.SimpleDateFormat('MM/dd/yyyy')
            params.dueDate = df.parse(params.dueDate) 
        }
        
        def taskInstance = new Task(params)
        def event = TekEvent.findBySlug(params.slug)
        println "the event is a: ${event.class}"
        
        event.addToTasks(taskInstance)
        
        if(!taskInstance.hasErrors() && taskInstance.save()) {
            flash.message = "Task saved."
            redirect(action:list, params:[slug:event.slug])
        }
        else {
            println  "task save failed"
            taskInstance.errors.allErrors.each{ println it }
            render(view:'list',model:[taskInstance:taskInstance])
        }
    }

    def markComplete = {
        println "just got into the markComplete action"
        def taskInstance = Task.get(params.id)
        taskInstance.completed = true
        taskInstance.save()
        render "completed"
    }

}

