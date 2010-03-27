class TaskController {

    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        println "task controller list action $params"
        def tekEventInstance = TekEvent.findBySlug(params.slug)
        def taskInstanceList = Task.findAllByEvent(tekEventInstance)
        return [ taskInstanceList: taskInstanceList, tekEventInstance:tekEventInstance,]
    }

    def show = {
        def taskInstance = Task.get( params.id )
        def tekEventInstance = TekEvent.get(taskInstance.event.id)
        def allTasks = Task.findAllByEvent(tekEventInstance)

        if(!taskInstance) {
            flash.message = "No task found with id: ${params.id}"
            redirect(action:list, id:params.id)
        }
        else { return [ taskInstance : taskInstance, allTasks : allTasks, tekEventInstance:tekEventInstance ] }
    }

    def delete = {
        def taskInstance = Task.get( params.id )
        def tekEventInstance = taskInstance.event
        println "in task delete, taskEvent is " + tekEventInstance
        if(taskInstance) {
            try {
                taskInstance.delete()
                flash.message = "Task deleted"
                redirect(action:list, params:[ slug: tekEventInstance.slug])
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
        def tekEventInstance = TekEvent.get(taskInstance.event.id)
        def taskInstanceList = Task.findAllByEvent(tekEventInstance)
        
        if(!taskInstance) {
            flash.message = "No task found with id ${params.id}"
            redirect(action:list, params:[ slug: tekEventInstance.slug])
        }
        else {
            [ taskInstance: taskInstance, tekEventInstance: tekEventInstance ]
        }
    }

    def update = {
        println "entering updateTask action: $params"
        if(params.dueDate){ 
            def df = new java.text.SimpleDateFormat('MM/dd/yyyy')
            params.dueDate = df.parse(params.dueDate) 
        }

        def taskInstance = Task.get( params.id )
        def tekEventInstance = TekEvent.findBySlug(params.slug)
        println taskInstance
        println tekEventInstance
        
        def taskInstanceList = Task.findAllByEvent(event)
        if(taskInstance) {
            

            if(params.version) {
                def version = params.version.toLong()
                if(taskInstance.version > version) {
                    taskInstance.errors.rejectValue("version", "task.optimistic.locking.failure", "Another user has updated this Task while you were editing.")
                    redirect(action:"show", id:taskInstance.id)
                    return
                }
            }

            taskInstance.properties = params
            if(!taskInstance.hasErrors() && taskInstance.save()) {
                flash.message = "Task updated"
                redirect(action:"show", id:tekEventInstance.id, )
            }
            else {
                redirect(action:"list", model:[ slug: tekEventInstance.slug, ])
            }
        }
        else {
            flash.message = "No task found with id ${params.id}"
            redirect(action:"list", model:[ slug: tekEventInstance.slug, ])
        }
    }

    def addTask = {
        
      println "entering addTask action"
      println params

      if(params.dueDate){
          def df = new java.text.SimpleDateFormat('MM/dd/yyyy')
          params.dueDate = df.parse(params.dueDate)
      }

      def taskInstance = new Task(params)
      def tekEventInstance = TekEvent.findBySlug(params.slug)
			taskInstance.event = tekEventInstance
			
      def taskInstanceList = Task.findAllByEvent(tekEventInstance)

      if(!taskInstance.hasErrors() && taskInstance.save()) {

				  tekEventInstance.addToTasks(taskInstance)
          flash.message = "Task saved."
          println "about to render..."
          redirect(action:list, params:[ slug:tekEventInstance.slug,])
          return
      }

      else {
          taskInstance.errors.allErrors.each{ println it }
          redirect(action:list, params:[ slug:tekEventInstance.slug,])
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

