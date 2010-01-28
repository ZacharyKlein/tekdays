class SponsorshipService {
	def mailService
	
    boolean transactional = true

    def sponsorApproval(sponsorship, event, message) {
		sponsorship.sponsorApproved = true
		sponsorship.save()
		notifyOrganizerOfSponsorApproval(sponsorship, event, message)
    }

	def organizerApproval(sponsorship, event, message){
		sponsorship.organizerApproved = true
		sponsorship.save()
		notifySponsorOfOrganizerApproval(sponsorship, event, message)
	}
	
	def requestSponsorship(sponsor, event, message){
		def sponsorship = new SponsorShip(event:event, sponsor:sponsor, organizerApproved:true)
		sponsorship.save()
		mailService.sendMail {
	                to sponsor.rep.email
	                from "TekDays.com@gmail.com"
	                subject "[TekDays] Request to sponsor ${event.name}"
	                body message
	    }
	    
	}
	 
	def offerSponsorship(sponsor, event, message){
		def sponsorship = new SponsorShip(event:event, sponsor:sponsor, sponsorApproved:true)
		sponsorship.save()
		mailService.sendMail {
	                to event.organizer.email
	                from "TekDays.com@gmail.com"
	                subject "[TekDays] Sponsorship offer from $sponsor.name"
	                body message
	    }
	    
	}
	
}
