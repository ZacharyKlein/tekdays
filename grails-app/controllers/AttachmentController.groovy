class AttachmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        def tekEventInstance = TekEvent.findBySlug(params.slug)
        println "oh hai! im in ur attachment list, pwintin ur params... " + params
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)

        if(params.attachmentInstance) {
	        [attachmentInstanceList: tekEventInstance.attachments,
	        attachmentInstanceTotal: tekEventInstance.attachments.count(),
	        tekEventInstance: tekEventInstance,
	        attachmentInstance: attachmentInstance]
				}
				else {
					[attachmentInstanceList: tekEventInstance.attachments,
	        attachmentInstanceTotal: tekEventInstance.attachments.count(),
	        tekEventInstance: tekEventInstance]
				}
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
        def tekEventInstance = TekEvent.findBySlug(params.slug)

        attachmentInstance.location = "web-app/files/${tekEventInstance?.slug}/${fileName}"
        attachmentInstance.dateCreated = new Date()
        def saveLocation = new File(attachmentInstance.location);
        if(saveLocation.exists()){
            params.file.transferTo(saveLocation)
        } else {
            saveLocation.mkdirs()
            params.file.transferTo(saveLocation)
        }

        attachmentInstance.name = params.file.originalFilename
        attachmentInstance.event = tekEventInstance
        if (attachmentInstance.save(flush: true)) {
          tekEventInstance.addToAttachments(attachmentInstance)
          flash.message = "File saved."
          redirect(action: "list", params:[slug:tekEventInstance.slug ])
        }
        else {
					flash.message = "Invalid File"
          redirect(action: "list", params:[slug:tekEventInstance.slug, attachmentInstance:attachmentInstance])
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

    def editFile = {
        println "we is in the editFile action of the AttachmentController now"
        def attachmentInstance = Attachment.get( params.id )
        println "still in editFile. attachmentInstance is " + attachmentInstance
        def event = TekEvent.get(attachmentInstance.event.id)
        println "and the event in the attachmentInstance is " + event
        def attachmentInstanceList = Attachment.findAllByEvent(event)

        if(!attachmentInstance) {
            println "there was no attachmentInstance"
            flash.message = "Couldn't find that file."
            render(template:"attachmentList", model:[ attachmentInstanceList: attachmentInstanceList, ])
        }
        else {
            println "there was an attachmentInstance"
            render(template:"editFile", model:[attachmentInstance:attachmentInstance])
        }
    }

        def update = {
        println "entering update action. params are: $params"

        def attachmentInstance = Attachment.get( params.id )
        def event = TekEvent.findBySlug(params.slug)
        println "attachmentInstance in update action is " + attachmentInstance
        println "event in update action is " + event

        def attachmentInstanceList = Attachment.findAllByEvent(event)
        if(attachmentInstance) {


            if(params.version) {
                def version = params.version.toLong()
                if(attachmentInstance.version > version) {
                    attachmentInstance.errors.rejectValue("version", "attachment.optimistic.locking.failure", "Another user has updated this file while you were editing.")
                    render(template:"/shared/editFile", model:[attachmentInstance:attachmentInstance])
                    return
                }
            }

            attachmentInstance.properties = params
            if(!attachmentInstance.hasErrors() && attachmentInstance.save()) {
                println "saved attachmentInstance (in attachment update). it is " + attachmentInstance
                flash.message = "File updated"
                render(template:"/attachment/attachments", model:[ attachmentInstanceList: attachmentInstanceList, ])
                return
            }
            else {
                render(template:"editFile", model:[attachmentInstance:attachmentInstance])
            }
        }
        else {
            flash.message = "No file found with id ${params.id}"
            render(template:"/attachment/attachments", model:[ attachmentInstanceList: attachmentInstanceList, ])
        }
    }

}

