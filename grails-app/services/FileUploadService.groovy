class FileUploadService {

    boolean transactional = true

    def uploadEventBanner(file, id) {

        def bannerFile = file
        def bannerName = file.originalFilename
        def event = TekEvent.get(id)

        println "the banner is $bannerName"


        if(!bannerFile.isEmpty()){
            def test = event.bannerLocation

            if((test) && (bannerFile)){
                def oldBanner = new File(test).delete()
            }

            event.bannerLocation = "/srv/www/tekdays/images/events/banners/${event.slug}/"
            event.bannerName = bannerName

            def bannerDir = "/srv/www/tekdays/${event.bannerLocation}"
            def d = new File("${bannerDir}")
            println "d exists. true or false: " + d.exists()
            if(!d.exists()){
              d.mkdirs()
              println "we should have mkdirs()d the d"
              println "let's try this again. d exists. true or false: " + d.exists()
            }

            def location = new File("${bannerDir}/${bannerName}")

            println "location exists. true or false: " + location.exists()
            if(!location.exists()){
               println "location exists. true or false: " + location.exists()
               location.mkdirs()
               println "we should have mkdirs()d the location"
               println "let's try this again. location exists. true or false: " + location.exists()
            }

            println "we know what the size of this location thing is? " + location.size()
            bannerFile?.transferTo(location)
            println "now what is the size of this location thing after we bannerFile.transferTo(location)? " + location.size()
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

            def bannerTransfer = "${sponsor.bannerLocation}${sponsor.bannerName}"

            def location = new File(bannerTransfer)

            println "in uploadSponsorBanner method of FileUploadService, location is " + location

            if(!location.exists()){
               location.mkdirs()
            }

            bannerFile?.transferTo(location)
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

            sponsor.logoLocation = "/srv/www/tekdays/images/sponsors/logos/${sponsor.name.toLowerCase().encodeAsHyphen()}/"
            sponsor.logoName = logoName

            def logoTransfer = "/srv/www/tekdays/${sponsor.logoLocation}${sponsor.logoName}"

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

