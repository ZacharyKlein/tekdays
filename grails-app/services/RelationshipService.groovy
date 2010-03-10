class RelationshipService {

    boolean transactional = true

    def userPendingVolunteer(userId) {
        def user = TekUser.get(userId)
        def volunteers = Volunteer.findAllByUser(user)
        def pending
        if(volunteers){
            pending = volunteers.findAll { it?.active == false }
        }
        return pending
    }

    def userPendingSponsorOfferRep(userId) {
        def user = TekUser.get(userId)
        def sponsor = Sponsor.findByRep(user)
        def pending
        if(sponsor){
            def sponsorships = Sponsorship.findAllBySponsor(sponsor)
            pending = sponsorships.findAll { it?.organizerApproved == false }
        }
        return pending
    }

    def userPendingSponsorOffer(userId){
        def user = TekUser.get(userId)
        def pending
        if(user){
            def sponsorships = Sponsorship.list().findAll { it?.event.organizer.id == user?.id }
            pending = sponsorships.findAll { it?.organizerApproved == false }
        }
        return pending
    }

    def userPendingSponsorRequest(userId) {
        def user = TekUser.get(userId)
        def sponsorships = Sponsorship.list().findAll { it?.event.organizer.id == user?.id }
        def pending
        if(sponsorships){
            pending = sponsorships.findAll { it?.sponsorApproved == false }
        }
        return pending
    }

    def pendingRelationships(userId) {
        def pendingVolunteers = userPendingVolunteer(userId)
        def pendingSponsorOffers = userPendingSponsorOffer(userId)
        def pendingSponsorRequests = userPendingSponsorRequest(userId)
        [ 'pendingVolunteers':pendingVolunteers, 'pendingSponsorOffers':pendingSponsorOffers, 'pendingSponsorRequests':pendingSponsorRequests ]
    }
}

