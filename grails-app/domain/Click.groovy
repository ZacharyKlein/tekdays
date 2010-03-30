class Click {

    String host
    Date clickDate = new Date()

    static belongsTo = Ad

    static constraints = {
      host nullable:true, blank:true
      clickDate nullable:false, blank:false
    }
}
