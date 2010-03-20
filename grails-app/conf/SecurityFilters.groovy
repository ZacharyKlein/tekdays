class SecurityFilters {

    def authenticateService

    def filters = {

        admin(controller:"admin", action:"*") {
          before = {
            if(authenticateService.userDomain()){
              def user = TekUser.get(authenticateService.userDomain().id)
              if(!actionName.equals('leaveFeedback') && !user.isAdmin()){
                flash.message = "Access denied."
                redirect(controller:"home", action:"index")
                return false
              }            
              return true
            } else {
              flash.message = "Please login.."
              redirect(controller:"home", action:"index")
              return false
            }
          }
        }

        attachment(controller:"attachment", action:"*"){
          before = {
            if(authenticateService.userDomain()){
              def event
              if(params.id){
                def attachment = Attachment.get(params.id)
                event = attachment.event
              } else {
                event = TekEvent.findBySlug(params.slug)
              }
              def user = TekUser.get(authenticateService.userDomain().id)
              if(!event.findAssociatedUsers().find{it.id == user.id} && !user.isAdmin()){
                flash.message = "Access denied."
                redirect(controller:"home", action:"index")
                return false
              }
              return true
          } else {
            flash.message = "Please login.."
            redirect(controller:"home", action:"index")
            return false
            }
          }
        }

        messages(controller:"message", action:"*"){
          before = {
            if(authenticateService.userDomain()){
              def event
              if(params.id){
                def message = Message.get(params.id)
                event = message.event
              } else {
                event = TekEvent.findBySlug(params.slug)
              }
              def user = TekUser.get(authenticateService.userDomain().id)
              if(!event.findAssociatedUsers().find{it.id == user.id} && !user.isAdmin()){
                flash.message = "Access denied."
                redirect(controller:"home", action:"index")
                return false
              }
              return true
          } else {
            flash.message = "Please login.."
            redirect(controller:"home", action:"index")
            return false
            }
          }
        }

        posts(controller:"post", action:"*"){
          before = {
            if(authenticateService.userDomain()){
              def event
              if(params.id){
                def post = Post.get(params.id)
                event = post.event
              } else {
                event = TekEvent.findBySlug(params.slug)
              }
              def user = TekUser.get(authenticateService.userDomain().id)
              if(!event.findAssociatedUsers().find{it.id == user.id} && !user.isAdmin()){
                flash.message = "Access denied."
                redirect(controller:"home", action:"index")
                return false
              }
              return true
          } else {
            flash.message = "Please login.."
            redirect(controller:"home", action:"index")
            return false
            }
          }
        }

        reg(controller:"registration", action:"(show|edit|update|delete|list)"){
          before = {
            println params
            if(authenticateService.userDomain()){
              def event
              if(params.id){
                def registration = Registration.get(params.id)
                event = registration.event
              } else {
                event = TekEvent.findBySlug(params.slug)
              }
              def user = TekUser.get(authenticateService.userDomain().id)
              if(!event.findAssociatedUsers().find{it.id == user.id} && !user.isAdmin()){
                flash.message = "Access denied."
                redirect(controller:"home", action:"index")
                return false
              }
              return true
          } else {
            flash.message = "Please login.."
            redirect(controller:"home", action:"index")
            return false
            }
          }
        }

        rqmp(controller:"requestmap", action:"*"){
          before = {
            if(authenticateService.userDomain()){
              def user = TekUser.get(authenticateService.userDomain().id)
              if(!user.isAdmin()){
                flash.message = "Access denied."
                redirect(controller:"home", action:"index")
                return false
              }
              return true
            } else {
              flash.message = "Please login.."
              redirect(controller:"home", action:"index")
              return false
            }
          }
        }

        role(controller:"role", action:"*"){
          before = {
            if(authenticateService.userDomain()){
              def user = TekUser.get(authenticateService.userDomain().id)
              if(!user.isAdmin()){
                flash.message = "Access denied."
                redirect(controller:"home", action:"index")
                return false
              }
              return true
            } else {
              flash.message = "Please login.."
              redirect(controller:"home", action:"index")
              return false
            }
          }
        }

        sch(controller:"schedule", action:"*"){
          before = {
            if(authenticateService.userDomain()){
              def event
              if(params.id){
                def schedule = Schedule.get(params.id)
                event = schedule.event
              } else {
                event = TekEvent.findBySlug(params.slug)
              }
              def user = TekUser.get(authenticateService.userDomain().id)
              if(!event.findAssociatedUsers().find{it.id == user.id} && !user.isAdmin()){
                flash.message = "Access denied."
                redirect(controller:"home", action:"index")
                return false
              }
              return true
          } else {
            flash.message = "Please login.."
            redirect(controller:"home", action:"index")
            return false
            }
          }
        }

        task(controller:"task", action:"*"){
          before = {
            if(authenticateService.userDomain()){
              def event
              if(params.id){
                def task = Task.get(params.id)
                event = task.event
              } else {
                event = TekEvent.findBySlug(params.slug)
              }
              def user = TekUser.get(authenticateService.userDomain().id)
              if(!event.findAssociatedUsers().find{it.id == user.id} && !user.isAdmin()){
                flash.message = "Access denied."
                redirect(controller:"home", action:"index")
                return false
              }
              return true
          } else {
            flash.message = "Please login.."
            redirect(controller:"home", action:"index")
            return false
            }
          }
        }

        modifyUser(controller:"tekUser", action:"(edit|update|delete)"){
          before = {
            println params
            if(authenticateService.userDomain()){
              def userInQuestion
              if(params.username){
                userInQuestion = TekUser.findByUsername(params.username)
              } else {
                userInQuestion = TekUser.get(params.id)
              }
              def user = TekUser.get(authenticateService.userDomain().id)
              println "in modifyUser filter, the logged-in user is " + user.username + ", and his id is " + user.id
              println "in modifyUser filter, the userInQuestion is " + userInQuestion.username + ", and *his* id is " + userInQuestion.id
              println "is this the same id? " + user.id == userInQuestion.id
              println "is this user at least an admin? " + user.isAdmin()
              if(user.id != userInQuestion.id && !user.isAdmin()){
                flash.message = "Access denied."
                redirect(controller:"home", action:"index")
                return false
              }
              return true
          } else {
            flash.message = "Please login.."
            redirect(controller:"home", action:"index")
            return false
            }
          }
        }

        modifyTag(controller:"tag", action:"(edit|update|delete)") {
          before = {
            if(authenticateService.userDomain()){
              def user = TekUser.get(authenticateService.userDomain().id)
              if(!user.isAdmin()){
                flash.message = "Access denied."
                redirect(controller:"home", action:"index")
                return false
              }
              return true
            } else {
              flash.message = "Please login.."
              redirect(controller:"home", action:"index")
              return false
            }
          }
        }

        newTag(controller:"tag", action:"(create|save)") {
          before = {
            if(authenticateService.userDomain()){
              def user = TekUser.get(authenticateService.userDomain().id)
              if(!TekEvent.findByOrganizer(user) && !Sponsor.findByRep(user) && !user.isAdmin()){
                flash.message = "Access denied."
                redirect(controller:"home", action:"index")
                return false
              }
              return true
            } else {
              flash.message = "Please login.."
              redirect(controller:"home", action:"index")
              return false
            }
          }
        }

        /*profileChanges(controller:"tekUser", action:"edit") {

            before = {
                println "entering tekUser edit Security Filter..."
                println params

                println params
                def currentUser = TekUser.get(authenticateService.userDomain().id)
                def profileUser
                def adminRole = Role.findByAuthority("ROLE_ADMIN")

                if(params.username){
                    println "params.username is true"
                    profileUser = TekUser.findByUsername(params.username)
                }

                else {
                    println "Nope, using params.id"
                    profileUser = TekUser.get(params.id)
                    println profileUser
                }

                println profileUser

                if((currentUser?.id != profileUser?.id) && (!currentUser?.isAdmin())) {
                    flash.message = "Dude, you can't edit someone else's profile!"
                    redirect(controller:"tekUser",action:"list")
                    return false
                }

            return true

            }

        }*/

        editMessage(controller:"message", action:"edit") {

            before = {

                def currUser = TekUser.get(authenticateService.userDomain().id)
                def currUserId = authenticateService.userDomain().username
                def role = Role.findByAuthority("ROLE_ADMIN")
                def message = Message.get(params.id)
                    if((!role.people.find{it.id == currUser.id}) && (currUserId != message.author.username)) {
                        flash.message = "Dude, you can't edit someone else's post!"
                        redirect(controller:"message",action:"topic")
                        return false
                    }
            return true

            }

        }

        msg(controller:"message", action:"(create|save|show|edit|update|delete|forum|topic|reply|list|showDetail)"){

            before = {

                if (!authenticateService.isLoggedIn()){

                    flash.message = "Please login.."
                    redirect(controller:"home", action:"index")
                    return false

                }

                return true

            }

        }

        allUsers(controller:"tekUser", action:"list"){

            before = {

                def currUser = TekUser.get(authenticateService.userDomain().id)
                def role = Role.findByAuthority("ROLE_ADMIN")
                if(!role.people.find{it.id == currUser.id}){
                    flash.message = "Sorry - you're not authorized to view this page."
                    redirect(controller:"home", action:"index")
                    return false

                }

                return true

            }

        }

        listVolunteers(controller:"volunteer", action:"list"){

            before = {

                println "entering listVolunteers. params are: " + params
                def currUser = TekUser.get(authenticateService.userDomain().id)
                def organizer = TekEvent.findBySlug(params.slug).organizer
                def role = Role.findByAuthority("ROLE_ADMIN")
                if((currUser.id != organizer.id) && (!role.people.find{it.id == currUser.id})){
                    flash.message = "Sorry - you're not authorized to view this page."
                    redirect(controller:"home", action:"index")
                    return false

                }

                return true

            }

        }


        editVolunteer(controller:"volunteer", action:"edit"){

            before = {

                println "entering editVolunteer. params are: " + params
                def volunteerInstance = Volunteer.get(params.id)
                def currUser = TekUser.get(authenticateService.userDomain().id)
                def organizer = TekEvent.get(volunteerInstance?.event.id).organizer
                def role = Role.findByAuthority("ROLE_ADMIN")
                if((currUser?.id != organizer?.id) && (!role.people.find{it.id == currUser?.id})){
                    flash.message = "Sorry - you're not authorized to view this page."
                    redirect(controller:"home", action:"index")
                    return false

                }

                return true

            }

        }


        modifyEvent(controller:"tekEvent", action:"(edit|update|editDescription|updateEvent)"){

            before = {

                println "entering editEvent. params are: " + params

                if(authenticateService.userDomain()){

                    def tekEventInstance = TekEvent.findBySlug(params.slug)
                    def user = TekUser.get(authenticateService.userDomain().id)
                    def organizer = tekEventInstance.organizer
                    if((user?.id != organizer?.id) && (!user?.isAdmin())){
                        flash.message = "Sorry - you're not authorized to view this page."
                        redirect(controller:"home", action:"index")
                        return false

                    }

                    return true

                } else {
                    flash.message = "Please login.."
                    redirect(controller:'home', action:'index')
                }
            }

        }

        otherEvent(controller:"tekEvent", action:"(volunteer|create|save)"){

            before = {

                if(authenticateService.userDomain()){
                  return true
                } else {
                    flash.message = "Please login.."
                    redirect(controller:'home', action:'index')
                }
            }
        }

        deleteEvent(controller:"tekEvent", action:"delete"){
          before = {
            if(authenticateService.userDomain()){
              def user = TekUser.get(authenticateService.userDomain().id)
              if(!user.isAdmin()){
                flash.message = "Access denied."
                redirect(controller:"home", action:"index")
                return false
              }
              return true
            } else {
              flash.message = "Please login.."
              redirect(controller:"home", action:"index")
              return false
            }
          }
        }

        modifySponsor(controller:"sponsor", action:"(edit|update|delete)"){
            before = {
                if(authenticateService.userDomain()){
                    def user = TekUser.get(authenticateService.userDomain().id)
                    def sponsor = Sponsor.findBySlug(params.slug)
                    if(sponsor?.rep?.id != user.id){
                        flash.message = "Dude, you can't do that."
                        redirect(controller:"home", action:"index")
                        return false
                    }
                    return true
                } else {
                    flash.message = "Please login.."
                    redirect(controller:"home", view:"loggedOut")
                }

            }
        }

        /*Business! Mankind was my business. The common welfare was my business; charity, mercy, forbearance, and benevolence, were, all, my business. The dealings of my trade were but a drop of water in the comprehensive ocean of my business!

            Why did I walk through crowds of fellow-beings with my eyes turned down, and never
            raise them to that blessed Star which led the Wise Men to a poor abode! Were there
            no poor homes to which its light would have conducted me! */

    }
}

