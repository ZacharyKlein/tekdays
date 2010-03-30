class Ad {

    String name
    String imageLocation
    String imageName
    static hasMany = [clicks: Click]

    static constraints = {

      name nullable:false, blank:false
      imageLocation nullable:false, blank:false
      imageName nullable:false, blank:false
      
    }
}
