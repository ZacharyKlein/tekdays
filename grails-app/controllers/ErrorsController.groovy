class ErrorsController {

    def mailService
    def asynchronousMailService

    def notfound = {
      def uri = request.forwardURI
      asynchronousMailService.sendAsynchronousMail {
                to "fifthposition92@gmail.com"
                from "TekDays.com@gmail.com"
                subject "[TekDays] Somebody got a 404"
                body "Dude, someone got a 404 on TekDays. URL: '${uri}'"
      }
    }

    def internalservererror = {
      asynchronousMailService.sendAsynchronousMail {
                to "fifthposition92@gmail.com"
                from "TekDays.com@gmail.com"
                subject "[TekDays] Somebody got a 500"
                html g.render(template:"error500")
      }
    }

}

