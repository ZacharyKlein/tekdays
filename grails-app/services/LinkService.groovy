class LinkService {

    boolean transactional = true

    def verifyLinks(p) {
	    p.properties.each{
	        if(it.key.contains("website") && it.value) {
	            if(!(it.value?.contains("http://") || it.value?.contains("ftp://"))) {
	                return p."${it.key}" = "http://${it.value}"
	            }
	        }
	    }

    }

}
