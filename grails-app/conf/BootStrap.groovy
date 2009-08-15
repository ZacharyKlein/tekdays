class BootStrap {

    def init = { servletContext ->
        if(!Role.findByAuthority("ROLE_USER"))
            new Role(authority:"ROLE_USER", description:"A regular user.").save()                           
    }
    
    def destroy = {
    }
} 
