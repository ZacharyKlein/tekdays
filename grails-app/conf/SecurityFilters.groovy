class SecurityFilters {

    def authenticateService

    def filters = {

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
                if((currUser.id != organizer.id) && (!role.people.find{it.id == currUser.id})){
                    flash.message = "Sorry - you're not authorized to view this page."
                    redirect(controller:"home", action:"index")
                    return false

                }

                return true

            }

        }


    }
}

