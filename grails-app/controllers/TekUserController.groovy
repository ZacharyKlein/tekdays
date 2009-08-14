

class TekUserController {

    def authenticateService
    def linkService
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ tekUserInstanceList: TekUser.list( params ), tekUserInstanceTotal: TekUser.count() ]
    }

    def show = {
        println params.username
        if(params.username) {
            def tekUserInstance = TekUser.findByUsername( params.username )
            if(!tekUserInstance) {
                flash.message = "User ${params.username} not found."
                redirect(action:list)
            }
            else { return [ tekUserInstance : tekUserInstance ] }
        } else {
            def tekUserInstance = TekUser.get( params.id )
            if(!tekUserInstance) {
                flash.message = "User ID ${params.id} not found."
                redirect(action:list)
            }
            else { return [ tekUserInstance : tekUserInstance ] }
        }
    }

    def delete = {
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
        def tekUserInstance = TekUser.findByUsername( params.username )

        if(!tekUserInstance) {
            flash.message = "User ${params.username} not found."
            redirect(action:list)
        }
        else {
            return [ tekUserInstance : tekUserInstance ]
        }
    }

    def update = {
        println "*update* action params are: " + params
        def tekUserInstance = TekUser.findByUsername( params.username )
        if(tekUserInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(tekUserInstance.version > version) {
                    
                    tekUserInstance.errors.rejectValue("version", "tekUser.optimistic.locking.failure", "Another user has updated this TekUser while you were editing.")
                    render(view:'edit',model:[tekUserInstance:tekUserInstance])
                    return
                }
            }
            def oldPassword = tekUserInstance.passwd
            tekUserInstance.properties = params
            linkService.verifyLinks(tekUserInstance)
            if (!params.passwd.equals(oldPassword)) {
	        tekUserInstance.passwd = authenticateService.encodePassword(params.passwd)
	    }
            if(!tekUserInstance.hasErrors() && tekUserInstance.save()) {
                flash.message = "Profile changes saved."
                redirect(action:show,params:[username:tekUserInstance.username])
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
        def tekUserInstance = new TekUser()
        tekUserInstance.properties = params
        return ['tekUserInstance':tekUserInstance]
    }

    def save = {
        def tekUserInstance = new TekUser(params)
        linkService.verifyLinks(tekUserInstance)
        if (params.captcha.toUpperCase() != session.captcha) {
	    tekUserInstance.passwd = ''
	    flash.message = 'Access code did not match.'
	    render view: 'create', model: [tekUserInstance: tekUserInstance]
	    return
	}
        if(params.passwd == params.confirmpassword){
        tekUserInstance.passwd = authenticateService.encodePassword(params.passwd)
        def avFile = params.avatar
        def location = "web-app/images/avatars/${params.username}-avatar.jpg"
        def saveLocation = new File(location); saveLocation.mkdirs()
        avFile.transferTo(saveLocation)
            if(!tekUserInstance.hasErrors() && tekUserInstance.save()) {
                def role = Role.findByAuthority("ROLE_USER")
                role.addToPeople(tekUserInstance)
                tekUserInstance.enabled = true
                //addRoles(tekUserInstance)
                flash.message = "Your account was created."
                redirect(action:show,params:[username:tekUserInstance.username])
            }
            else {
                render(view:'create', model:[tekUserInstance:tekUserInstance])
            }
        } else {
                flash.message = "Passwords do not match."
                render(view:'create', model:[tekUserInstance:tekUserInstance])
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
}
