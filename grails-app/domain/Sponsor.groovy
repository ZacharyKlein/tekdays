class Sponsor {
    String name
    String website
    String description
    byte[] logo
    String logoLocation
    String fp
    String logoName
    String slug
    TekUser rep

    String toString(){
        name
    }

    static hasMany=[sponsorships:Sponsorship, tags:Tag]

    static constraints = {
        name(blank:false)
        website(blank:true, nullable:true)
        description(nullable:true, maxSize:5000)
        logo(nullable:true, maxSize:1000000)
        sponsorships(nullable:true)
        tags(nullable:true)
        rep(nullable:true)
        logoLocation(nullable:true, blank:true)
        fp(nullable:true, blank:true)
        logoName(nullable:true, blank:true)
        slug(nullable:true, blank:true)
    }

    static mapping = {
        profile lazy:false
    }


}

