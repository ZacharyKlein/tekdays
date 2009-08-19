class TekEvent {
    String city
    String name
    TekUser organizer
    String venue
    Date startDate
    Date endDate
    String description
    String twitterId
    String twitterPassword

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
        startDate(nullable:true)
        endDate(nullable:true)
        volunteers(nullable : true)
        sponsorships(nullable : true)
        tasks(nullable : true)
        messages(nullable : true)
        registrations(nullable : true)
//START_HIGHLIGHT
        twitterId(nullable:true)
        twitterPassword(nullable:true)
//END_HIGHLIGHT
    }  
}
