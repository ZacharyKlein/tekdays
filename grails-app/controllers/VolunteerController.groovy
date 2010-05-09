class VolunteerController {

    def mailService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        def tekEventInstance = TekEvent.findBySlug(params.slug)
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [volunteerInstanceList: tekEventInstance.volunteers, volunteerInstanceTotal: tekEventInstance.volunteers.count(), tekEventInstance:tekEventInstance]
    }

    def create = {
        def volunteerInstance = new Volunteer()
        volunteerInstance.properties = params
        return [volunteerInstance: volunteerInstance]
    }

    def save = {
        def volunteerInstance = new Volunteer(params)
        if (volunteerInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'volunteer.label', default: 'Volunteer'), volunteerInstance.id])}"
            redirect(action: "show", id: volunteerInstance.id)
        }
        else {
            render(view: "create", model: [volunteerInstance: volunteerInstance])
        }
    }

    def show = {
        def volunteerInstance = Volunteer.get(params.id)
        if (!volunteerInstance) {
            flash.message = "Volunteer not found."
            redirect(controller:"home", action: "index")
        }
        else {
            [volunteerInstance: volunteerInstance]
        }
    }

    def edit = {
        def volunteerInstance = Volunteer.get(params.id)
        def tekEventInstance = TekEvent.get(volunteerInstance.event.id)
        if (!volunteerInstance) {
            flash.message = "Volunteer not found."
            redirect(controller:"home", action: "index")
        }
        else {
            return [volunteerInstance: volunteerInstance, tekEventInstance:tekEventInstance]
        }
    }

    def update = {
        println "volunteer update params: ${params}"
        def volunteerInstance = Volunteer.get(params.id)
        if (volunteerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (volunteerInstance.version > version) {

                    volunteerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'volunteer.label', default: 'Volunteer')] as Object[], "Another user has updated this Volunteer while you were editing")
                    render(view: "edit", model: [volunteerInstance: volunteerInstance])
                    return
                }
            }
            volunteerInstance.properties = params

            if (!volunteerInstance.hasErrors() && volunteerInstance.save(flush: true)) {
               if(volunteerInstance.active){
                   mailService.sendMail {
                       to "${volunteerInstance.user.email}"
                       from "TekDays.com@gmail.com"
                       subject "[TekDays] ${volunteerInstance?.event.organizer.profile?.fullName ?: volunteerInstance?.event.organizer.username} has made you a volunteer with ${volunteerInstance.event?.name}"
                       body """${volunteerInstance.user.profile?.fullName ?: volunteerInstance.user.username},

${volunteerInstance?.event.organizer.profile?.fullName ?: volunteerInstance?.event.organizer.username} (${volunteerInstance.event.organizer.username}) has accepted your offer to help with ${volunteerInstance.event?.name}. Click here for the event dashboard: http://tekdays.com/events/${volunteerInstance.event.slug}/dashboard"""
                       /*html g.render(template:"notice", model:[contactInstance: contactInstance])*/
                    }
                }
                flash.message = "Volunteer status updated."
                redirect(action: "list", params:[slug: volunteerInstance.event.slug])
            }
            else {
                render(view: "edit", model: [volunteerInstance: volunteerInstance])
            }
        }
        else {
            flash.message = "Volunteer not found."
            redirect(controller:"home", action: "index")
        }
    }

    def delete = {
        def volunteerInstance = Volunteer.get(params.id)
        if (volunteerInstance) {
            try {
                volunteerInstance.delete(flush: true)
                flash.message = "Volunteer deleted."
                redirect(controller:"home", action: "index")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'volunteer.label', default: 'Volunteer'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'volunteer.label', default: 'Volunteer'), params.id])}"
            redirect(action: "list")
        }
    }
}

