class AttachmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [attachmentInstanceList: Attachment.list(params), attachmentInstanceTotal: Attachment.count()]
    }

    def create = {
        def attachmentInstance = new Attachment()
        attachmentInstance.properties = params
        return [attachmentInstance: attachmentInstance]
    }

    def save = {
        println "entering attachment save action"
        println params
        def attachmentInstance = new Attachment(params)
        
        def fileName = 'dummy'
        def event = TekEvent.get(params.eventId)
        
        attachmentInstance.location = "web-app/files/${event}/${fileName}-file.pdf"
        def saveLocation = new File(attachmentInstance.location);
        saveLocation.mkdirs()
        params.file.transferTo(saveLocation)

        
        
        if (attachmentInstance.save(flush: true)) {
            event.attachments << attachmentInstance
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'attachment.label', default: 'Attachment'), attachmentInstance.id])}"
            redirect(action: "show", id: attachmentInstance.id)
        }
        else {
            render(view: "create", model: [attachmentInstance: attachmentInstance])
        }
    }

    def show = {
        def attachmentInstance = Attachment.get(params.id)
        if (!attachmentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'attachment.label', default: 'Attachment'), params.id])}"
            redirect(action: "list")
        }
        else {
            [attachmentInstance: attachmentInstance]
        }
    }

    def edit = {
        def attachmentInstance = Attachment.get(params.id)
        if (!attachmentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'attachment.label', default: 'Attachment'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [attachmentInstance: attachmentInstance]
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
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'attachment.label', default: 'Attachment'), attachmentInstance.id])}"
                redirect(action: "show", id: attachmentInstance.id)
            }
            else {
                render(view: "edit", model: [attachmentInstance: attachmentInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'attachment.label', default: 'Attachment'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def attachmentInstance = Attachment.get(params.id)
        if (attachmentInstance) {
            try {
                attachmentInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'attachment.label', default: 'Attachment'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'attachment.label', default: 'Attachment'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'attachment.label', default: 'Attachment'), params.id])}"
            redirect(action: "list")
        }
    }
}
