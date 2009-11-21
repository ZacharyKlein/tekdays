class HyphenCodec {

  static encode = {target->
    //println "in encode method of codec class. target class is: " + target?.class
    if(target){
      //println "in encode method of codec class. target value is: " + target
      target.replaceAll(" ", "-")
    }
  }

  static decode = {target->
    //println "in decode method of codec class. target class is: " + target?.class
    if(target){
      //println "in decode method of codec class. target value is: " + target
      target.replaceAll("-", " ")
    }
  }

}

