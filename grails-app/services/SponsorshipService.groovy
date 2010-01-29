class SponsorshipService {

	def mailService

    boolean transactional = true

    def sponsorApproval(sponsorship, event) {
		sponsorship.sponsorApproved = true
		sponsorship.save()
		notifyOrganizerOfSponsorApproval(sponsorship, event)
    }

	def organizerApproval(sponsorship, event){
		sponsorship.organizerApproved = true
		sponsorship.save()
		notifySponsorOfOrganizerApproval(sponsorship, event)
	}

	def requestSponsorship(sponsor, event, message){
		def sponsorship = new Sponsorship(event:event, sponsor:sponsor, organizerApproved:true)
		sponsorship.save()
		mailService.sendMail {
	                to sponsor.rep.email
	                from "TekDays.com@gmail.com"
	                subject "[TekDays] Request to sponsor ${event.name}"
	                body message
	    }

	}

	def offerSponsorship(sponsor, event, message){
		def sponsorship = new Sponsorship(event:event, sponsor:sponsor, sponsorApproved:true)
		sponsorship.save()
		mailService.sendMail {
	                to event.organizer.email
	                from "TekDays.com@gmail.com"
	                subject "[TekDays] $sponsor.name has offered to sponsor $event.name"
	                body """${event.organizer.profile?.fullName ?: event.organizer.username},

${sponsor.name} has offered to sponsor ${event.name}. ${sponsor.rep.profile?.fullName ?: sponsor.rep.username} (${sponsor.name}'s representative) says:

    $message

Click the link to approve this: http://localhost:8080/tekdays/sponsors/approve/${sponsorship.id}
"""
	    }

	}


    def notifySponsorOfOrganizerApproval(sponsorship, event){
        def sponsor = Sponsor.get(sponsorship?.sponsor.id)
        def organizer = TekUser.get(event?.organizer.id)
        mailService.sendMail {
            to sponsor?.rep.email
            from "TekDays.com@gmail.com"
            subject "${organizer?.profile?.fullName ?: organizer?.username} has accepted your offer to sponsor ${event.name}"
            body """${sponsor?.rep.profile?.fullName ?: sponsor?.rep.username},

${organizer?.profile?.fullName ?: organizer.username} has accepted ${sponsor?.name}'s offer to sponsor ${event?.name}. To see the event's home page, click this link: http://localhost:8080/tekdays/events/${event?.slug}
"""
        }
    }

	def notifyOrganizerOfSponsorApproval(sponsorship, event){

	}

}

