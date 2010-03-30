class TekUser {

  boolean enabled
  String username
  String passwd
  String email
  String avatarLocation
  String avatarName
  String fp
  Profile profile
  Date dateCreated = new Date()
  String hiddenHelp = " "
  static final Integer HELP_1 = 1
  static final Integer HELP_2 = 2

  static transients = ['pass']

  //and his sympathy for all poor men...

  static hasMany = [authorities: Role, volunteers:Volunteer]
  static belongsTo = Role
  static searchable = true

  //that led them straight to the home of Scrooge's faithful clerk.



def showHelp(helpVal){
	if (hiddenHelp && hiddenHelp.trim() != ''){
		def hiddenHelps = hiddenHelp.split(',').collect{it.toInteger()}
		println hiddenHelps
		return !hiddenHelps?.contains(helpVal)
	}
	else
		return true
}

def hideHelp(helpVal){
	if (hiddenHelp && hiddenHelp.trim() != '')
		hiddenHelp += ",$helpVal"
	else
		hiddenHelp += helpVal
}



  String pass = '[secret]'

      //Goose! They're cookin' goose down there!

  //Rizzo. Get out of the way!
      //Hey. Hey. Hey. Hey!


  String toString(){ username }

    //Don't be sweeping the chimney now. You're blockin' the smell!

  def isAdmin(){
    def adminRole = Role.findByAuthority("ROLE_ADMIN")
    if(adminRole?.people.find{it.id == id}){
      return true
    } else {
      return false
    }
  }

      //This is Bob Cratchit's house?
  //How do you know that?
      //You just told me.
  //Well. I'm usually trustworthy.

  def isOrganizer(TekEvent event) {
    println "we're in the isOrganizer method of the TekUser. event is ${event}"
    event.organizer.id == id
  }

      //Who's that?
  //Mrs Cratchit. Of course!

  //Peter. Do not stop turning that spit.
  //That is the whole secret of a properly roasted goose.

    //It smells so good. Mother.

  //It does. Doesn't it?


  def isVolunteer(TekEvent event) {
    println "we're in the isVolunteer method of the TekUser. event is ${event}"
    event.volunteers.find{it.id == this.id}
  }

      //Oh. That smells wonderful!

  //Oh. Good grief!

  static constraints = {

          //Hey. I'm stuck. Get me outta here.
      //I knew you weren't suited for literature.
      username(blank: false, unique: true)
      passwd(blank: false, unique:true)
      email(email:true)
      avatarLocation(nullable:true, blank: true)
      avatarName(nullable:true, blank: true)
      fp(nullable: true, blank:true)
      profile(nullable:true)
      dateCreated(nullable:true, blank:true)
      hiddenHelp(nullable:true)
          //At least I landed on something soft.
          //And hot!

          //Hot! Hot! Hot! Hot! Hot!

  }

  //Hmm?

      //I fell down the chimney and landed on a flaming hot goose.


  static mapping = {
      profile lazy:false
  }

}

