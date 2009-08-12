class Task {
    String title
    String notes
    TekUser assignedTo
    Date dueDate
    TekEvent event
    //START_HIGHLIGHT
    Boolean completed
    //END_HIGHLIGHT
    
    static constraints = {
        title(blank:false)
        notes(blank:true, nullable:true, maxSize:5000)
        assignedTo(nullable:true)
        dueDate(nullable:true)
        //START_HIGHLIGHT
        completed(nullable:true)
        //END_HIGHLIGHT
    }
    
    static belongsTo = TekEvent
    
    String toString(){
        title
    }
}
