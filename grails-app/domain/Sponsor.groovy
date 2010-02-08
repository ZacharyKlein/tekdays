class Sponsor {
    String name
    String website
    String description
    byte[] banner
    String bannerLocation
    String fp
    String bannerName
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
        banner(nullable:false, maxSize:1000000)
        sponsorships(nullable:true)
        tags(nullable:true)
        rep(nullable:true)
        bannerLocation(nullable:true, blank:true)
        fp(nullable:true, blank:true)
        bannerName(nullable:true, blank:true)
        slug(nullable:true, blank:true)
    }

    static mapping = {
        profile lazy:false
    }


}

