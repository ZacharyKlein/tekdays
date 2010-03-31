class TekPostController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        [tekPostInstanceList: TekPost.list(max:10, sort:"dateCreated", order:"desc"), tekPostInstanceTotal: TekPost.count()]
    }

    def create = {
        def tekPostInstance = new TekPost()
        tekPostInstance.properties = params
        return [tekPostInstance: tekPostInstance]
    }

    def save = {
        def tekPostInstance = new TekPost(params)
        if (tekPostInstance.save(flush: true)) {
            flash.message = """Saved post, dude. Congrats. (Have a look at the <a href="${createLink(controller:'tekPost', action:'list')}"><strong>blog</strong></a>, by the way.)"""
            redirect(action: "show", id: tekPostInstance.id)
        }
        else {
            render(view: "create", model: [tekPostInstance: tekPostInstance])
        }
    }

    def show = {
        def tekPostInstance = TekPost.get(params.id)
        if (!tekPostInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tekPost.label', default: 'TekPost'), params.id])}"
            redirect(action: "list")
        }
        else {
            [tekPostInstance: tekPostInstance]
        }
    }

    def edit = {
        def tekPostInstance = TekPost.get(params.id)
        if (!tekPostInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tekPost.label', default: 'TekPost'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [tekPostInstance: tekPostInstance]
        }
    }

    def update = {
        def tekPostInstance = TekPost.get(params.id)
        if (tekPostInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (tekPostInstance.version > version) {
                    
                    tekPostInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'tekPost.label', default: 'TekPost')] as Object[], "Another user has updated this TekPost while you were editing")
                    render(view: "edit", model: [tekPostInstance: tekPostInstance])
                    return
                }
            }
            tekPostInstance.properties = params
            if (!tekPostInstance.hasErrors() && tekPostInstance.save(flush: true)) {
                flash.message = """Updated post, dude. (Have a look at the <a href="${createLink(controller:'tekPost', action:'list')}"><strong>blog</strong></>.)"""
                redirect(action: "show", id: tekPostInstance.id)
            }
            else {
                render(view: "edit", model: [tekPostInstance: tekPostInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tekPost.label', default: 'TekPost'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def tekPostInstance = TekPost.get(params.id)
        if (tekPostInstance) {
            try {
                tekPostInstance.delete(flush: true)
                flash.message = "Deleted post, dude."
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'tekPost.label', default: 'TekPost'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tekPost.label', default: 'TekPost'), params.id])}"
            redirect(action: "list")
        }
    }
}
