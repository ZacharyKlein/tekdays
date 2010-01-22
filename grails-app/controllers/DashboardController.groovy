
class DashboardController {

    def twitterService
    def authenticateService



    def index = { }

    def dashboard = {
        println "we just got into the dashboard action, and the params are " + params
        def event = TekEvent.findBySlug(params?.slug)
        println "event is: " + event
        if (event){
          if (authenticateService.userDomain()) {
            if(event.organizer.username == authenticateService.userDomain().username ||
               event.volunteers.collect{it.username}.contains(
                                                         authenticateService.userDomain().username)){
                def tasks = Task.findAllByEvent/*AndCompleted*/(event, /*'false',*/
                                                            [max:5, sort:'dueDate'])
                def volunteers = event.volunteers
                def messages = Message.findAllByEventAndParentIsNull(event,
                                                                     [sort:'id',
                                                                      order:'desc'])

                def attachments = event.attachments
                def sponsorships = event.sponsorships
                def blurb = Blurb.findByName("custom_${event.id}")
                if (!blurb){
                    blurb = new Blurb(name:"custom_${event.id}",
                                      content:"").save()
                }

                return [event:event, eventId:event.id, eventId:event.id, tasks:tasks, volunteers:volunteers,
                        messages:messages, attachments:attachments, sponsorships:sponsorships,
                        blurb:blurb]

            }
            else{
              flash.message = "Access to dashboard for ${event.name} denied."
              redirect(controller:'tekEvent', action:'list')
          }
         }
        }

        else{
            flash.message = "No event was found with an id of ${params.id}"
            redirect(controller:'tekEvent', action:'list')
        }
    }


    def updateBlurb = {
        println "here we're starting the updateBlurb action. params are " + params
	    def blurb = Blurb.get(params.id)
        def event = TekEvent.get(params.eventId)
	    def name = event?.name
	    blurb.content = params.content
	    blurb.save()
	    println "going to redirect with the event being " + event + " and the name being " + name
	    redirect(action:'dashboard', params:[name:name.encodeAsHyphen().toLowerCase(), event:event])
    }

    def tweet = {
	    def event = TekEvent.get(params.id)
	    if (event){
		    twitterService.setStatus(params.status,
                                     [username:event.twitterId,
                                      password:event.twitterPassword])
	    }
	    redirect(action:dashboard, id:event.id)
    }
}

