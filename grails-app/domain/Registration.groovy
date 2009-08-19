class Registration {
    
    String firstName
    String lastName
    String email
    Boolean confirmed
    TekEvent event

    static belongsTo = TekEvent

    static constraints = {

        firstName nullable:false
        lastName nullable:false
        email nullable:false, email:true

    }
}
