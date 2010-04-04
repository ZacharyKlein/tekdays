import org.apache.commons.io.FileUtils
import java.text.SimpleDateFormat
import grails.converters.JSON

class TekEventController {

    def authenticateService
    def taskService
    def tagService
    def mailService
    def fileUploadService

    def index = { redirect(action:'search') }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ tekEventInstanceList: TekEvent.list( params ),
          tekEventInstanceTotal: TekEvent.count() ]
    }
    def search = {
        println "in event search, srsly. here r ur params: " + params
        println "im in ur event controller"
        println "pwinting ur params"
        def events
        def adv = (params.city || params.state || params.country || params.before || params.after)
        println "are there params.query? " + params.query
        if(params.query){
            events = TekEvent.search(params.query).results
            println "there wer params.query, n dese r de evnts: " + events
        }
        else {
            events = TekEvent.list()
        }
        if (adv){
	        println "In advanced events == $events"

	        println "oh hai! dis chairs takun, k?"
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
            def posts = Post.findAllByEvent(tekEventInstance, [max:3, sort:'dateCreated', order:'desc'])
            return [ tekEventInstance : tekEventInstance, posts : posts ]
        }
    }

    def volunteer = {
	    def event = TekEvent.get(params.id)
	    def user = TekUser.get(authenticateService.userDomain().id)
	    if(!Volunteer.findByEventAndUser(event, user)){
	        def volunteerInstance = new Volunteer(event:event, user:authenticateService.userDomain(), active:false, dateCreated:new Date())
	        if(volunteerInstance.save()){
                event.addToVolunteers(volunteerInstance)
                event.save()
                mailService.sendMail {
                    to "${event.organizer.email}"
                    from "TekDays.com@gmail.com"
                    subject "[TekDays] ${volunteerInstance?.user.profile?.fullName ?: volunteerInstance?.user.username} has volunteered to help with ${event?.name}"
                    body """${volunteerInstance.event.organizer.profile?.fullName ?: volunteerInstance.event.organizer.username},

${volunteerInstance?.user.profile?.fullName ?: volunteerInstance?.user.username} (${volunteerInstance.user.username}) has volunteered to help with ${event?.name}. To approve this, click this link: http://localhost:8080/tekdays/volunteers/approve/${volunteerInstance.id}"""
                    /*html g.render(template:"notice", model:[contactInstance: contactInstance])*/
                }
	            //render "Thank you for volunteering!"
	            render "<p><strong>Thanks!</strong><br /> You'll be emailed when the organizer adds you as a volunteer.</p>"
	        }
	    } else {
	        render "oh hai! u can has vlnteered awlredi, srsly."
	    }
    }

    def delete = {
        println "in event delete action. params are: " + params
        def tekEventInstance = TekEvent.findBySlug( params.slug )
        def location = "/srv/www/tekdays/files/${tekEventInstance?.slug}"
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

    def editDate = {
        def tekEventInstance = TekEvent.findBySlug( params.slug )

        if(!tekEventInstance) {
            flash.message = "Couldn't find ${params.name.decodeHyphen()}."
            redirect(action:list)
        }
        else {
            return [ tekEventInstance : tekEventInstance, id:tekEventInstance.id ]
        }
    }

    def editLogo = {
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
            if(params.startDate){ params.startDate = df.parse(params.startDate) }
            if(params.endDate){ params.endDate = df.parse(params.endDate) }

            if(params.banner){
                fileUploadService.uploadEventBanner(params.banner, tekEventInstance.id)
            }
            if(params.flyerFile){
                fileUploadService.uploadFlyer(params.flyerFile, tekEventInstance.id)
            }

             if(params.logoFile){
                fileUploadService.uploadEventLogo(params.logoFile, tekEventInstance.id)
            }

            tekEventInstance.properties = params

            if(params.tagList) tagService.saveTag(params.tagList, tekEventInstance)
            if(!tekEventInstance.hasErrors() && tekEventInstance.save()) {
                flash.message = "Event updated."
                redirect(action: edit, params:[slug: tekEventInstance.slug])
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

        if(params.tagList) tagService.saveTag(params.tagList, tekEventInstance)

        tekEventInstance.bannerLocation = "/srv/www/tekdays/images/events/banners/"
        tekEventInstance.bannerName = "default-banner.png"
        tekEventInstance.logo = "/srv/www/tekdays/images/events/logos/default-logo.png"


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

        def result = [ result: tagList ]

        render result as JSON
        println result
    }

    def autoCity = {
       def cities = TekEvent.executeQuery("select distinct ev.city from TekEvent ev where ev.city like ?", params.query + '%')
       cities = cities.collect { city -> [id:city, name:city] }
       def result = [ result: cities ]
       render result as JSON
       println result
    }

    def autoState = {
       def usStates = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut',
               'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa',
               'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan',
               'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
               'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma',
               'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee',
               'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']

       def states = TekEvent.executeQuery("select distinct ev.state from TekEvent ev") + usStates as SortedSet
       states = states.findAll { it.toUpperCase().startsWith(params.query.toUpperCase()) }

       states = states.sort()
       states = states.collect { state -> [id:state, name:state] }
       def result = [ result: states ]
       render result as JSON
       println result
    }

    def updateEvent = {
        //I-I believe you've convinced them once again. Mr Scrooge.
        println "entering updateEvent action. params are: $params"

        def tekEventInstance = TekEvent.get( params.id )
        println "tekEventInstance in updateEvent action is " + tekEventInstance
        //At that moment. who should arrive at the door...
        if(tekEventInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(attachmentInstance.version > version) {
                    attachmentInstance.errors.rejectValue("version", "attachment.optimistic.locking.failure", "Another user has updated this file while you were editing.")
                    render(template:"/dashboard/editEvent", model:[tekEventInstance:tekEventInstance])
                    return
                } //but Scrooge's nephew. Fred. his only living relative.
            }
            tekEventInstance.properties = params
            //Nephew Fred? I don't see him.

            //Trust me.
            if(!tekEventInstance.hasErrors() && tekEventInstance.save()) {
                //Hello? Uncle?
                println "saved tekEventInstance (in updateEvent). it is " + tekEventInstance
                //Rizzo?

                //You're very good at that. Mr Dickens.
                flash.message = "Event updated"
                render(template:"/dashboard/editEvent", model:[ tekEventInstance: tekEventInstance ])
                return
            }
            else {
                render(template:"editEvent", model:[tekEventInstance:tekEventInstance])
            }
        }
        else {
            flash.message = "Argh! No event found with id ${params.id}"
            render(template:"/dashboard/editEvent", model:[ tekEventInstance: tekEventInstance ])
        }
    }

    def displayBanner = {
			println "entering displayBanner"
			def tekEventInstance = TekEvent.findBySlug(params.slug)
			println tekEventInstance
			println tekEventInstance.bannerLocation
			println tekEventInstance.bannerName
			def banner = new File("${tekEventInstance.bannerLocation}/${tekEventInstance.bannerName}")
			println banner

			response.contentType = "image/jpeg"
	    response.contentLength = banner.size()
	    response.outputStream.write(banner.readBytes())
		}

}

//What's that?

//Oh. look! It's the penguins' Christmas skating party.

//Ah! Hmm. Uh. Yeah.

//Merry Christmas. Penguins.

