class TekUser {

    static transients = ['pass']
    static hasMany = [authorities: Role]
    static belongsTo = Role

    String fullName
    String username
    String passwd
    String email
    String website
    String bio
    boolean enabled
    boolean emailShow
    boolean fullNameShow

    String pass = '[secret]'

    String toString(){ fullName }

    static constraints = {
        fullName(blank: false)
        username(blank: false, unique: true)
        passwd(blank: false)
        email()
        website()
        bio(maxSize:5000)
    }

}

