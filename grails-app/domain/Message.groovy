class Message {
    String subject
    String content
    Message parent
    TekEvent event
    TekUser author
    Date timePosted
    
    static constraints = {
        subject(blank:false)
        content(blank:false, maxSize:2000)
        parent(nullable:true)
        author(nullable:false)
        timePosted(nullable:true, min: new Date())
    }
    
    static belongsTo = TekEvent
}
