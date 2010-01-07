class SecurityFilters {

    def authenticateService

    def filters = {

        profileChanges(controller:"tekUser", action:"edit") {

            before = {

                println params
                def currentUser = TekUser.get(authenticateService.userDomain().id)
                if(params.username){
                  def owner = TekUser.findByUsername(params.username)
                } else {
                  def owner = TekUser.get(params.id)
                }
                if(currentUser.id != owner.id) {
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

