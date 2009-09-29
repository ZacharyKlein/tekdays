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

            return [ volunteerEvents: volunteerEvents, organizerEvents: organizerEvents ]

        }

    }

    def test = {}

}
