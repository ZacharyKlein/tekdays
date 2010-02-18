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

            event.bannerLocation = "images/banners/${event.name}/"
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
            def test = sponsor.bannerLocation

            if((test) && (bannerFile)){
                def oldBanner = new File(test).delete()
            }

            sponsor.bannerLocation = "images/banners/${sponsor.name}/"
            sponsor.bannerName = bannerName

            def bannerTransfer = "web-app/${sponsor.bannerLocation}${sponsor.bannerName}"

            def location = new File(bannerTransfer)

            if(!location.exists()){
               location.mkdirs()
            }

            bannerFile?.transferTo(location)
        }

    }

    def uploadScheduleService(file, id) {
        def scheduleFile = file
        def scheduleName = file.originalFilename
        def event = TekEvent.get(id)

        if(!scheduleFile.isEmpty()) {
            def test = event.schedule
            if((test) && (scheduleFile)) { def oldSchedule = new File(test).delete() }

            event.schedule = "files/${event.name}/${scheduleName}

            def scheduleTransfer = "web-app/files/${event.name}/${scheduleName}"

            def location = new File(scheduleTransfer)
            
            if(!location.exists()) {
                location.mkdirs()
            }

            scheduleFile?.transferTo(location)
        }
        
    }
    

}
