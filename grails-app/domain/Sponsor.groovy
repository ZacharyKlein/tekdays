class Sponsor {
    String name
    String website
    String description
    byte[] logo
    
    String toString(){
        name
    }

    static hasMany=[sponsorships:Sponsorship]

    static constraints = {
        name(blank:false)
        website(blank:true, nullable:true)
        rep(nullable:false)
        description(nullable:true, maxSize:5000)
        logo(nullable:true, maxSize:1000000)
        sponsorships(nullable:true)
    }
}
