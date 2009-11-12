class Attachment {

    String name
    String location
    Date dateCreated


    static belongsTo = TekEvent
    
    static constraints = {
        name(nullable:false)
        location(nullable:false)
        dateCreated(nullable:true)
    }
}
