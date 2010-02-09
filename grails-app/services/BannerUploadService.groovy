// class BannerUploadService {
// 
//     boolean transactional = true
// 
//     def uploadEventBanner(file, id) {
// 
//         def bannerFile = file
//         def bannerName = file.originalFilename
//         def event = TekEvent.get(id)
// 
//         println "the banner is $banner"
// 
//         if(event.banner){
//             def oldBanner = new File(event.banner).delete()
//         }
// 
//         event.bannerLocation = "web-app/images/banners/${event.name}/${bannerFile.originalFilename}"
//         event.banner = "${bannerFile.originalFilename}"
// 
//         def location = new File(event.bannerLocation)
//         if(!location.exists()){
//            location.mkdirs()
//         }
//         bannerFile?.transferTo(location)
// 
//     }
//     
//     
//    
//         if(!loFile.isEmpty()){
//             def thisIsATest = sponsorInstance.bannerLocation
// 
//             if((thisIsATest) && (params.banner)){
//                 def oldAvatar = new File(thisIsATest).delete()
//             }
// 
//             sponsorInstance.bannerLocation = "images/banners/${sponsorInstance.name}/"
//             sponsorInstance.banner = fileName
// 
//             def bannerTransfer = "${sponsorInstance.bannerLocation}${sponsorInstance.banner}"
// 
//             def location = new File(bannerTransfer)
// 
//             if(!location.exists()){
//                location.mkdirs()
//             }
// 
//             loFile?.transferTo(location)
//         }
//     
//     
//     
//       
// }
