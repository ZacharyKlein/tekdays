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

            event.bannerLocation = "images/banners/${event.name.toLowerCase().encodeAsHyphen()}/"
            event.bannerName = bannerName

            def bannerTransfer = "web-app/${event.bannerLocation}${event.bannerName}"

            def location = new File(bannerTransfer)

            if(!location.exists()){
               location.mkdirs()
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
                def oldBanner = new File("web-app/${oldBannerPath}/${sponsor.bannerName}")
                println "the oldBanner is " + oldBanner
                oldBanner?.delete()
            }

            sponsor.bannerLocation = "images/banners/${sponsor.name.toLowerCase().encodeAsHyphen()}/"
            sponsor.bannerName = bannerName

            def bannerTransfer = "web-app/${sponsor.bannerLocation}${sponsor.bannerName}"

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
                def oldLogo = new File("web-app${oldLogoPath}/${sponsor.logoName}")
                println "oldLogo is " + oldLogo
                oldLogo?.delete()
            }

            sponsor.logoLocation = "/images/sponsor-logos/${sponsor.name.toLowerCase().encodeAsHyphen()}/"
            sponsor.logoName = logoName

            def logoTransfer = "web-app/${sponsor.logoLocation}${sponsor.logoName}"

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
                def oldLogo = new File("web-app${oldLogoPath}/${event.slug}")
                println "oldLogo is " + oldLogo
                oldLogo?.delete()
            }

            event.logo = "/images/event-logos/${event.slug}/${logoName}"

            def logoTransfer = "web-app/${event.log}"

            def location = new File(logoTransfer)

            println "in uploadEventLogo method of FileUploadService, location is " + location

            if(!location.exists()){
               println "location does not exist yet"
               location.mkdirs()
            }

            logoFile?.transferTo(location)
        }

    }



        def uploadSchedule(file, id) {
        def scheduleFile = file
        def scheduleName = file.originalFilename
        def event = TekEvent.get(id)

        if(!scheduleFile.isEmpty()) {
            def test = event.schedule
            if((test) && (scheduleFile)) { def oldSchedule = new File(test).delete() }

            event.schedule = "files/${event.slug}/${scheduleName}"

            def scheduleTransfer = "web-app/files/${event.slug}/${scheduleName}"

            def location = new File(scheduleTransfer)

            if(!location.exists()) {
                location.mkdirs()
            }

            scheduleFile?.transferTo(location)
        }

    }
}

