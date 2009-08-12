

class TaskController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ taskInstanceList: Task.list( params ), taskInstanceTotal: Task.count() ]
    }

    def show = {
        def taskInstance = Task.get( params.id )

        if(!taskInstance) {
            flash.message = "Task not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ taskInstance : taskInstance ] }
    }

    def delete = {
        def taskInstance = Task.get( params.id )
        if(taskInstance) {
            try {
                taskInstance.delete()
                flash.message = "Task ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Task ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Task not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def taskInstance = Task.get( params.id )

        if(!taskInstance) {
            flash.message = "Task not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ taskInstance : taskInstance ]
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
                flash.message = "Task ${params.id} updated"
                redirect(action:show,id:taskInstance.id)
            }
            else {
                render(view:'edit',model:[taskInstance:taskInstance])
            }
        }
        else {
            flash.message = "Task not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def taskInstance = new Task()
        taskInstance.properties = params
        return ['taskInstance':taskInstance]
    }

    def save = {
        def taskInstance = new Task(params)
        if(!taskInstance.hasErrors() && taskInstance.save()) {
            flash.message = "Task ${taskInstance.id} created"
            redirect(action:show,id:taskInstance.id)
        }
        else {
            render(view:'create',model:[taskInstance:taskInstance])
        }
    }
}
