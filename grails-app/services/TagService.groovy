class TagService {

    boolean transactional = true

    def saveTag(tagCsv, taggable) {
        println "entering tagservice saveTag"
        def tags = tagCsv.split(",")

        tags.each {
            def tagInstance = Tag.findByName(it)

            if (!tagInstance)
                tagInstance = new Tag(name:it)

            println tagInstance.name

            tagInstance.name = tagInstance.name.toLowerCase()

            if(tagInstance.save(flush:true)) {
                taggable.addToTags(tagInstance)
                println "tag saved. heading home...."
              
            }
        }
        return true
    }
}
