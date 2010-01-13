class TekUser {

    static transients = ['pass']
    static hasMany = [authorities: Role]
    static belongsTo = Role

    boolean enabled
    String username
    String passwd
    String email
    Profile profile



    String pass = '[secret]'

    String toString(){ username }

    def isAdmin(){
        def adminRole = Role.findByAuthority("ROLE_ADMIN")
        adminRole?.people.find{it.id == id}
    }

    static constraints = {

        username(blank: false, unique: true)
        passwd(blank: false, unique:true)
        email(email:true)
        profile(nullable:true)

    }
    static mapping = {
        profile lazy:false
    }

}

