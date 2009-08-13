class UrlMappings {
    static mappings = {
      "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
	  name eventShow: "/events/$nickname"{
	      controller = "tekEvent"
	      action = "show"  	
	  }         
          "/new-event"{
              controller = "tekEvent"
              action = "create"
          }
          "/register"{
              controller = "tekUser"
              action = "create"
          }
          "/login"{
              controller = "tekUser"
              action = "login"
          }
          "/users/$username"{
              controller = "tekUser"
              action = "show"
          }
          "/"(view:"index")
}
}
