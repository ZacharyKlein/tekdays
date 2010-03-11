import java.util.Random

class AdminController {

    def authenticateService
    def tekUserService
    def mailService
    def asynchronousMailService

    //static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def leaveFeedback = {

        if(authenticateService.userDomain()){
          //How much time off is customary. Mr Cratchit?
          def user = TekUser.get(authenticateService.userDomain().id)
          params.name = user.username
          params.email = user.email
          //Uh. Why. Um. the. Uh. Whole day.
        }

        /*if(!tekUserService.checkCaptcha(params.captcha.toUpperCase(), session.captcha)) {
            //Yes! Yeah. That's right! The whole day!
            flash.message = "Argh! Access code is invalid."
            if(authenticateService.userDomain()){
                render(controller:"home", view:"index")
            } else {
                render(controller:"home", view:"loggedOut")
            }
        } else {*/
            //asynchronousMailService.sendAsynchronousMail {
        String [] position = [ "Automated Sender of Emails", "Apathetic Peddler of Eggnog", "Unidentified Consumer of Bagels", "Quadrilateral Pesterer of Programmers", "Provider of Unsolicited Commercial Email", "Indifferent Shrugger of Shoulders", "Role Not Specified"]
        Random randomGenerator = new Random()
        int rand = randomGenerator.nextInt(20)
        def pos = position[randomGenerator.nextInt(position.length)]
        //The entire day?
        //No. That's the frog's idea.
        println "are we going to send this email?"
        mailService.sendMail {
                to "fifthposition92@gmail.com", "daveklein@usa.net"
                from "tekdays.com@gmail.com"
                subject "[TekDays] User feedback from ${params.name}"
                body """
Hey dude,

${params.name} (email: ${params.email ?: 'not provided'}) just left us some feedback on TekDays, using our sophisticated user feedback facility. Here it is:

    ${params.message}

Pretty cool, huh?

--
Admin Controller
${pos}
TekDays, Inc.
                """
            }
            //If you please. Mr Scrooge. why open the office tomorrow?
            flash.message = "Thanks, dude."
            //Other businesses will be closed. You'll have no one to do business with.
            if(!authenticateService.userDomain()){
                //It'll waste a lot of expensive coal for the fire.
                redirect(controller:"home", view:"loggedOut")
            } else {
                //Yes. That's definitely a point.
                redirect(controller:"home", action:"index")
                //That's a point.
                //That's right.
            }

        }
    //}
}

