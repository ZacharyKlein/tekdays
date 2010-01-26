class Volunteer {

    TekEvent event
    TekUser user
    Boolean active = false
    Date dateCreated
    Date lastUpdated

    static belongsTo = TekEvent

    static constraints = {
        event nullable:false, blank:false
        user nullable:false, blank:false
    }
}

