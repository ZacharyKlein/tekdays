class HomeController {

    def authenticateService

    def index = {
        if(authenticateService.isLoggedIn()){
            def user = authenticateService.userDomain()
            def volunteerEvents = TekEvent.createCriteria().list{
                volunteers{
                    eq('id' , user.id)
                }
            }
            def organizerEvents = TekEvent.findAllByOrganizer(user)

            def sponsorEvents

            if(Sponsor.findByRep(user)){
              println "in home index. we're going to find the sponsor this user is representing"
                def sponsor = Sponsor.findByRep(user)
              println "the sponsor that this user (" + user + ") is representing is " + sponsor
                sponsorEvents = TekEvent.list().collect( it?.sponsorships?.sponsor.contains(sponsor) )
              println "i blew up"
            }

            return [ volunteerEvents: volunteerEvents, organizerEvents: organizerEvents, sponsorEvents: sponsorEvents ]

        }

    }

    def test = {}

}

