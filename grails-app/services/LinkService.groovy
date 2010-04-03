class LinkService {

    boolean transactional = true

    def verifyLinks(p) {
            println "p in LinkService.verifyLinks() is " + p
            println "in LinkService.verifyLinks(), p's class is " + p.class
            println "p.properties.each are " + p.properties.each
            def foo = p.website
	    /*p?.properties.each{
	        if(it?.key.contains("website") && it?.value) {
                    println "we found a property with 'website'"
	            if(!(it?.value?.contains("http://") || it?.value?.contains("ftp://"))) {
	                return p?."${it?.key}" = "http://${it?.value}"
	            }
	        }
	    }*/
            if(p?.website){
                if(!(p.website.contains("http://") || p.website.contains("ftp://"))) {
	                return p.website = "http://$foo"
	            }
            }
    }

}

