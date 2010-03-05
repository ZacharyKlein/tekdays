
class DashboardController {

    def twitterService
    def authenticateService



    def index = { }

    def dashboard = {
        println "we just got into the dashboard action, and the params are " + params
        def tekEventInstance = TekEvent.findBySlug(params?.slug)
        if (tekEventInstance){
            if((authenticateService.userDomain()) &&
             (tekEventInstance.organizer.username == authenticateService.userDomain().username
             || tekEventInstance.volunteers.collect{it.user.username}.contains(authenticateService.userDomain().username)
             || adminRole.people.find{ it.id == authenticateService.userDomain().id}
             || isEventSponsor == true)){
                def user = TekUser.get(authenticateService.userDomain()?.id)
                def isEventSponsor = false
                if (Sponsor.findByRep(user)){
                    def sponsor = Sponsor.findByRep(user)
                    def sponsorship = Sponsorship.findByEventAndSponsor(tekEventInstance, sponsor)
                    if (sponsorship.organizerApproved == true && sponsorship.sponsorApproved ==  true){
                        isEventSponsor = true
                    }
                }
        def adminRole = Role.findByAuthority("ROLE_ADMIN")
        println "tekEventInstance is: " + tekEventInstance
                def tasks = Task.findAllByEvent/*AndCompleted*/(tekEventInstance, /*'false',*/
                                                            [max:5, sort:'dueDate'])
                def taskInstanceList = Task.findAllByEvent(tekEventInstance)
                def volunteers = tekEventInstance.volunteers
                def messages = Message.findAllByEventAndParentIsNull(tekEventInstance,
                                                                     [sort:'id',
                                                                      order:'desc'])

                def forumTopics = tekEventInstance?.messages.findAll{!it.parent}.sort{obj1, obj2 ->  obj2.dateCreated <=> obj1.dateCreated}
                def attachments = tekEventInstance.attachments
                def sponsorships = tekEventInstance.sponsorships
                println "deep within the bowels of the earth, or shall we say the Dashboard Controller, the tekEventInstance we are going to return is " + tekEventInstance
                def blurb = Blurb.findByName("custom_${tekEventInstance.id}")
                if (!blurb){
                    blurb = new Blurb(name:"custom_${tekEventInstance.id}",
                                      content:"").save()
                }

                return [tekEventInstance:tekEventInstance, tasks:tasks, volunteerInstanceList:volunteers,
                        messages:messages, attachments:attachments, sponsorships:sponsorships, forumTopics:forumTopics,
                        blurb:blurb, taskInstanceList: taskInstanceList, taskInstanceTotal: taskInstanceList.size()]
            }

            else{
                flash.message = "Access to dashboard for ${tekEventInstance.name} denied."
                redirect(controller:'home', action:'index')
          }
        }

        else{
            flash.message = "No tekEventInstance was found with an id of ${params.id}"
            redirect(controller:'tekEvent', action:'search')
        }
    }


    def updateBlurb = {
        println "here we're starting the updateBlurb action. params are " + params
	    def blurb = Blurb.get(params.id)
        def tekEventInstance = TekEvent.get(params.tekEventInstanceId)
	    def name = tekEventInstance?.name
	    blurb.content = params.content
	    blurb.save()
	    println "going to redirect with the tekEventInstance being " + tekEventInstance + " and the name being " + name
	    redirect(action:'dashboard', params:[name:name.encodeAsHyphen().toLowerCase(), tekEventInstance:tekEventInstance])
    }

    def tweet = {
	    def tekEventInstance = TekEvent.get(params.id)
	    if (tekEventInstance){
		    twitterService.setStatus(params.status,
                                     [username:tekEventInstance.twitterId,
                                      password:tekEventInstance.twitterPassword])
	    }
	    redirect(action:dashboard, id:tekEventInstance.id)
    }
}

