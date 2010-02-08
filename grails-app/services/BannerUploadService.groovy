class BannerUploadService {

    boolean transactional = true

    def uploadEventBanner(file, id) {

        def bannerFile = file
        def event = TekEvent.get(id)

        println "the banner is $banner"

        if(event.banner){
            def oldBanner = new File(event.banner).delete()
        }

        event.bannerLocation = "web-app/images/banners/${event.name}/${bannerFile.originalFilename}"
        event.banner = "${bannerFile.originalFilename}"

        def location = new File(event.bannerLocation)
        if(!location.exists()){
           location.mkdirs()
        }
        bannerFile?.transferTo(location)

    }
    
      
}
