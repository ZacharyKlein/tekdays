class Attachment {

    String name
    String location


    static belongsTo = TekEvent
    
    static constraints = {
        name(nullable:false)
        location(nullable:false)
    }
}
