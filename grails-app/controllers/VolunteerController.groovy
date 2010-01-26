class VolunteerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        def event = TekEvent.findBySlug(params.slug)
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [volunteerInstanceList: event.volunteers, volunteerInstanceTotal: event.volunteers.count(), event:event]
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
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'volunteer.label', default: 'Volunteer'), params.id])}"
            redirect(action: "list")
        }
        else {
            [volunteerInstance: volunteerInstance]
        }
    }

    def edit = {
        def volunteerInstance = Volunteer.get(params.id)
        if (!volunteerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'volunteer.label', default: 'Volunteer'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [volunteerInstance: volunteerInstance]
        }
    }

    def update = {
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
                flash.message = "Volunteer status updated."
                redirect(action: "list", slug: volunteerInstance.event.slug)
            }
            else {
                render(view: "edit", model: [volunteerInstance: volunteerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'volunteer.label', default: 'Volunteer'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def volunteerInstance = Volunteer.get(params.id)
        if (volunteerInstance) {
            try {
                volunteerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'volunteer.label', default: 'Volunteer'), params.id])}"
                redirect(action: "list")
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

