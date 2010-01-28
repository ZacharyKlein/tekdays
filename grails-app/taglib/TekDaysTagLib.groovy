class TekDaysTagLib {

  static namespace = "td"

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

    def showAvatar = { attrs ->
        def user = TekUser.findByUsername(attrs.username)
        out << "<img class='avatar' src='"
        out << resource(dir:"images/avatars/${user?.username}", file:user.avatarName)
        out << "' />"
    }

    def showLogo = { attrs ->
        def sponsor = Sponsor.get(attrs.id)
        out << "<img src='"
        out << resource(dir:"images/logos/${sponsor?.name}", file:sponsor.logoName)
        out << "' />"
    }

    def displayFullName = { attrs ->
        def user = TekUser.findByUsername(attrs.username)
        if(user?.profile?.fullNameShow) {
            out << "${user?.profile?.fullName}"
        } else {
            out << "[hidden]"
        }
    }

    def ifIsAuthor = { attrs, body ->
        def user =  TekUser.get(authenticateService.userDomain()?.id)
        def message = Message.get(attrs.id)
        def adminRole = Role.findByAuthority("ROLE_ADMIN")
        println "the current user is " + user + ", baby"
        println "message.author.username in taglib is " + message.author.username + ", man"
        def author = TekUser.get(message.author.id)
        println "the adminRole is " + adminRole + ". its authority is " + adminRole?.authority
        println "true or false. the adminRole contains the current user (" + user + "): " + adminRole?.people.contains(user)
        adminRole.people.each { println it }
        if((user == author) || (adminRole.people.find{it.id == user.id})) {
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

   def profileChange = { attrs, body ->
      def user = authenticateService.userDomain()
      def adminRole = Role.findByAuthority("ROLE_ADMIN")
      println "logged in user is... " + user
      def owner = TekUser.get(attrs.ownerId)
      println "and the owner is... " +  owner
      if((user?.id == owner.id) || (adminRole.people.find{it.id == user?.id})){
         out << body()
      }
      else {
         out << ""
      }
   }

   def ifIsAssociated = { attrs, body ->
       def user =  TekUser.get(authenticateService.userDomain()?.id)
       def adminRole = Role.findByAuthority("ROLE_ADMIN")
       println "in ifIsAssociated tag, and the logged-in user is " + user
       def event = TekEvent.get(attrs.id)
       println "still in ifIsAssociated tag. the event is " + event
       println "is this user a volunteer? " + event.volunteers.find{it.user.id == user?.id}
       println "hmm. is this user the organizer? " + event.organizer == user
       println "the organizer of this event is " + event?.organizer
       if( (event.volunteers.find{it.user.id == user?.id && it.active == true}) || (event.organizer == user) || (adminRole.people.find{it.id == user?.id}) ){
           out << body()
       }
       else {
           out << ""
       }
   }

   def ifIsOrganizer = { attrs, body ->
       def user =  TekUser.get(authenticateService.userDomain()?.id)
       def adminRole = Role.findByAuthority("ROLE_ADMIN")
       println "in ifIsOrganizer tag, and the logged-in user is " + user
       def event = TekEvent.get(attrs.id)
       println "still in ifIsOrganizer tag. the event is " + event
       println "is this user the organizer? " + event.organizer == user
       println "the organizer of this event is " + event?.organizer
       if( (event.organizer == user) || (adminRole.people.find{it.id == user?.id}) ){
           out << body()
       }
       else {
           out << ""
       }
   }

   def profileInfo = { attrs ->
       println "w00t! we just got into the profileInfo tag."
       def loggedInUserId = authenticateService.userDomain().id
       def user = TekUser.get(loggedInUserId)
       def profile = user?.profile
       def field = profile?."${attrs?.fieldName}"
       println "okay, so the field that we're going to return is: " + field

       out << field
   }

   def editInPlace = { attrs, body ->
       println "w00t! just got into the editInPlace tag, and the params are: " + params
       def rows = attrs.rows ? attrs.rows : 0
       def cols = attrs.cols ? attrs.cols : 0
       def id = attrs.remove('id')

       def user =  TekUser.get(authenticateService.userDomain()?.id)
       def event = TekEvent.get(attrs.eventId)
       def adminRole = Role.findByAuthority("ROLE_ADMIN")

       if( (event.volunteers.contains(user)) || (event.organizer == user) || (adminRole.people.find{it.id == user?.id}) ){
         out << "<span id='${id}'>"
         out << body()
         out << "</span>"
         out << "<script type='text/javascript'>"
         out << "new Ajax.InPlaceEditor('${id}', '"
         out << createLink(attrs)
         out << "',{"
         if(rows)
          out << "rows:"
          out << "${rows}"
          out << ","
         if(cols)
           out << "cols:"
           out << "${cols}"
           out << ","
         if(attrs.paramName) {
           out << """callback: function(form, value) {
               return '${attrs.paramName}=' + escape(value) }"""
         }
         out << "});"
         out << "</script>"
       } else {
         out << "${attrs.otherwise}"
       }
   }

/*   def linkToFile = { attrs, body ->
       println "in linkToFile tag. attrs: " + attrs
       def file = attrs.file
       def event = TekEvent.get(attrs.id)
       println file?.class
       out << '''<a href="${resource(dir:'files/'''
       out << """${event?.name.toLowerCase().encodeAsHyphen()}"""
       out << """', file:'"""
       out << """${file.name}"""
       out << """')}">"""
       out << body()
       out << """</a>"""
   }    */

   def linkToFile = { attrs, body ->
       println "in linkToFile tag. attrs: " + attrs
       def file = attrs.file
       def event = TekEvent.get(attrs.id)
       println file?.class
       out << "<a href='"
       out << resource(dir:"files/${event?.slug}", file:file.name)
       out << "'>"
       out << body()
       out << "</a>"
    }

def downloadList = { attrs ->
       def user =  TekUser.get(authenticateService.userDomain()?.id)
       def adminRole = Role.findByAuthority("ROLE_ADMIN")
       def event = TekEvent.get(attrs.id)
       def files = event.attachments
       if ((event?.volunteers?.contains(user)) || (event.organizer == user) || (adminRole.people.find{it.id == user?.id}) ){
           out << "<div id='eventDownloadList'>"
           out << "<h4>Downloads</h4>"
           if (files?.size() > 0){
               out << "<ul>"
               files.each{file ->
                   out << "<li class='file'>"
                   out << gui.toolTip(text:file.description){
                       td.linkToFile(id:event.id, file:file){
                              file.displayName ?: file.name
                       }
                   }
                   out << "</li>"
               }
               out << "</ul>"
           }
           out << "<br />"
           //out << link.newAttachment(name:event.name.toLowerCase().encodeAsHyphen()){'Upload a file'}
           out << g.link(mapping:'eventAttachments', params:[slug:event?.slug], 'All Files')
           out << " | "
           out << g.link(mapping:'newAttachment', params:[slug:event?.slug], 'Upload a file')
           out << "..."
           out << "</div>"
       }
       else {
           out << ""
       }
   }

    def volunteerInfo = {attrs ->
	    if (authenticateService.isLoggedIn()){
		    def user = TekUser.findByUsername(authenticateService.userDomain().username)
		    println "in td:volunteerButton. user is: " + user
		    def event = TekEvent.get(attrs.eventId)
		    println "who is the organizer? " + event.organizer
		    if ((event) && (!Volunteer.findByEventAndUser(event, user)) && (event.organizer != user)){
			    out << "<span id='volunteerSpan' class='menuButton'>"
		        out << "<button id='volunteerButton' type='button'>"
		        out << "Volunteer For This Event"
		        out << "</button>"
		        out << "</span>"
            } else if ((event) && (event.volunteers.find{it.user.id == user?.id && it.event == event && it.active == false}) ) {
                out << "<p><strong>You've volunteered for this event.</strong><br />"
                out << "You'll be emailed when the organizer adds you as a volunteer.</p>"
            } else {
                out << ""
            }
        }
    }


//ARGH! I CAN'T HOLD IT, CHARLIE! I CAN'T HOLD IT!

}

