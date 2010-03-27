class TekDaysTagLib {

  static namespace = "td"

  def authenticateService
  def relationshipService

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

    def sponsorBanner = { attrs ->
        def sponsor = Sponsor.get(attrs.id)
        out << "<img src='"
        out << resource(dir:"images/banners/${sponsor?.name}", file:sponsor.banner)
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
        out << "${lastPost.author.username}"
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
       println "is this user a volunteer? " + event.volunteers.find{it.user.id == user?.id && it.active == true}
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

       if( (event?.volunteers.find{it.user.id == user?.id && it.active == true}) || (event.organizer == user) || (adminRole?.people.find{it.id == user?.id}) ){
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
       if ( (event?.volunteers.find{it.user.id == user?.id && it.active == true}) || (event.organizer == user) || (adminRole.people.find{it.id == user?.id}) ){
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
		    println "in td:volunteerInfo. user is: " + user
		    def event = TekEvent.get(attrs.eventId)
		    println "who is the organizer? " + event.organizer
		    if ((event) && (!Volunteer.findByEventAndUser(event, user)) && (event.organizer != user) && (!Sponsor.findByRep(user))){
			    out << "<span id='volunteerSpan' class='menuButton'>"
		        out << "<p>"
		        out << "<button id='volunteerButton' type='button'>"
		        out << "Volunteer"
		        out << "</button>"
		        out << "</p>"
		        out << "</span>"
            } else if ((event) && (event.volunteers.find{it.user.id == user?.id && it.active == false}) ) {
                out << "<p class='pending'><strong>You've volunteered for this event.</strong><br />"
                out << "You'll be emailed when the organizer adds you as a volunteer.</p>"
            } else {
                out << ""
            }
        }
    }

    def sponsorInfo = {attrs ->
	    if (authenticateService.isLoggedIn()){
		    def user = TekUser.findByUsername(authenticateService.userDomain().username)
		    println "in td:sponsorInfo. user is: " + user
		    def event = TekEvent.get(attrs.eventId)
		    println "is the user a sponsor? " + Sponsor.findByRep(user)
		    def sponsor = Sponsor.findByRep(user)
		    if ((event) && (sponsor) && (!event.sponsorships?.find{it?.sponsor.id == sponsor?.id})){
			    out << "<span id='sponsorSpan' class='menuButton'>"
		        out << "<p>"
		        out << "<button id='sponsorButton' type='button'>"
		        out << "Offer to Sponsor"
		        out << "</button>"
		        out << "</p>"
		        out << "</span>"
            } else if ((event) && (sponsor) && (event.sponsorships.find{it?.sponsor == sponsor && it?.organizerApproved == false}) ) {
                out << "<p class='pending'><strong>${sponsor?.name} has offered to sponsor this event.</strong><br />"
                out << "You'll be emailed when the organizer accepts your offer.</p>"
            } else {
                out << ""
            }
        }
    }

   def ifIsSponsor = { attrs, body ->
       def user =  TekUser.get(authenticateService.userDomain()?.id)
       def adminRole = Role.findByAuthority("ROLE_ADMIN")
       println "in ifIsSponsor tag, and the logged-in user is " + user
       println "is this user a sponsor? " + Sponsor.findByRep(user)
       if( (Sponsor.findByRep(user)) || (adminRole.people.find{it.id == user?.id}) ){
           out << body()
       }
       else {
           out << ""
       }
   }

   def sponsorContact = {attrs ->
	    if (authenticateService.isLoggedIn()){
		    def user = TekUser.get(authenticateService.userDomain().id)
		    def sponsor = Sponsor.get(attrs.sponsorId)
		    def organizerEvents = TekEvent.findByOrganizer(user)
		    println "in td:sponsorContact. user is: " + user
		    println "is this user an organizer? " + TekEvent.findByOrganizer(user)
		    if (sponsor?.rep.id != user?.id){
			    out << '''<span style="position:relative; bottom:-40px; left:15px; margin-top:50px;">'''
			    out << '''<a id="sponsorContact" style="padding:20px; background:#000080; color:white; text-decoration:none; font-weight:bold; font-size:28px;" href="#">Contact this Sponsor!</a>'''
                out << '''</span>'''
            }
            /*def s = sponsor?.sponsorships.findAll{it?.event.organizer.id == user?.id}
            println "in td:sponsorContact, s is: ${s}"
            s?.each { println "is this sponsorship sponsorApproved? ${it.sponsorApproved}" }
            def existingSponsorships = s?.collect{ it?.sponsorApproved == false }
            println "in td:sponsorContact, existingSponsorships is: ${existingSponsorships}"
            existingSponsorships?.each { sponsorship ->
                out << "<p><strong>You've asked ${sponsor?.name} to sponsor ${sponsorship.event.name}.</strong><br />"
                out << "You'll be emailed when the sponsor approves.</p>"
            }*/
        }
    }

  def eventsSponsoredBy = { attrs ->
    def sponsor = Sponsor.get(attrs.sponsor)
    println "in eventsSponsoredBy tag, the sponsor is " + sponsor
    def events
    println "are there any event sponsorships? " + sponsor.sponsorships
    sponsor.sponsorships.each { println it.properties }
    if(sponsor.sponsorships){
      //events = sponsor.sponsorships.collect{ it.event }
      out << """<div id="sponsorshipList" """
      out << """style="border:1px solid #000080; padding:10px; min-height:350px; background-color:#F3F3F3">"""
      out << """<h2>Events sponsored by ${sponsor?.name}</h2>"""
      sponsor.sponsorships.each {
          def name = it?.event.name
          out << td.eventListItem(id:it?.event.id)
      }
      out << """</div>"""
    }

  }


  def eventFlyerDownload = { attrs, body ->
    println "in linkToFile tag. attrs: " + attrs
    def flyer = attrs.flyer
    def event = TekEvent.get(attrs.id)
    out << "<a href='"
    out << resource(dir:"files/${event?.slug}", file:flyer)
    out << "'>"
    out << body()
    out << "</a>"
  }

  def eventListItem = { attrs ->
    println "in eventListItem tag"
    def event = TekEvent.get(attrs.id)
    if(event){
      if(event.logo) {
          out << """<img src='"""
          out << g.resource(dir:event.getLogoLocation(), file:event.getLogoName())
          out << """' height="80" width="80" /> <br />"""
      }
      else {
				out << event.name + "<br />"
				out << event.logo
			}
		}
  }


  def sponsorListItem = { attrs ->
    println "in sponsorListItem tag"
    def sponsor = Sponsor.get(attrs.id)
    if(sponsor){

      if(sponsor.bannerName){
        out << """<img src='"""
        out << request.contextPath
        out << "/"
        out << sponsor.bannerLocation
        out << sponsor.bannerName
        out << "' />"
      }
      else
				if(sponsor.logoName) {
          out << """<img src='"""
          out << request.contextPath
          out << "/"
          out << sponsor.logoLocation
          out << sponsor.logoName
          out << """' height='120' width='120' align='absmiddle' /> &nbsp;"""
          out << sponsor.name
      }

      else {
        out << sponsor.name
      }
		}
	}

  def volunteersHomeAssociated = { attrs ->
      def event = TekEvent.get(attrs.id)
      if(event){
        if(event.volunteers){
          def activeVolunteers = event.volunteers.find{ it.active == true }
          def nonActiveVolunteers = event.nonApprovedVolunteers()
          if(activeVolunteers?.count() > 0 || nonActiveVolunteers?.count() > 0){
              out << """<p>"""
              out << "${activeVolunteers.count()}"
              out << " volunteers - "
              if(nonActiveVolunteers.size() > 0){
                  out << """<span style='font-color:red;'><b>"""
                  out << "${nonActiveVolunteers.count()}"
                  out << " not approved yet ("
                  out << g.link(mapping:'volunteerList', params:[slug:event.slug], "view all")
                  out << ")</span>"
              }
          }
        }
      }
  }

  //Now. Once again, I must ask you to remember that the Marleys were dead...

  def linkToSearchByTag = { attrs ->
      def tag = Tag.get(attrs.id) //And decaying in their graves.
      if(tag){
          out << g.link(mapping:"search", params:[query:tag.name]){
              tag.name
          }
      } // "Yuck!"
  }

  def displayUserName = { attrs -> //Hey. Boss. Ask him.
      //Tell him. Mr Cratchit.
      def user = TekUser.get(attrs.id)
      if(user){ //Come on. Do it now. Boss.
          if((user.profile?.fullName) && (user.profile?.fullNameShow)){
              //Uh. If you please. Mr Scrooge...
              out << user.profile?.fullName
              //it's gotten colder.
          } else {
              println "no fullName"
              //and the bookkeeping staff...
              out << user.username
              //would like to have an extra shovelful of coal for the fire.
          }
      } else {
          println "no user"
          //We can't do the bookkeeping.
          //Yeah. All of our pens have turned to ink-cicles.
          out << ""
          //Our assets are frozen!
      } //How would the bookkeepers like to be suddenly unemployed?
      //Heatwave!
      //This is my island in the sun

      //l-I believe you've convinced them once again. Mr Scrooge.
  }

def pendingItems = { attrs ->
  def user = TekUser.get(authenticateService.userDomain().id)
  println user
  def pendingSponsorRequests
  def pendingSponsorOffers
  def pendingSponsorOffersRep
  def pendingVolunteers
  def pendingVolunteerOffers

  pendingSponsorRequests = relationshipService.userPendingSponsorRequest(user.id)
  pendingSponsorOffers = relationshipService.userPendingSponsorOffer(user.id)
  pendingSponsorOffersRep = relationshipService.userPendingSponsorOfferRep(user.id)
  pendingVolunteers = relationshipService.userPendingVolunteer(user.id)
  pendingVolunteerOffers = relationshipService.userPendingVolunteerOffer(user.id)

  if(pendingSponsorRequests?.size() > 0){
    out << "<div>"
    out << "<h3>"
    out << g.message(code:"home.loggedin.pending.sponsor.requests")
    out << " ("
    out << "${pendingSponsorRequests?.size()}"
    out << ")</h3>"
    out << "<hr /> <br />"
    pendingSponsorRequests.each { p ->
      println "in pendingSponsorRequests loop in td:pendingItems, p's class is " + p.class
      out << """<p class="pendingItem"> Requested """
      out << g.link(mapping:'showSponsor', params:['slug':p.sponsor.slug]){ p.sponsor.name }
      out << " to sponsor "
      out << g.link(mapping:'eventHome', params:['slug':p.event.slug]){ p.event.name }
      out << " ("
      out << g.formatDate(date:p.dateCreated, format:"MMMM dd, yyyy")
      out << ''')<span class="pending"> - '''
      out << g.message(code:"home.loggedin.pending.sponsor.requestdesc")
      out << '''</span></p><br />'''
      out << "</div><br />"
    }
  }
  if(pendingSponsorOffers?.size() > 0){
    out << "<div>"
    out << "<h3>"
    out << g.message(code:"home.loggedin.pending.sponsor.offers")
    out <<" ("
    out << "${pendingSponsorOffers?.size()}"
    out << ")</h3>"
    out << "<hr /> <br />"
    pendingSponsorOffers.each { p ->
      println "in pendingSponsorOffers loop in td:pendingItems, p's class is " + p.class
      out << """<p class="pendingItem">"""
      //println "in pendingItems tag, p in the pendingSponsorOffers is " + p + ", and its id is " + p.id
      out << g.link(mapping:'sponsorApprove', params:['id':p.id]){ "Offer" }
      out << " from "
      out << p.sponsor.name
      out << " to sponsor "
      out << g.link(mapping:'eventHome', params:['slug':p.event.slug]){ p.event.name }
      out << " ("
      out << g.formatDate(date:p.dateCreated, format:"MMMM dd, yyyy")
      out << ''')<span class="pending"> - '''
      out << g.message(code:"home.loggedin.pending.sponsor.offerdesc")
      out << '''</span></p><br />'''
    }
    out << "</div><br />"
  }
  if(pendingVolunteers?.size() > 0 || pendingVolunteerOffers?.size() > 0){
    out << """<div style="padding:10px;">"""
    out << "<h3>"
    out << g.message(code:"home.loggedin.pending.volunteers")
    out << " ("

    def pendingCount = 0
    if (pendingVolunteers)
        pendingCount += pendingVolunteers.size()
    if (pendingVolunteerOffers)
        pendingCount += pendingVolunteerOffers.size()

    out << "${pendingCount}"
    out << ")</h3>"
    out << "<hr /> <br />"
    pendingVolunteers.each { p ->
      println "in pendingVolunteers loop in td:pendingItems, p's class is " + p.class
      println "in pendingSponsorRequests loop in td:pendingItems, p's class is " + p.class
      out << '''<p class="pendingItem"><b>you</b> have volunteered for '''
      out << g.link(mapping:'eventHome', params:['slug':p.event.slug]){ p.event.name }
      out << " ("
      out << g.formatDate(date:p.dateCreated, format:"MMMM dd, yyyy")
      out << ")"
      out << '''<span class="pending"> - '''
      out << g.message(code:"home.loggedin.pending.volunteeroffer")
      out << '''</span></p><br />'''
    }
    pendingVolunteerOffers.each { p ->
      println "in pendingVolunteerOffers loop in td:pendingItems, p's class is " + p.class
      out << '''<p class="pendingItem"><b>'''
      out << "${p.user.username}"
      out << "</b> "
      out << g.link(mapping:'volunteerApprove', params:['id':p.id]){ "has volunteered" }
      out << " for "
      out << g.link(mapping:'eventHome', params:['slug':p.event.slug]){ p.event.name }
      out << " ("
      out << g.formatDate(date:p.dateCreated, format:"MMMM dd, yyyy")
      out << ''')<span class="pending"> - '''
      out << g.message(code:"home.loggedin.pending.volunteerrequest")
      out << '''</span></p><br />'''
    }
    out << "</div><br />"
  }
}

//ARGH! I CAN'T HOLD IT, CHARLIE! I CAN'T HOLD IT!

}