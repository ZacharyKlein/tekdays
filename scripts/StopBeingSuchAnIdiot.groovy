import java.util.Random

includeTargets << grailsScript("Init")

target(main: "Desperately attempts to convince Grails to quit being such an idiot. Rarely succeeds.") {
    String [] response = [ "if you insist", "maybe later", "yeah right", "manufacturer's guarantee voided", "weed eater", "what dat!", "sure"]
    Random randomGenerator = new Random()
    int rand = randomGenerator.nextInt(20)
    println "clear".execute().text
    println "Results: ('grails stop-being-such-an-idiot')=========================================="
    //println "Results: ('grails stop-being-such-an-idiot')"
    println "\n                                 GRAILS SAYS:\n"
    println response[randomGenerator.nextInt(response.length)].center(80) + "\n"
    println "======================================================================================"
    sleep(5000); println "clear".execute().text
}

setDefaultTarget(main)

