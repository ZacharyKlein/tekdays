class AttachmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        def event = TekEvent.findBySlug(params.slug)
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [attachmentInstanceList: event.attachments, attachmentInstanceTotal: event.attachments.count(), tekEventInstance:event]
    }

    def create = {
        def attachmentInstance = new Attachment()
        def event = TekEvent.findBySlug(params.slug)
        attachmentInstance.properties = params
        println "in attachment create action (about to leave), and the event is: " + event
        return [attachmentInstance: attachmentInstance, tekEventInstance:event]
    }

    def save = {
        println "entering attachment save action"
        println params
        def attachmentInstance = new Attachment(params)

        def fileName = params.file.originalFilename
        def event = TekEvent.get(params.eventId)

        attachmentInstance.location = "web-app/files/${event?.slug}/${fileName}"
        attachmentInstance.dateCreated = new Date()
        def saveLocation = new File(attachmentInstance.location);
        if(saveLocation.exists()){
            params.file.transferTo(saveLocation)
        } else {
            saveLocation.mkdirs()
            params.file.transferTo(saveLocation)
        }

        attachmentInstance.name = params.file.originalFilename
        attachmentInstance.event = event
        if (attachmentInstance.save(flush: true)) {
            event.addToAttachments(attachmentInstance)
            flash.message = "File saved."
            redirect(action: "show", id: attachmentInstance.id)
        }
        else {
            render(view: "create", model: [attachmentInstance: attachmentInstance])
        }
    }

    def show = {
        def attachmentInstance = Attachment.get(params.id)
        def event = TekEvent.get(attachmentInstance.event?.id)
        println "in the attachment show action, and the event is " +  attachmentInstance?.event
        if (!attachmentInstance) {
            flash.message = "Couldn't find that file."
            redirect(action: "list")
        }
        else {
            [attachmentInstance: attachmentInstance, tekEventInstance: event]
        }
    }

    def edit = {
        def attachmentInstance = Attachment.get(params.id)
        def event = TekEvent.get(attachmentInstance.event.id)
        if (!attachmentInstance) {
            flash.message = "Couldn't find that file.'"
            redirect(action: "list")
        }
        else {
            return [attachmentInstance: attachmentInstance, tekEventInstance:event]
        }
    }

    def update = {
        def attachmentInstance = Attachment.get(params.id)
        if (attachmentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (attachmentInstance.version > version) {

                    attachmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'attachment.label', default: 'Attachment')] as Object[], "Another user has updated this Attachment while you were editing")
                    render(view: "edit", model: [attachmentInstance: attachmentInstance])
                    return
                }
            }
            attachmentInstance.properties = params
            if (!attachmentInstance.hasErrors() && attachmentInstance.save(flush: true)) {
                flash.message = "File updated."
                redirect(action: "show", id: attachmentInstance.id)
            }
            else {
                render(view: "edit", model: [attachmentInstance: attachmentInstance])
            }
        }
        else {
            flash.message = "Couldn't find that file."
            redirect(action: "list")
        }
    }

    def delete = {
        def attachmentInstance = Attachment.get(params.id)
        def event = attachmentInstance.event
        def file = new File(attachmentInstance.location)
        if (attachmentInstance) {
            try {
                attachmentInstance.delete(flush: true)
                file.delete()
                flash.message = "File deleted."
                redirect(action: "list", params:[slug:event?.slug])
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Argh! Couldn't delete that file."
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "Couldn't find that file.'"
            redirect(action: "list")
        }
    }
}

