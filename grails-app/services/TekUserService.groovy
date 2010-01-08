import org.springframework.security.providers.UsernamePasswordAuthenticationToken as AuthToken
import org.springframework.security.context.SecurityContextHolder as SCH

class TekUserService {

    def authenticateService
    def daoAuthenticationProvider
    def linkService

    boolean transactional = true



    def checkPasswd(String passwd, String confirmPasswd) {
            println "entering tekUserService checkCreds method"
            if(passwd != confirmPasswd) { return false }
            else { return true }
        }

    def checkCaptcha(captcha, confirmCaptcha) {
            if(captcha.toUpperCase() != confirmCaptcha) { return false }
            else { return true }
        }

    }

