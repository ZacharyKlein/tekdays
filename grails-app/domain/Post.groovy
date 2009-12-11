class Post {

    String title
    Date dateCreated = new Date()
    String content
    TekEvent event

    static belongsTo = TekEvent

    static constraints = {
        title blank:false
        dateCreated blank:false
        content blank:false, maxSize:10000
    }
}

