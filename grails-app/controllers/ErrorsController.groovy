class ErrorsController {

    def mailService

    def notfound = {
      def uri = request.forwardURI
      mailService.sendMail {
                to "daveklein@usa.net","fifthposition92@gmail.com","zak@silver-chalice.com"
                from "TekDays.com@gmail.com"
                subject "[TekDays] Somebody got a 404"
                body "Dude, someone got a 404 on TekDays. URL: '${uri}'"
      }
    }

    def internalservererror = {
      mailService.sendMail {
                to "fifthposition92@gmail.com"
                from "TekDays.com@gmail.com"
                subject "[TekDays] Somebody got a 500"
                html g.render(template:"error500")
      }
    }

}

