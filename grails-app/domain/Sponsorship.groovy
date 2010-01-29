class Sponsorship {
    TekEvent event
    Sponsor sponsor
    String contributionType
    String description
    String notes
    Boolean sponsorApproved = false
    Boolean organizerApproved = false

    static constraints = {
        event(nullable:false)
        sponsor(nullable:false)
        contributionType(blank: true, inList:["Other", "Venue", "A/V", "Promotion", "Cash"], nullable:true)
        description(nullable:true, blank:true)
        notes(nullable:true, blank:true, maxSize:5000)
	    sponsorApproved()
	    organizerApproved()
    }
}

