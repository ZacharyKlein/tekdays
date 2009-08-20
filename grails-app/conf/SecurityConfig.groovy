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
        /login/auth=IS_AUTHENTICATED_ANONYMOUSLY
        /signup=IS_AUTHENTICATED_ANONYMOUSLY
        /tekuser/save=IS_AUTHENTICATED_ANONYMOUSLY
        /tekuser/show=IS_AUTHENTICATED_ANONYMOUSLY
        /user/**=IS_AUTHENTICATED_ANONYMOUSLY
        /users/**=IS_AUTHENTICATED_ANONYMOUSLY
        /tekevent/show=IS_AUTHENTICATED_ANONYMOUSLY
        /tekevent/list=IS_AUTHENTICATED_ANONYMOUSLY
        /register/for/**=IS_AUTHENTICATED_ANONYMOUSLY
        /registration/save=IS_AUTHENTICATED_ANONYMOUSLY
        /js/**=IS_AUTHENTICATED_ANONYMOUSLY
        /css/**=IS_AUTHENTICATED_ANONYMOUSLY
        /images/**=IS_AUTHENTICATED_ANONYMOUSLY
        /plugins/**=IS_AUTHENTICATED_ANONYMOUSLY
        /captcha/**=IS_AUTHENTICATED_ANONYMOUSLY
        /**=IS_AUTHENTICATED_REMEMBERED
        """

}
