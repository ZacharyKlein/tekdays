class TekDaysTagLib {

  def authenticateService

  def messageThread = {attrs ->
    def messages = attrs.messages.findAll{!it.parent}
    processMessages(messages, 0)
  }
  
  void processMessages(messages, indent){
    messages.each{msg ->

      def body = "${msg?.author} - ${msg?.subject}"
      out << "<div style='height:30; margin-left:${indent * 20};'>"
      out << "${remoteLink(action:'showDetail', id:msg.id, update:'details', body)}"
      out << "</div>"
      
      def children = Message.findAllByParent(msg)
      if (children){
          processMessages(children, indent + 1)
      }
    }
  }

  def loginToggle = {
    out << "<div id='loginToggle'>"
    if (authenticateService.isLoggedIn()){
      def uname = authenticateService.userDomain().username
      def user = TekUser.findByUsername(uname)
      out << "Welcome "
      out << "${authenticateService.userDomain().username}"
      out << " | <a href='${createLink(controller:'tekUser', action:'show', id:'${user.id}')}'>Profile</a>"
      out << " | <a href='${createLink(controller:'logout', action:'index')}'>"
      out << "Logout </a>"
    }
    else{
      out << "<a href='${createLink(controller:'login', action:'auth')}'>"
      out << "Login </a>"
    }
    out << "</div><br/>"
  }

def organizerEvents = {
  if (authenticateService.isLoggedIn()){
    def events = TekEvent.findAllByOrganizer(authenticateService.userDomain())
    if (events){
      out << "<div style='margin-left:25px; margin-top:25px; width:85%'>"
      out << "<h3>Events you are organizing:</h3>"
      out << "<ul>"
      events.each{
	    out << "<li><a href='"
	    out << "${createLink(controller:'tekEvent',action:'show',id:it.id)}'>"
	    out << "${it}</a></li>"
      }
      out << "</ul>"
      out << "</div>"
    }
  }	
}

def volunteerEvents = {
  if (authenticateService.isLoggedIn()){
    def events = TekEvent.createCriteria().list{
	  volunteers{
	    eq('id', authenticateService.userDomain()?.id)	
	  }
    }
    if (events){
      out << "<div style='margin-left:25px; margin-top:25px; width:85%'>"
      out << "<h3>Events you volunteered for:</h3>"
      out << "<ul>"
      events.each{
	    out << "<li><a href='"
	    out << "${createLink(controller:'tekEvent',action:'show',id:it.id)}'>"
	    out << "${it}</a></li>"
      }
      out << "</ul>"
      out << "</div>"
    }
  }	
}

def volunteerButton = {attrs ->
	if (authenticateService.isLoggedIn()){
		def user = TekUser.findByUsername(authenticateService.userDomain().username)
		def event = TekEvent.get(attrs.eventId)
		if (event && !event.volunteers.contains(user)){
			out << "<span id='volunteerSpan' class='menuButton'>"
		    out << "<button id='volunteerButton' type='button'>"
		    out << "Volunteer For This Event"
		    out << "</button>"
		    out << "</span>"
        }
    }
}

    def showAvatar = { attrs ->
        def user = TekUser.findByUsername(attrs.username)
        out << '''<img src="'''
        out << "${request.contextPath}"
        out << '''/images/avatars/'''
        out << "${attrs.username}"
        out << '''-avatar.jpg" height="'''
        out << "${attrs.height}" 
        out << '''" width="'''
        out << "${attrs.width}"
        out << '''" align="'''
        out << "${attrs.align}"
        out << '''" />'''
    }

    def displayFullName = { attrs ->
        def user = TekUser.findByUsername(attrs.username)
        if(user.fullNameShow) {
            out << "${user.fullName}"
        } else {
            out << "[hidden]"
        }
    }

    def ifIsAuthor = { attrs, body ->
        def currentUser = TekUser.findByUsername(authenticateService.userDomain().username)
        def message = Message.get(attrs.id)
        println "the current user is " + currentUser + ", baby"
        println "message.author.username in taglib is " + message.author.username + ", man"
        def author = TekUser.findByUsername(message.author.username)
        if(currentUser == author) {
            out << body()
        }
        else {
            out << " "
        }
    }

    def postCount = { attrs ->
        println "rendering postCount Tag"
        def topic = Message.findById(attrs.topic)
        println topic

        def postCount = Message.countByParent(topic) + 1
        println postCount


        out << "${postCount}"
    }

   def lastPost = { attrs ->
	println "rendering lastPost tag"
 	def topic = Message.findById(attrs.topic)
	def lastReply = Message.findAllByParent(topic, [sort:'dateCreated',  
						order:'desc', max:'1'])[0]
	def lastPost
					     
        if(lastReply) {
	  lastPost = lastReply
	}
	else {
	  lastPost = topic
	}

	out << "${formatDate format:'M/dd/yy h:mm a', date:lastPost.dateCreated}  by "
        out << '''<a href="'''
        out << "${createLinkTo(controller:'tekUser', action:'show', id:lastPost.author.id)}"
        out << '''">'''
        out << "${lastPost.author.fullName}"
        out << '</a>'
	
	
   }

}

