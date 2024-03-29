class HomeController {

    def authenticateService
    def relationshipService

    def index = {
        if(authenticateService.isLoggedIn()){
            def user = authenticateService.userDomain()
            def volunteerEvents = []
            def sponsoredEvents = []
            def sponsor
            def pendingSponsorRequests
            def pendingSponsorOffers
            def pendingSponsorOffersRep
            def pendingVolunteers
            def pendingVolunteerOffers

            pendingSponsorRequests = relationshipService.userPendingSponsorRequest(user.id)
            pendingSponsorOffers = relationshipService.userPendingSponsorOffer(user.id)
            println "size() of pendingSponsorOffers in Home Controller (user " + user.username + "): " + pendingSponsorOffers.size()
            pendingSponsorOffersRep = relationshipService.userPendingSponsorOfferRep(user.id)
            pendingVolunteers = relationshipService.userPendingVolunteer(user.id)
            pendingVolunteerOffers = relationshipService.userPendingVolunteerOffer(user.id)

            Volunteer.findAllByUser(user).each{
                if (it.active)
                    volunteerEvents << it.event
            }

            println "volunteerEvents in home controller index are ${volunteerEvents}"
            def organizerEvents = TekEvent.findAllByOrganizer(user)
            println "can haz organizerEvents? teh organizer events in teh home index wuz " + organizerEvents

            if(Sponsor.findByRep(user)){
              println "in home index. we're going to find the sponsor this user is representing"
              sponsor = Sponsor.findByRep(user)
              println "the sponsor that this user (" + user + ") is representing is " + sponsor

                Sponsorship.findAllBySponsor(sponsor).each {
                    if(it?.organizerApproved && it?.sponsorApproved)
                        sponsoredEvents.add(it?.event)
                }
                println "sponsoredEvents are " + sponsoredEvents

            }

            render(view:'index', model:[ user:user, pendingSponsorRequests:pendingSponsorRequests, pendingSponsorOffers:pendingSponsorOffers, pendingVolunteers:pendingVolunteers, pendingVolunteerOffers:pendingVolunteerOffers, volunteerEvents: volunteerEvents, organizerEvents: organizerEvents, sponsoredEvents: sponsoredEvents, sponsor:sponsor ])

        } else {
            render(view:'loggedOut')
        }

    }

    def test = {}

}

