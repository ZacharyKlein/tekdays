class TekPost {
  String title
  String body
  Date dateCreated = new Date()

  static constraints = {
    title nullable:false, blank:false
    body nullable:false, blank:false, maxSize:50000
    dateCreated nullable:false, blank:false

  }
}
