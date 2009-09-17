

class TagController {
    
    def index = {
        redirect action:"list", params:params 
    }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ tagInstanceList: Tag.list( params ), tagInstanceTotal: Tag.count() ]
    }

    def show = {
        def tagInstance = Tag.get( params.id )

        if(!tagInstance) {
            flash.message = "Tag not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            [ tagInstance : tagInstance ]
        }
    }

    def delete = {
        def tagInstance = Tag.get( params.id )
        if(tagInstance) {
            try {
                tagInstance.delete(flush:true)
                flash.message = "Tag ${params.id} deleted"
                redirect(action:"list")
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Tag ${params.id} could not be deleted"
                redirect(action:"show",id:params.id)
            }
        }
        else {
            flash.message = "Tag not found with id ${params.id}"
            redirect(action:"list")
        }
    }

    def edit = {
        def tagInstance = Tag.get( params.id )

        if(!tagInstance) {
            flash.message = "Tag not found with id ${params.id}"
            redirect action:'list'
        }
        else {
            return [ tagInstance : tagInstance ]
        }
    }

    def update = {
        def tagInstance = Tag.get( params.id )
        if(tagInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(tagInstance.version > version) {
                    
                    tagInstance.errors.rejectValue("version", "tag.optimistic.locking.failure", "Another user has updated this Tag while you were editing.")

                    render view:'edit', model:[tagInstance:tagInstance]
                    return
                }
            }
            tagInstance.properties = params
            if(!tagInstance.hasErrors() && tagInstance.save()) {
                flash.message = "Tag ${params.id} updated"

                redirect action:'show', id:tagInstance.id
            }
            else {
                render view:'edit', model:[tagInstance:tagInstance]
            }
        }
        else {
            flash.message = "Tag not found with id ${params.id}"
            redirect action:'list'
        }
    }

    def create = {
        def tagInstance = new Tag()
        tagInstance.properties = params
        return ['tagInstance':tagInstance]
    }

    def save = {
        def tagInstance = Tag.findByName(params.name)
        if (!tagInstance)
            tagInstance = new Tag(params)
        tagInstance.name = tagInstance.name.toLowerCase()

        if(tagInstance.save(flush:true)) {
            flash.message = "Tag ${tagInstance.id} created"

            redirect action:"show", id:tagInstance.id
        }
        else {
            render view:'create', model:[tagInstance:tagInstance]
        }
    }
}
