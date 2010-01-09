class Sponsor {
    String name
    String website
    String description
    byte[] logo
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
    }
    
    static mapping = {
        profile lazy:false
    }


}


