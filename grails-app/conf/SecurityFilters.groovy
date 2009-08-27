class SecurityFilters {

    def authenticateService

    def filters = {

        profileChanges(controller:"tekUser", action:"edit") {

            before = {

                def currUserId = authenticateService.userDomain().username
                if(currUserId != params.username) { 
                    flash.message = "Dude, you can't edit someone else's profile!"
                    redirect(controller:"tekUser",action:"list")
                    return false
                }

            return true

            }

        }

        editMessage(controller:"message", action:"edit") {

            before = {

                def currUserId = authenticateService.userDomain().username
                if(currUserId != params.author.username) { 
                    flash.message = "Dude, you can't edit someone else's post!"
                    redirect(controller:"message",action:"list")
                    return false
                }

            return true

            }

        }

    }
}
