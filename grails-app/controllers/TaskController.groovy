class TaskController {

    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        println "task controller list action $params"
        def tekEventInstance = TekEvent.findBySlug(params.slug)
        def taskInstanceList = Task.findAllByEvent(tekEventInstance)
        return [ taskInstanceList: taskInstanceList, tekEventInstance:tekEventInstance, taskInstanceTotal:taskInstanceList.size()]
    }

    def show = {
        def taskInstance = Task.get( params.id )
        def tekEventInstance = TekEvent.get(taskInstance.event.id)
        def allTasks = Task.findAllByEvent(tekEventInstance)

        if(!taskInstance) {
            flash.message = "No task found with id: ${params.id}"
            redirect(action:list)
        }
        else { return [ taskInstance : taskInstance, allTasks : allTasks, tekEventInstance:tekEventInstance ] }
    }

    def delete = {
        def taskInstance = Task.get( params.id )
        def taskEvent = taskInstance.event
        println "in task delete, taskEvent is " + taskEvent
        if(taskInstance) {
            try {
                taskInstance.delete()
                flash.message = "Task deleted"
                redirect(action:list, params:[slug:taskEvent?.slug])
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

    def editTask = {
        def taskInstance = Task.get( params.id )
        def event = TekEvent.get(taskInstance.event.id)
        def taskInstanceList = Task.findAllByEvent(event)
        
        if(!taskInstance) {
            flash.message = "No task found with id ${params.id}"
            render(template:"/task/allTasks", model:[ taskInstanceList: taskInstanceList, ])
        }
        else {
            render(template:"/task/editTask", model:[taskInstance:taskInstance])
        }
    }

    def updateTask = {
        println "entering updateTask action: $params"
        if(params.dueDate){ 
            def df = new java.text.SimpleDateFormat('MM/dd/yyyy')
            params.dueDate = df.parse(params.dueDate) 
        }

        def taskInstance = Task.get( params.id )
        def event = TekEvent.findBySlug(params.slug)
        println taskInstance
        println event
        
        def taskInstanceList = Task.findAllByEvent(event)
        if(taskInstance) {
            

            if(params.version) {
                def version = params.version.toLong()
                if(taskInstance.version > version) {
                    taskInstance.errors.rejectValue("version", "task.optimistic.locking.failure", "Another user has updated this Task while you were editing.")
                    render(template:"/task/editTask", model:[taskInstance:taskInstance])
                    return
                }
            }

            taskInstance.properties = params
            if(!taskInstance.hasErrors() && taskInstance.save()) {
                flash.message = "Task updated"
                render(template:"/task/allTasks", model:[ taskInstanceList: taskInstanceList, ])
            }
            else {
                render(template:"/task/editTask", model:[taskInstance:taskInstance])
            }
        }
        else {
            flash.message = "No task found with id ${params.id}"
            render(template:"/task/allTasks", model:[ taskInstanceList: taskInstanceList, ])
        }
    }

    def addTask = {
        
        println "entering addTask action"
        if(params.dueDate){ 
            def df = new java.text.SimpleDateFormat('MM/dd/yyyy')
            params.dueDate = df.parse(params.dueDate) 
        }

        def newTask = new Task(params)
        def event = TekEvent.findBySlug(params.slug)
        def taskInstanceList = Task.findAllByEvent(event)
        
        event.addToTasks(newTask)

        if(!newTask.hasErrors() && newTask.save()) {
            flash.message = "Task saved."
            println "about to render..."
            render(template:"/task/allTasks", model:[ taskInstanceList: taskInstanceList, ])
            return
        }
        
        else {
            taskInstance.errors.allErrors.each{ println it }
            render(template:"/task/allTasks", model:[ taskInstanceList: taskInstanceList, ])
            return
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

