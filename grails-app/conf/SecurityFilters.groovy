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
              def user = authenticateService.userDomain()
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

                def currUser = authenticateService.userDomain()
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

                def currUser = authenticateService.userDomain()
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
                def currUser = authenticateService.userDomain()
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
                def currUser = authenticateService.userDomain()
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


        editEvent(controller:"tekEvent", action:"edit"){

            before = {

                println "entering editEvent. params are: " + params

                if(authenticateService.userDomain()){

                    def tekEventInstance = TekEvent.findBySlug(params.slug)
                    def user = authenticateService.userDomain()
                    def organizer = tekEventInstance.organizer
                    def role = Role.findByAuthority("ROLE_ADMIN")
                    if((user?.id != organizer?.id) && (!role.people.find{it.id == user?.id})){
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

