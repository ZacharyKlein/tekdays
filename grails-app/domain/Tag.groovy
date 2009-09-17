class Tag {

    String name
    
    static hasMany = [events:TekEvent, sponsors:Sponsor]
    static belongsTo = [TekEvent, Sponsor]

    static constraints = {
        events(nullable:true)
        sponsors(nullable:true)
    }
}
