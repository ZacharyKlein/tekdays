class Registration {

    String firstName
    String lastName
    String email
    TekEvent event

    static belongsTo = TekEvent

    static constraints = {

        firstName nullable:false
        lastName nullable:false
        email nullable:false, email:true

    }

    String toString(){
        "${firstName} ${lastName} - ${event}"
    }
}

