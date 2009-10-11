class HyphenCodec {

  static encode = {target->
    target.replaceAll(" ", "-")
  }

  static decode = {target->
    target.replaceAll("-", " ")
  }

}

