class Attachment {

    String displayName
    String name
    String location
    String description
    Date dateCreated = new Date()
    TekEvent event


    static belongsTo = TekEvent

    String toString() {
        name
    }

    static constraints = {
        displayName(nullable:true)
        name(nullable:false)
        location(nullable:false)
        description(nullable:true, maxSize:1000)
        dateCreated(nullable:true)
    }
}

