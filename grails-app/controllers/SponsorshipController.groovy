class SponsorshipController {

    def authenticateService
    def sponsorshipService

    def index = {
        redirect action:"list", params:params
    }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def all = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ sponsorshipInstanceList: Sponsorship.list( params ), sponsorshipInstanceTotal: Sponsorship.count() ]
    }

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        def event = TekEvent.findBySlug(params.slug)
        [ sponsorshipInstanceList: Sponsorship.findByEvent(event), sponsorshipInstanceTotal: Sponsorship.count() ]
    }

    def show = {
        def sponsorshipInstance = Sponsorship.get( params.id )

        if(!sponsorshipInstance) {
            flash.message = "Sponsorship not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            [ sponsorshipInstance : sponsorshipInstance ]
        }
    }

    def delete = {
        def sponsorshipInstance = Sponsorship.get( params.id )
        if(sponsorshipInstance) {
            try {
                sponsorshipInstance.delete(flush:true)
                flash.message = "Sponsorship ${params.id} deleted"
                redirect(action:"list")
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Sponsorship ${params.id} could not be deleted"
                redirect(action:"show",id:params.id)
            }
        }
        else {
            flash.message = "Sponsorship not found with id ${params.id}"
            redirect(action:"list")
        }
    }

    def edit = {
        def sponsorshipInstance = Sponsorship.get( params.id )
        def event = TekEvent.get(sponsorshipInstance?.event.id)

        def isOrganizer = false
        def user = TekUser.get(authenticateService.userDomain().id)
        if(event.organizer.id == user.id){ isOrganizer = true }

        if(!sponsorshipInstance) {
            flash.message = "Sponsorship not found with id ${params.id}"
            redirect action:'list'
        }
        else {
            return [ sponsorshipInstance : sponsorshipInstance, event : event, isOrganizer : isOrganizer ]
        }
    }

    def update = {
        def sponsorshipInstance = Sponsorship.get( params.id )
        if(sponsorshipInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(sponsorshipInstance.version > version) {

                    sponsorshipInstance.errors.rejectValue("version", "sponsorship.optimistic.locking.failure", "Another user has updated this Sponsorship while you were editing.")

                    render view:'edit', model:[sponsorshipInstance:sponsorshipInstance]
                    return
                }
            }
            sponsorshipInstance.properties = params
            if(!sponsorshipInstance.hasErrors() && sponsorshipInstance.save()) {
                flash.message = "Sponsorship ${params.id} updated"

                redirect action:'show', id:sponsorshipInstance.id
            }
            else {
                render view:'edit', model:[sponsorshipInstance:sponsorshipInstance]
            }
        }
        else {
            flash.message = "Sponsorship not found with id ${params.id}"
            redirect action:'list'
        }
    }

    def create = {
        def sponsorshipInstance = new Sponsorship()
        def event = TekEvent.findBySlug(params?.slug)
        sponsorshipInstance.properties = params
        sponsorshipInstance.event = event

        return ['sponsorshipInstance':sponsorshipInstance, 'event':event]
    }

    def save = {
        def sponsorshipInstance = new Sponsorship(params)
        sponsorshipInstance.event.addToVolunteers( sponsorshipInstance.sponsor.rep )
        if(sponsorshipInstance.save(flush:true)) {
            flash.message = "Sponsorship ${sponsorshipInstance.id} created"

            redirect action:"show", id:sponsorshipInstance.id
        }
        else {
            render view:'create', model:[sponsorshipInstance:sponsorshipInstance]
        }
    }

    def requestSponsorshipPage = {

    }

	def requestSponsorship = {

	}

	def offerSponsorshipPage = {

	}

	def offerSponsorship = {
		def user = TekUser.get(authenticateService.userDomain().id)
		def sponsor = Sponsor.findByRep(user)
	    if(sponsor){
	        def event = TekEvent.get(params.id)
	        def message = params.message
	        sponsorshipService.offerSponsorship(sponsor, event, message)
	        render "<p><strong>Thanks!</strong><br /> You'll be emailed when the organizer accepts your offer.</p>"
	    } else {
	        flash.message = "You're not representing a sponsor!"
	        redirect(controller:'home', action:'index')
	    }
	}

	def sponsorAccept = {
	    def sponsorship = Sponsorship.get(params.id)
	    def event = TekEvent.get(sponsorship?.event.id)
	    sponsorshipService.sponsorApproval(sponsorship, event)
	    flash.message = "Status updated."
	    redirect(controller:"tekEvent", action:"show", params:[slug:event?.slug])
	}

	def organizerAccept = {
	    def sponsorship = Sponsorship.get(params.id)
	    def event = TekEvent.get(sponsorship?.event.id)
	    sponsorshipService.organizerApproval(sponsorship, event)
	    flash.message = "Status updated."
	    redirect(controller:"sponsorship", action:"list", params:[slug:event?.slug])
	}

}

