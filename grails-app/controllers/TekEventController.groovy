import java.text.SimpleDateFormat

class TekEventController {

    def authenticateService
    def taskService
    def tagService
    def index = { redirect(action:'joeblow') }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def joeblowFlow = {
        println "i'm in the joeblowFlow and i should be going to the basic state but i won't because that  would be a Good Thing and we're trying to avoid those here"
        basic {
            println "in basic state"
            on("next"){/*
              flow.event = new TekEvent(params)
              flow.event.validate() ? success() : error()*/
            }.to "description"
            on("cancel"){
              redirect(controller:'home')
            }//.to "blowUp"
        }

        blowUp {
            redirct(controller:'home')
        }
/*
        description {
            on("next"){
              flow.event.description = params.description
              flow.event.validate()  ? success() : error()
            }.to "venue"
            on "back".to "basic"
        }

        venue {
            on "next"{
                flow.event.venue = params.venue
                flow.event.venueMapLink = params.venueMapLink
                flow.event.validate() ? success() : error()
            }.to "twitter"
            on "skip".to "twitter"
            on "back".to "description"
        }

        twitter{
            on "next"{
                flow.event.twitterId = params.twitterId
                flow.event.twitterPassword = params.twitterPassword
                flow.event.validate() ? success() : error()
            }.to "showEv"
            on "skip".to "showEv"
            on "back".to "venue"
        }

        showEv{
            redirect(controller:"tekEvent", action: "show", name: "${flow.event.name.encodeAsHyphen()}")
        }*/
    }

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
        println "the params in the event show action are: " + params
	    def tekEventInstance = TekEvent.findByName(params.name.decodeHyphen())
        if(!tekEventInstance) {
            flash.message = "Couldn't find that event."
            redirect(action:list)
        }
        else { return [ tekEventInstance : tekEventInstance ] }
    }

    def volunteer = {
	    def event = TekEvent.get(params.id)
        event.addToVolunteers(authenticateService.userDomain())
        event.save()
	    render "Thank you for volunteering!"
    }

    def delete = {
        def tekEventInstance = TekEvent.get( params.id )
        if(tekEventInstance) {
            try {
                tekEventInstance.delete()
                flash.message = "Deleted event."
                redirect(action:list)
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
        def tekEventInstance = TekEvent.findByName( params.name.decodeHyphen() )

        if(!tekEventInstance) {
            flash.message = "Couldn't find ${params.name.decodeHyphen()}."
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
                        "Another user has updated this event " +
                            "while you were editing.")
                    render(view:'edit',model:[tekEventInstance:tekEventInstance])
                    return
                }
            }
            tekEventInstance.properties = params
            tagService.saveTag(params.tag.name, tekEventInstance)
            if(!tekEventInstance.hasErrors() && tekEventInstance.save()) {
                flash.message = "Event updated."
                redirect(action:show,name:tekEventInstance.name.encodeAsHyphen())
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
        def tekEventInstance = new TekEvent()
        def tagInstance = new Tag()
        tekEventInstance.properties = params
        return ['tekEventInstance':tekEventInstance, 'tagInstance':tagInstance]
    }

    def save = {
        params.startDate = new Date().parse('MM/dd/yyyy',
	                                     params.startDate)

        def tekEventInstance = new TekEvent(params)
        println "tekEventInstance.name is " + tekEventInstance.name

        tagService.saveTag(params.tag.name, tekEventInstance)
        println "tekEventInstance.name is " + tekEventInstance.name
        println "these are the disgustingly annoying evil wicked params " + params


        
        if(tekEventInstance.nickname){
          tekEventInstance.nickname = tekEventInstance.twitterId
        }
        else {
          tekEventInstance.nickname = tekEventInstance.name.encodeAsHyphen()
        }
        
        if(!tekEventInstance.hasErrors() && tekEventInstance.save()){
            taskService.addDefaultTasks(tekEventInstance)
            redirect action:show, params:[name:tekEventInstance?.name.encodeAsHyphen()]
        }
        else {
            render(view:'create',model:[tekEventInstance:tekEventInstance])
        }
    }

}

