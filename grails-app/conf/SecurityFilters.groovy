class SecurityFilters {

    def authenticateService

    def filters = {

        profileChanges(controller:"tekUser", action:"edit") {

            before = {
                println "entering tekUser edit Security Filter..."
                println params

                println params
                def currentUser = TekUser.get(authenticateService.userDomain().id)
                def profileUser
                
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
                                
                if(currentUser.id != profileUser.id) {
                    flash.message = "Dude, you can't edit someone else's profile!"
                    redirect(controller:"tekUser",action:"list")
                    return false
                }

            return true

            }

        }

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

    }
}

