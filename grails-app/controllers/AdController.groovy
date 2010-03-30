class AdController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [adInstanceList: Ad.list(params), adInstanceTotal: Ad.count()]
    }

    def create = {
        def adInstance = new Ad()
        adInstance.properties = params
        return [adInstance: adInstance]
    }

    def save = {
        def adInstance = new Ad(params)
        def img = params.img
        def filename = params.img.originalFilename
        adInstance.imageLocation = "${request.getSession().getServletContext().getRealPath("/")}images/a/${params.name.toLowerCase().encodeAsHyphen()}/${filename}"
        adInstance.imageName = filename
        def location = new File(adInstance.imageLocation)
        location.mkdirs()
        img?.transferTo(location)

        if (adInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'ad.label', default: 'Ad'), adInstance.id])}"
            redirect(action: "show", id: adInstance.id)
        }
        else {
            render(view: "create", model: [adInstance: adInstance])
        }
    }

    def show = {
        def adInstance = Ad.get(params.id)
        if (!adInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])}"
            redirect(action: "list")
        }
        else {
            [adInstance: adInstance]
        }
    }

    def edit = {
        def adInstance = Ad.get(params.id)
        if (!adInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [adInstance: adInstance]
        }
    }

    def update = {
        def adInstance = Ad.get(params.id)
        if (adInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (adInstance.version > version) {
                    
                    adInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'ad.label', default: 'Ad')] as Object[], "Another user has updated this Ad while you were editing")
                    render(view: "edit", model: [adInstance: adInstance])
                    return
                }
            }
            adInstance.properties = params
            if (!adInstance.hasErrors() && adInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'ad.label', default: 'Ad'), adInstance.id])}"
                redirect(action: "show", id: adInstance.id)
            }
            else {
                render(view: "edit", model: [adInstance: adInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def adInstance = Ad.get(params.id)
        if (adInstance) {
            try {
                adInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])}"
            redirect(action: "list")
        }
    }
}
