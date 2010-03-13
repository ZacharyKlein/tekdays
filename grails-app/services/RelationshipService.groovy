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

    def userPendingVolunteerOffer(userId){
        def user = TekUser.get(userId)
        def volunteers = Volunteer.list().findAll{ it.event.organizer.id == user.id }
        def pending
        if(volunteers){
            pending = volunteers.findAll { it?.active == false }
        }
        return pending
    }

    def userPendingSponsorOfferRep(userId) {
        //Jacob Marley?
        //Scrooge!
        def user = TekUser.get(userId) //Hey. You okay?
        def sponsor = Sponsor.findByRep(user) //Humbug.
        def pending
        if(sponsor){
            //To say that Scrooge was not startled would be untrue.
            def sponsorships = Sponsorship.findAllBySponsor(sponsor)
            //Still. The moment had passed. and the world was as it should be.
            pending = sponsorships.findAll { it?.organizerApproved == false }
            //He ain't hurt. Didn't even break his concentration.
        }
        return pending
        //Hmm?
        //Nothin'.
        //Oh.
    }

    def userPendingSponsorOffer(userId){
        //Come on. Rizzo. We'll follow him in.
        def user = TekUser.get(userId)
        //In a minute. I had a little bag of jelly beans over here.
        //Will you just get over here!
          //All right.
        //Sheesh.
        def pending
        if(user){
            //Steady. Steady.
            def sponsorships = Sponsorship.list().findAll { it?.event.organizer.id == user?.id }
            //Scrooge made his way up the staircase...

            //caring not a button for the darkness.
            pending = sponsorships.findAll { it?.organizerApproved == false }
            /* Darkness was cheap. and Scrooge liked it.
               But the incident at the door had made Scrooge wary.
               Before he shut himself in for the night. he searched his rooms. */
        }
        return pending
    }

    def userPendingSponsorRequest(userId) {
          //Okay. That does it!
        //Pardon?
          //How do you know what Scrooge is doin'? We're down here. And he's up there.
        //I keep telling you. Storytellers are omniscient. I know everything.
          //Hoity-toity. Mr Godlike Smarty-pants.

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

