import org.springframework.security.providers.UsernamePasswordAuthenticationToken as AuthToken
import org.springframework.security.context.SecurityContextHolder as SCH

class TekUserService {

    def authenticateService
    def daoAuthenticationProvider
    def linkService

    boolean transactional = true

    def saveUser(params, captcha)  {
        println "entering tekUserService saveUser method"
        println params
        def tekUserInstance = new TekUser(params[rep])
        linkService.verifyLinks(tekUserInstance)
        if (params.captcha.toUpperCase() != captcha) {
	        tekUserInstance.passwd = ''
	        flash.message = 'Access code did not match.'
	        render view: 'create', model: [tekUserInstance: tekUserInstance]
	        return
	    }
        if(params.passwd == params.confirmpassword){
            tekUserInstance.passwd = authenticateService.encodePassword(params.passwd)
            def avFile = params.avatar
            println params.avatar
            def location = "web-app/images/avatars/${params.username}-avatar.jpg"
            def saveLocation = new File(location); saveLocation.mkdirs()
            avFile.transferTo(saveLocation)
            if(!tekUserInstance.hasErrors() && tekUserInstance.save()) {
                def role = Role.findByAuthority("ROLE_USER")
                role.addToPeople(tekUserInstance)
                tekUserInstance.enabled = true
                if(tekUserInstance.username) {
                            def auth = new AuthToken(tekUserInstance.username, params.passwd)
			    def authtoken = daoAuthenticationProvider.authenticate(auth)
			    SCH.context.authentication = authtoken
                }

                return tekUserInstance
            }
            else {
                return false
            }
        } else {
            flash.message = "Passwords do not match."
            return false
        }
    }

    def serviceMethod() {

    }
}

