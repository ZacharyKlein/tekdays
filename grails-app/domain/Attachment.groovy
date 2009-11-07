class Attachment {

    String name
    String location
    
    static constraints = {
        name(nullable:false)
        location(nullable:false)
    }
}
