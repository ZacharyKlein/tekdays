class Attachment {

    String displayName
    String name
    String location
    Date dateCreated


    static belongsTo = TekEvent

    static constraints = {
        displayName(nullable:true)
        name(nullable:false)
        location(nullable:false)
        dateCreated(nullable:true)
    }
}

