
class DashboardController {

    def twitterService
    def authenticateService



    def index = { }

    def dashboard = {
        def event = TekEvent.findByName(params.name.decodeHyphen())
        println "event is: " + event
        if (event){
          if (authenticateService.userDomain()) {
            if(event.organizer.username == authenticateService.userDomain().username ||
               event.volunteers.collect{it.username}.contains(
                                                         authenticateService.userDomain().username)){
                def tasks = Task.findAllByEventAndCompleted(event, false,
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

                return [event:event, eventId:event.id, tasks:tasks, volunteers:volunteers,
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
	    def blurb = Blurb.get(params.id)
	    blurb.content = params.content
	    blurb.save()
	    redirect(action:'dashboard', id:params.eventId)
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

