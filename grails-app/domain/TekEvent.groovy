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
    String flyer

    String bannerLocation
    String bannerName
    String logo


    String toString(){ "$name" }


//     def fileName

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
        def users = []
        def v = volunteers.findAll{ it.active == true } as List
        v.each {
          def u = TekUser.get(it.user.id)
          users.add(u)
        }
        users << organizer
        return users
    }

    def findSponsors(){
        def s = sponsorships.find{ it.organizerApproved == true && it.sponsorApproved == true }
        def sponsors = s?.collect{ it.sponsor }
    }


// Static methods to seperate filename/location for logo and bannerLocation

    def getFileLocation(String fileString) {def fileLocation = fileString?.split('/')[0..-2].join('/') }
    def getFileName(String fileString) { def fileName = fileString?.split('/')[-1] }

    def getLogoName() { getFileName(logo) }
    def getLogoLocation() { getFileLocation(logo) }

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
        flyer(nullable:true)
        attachments(nullable:true)

        bannerLocation(nullable:true)
        bannerName(nullable:true)
        logo(nullable:true, blank:true)

    }

    static mapping = {
        profile lazy:false
    }
}

