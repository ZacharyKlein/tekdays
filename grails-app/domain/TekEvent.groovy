class TekEvent {
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
    
	static searchable = true

    static hasMany = [volunteers:TekUser, 
                      respondents:String, 
                      sponsorships:Sponsorship,
                      tasks:Task, 
                      messages:Message,
                      registrations:Registration]
    
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
        twitterId(nullable:true)
        twitterPassword(nullable:true)
	schedule(nullable:true)
    }  
}
