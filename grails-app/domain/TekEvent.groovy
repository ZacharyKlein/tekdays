class TekEvent implements Serializable {
    String city
    String state
    String country
    String name
    TekUser organizer
    String venue
    String venueMapLink
    Date startDate
    Date endDate
    String description
    String nickname
    String twitterId
    String twitterPassword
    String slug
    String schedule

    String bannerLocation
    String bannerName
    String logoName
    String logoLocation

    String toString(){
        "$name"
    }


    def fileName

    static searchable = {
        tags component: true
        organizer component: true
    }

    def authenticateService

    def currentUserTasks() {
        println "we're in the currentUserTasks() here..."
        def user = TekUser.get(authenticateService.userDomain().id)
        def taskList = tasks.findAll{ it.assignedTo == user && it.completed == false }
        return taskList.sort{it.id}
    }

    def nonApprovedVolunteers() {
        println "in nonApprovedVolunteers() method now"
        def volunteers = volunteers.findAll{ it?.active == false }
    }

    def findAssociatedUsers(){
        def users = volunteers as List
        users << organizer
    }

    def findSponsors(){
        def s = sponsorships.find{ it.organizerApproved == true && it.sponsorApproved == true }
        def sponsors = s?.collect{ it.sponsor }
    }

    def getFileName(String file) {
        fileName = file.split('/')[-1]
    }

    def getFileLocation(String file) {
        fileLocation = file.split('/')[0..-2].join('/')
    }

    static hasMany = [respondents:String,
                      sponsorships:Sponsorship,
                      tasks:Task,
                      messages:Message,
                      registrations:Registration,
                      tags:Tag,
                      attachments:Attachment,
                      posts:Post,
                      volunteers:Volunteer]

    static constraints = {
        name(blank:false, unique:true)
        city(blank:false)
        state(nullable: true)
        country(blank: false)
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
        nickname(nullable:true)
        twitterId(nullable:true)
        twitterPassword(nullable:true)
        slug(blank:true, nullable:true)
        schedule(nullable:true)
        attachments(nullable:true)

        bannerLocation(nullable:true)
        bannerName(nullable:true)
        logoName(nullable:true, blank:true)
        logoLocation(nullable:true, blank:true)

        fileName(nullable:true)
    }

    static mapping = {
        profile lazy:false
    }
}

