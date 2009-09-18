

class TaskController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        def event = TekEvent.get(params.id)
        def taskInstanceList = Task.findAllByEvent(event)
        [ taskInstanceList: taskInstanceList, taskInstanceTotal: taskInstanceList.size() ]
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
            redirect(action:list)
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
        def event = TekEvent.get(params.id)
        def allTasks = Task.findAllByEvent(event)
        taskInstance.properties = params
        taskInstance.event = TekEvent.get(params.id)
        def associatedUsers = taskInstance.event.findAssociatedUsers()
        println "in task create action. params are " + params
        // def event = TekEvent.get(params.id)
        println "event is: " + taskInstance.event
        println "event class is: " + taskInstance.event.class
        // taskInstance.event = event
        return ['taskInstance':taskInstance, 'associatedUsers':associatedUsers, 'allTasks':allTasks]
    }

    def save = {
        println "in task save action. params are " + params
        def taskInstance = new Task(params)
        def event = TekEvent.get(params.eventId)
        taskInstance.event = event
        if(!taskInstance.hasErrors() && taskInstance.save()) {
            flash.message = "Task saved."
            redirect(action:show,id:taskInstance.id)
        }
        else {
            render(view:'create',model:[taskInstance:taskInstance])
        }
    }

    def updateStatus = {
        def taskInstance = Task.get(params.taskId)
        taskInstance.completed = params.status
        taskInstance.save()
        return
    }

}
