import java.text.SimpleDateFormat
import grails.converters.JSON

class TekEventController {

    def authenticateService
    def taskService
    def tagService
    def mailService

    def index = { redirect(action:'search') }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ tekEventInstanceList: TekEvent.list( params ),
          tekEventInstanceTotal: TekEvent.count() ]
    }
    def search = {
        println "im in ur event controller"
        println "pwinting ur params"
        def events
        def adv = (params.city || params.state || params.country || params.before || params.after)
        if(params.query){
            events = TekEvent.search(params.query).results
        }
        else {
            events = TekEvent.list()
        }
        if (adv){
	        println "In advanced events == $events"

	        println "oh hai! dis chairs takin, k?"
	        events = events.findAll{event ->
		 		def result = true
		   		if (params.city){
					result = event.city.toUpperCase() == params.city.toUpperCase()
				}
				if (params.state){
					result = (result && event.state.toUpperCase() == params.state.toUpperCase())
				}
				if (params.country){
					result = (result && event.country.toUpperCase() == params.country.toUpperCase())
				}
				if (params.before){
					try{
					    def before = new java.text.SimpleDateFormat('MM/dd/yyyy').parse(params.before)
					    result = (result && event.startDate < before)
					}
					catch(Exception ex){}
				}
				if (params.after){
					try{
					    def after = new java.text.SimpleDateFormat('MM/dd/yyyy').parse(params.after)
					    result = (result && event.startDate > after)
					}
					catch(Exception ex){}
				}
				result
			}
        }
        [events : events]

    }

    def show = {
        println "the params in the event show action are: " + params
	    def tekEventInstance = TekEvent.findBySlug(params.slug)
        if(!tekEventInstance) {
            flash.message = "Couldn't find that event."
            redirect(action:list)
        }
        else {
            def posts = Post.findAllByEvent(tekEventInstance, [max:2, sort:'dateCreated', order:'desc'])
            return [ tekEventInstance : tekEventInstance, posts : posts ]
        }
    }

    def volunteer = {
	    def event = TekEvent.get(params.id)
	    def volunteerInstance = new Volunteer(event:event, user:authenticateService.userDomain(), active:false, dateCreated:new Date())
	    if(volunteerInstance.save()){
            event.addToVolunteers(volunteerInstance)
            event.save()
            mailService.sendMail {
                to "${event.organizer.email}"
                from "TekDays.com@gmail.com"
                subject "[TekDays] ${volunteerInstance?.user.profile?.fullName} has volunteered to help with ${event?.name}"
                body """${volunteerInstance?.user.profile?.fullName} (${volunteerInstance.user.username}) has volunteered to help with ${event?.name}. To approve this, click this link: http://localhost:8080/tekdays/volunteers/approve/${volunteerInstance.id}"""
                /*html g.render(template:"notice", model:[contactInstance: contactInstance])*/
            }
	        //render "Thank you for volunteering!"
	        render "oh hai! u vlnteered. jus thot u shd no, srsly. kthxbai."
	    }
    }

    def delete = {
        println "in event delete action. params are: " + params
        def tekEventInstance = TekEvent.findBySlug( params.slug )
        def location = "web-app/files/${tekEventInstance?.slug}"
        def files = new File(location)
        println "is there a 'files'? let's see..." + files
        if(tekEventInstance) {
            try {
                tekEventInstance.delete()
                flash.message = "Deleted event."
                println "in event delete, the location is ${location}"
                if(files.exists()){
                    files.listFiles().each {
                        it?.delete()
                    }
                    files?.deleteDir()
                }
                redirect(action:search)
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
        def tekEventInstance = TekEvent.findBySlug( params.slug )

        if(!tekEventInstance) {
            flash.message = "Couldn't find ${params.name.decodeHyphen()}."
            redirect(action:list)
        }
        else {
            return [ tekEventInstance : tekEventInstance, id:tekEventInstance.id ]
        }
    }

    def update = {
        println "just got into the event update action. params are really pretty bad things, if you think about it. here they are anyway: " + params
        def df = new java.text.SimpleDateFormat('MM/dd/yyyy')
        def tekEventInstance = TekEvent.get( params.id )
        if(tekEventInstance) {
            println "there was a tekEventInstance (${tekEventInstance})"
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
            println "still in event update - going to parse dates now..."
            if(params.startDate){ params.startDate = df.parse(params.startDate) }
            if(params.endDate){ params.endDate = df.parse(params.endDate) }
            println "the tekEventInstance.name is ${tekEventInstance.name}"
            println "the params.name is ${params.name}"
            tekEventInstance.properties = params
            println "event update is going to save tags now..."
            tagService.saveTag(params.tag.name, tekEventInstance)
            if(!tekEventInstance.hasErrors() && tekEventInstance.save()) {
                flash.message = "Event updated."
                redirect(action: show, params:[slug: tekEventInstance.slug])
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
        println "event create"
        println "I CRIES BECAUSE"
        def tekEventInstance = new TekEvent(params)
        def tagInstance = new Tag()

        return ['tekEventInstance':tekEventInstance, 'tagInstance':tagInstance]
    }

    def save = {
        println "entering tekEvent save action; params are $params"
        println "I ARE OUT OF FOCUSSED"
        def df = new java.text.SimpleDateFormat('MM/dd/yyyy')

        def tekEventInstance = new TekEvent(params)

        println "tekEventInstance.name is " + tekEventInstance.name

        /*if(tekEventInstance.nickname){
          tekEventInstance.nickname = tekEventInstance.twitterId
        }
        else {
          tekEventInstance.nickname = tekEventInstance.name.encodeAsHyphen()
        }*/

        tagService.saveTag(params.tagList, tekEventInstance)

        if(!tekEventInstance.hasErrors() && tekEventInstance.save()){
            taskService.addDefaultTasks(tekEventInstance)
            tekEventInstance.slug = tekEventInstance.name.toLowerCase().encodeAsHyphen()
            flash.message = "Cool, dude! Now you need to add lots of details to your event."
            redirect action:show, params:[slug:tekEventInstance?.slug]
        }
        else {
            render(view:'create',model:[tekEventInstance:tekEventInstance])
        }
    }

    def editDescription = {

        log.info "Update event description"

        //Get event
        def event = TekEvent.get(params.id)
        event.description = params.description

        //Render new page
        render params.description

    }

    def autoTags = {
        println "entering autoTags action..."
        def queryTerm = params.query

        def matchingTags = Tag.findAllByNameIlike("${queryTerm}%")

        def tagList = matchingTags.collect { tag ->
            [id: tag.id, name: tag.name]
        }

        def jsonResult = [ tagList: tagList ]

        render jsonResult as JSON
    }

}

