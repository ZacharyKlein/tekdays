class TekEvent implements Serializable {
    String city
    String name
    TekUser organizer
    String venue
    String venueMapLink
    Date startDate
    Date endDate
    String description
    String twitterId
    String twitterPassword
    Schedule schedule

    String toString(){
        "$name, $city"
    }


    static searchable = {
        tags component: true
    }

    def authenticateService

    def currentUserTasks() {
        def user = TekUser.get(authenticateService.userDomain().id)
        def foo = tasks.findAll{ it.assignedTo == user && it.completed == false }
        return foo
    }

    def findAssociatedUsers(){
        def users = volunteers as List
        users << organizer
    }

    static hasMany = [volunteers:TekUser,
                      respondents:String,
                      sponsorships:Sponsorship,
                      tasks:Task,
                      messages:Message,
                      registrations:Registration,
                      tags:Tag,
                      attachments:Attachment[]]

    static constraints = {
        name(blank:false)
        city(blank:false)
        description(maxSize : 5000)
        organizer(nullable:false)
        venue(nullable:true)
        venueMapLink(nullable:true)
        startDate(nullable:true)
        endDate(nullable:true)
        volunteers(nullable : true)
        sponsorships(nullable : true)
        tasks(nullable : true)
        messages(nullable : true)
        registrations(nullable : true)
        tags(nullable:true)
        twitterId(nullable:true)
        twitterPassword(nullable:true)
	schedule(nullable:true)
        attatchment(nullable:true)
    }
}

