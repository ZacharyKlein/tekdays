class HomePageTagLib {

  def authenticateService

  def volunteerEvents = {
    if (authenticateService.isLoggedIn()){
    def events = getEvents(authenticateService.userDomain())
    if(events){
     out << gui.tabView(){
     events.each { event ->
       def userTasks = event.tasks.findAll{ it.assignedTo == authenticateService.userDomain() }
       gui.tab(label:event.name, active:'true'){
        """<h1>${event.name}</h1> <p>${event.description}</p>"""
        if(userTasks){
          """<p>You need to:</p><ul>"""
           userTasks.each{ task ->
             """<li>${task.title}</li>"""
           }
         """</ul>"""
        }
       }
     }
    }
   }
  }
 }

  def getEvents(user){
    def events = TekEvent.list().each{
      it.volunteers.contains(user)
    }
  }

  def userTasks = { event ->

    def userTasks = event.tasks.findAll{ it.assignedTo == authenticateService.userDomain() }
    return userTasks

  }

}
 
