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
		def sponsorship = new Sponsorship(event:event, sponsor:sponsor, organizerApproved:true, organizerMessage:message)
		sponsorship.save()
		mailService.sendMail {
	                to sponsor.rep.email
	                from "TekDays.com@gmail.com"
	                subject "[TekDays] Request for ${sponsor?.name} to sponsor ${event.name}"
	                body """${sponsor.rep.profile?.fullName ?: sponsor.rep.username},

${event?.organizer.profile?.fullName ?: event?.organizer.username} wants ${sponsor?.name} to sponsor ${event?.name}:

    ${sponsorship.organizerMessage}

Click the link to approve this: http://tekdays.com/sponsors/approve/${sponsorship.id}
"""
	    }

	}

	def offerSponsorship(sponsor, event, message){
		def sponsorship = new Sponsorship(event:event, sponsor:sponsor, sponsorMessage:message, sponsorApproved:true)
		sponsorship.save(failOnError:true)
		mailService.sendMail {
	                to event.organizer.email
	                from "TekDays.com@gmail.com"
	                subject "[TekDays] $sponsor.name has offered to sponsor $event.name"
	                body """${event.organizer.profile?.fullName ?: event.organizer.username},

${sponsor.name} has offered to sponsor ${event.name}. ${sponsor.rep.profile?.fullName ?: sponsor.rep.username} (${sponsor.name}'s representative) says:

    ${sponsorship.sponsorMessage}

Click the link to approve this: http://tekdays.com/sponsors/approve/${sponsorship.id}
"""
	    }

	    if(!sponsorship.save()){ sponsorship.errors.allErrors.each{ println it } }

	}


    def notifySponsorOfOrganizerApproval(sponsorship, event){
        def sponsor = Sponsor.get(sponsorship?.sponsor.id)
        def organizer = TekUser.get(event?.organizer.id)
        mailService.sendMail {
            to sponsor?.rep.email
            from "TekDays.com@gmail.com"
            subject "[TekDays] ${organizer?.profile?.fullName ?: organizer?.username} has accepted your offer to sponsor ${event.name}"
            body """${sponsor?.rep.profile?.fullName ?: sponsor?.rep.username},

${organizer?.profile?.fullName ?: organizer.username} has accepted ${sponsor?.name}'s offer to sponsor ${event?.name}. To see the event's home page, click this link: http://tekdays.com/events/${event?.slug}
"""
        }
    }

	def notifyOrganizerOfSponsorApproval(sponsorship, event){
        def sponsor = Sponsor.get(sponsorship?.sponsor.id)
        def organizer = TekUser.get(event?.organizer.id)
        mailService.sendMail {
            to organizer?.email
            from "TekDays.com@gmail.com"
            subject "[TekDays] ${sponsor?.name} will sponsor ${event.name}"
            body """${organizer?.profile?.fullName ?: organizer?.username},

${sponsor?.rep.profile?.fullName ?: sponsor?.rep.username} has accepted your request for ${sponsor?.name} to sponsor ${event?.name}. Click the link to see all of your event's sponsors:  http://tekdays.com/events/${event?.slug}/sponsors
"""
    	}
    }

}

