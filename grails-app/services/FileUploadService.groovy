class FileUploadService {

    boolean transactional = true

    def uploadEventBanner(file, id) {

        def bannerFile = file
        def bannerName = file.originalFilename
        def event = TekEvent.get(id)

        println "the banner is $bannerName"

   
        if(!bannerFile.isEmpty()){
            def thisIsATest = event.bannerLocation

            if((thisIsATest) && (bannerFile)){
                def oldBanner = new File(thisIsATest).delete()
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
            def thisIsATest = sponsor.bannerLocation

            if((thisIsATest) && (bannerFile)){
                def oldBanner = new File(thisIsATest).delete()
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
    

}
