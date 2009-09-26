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
        /login/auth=IS_AUTHENTICATED_ANONYMOUSLY
        /signup=IS_AUTHENTICATED_ANONYMOUSLY
        /tekuser/save=IS_AUTHENTICATED_ANONYMOUSLY
        /tekuser/show=IS_AUTHENTICATED_ANONYMOUSLY
        /user/**=IS_AUTHENTICATED_ANONYMOUSLY
        /event/**=IS_AUTHENTICATED_ANONYMOUSLY
        /events=IS_AUTHENTICATED_ANONYMOUSLY
        /events/**=IS_AUTHENTICATED_ANONYMOUSLY
        /register/**=IS_AUTHENTICATED_ANONYMOUSLY
        /sponsors/**=IS_AUTHENTICATED_REMEMBERED
        /eregister/**=IS_AUTHENTICATED_ANONYMOUSLY
        /registration/save=IS_AUTHENTICATED_ANONYMOUSLY
        /users=ROLE_ADMIN
        /sponsor/list=ROLE_ADMIN
        /sponsors/**=IS_AUTHENTICATED_FULLY
        /js/**=IS_AUTHENTICATED_ANONYMOUSLY
        /css/**=IS_AUTHENTICATED_ANONYMOUSLY
        /images/**=IS_AUTHENTICATED_ANONYMOUSLY
        /plugins/**=IS_AUTHENTICATED_ANONYMOUSLY
        /captcha/**=IS_AUTHENTICATED_ANONYMOUSLY
        /**=IS_AUTHENTICATED_REMEMBERED
        """

}
