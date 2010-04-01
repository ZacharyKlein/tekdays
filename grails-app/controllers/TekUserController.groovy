import org.apache.commons.io.FileUtils
import org.springframework.security.providers.UsernamePasswordAuthenticationToken as AuthToken
import org.springframework.security.context.SecurityContextHolder as SCH

class TekUserController {

    def authenticateService
    def daoAuthenticationProvider
    def linkService
    def burningImageService
    def tekUserService


    def index = { redirect action:"list", params:params }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ tekUserInstanceList: TekUser.list( params ), tekUserInstanceTotal: TekUser.count() ]
    }

    def show = {
        println params.username
        def organizerEvents
        def tekUserInstance
        println "we just got into the show action of the tekUser. params are: " + params
        if(params.username) {
            tekUserInstance = TekUser.findByUsername( params.username )
        } else {
            tekUserInstance = TekUser.get(params.id)
        }
        if(!tekUserInstance){
            flash.message = "User ${params.username ?: params.id} not found."
            redirect(controller:'home', action:'index')
        } else {
            organizerEvents = TekEvent.findAllByOrganizer(tekUserInstance)
            return [ tekUserInstance : tekUserInstance, organizerEvents : organizerEvents ]
        }
    }

    def delete = {
        println "entering user delete, params are " + params
        def tekUserInstance = TekUser.get( params.id )
        if(tekUserInstance) {
            def authPrincipal = authenticateService.principal()
            //avoid self-delete if the logged-in user is an admin
            if (!(authPrincipal instanceof String) && authPrincipal.username == tekUserInstance.username) {
                flash.message = "You can not delete yourself, please login as another admin and try again"
            }
            else {
                try {
                    //first, delete this dude from People_Authorities table.
                    Role.findAll().each { it.removeFromPeople(tekUserInstance) }
                    def avatar = new File(tekUserInstance.avatarLocation).delete()
                    tekUserInstance.delete()
                    flash.message = "Account for $params.username deleted."
                    redirect(action:list)
                }
                catch(org.springframework.dao.DataIntegrityViolationException e) {
                    flash.message = "Account for ${params.username} could not be deleted."
                    redirect(action:show,id:params.id)
                }
            }
        }
    }

    def edit = {
        println "*edit* action params are: " + params
        println "we're trying to get this user in the user edit from the id ${params.id}"
        def tekUserInstance = TekUser.findByUsername(params.username)

        if(!tekUserInstance) {
            flash.message = "User ${params.id} not found."
            println flash.message
            redirect(action:list)
        }
        else {
            println "hey, dude. we are returning the user from the edit action: " + tekUserInstance
            return [ tekUserInstance : tekUserInstance ]
        }
    }

    def update = {
        println "*update* action params are: " + params
        println "in the user update and the params are ${params}"
        def fileName = params.profile.newavatar.originalFilename
        def avFile = params.profile.newavatar
        println "the avFile is ${avFile}"
        def tekUserInstance = TekUser.findByUsername( params.username )
        linkService.verifyLinks(tekUserInstance)
        if(tekUserInstance) {
        if (!updatePassword(tekUserInstance, params)){
            return
        }

            if(!avFile.isEmpty()){
              def thisIsATest = tekUserInstance.avatarLocation
              println "right now, thisIsATest is " + thisIsATest
              if((thisIsATest) && (params.profile?.newAvatar)){
                def oldAvatar = new File(thisIsATest).delete()
              }
              tekUserInstance.fp = "/srv/www/tekdays/images/avatars/${params.username}/${fileName}"
              tekUserInstance.avatarLocation = "/srv/www/tekdays/images/avatars/${params.username}/${fileName}"
              tekUserInstance.avatarName = fileName
              def location = new File(tekUserInstance.avatarLocation)
              if(!location.exists()){
                location.mkdirs()
              }
              avFile?.transferTo(location)
            }

        if(params.version) {
        def version = params.version.toLong()
        if(tekUserInstance.version > version) {

                    tekUserInstance.errors.rejectValue("version", "tekUser.optimistic.locking.failure", "An admin has updated this page while you were editing.")
                    render(view:'edit',model:[tekUserInstance:tekUserInstance])
                    return
                }
            }

            if(!tekUserInstance.profile) {
                tekUserInstance.profile = new Profile()
            }

            tekUserInstance.properties = params


            linkService.verifyLinks(tekUserInstance)
            if(!tekUserInstance.hasErrors() && tekUserInstance.save()) {
                flash.message = "Profile changes saved."
                //redirect(action:show,params:[username:tekUserInstance.username])
                redirect(uri:"/users/$tekUserInstance.username")
            }
            else {
                render(view:'edit',model:[tekUserInstance:tekUserInstance])
            }
        }
        else {
            flash.message = "User ${params.username} not found."
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        if(authenticateService.userDomain()){
            flash.message = "Already logged-in."
            redirect(controller:'home', action:'index')
        } else {
            def tekUserInstance = new TekUser()
            tekUserInstance.properties = params
            return ['tekUserInstance':tekUserInstance]
        }
    }


     def save = {
        println "entering tekUser save action"
        println params

        def tekUserInstance = new TekUser(params)

        if(!tekUserService.checkCaptcha(params.captcha.toUpperCase(), session.captcha)) {
            flash.message = "Access code is invalid"
            render(view:'create', model:[tekUserInstance:tekUserInstance])
            return
        }

        if(!tekUserService.checkPasswd(params.passwd, params.confirmpassword)) {
            flash.message = "Passwords did not match"
            render(view:'create', model:[tekUserInstance:tekUserInstance])
            return
        }

        tekUserInstance.passwd = authenticateService.encodePassword(params.passwd)
        linkService.verifyLinks(tekUserInstance)

        def orig = "${request.contextPath}/images/avatars/default-avatar.png"
        println "orig is " + orig
        def copy = "${request.contextPath}/images/avatars/${tekUserInstance.username}/default-avatar.png"

        def origFile = new File(orig)
        def copyFile = new File(copy)

        if(origFile != null){
          FileUtils.copyFile(origFile, copyFile)
        }

        tekUserInstance.fp = "${request.getSession().getServletContext().getRealPath("/")}images/avatars/${tekUserInstance.username}/default-avatar.png"
        tekUserInstance.avatarLocation = "${request.getSession().getServletContext().getRealPath("/")}images/avatars/${tekUserInstance.username}/default-avatar.png"
        tekUserInstance.avatarName = "default-avatar.png"

        if(!tekUserInstance.hasErrors() && tekUserInstance.save()) {
            def role = Role.findByAuthority("ROLE_USER")
            role.addToPeople(tekUserInstance)
            tekUserInstance.enabled = true

            println "setting up authtoken..."
            def auth = new AuthToken(tekUserInstance.username, params.passwd)
            def authtoken = daoAuthenticationProvider.authenticate(auth)
            SCH.context.authentication = authtoken

            flash.message = "Your account was created."
            redirect(action:show, id:tekUserInstance.id)
            return
        }

        else {
            println "something went wrong"
//             flash.message = "Invalid user data"
//             tekUserInstance.errors.allErrors.each { println it }
            render(view:'create', model:[tekUserInstance:tekUserInstance])
            return
        }
    }


        private void addRoles(tekUserInstance) {
                for (String key in params.keySet()) {
                        if (key.contains('ROLE') && 'on' == params.get(key)) {
                                Role.findByAuthority(key).addToPeople(tekUserInstance)
                        }
                }
        }

        private Map buildTekUserModel(tekUserInstance) {

                List roles = Role.list()
                roles.sort { r1, r2 ->
                        r1.authority <=> r2.authority
                }
                Set userRoleNames = []
                for (role in tekUserInstance.authorities) {
                        userRoleNames << role.authority
                }
                LinkedHashMap<Role, Boolean> roleMap = [:]
                for (role in roles) {
                        roleMap[(role)] = userRoleNames.contains(role.authority)
                }

                return [tekUserInstance: tekUserInstance, roleMap: roleMap]
        }

    def updatePassword(user, params) {
        def oldPassword = user.passwd
        if (params.newpasswd){
            if (authenticateService.encodePassword(params.currentpasswd) == oldPassword){
                    if (params.newpasswd == params.confirmpasswd){
                        user.passwd = authenticateService.encodePassword(params.newpasswd)
                        return true
                    }
                     else {
                         flash.message = "New password does not match confirmation. Please try again."
                         render(view:'edit', model:[tekUserInstance:user])
                         return false
                    }
                }
            else {
                flash.message = "Current password is incorrect. Please try again."
                render(view:'edit', model:[tekUserInstance:user])
                return false
            }
        }
        else {
            return true
        }
    }

    def updateAvatar(user, params) {
        if (params.newavatar) {
            println "in updateAvatar, and there are params.newavatar..."
            def fileName = params.newAvatar.originalFilename
            user.avatarLocation = "${request.getSession().getServletContext().getRealPath("/")}images/avatars/${params.username}/${fileName}"

            def avFile = params.newavatar

            def location = new File(user.avatarLocation)
            location.mkdirs()
            avFile.transferTo(location)
        }

    }

	def hideHelp = {
		println "entering hideHelp"
		def help = params.id
		def tekUserInstance = TekUser.get(authenticateService.userDomain()?.id)

		println help
		println tekUserInstance

		tekUserInstance.hideHelp(help)
		println tekUserInstance.hiddenHelp
		render " "
		println "rendering?"
		return
	}
/*    def account = {
        print "hey, what in the blue blazes is in this authenticateService? let's see... "
        println authenticateService.userDomain()
        def tekUserInstance = TekUser.get(authenticateService.userDomain().id)
        [ tekUserInstance : tekUserInstance ]
    }

    def updateUsername = {

        log.info "Update user username"

        //Get user
        def user = TekUser.get(params.id)
        user.username = params.username
        user.save()

    } */



}

