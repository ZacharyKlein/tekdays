class LinkService {

    boolean transactional = true

    def verifyLinks(link) {
      println "link in LinkService.verifyLinks() is " + link
      println "link LinkService.verifyLinks(), link's class is " + link

      if(!(link.contains("http://") || link.contains("ftp://"))) {
        return link = "http://$link"
	    }

    }

}

