security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true

	loginUserDomainClass = "TekUser"
	authorityDomainClass = "Role"
	requestMapClass = "Requestmap"

        useRequestMapDomainClass = false

            requestMapString = """\
        CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
        PATTERN_TYPE_APACHE_ANT
        /=IS_AUTHENTICATED_ANONYMOUSLY
        /home=IS_AUTHENTICATED_REMEMBERED
        /feedback=IS_AUTHENTICATED_REMEMBERED
        /login/auth=IS_AUTHENTICATED_ANONYMOUSLY
        /signup=IS_AUTHENTICATED_ANONYMOUSLY
        /tekuser/save=IS_AUTHENTICATED_ANONYMOUSLY
        /tekuser/show=IS_AUTHENTICATED_ANONYMOUSLY
        /user/**=IS_AUTHENTICATED_REMEMBERED
        /users/**=IS_AUTHENTICATED_REMEMBERED
        /events/**/volunteers=IS_AUTHENTICATED_REMEMBERED
        /event/**=IS_AUTHENTICATED_ANONYMOUSLY
        /events=IS_AUTHENTICATED_ANONYMOUSLY
        /events/**=IS_AUTHENTICATED_ANONYMOUSLY
        /search?q=**=IS_AUTHENTICATED_ANONYMOUSLY
        /register/**=IS_AUTHENTICATED_ANONYMOUSLY
        /sponsors/**=IS_AUTHENTICATED_ANONYMOUSLY
        /sponsor/create=IS_AUTHENTICATED_ANONYMOUSLY
        /sponsor/save=IS_AUTHENTICATED_ANONYMOUSLY
        /registration/save=IS_AUTHENTICATED_ANONYMOUSLY
        /volunteer/**=IS_AUTHENTICATED_REMEMBERED
        /users=ROLE_ADMIN
        /sponsor/list=ROLE_ADMIN
        /js/**=IS_AUTHENTICATED_ANONYMOUSLY
        /css/**=IS_AUTHENTICATED_ANONYMOUSLY
        /images/**=IS_AUTHENTICATED_ANONYMOUSLY
        /plugins/**=IS_AUTHENTICATED_ANONYMOUSLY
        /captcha/**=IS_AUTHENTICATED_ANONYMOUSLY
        /tekevent/displaylogo/**=IS_AUTHENTICATED_ANONYMOUSLY
        /tekevent/displaybanner/**=IS_AUTHENTICATED_ANONYMOUSLY
        /**=IS_AUTHENTICATED_REMEMBERED
        """

}


//Whoa. That's scary stuff. Hey. Should we be worried about the kids in the audience?

//Nah. That's all right. This is culture.

//Oh.

