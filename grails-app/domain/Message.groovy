class Message {
    String subject
    String content
    Message parent
    TekEvent event
    TekUser author
    Date dateCreated = new Date()
    Date lastUpdated    

    static constraints = {
        subject(blank:false)
        content(blank:false, maxSize:2000)
        parent(nullable:true)
        author(nullable:false)
        dateCreated(nullable:true)
    }
    
    static belongsTo = TekEvent
}
