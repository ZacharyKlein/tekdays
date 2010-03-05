class BootStrap {

    def authenticateService

    def init = { servletContext ->
        if(!Role.findByAuthority("ROLE_USER")){
            new Role(authority:"ROLE_USER", description:"A regular user.").save()
        }
        if(!Role.findByAuthority("ROLE_ADMIN")){
            def p = authenticateService.encodePassword("admin")
            def ad = new TekUser(username:"admin", passwd:p, email:"ad@min.com", enabled:true).save()
            def role = new Role(authority:"ROLE_ADMIN", description:"A great dude.").save()
            role.addToPeople(ad)
        }


      def defaultAvatarTemp = new File("web-app/images/default-avatar.png")

			def defaultAvatar = new File("web-app/images/avatars/default-avatar.png")

			defaultAvatar << defaultAvatarTemp.newInputStream()
    }
    
    def destroy = {
    }
} 
