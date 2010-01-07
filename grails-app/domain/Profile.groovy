class Profile {

    String fullName
    String website
    String bio

    boolean emailShow
    boolean fullNameShow

    static belongsTo = TekUser

    String toString(){ fullName }

    static constraints = {
        fullName(blank: true)
        website(nullable: true)
        bio(nullable: true, maxSize: 5000)
    }
}
