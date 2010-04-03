class LinkService {

    boolean transactional = true

    def verifyLinks(p) {
            println "p in LinkService.verifyLinks is " + p
            println "p.properties.each are " + p.properties.each
	    p?.properties.each{
	        if(it?.key.contains("website") && it?.value) {
                    println "we found a property with 'website'"
	            if(!(it?.value?.contains("http://") || it?.value?.contains("ftp://"))) {
	                return p?."${it?.key}" = "http://${it?.value}"
	            }
	        }
	    }

    }

}

