class TekUser {

    static transients = ['pass']
    static hasMany = [authorities: Role]
    static belongsTo = Role

    boolean enabled
    String username
    String passwd
    String email
    String avatarLocation
    String avatarName
    String fp
    Profile profile



    String pass = '[secret]'

    String toString(){ username }

    def isAdmin(){
        def adminRole = Role.findByAuthority("ROLE_ADMIN")
        adminRole?.people.find{it.id == id}
    }

    def isOrganizer(TekEvent event) {
        println "we're in the isOrganizer method of the TekUser. event is ${event}"
        event.organizer.id == id
    }

    def isVolunteer(TekEvent event) {
        println "we're in the isVolunteer method of the TekUser. event is ${event}"
        event.volunteers.find{it.id == this.id}
    }

    static constraints = {

        username(blank: false, unique: true)
        passwd(blank: false, unique:true)
        email(email:true)
        avatarLocation(nullable:true, blank: true)
        avatarName(nullable:true, blank: true)
        fp(nullable: true, blank:true)
        profile(nullable:true)

    }
    static mapping = {
        profile lazy:false
    }

}

