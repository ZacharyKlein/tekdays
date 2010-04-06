 class FileUploadService {

    boolean transactional = true

    def uploadEventBanner(file, id) {

      def bannerFile = file
      def bannerName = file.originalFilename
      def event = TekEvent.get(id)

      println "the banner is $bannerName"


      if(!bannerFile.isEmpty()){
        def test = event.bannerLocation
				println test
				
        if((test) && (bannerFile)){
          def oldBanner = new File(test).delete()
          println oldBanner
        }

        event.bannerLocation = "/srv/www/tekdays/images/events/banners/${event.slug}/"
        event.bannerName = bannerName

        println event.bannerLocation
        println event.bannerName

        def bannerDir = new File("${event.bannerLocation}")

        println "bannerDir exists. true or false: " + bannerDir.exists()
        if(!bannerDir.exists()){
          bannerDir.mkdirs()
          println "we should have mkdirs()d the bannerDir"
          println "let's try this again. bannerDir exists. true or false: " + bannerDir.exists()
        }

        def location = new File("${bannerDir}/${bannerName}")
				println location

        println "bannerDir exists. true or false: " + bannerDir.exists()
        if(!bannerDir.exists()){
           bannerDir.mkdirs()
        }

        bannerFile?.transferTo(location)
        
      }
    }


    def uploadSponsorBanner(file, id) {

        def bannerFile = file
        def bannerName = file.originalFilename
        def sponsor = Sponsor.get(id)

        println "the banner is $bannerName"


        if(!bannerFile.isEmpty()){
            def oldBannerPath = sponsor.bannerLocation

            if(oldBannerPath){
                def oldBanner = new File("${oldBannerPath}/${sponsor.bannerName}")
                println "the oldBanner is " + oldBanner
                oldBanner?.delete()
            }

            sponsor.bannerLocation = "/srv/www/tekdays/images/sponsors/banners/${sponsor.slug}/"
            sponsor.bannerName = bannerName

            def bannerTransferDir = "${sponsor.bannerLocation}"

            def locationDir = new File("${bannerTransferDir}")

            if(!locationDir.exists()){
              locationDir.mkdirs()
            }

            def bannerTransfer = "${sponsor.bannerName}"
            
            def location = new File("${locationDir}/${bannerTransfer}")

            println "in uploadSponsorBanner method of FileUploadService, location is " + location

            location << bannerFile
        }

    }

    def uploadSponsorLogo(file, id) {

      def logoFile = file
      def logoName = file.originalFilename
      def sponsor = Sponsor.get(id)

      println "in fileUploadService uploadSponsorLogo(), the logo is " + logoName


      if(!logoFile.isEmpty()){
        def oldLogoPath = sponsor.logoLocation
        println "oldLogoPath is " + oldLogoPath

        if(oldLogoPath){
          def oldLogo = new File("/srv/www/tekdays${oldLogoPath}/${sponsor.logoName}")
          println "oldLogo is " + oldLogo
          oldLogo?.delete()
        }

        sponsor.logoLocation = "/srv/www/tekdays/images/sponsors/logos/${sponsor.slug}/"
        sponsor.logoName = logoName

        def logoTransfer = "${sponsor.logoLocation}${sponsor.logoName}"
        def location = new File(logoTransfer)

        println "in uploadSponsorLogo method of FileUploadService, location is " + location

        if(!location.exists()){
          println "location does not exist yet"
          location.mkdirs()
        }

        logoFile?.transferTo(location)
      }
    }

    def uploadEventLogo(file, id) {

        def logoFile = file
        def logoName = file.originalFilename
        def event = TekEvent.get(id)

        println "in fileUploadService uploadEventLogo(), the logo is " + logoName


        if(!logoFile.isEmpty()){
            def oldLogoPath = event.logo
            println "oldLogoPath is " + oldLogoPath

            if(oldLogoPath){
                def oldLogo = new File("/srv/www/tekdays${oldLogoPath}/${event.slug}")
                println "oldLogo is " + oldLogo
                oldLogo?.delete()
            }

            event.logo = "/srv/www/tekdays/images/events/logos/${event.slug}/${logoName}"

            def logoTransfer = "${event.logo}"

            def location = new File(logoTransfer)

            println "in uploadEventLogo method of FileUploadService, location is " + location

            if(!location.exists()){
               println "location does not exist yet"
               location.mkdirs()
            }

            logoFile?.transferTo(location)
        }

    }



        def uploadFlyer(file, id) {
        def flyerFile = file
        def flyerName = file.originalFilename
        def event = TekEvent.get(id)

        if(!flyerFile.isEmpty()) {
            def test = event.flyer
            if((test) && (flyerFile)) { def oldFlyer = new File(test).delete() }

            event.flyer = "/srv/www/tekdays/files/${event.slug}/${flyerName}"

            def flyerTransfer = "/srv/www/tekdays/files/${event.slug}/${flyerName}"

            def location = new File(flyerTransfer)

            if(!location.exists()) {
                location.mkdirs()
            }

            flyerFile?.transferTo(location)
        }

    }
}

