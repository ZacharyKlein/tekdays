class PostController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def tekEventInstance = TekEvent.findBySlug(params.slug)
        [postInstanceList: Post.list(sort:"dateCreated", order:"desc"), postInstanceTotal: Post.count(), tekEventInstance:tekEventInstance]
    }

    def create = {
        def postInstance = new Post()
        def tekEventInstance = TekEvent.findBySlug(params.slug)
        postInstance.properties = params
        return [postInstance: postInstance, tekEventInstance:tekEventInstance]
    }

    def save = {
        def postInstance = new Post(params)
        def tekEventInstance = TekEvent.findBySlug(params.slug)
        postInstance.event = tekEventInstance
        postInstance.dateCreated = new Date()
        if (postInstance.save(flush: true)) {
            flash.message = "Post saved"
            println "in the post save, the event is " + tekEventInstance
            redirect(controller:"tekEvent", action: "show", params:[slug: tekEventInstance?.slug])
        }
        else {
            render(view: "create", model: [postInstance: postInstance, slug: tekEventInstance?.slug])
        }
    }

    def show = {
        def postInstance = Post.get(params.id)
        if (!postInstance) {
            flash.message = "Couldn't find that post."
            redirect(action: "list")
        }
        else {
            [postInstance: postInstance]
        }
    }

    def edit = {
        def postInstance = Post.get(params.id)
        def event = TekEvent.get(postInstance.event.id)
        if (!postInstance) {
            flash.message = "Couldn't find that post."
            redirect(action: "list")
        }
        else {
            return [postInstance: postInstance, event:event]
        }
    }

    def update = {
        def postInstance = Post.get(params.id)
        if (postInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (postInstance.version > version) {

                    postInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'post.label', default: 'Post')] as Object[], "Another user has updated this Post while you were editing")
                    render(view: "edit", model: [postInstance: postInstance])
                    return
                }
            }
            postInstance.properties = params
            if (!postInstance.hasErrors() && postInstance.save(flush: true)) {
                flash.message = "Post updated"
                println "about to redirect in post update action. postInstance's event is " + postInstance.event
                redirect(controller: "tekEvent", action: "show", params:[slug:postInstance.event.slug])
            }
            else {
                render(view: "edit", model: [postInstance: postInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def postInstance = Post.get(params.id)
        def eventSlug = postInstance.event.slug
        if (postInstance) {
            try {
                postInstance.delete(flush: true)
                flash.message = "Post deleted"
                redirect(controller:"tekEvent", action: "show", params:[slug: eventSlug])
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'post.label', default: 'Post'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), params.id])}"
            redirect(action: "list")
        }
    }
}

