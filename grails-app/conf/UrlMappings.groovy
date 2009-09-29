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
	  name eventShowWId: "/events/$id"{
	      controller = "tekEvent"
	      action = "show"  	
	  }       
          "/new-event"{
              controller = "tekEvent"
              action = "create"
          }
          "/events"{
              controller = "tekEvent"
              action = "list"
          }
          "/signup"{
              controller = "tekUser"
              action = "create"
          }
          "/register/$id"{
              controller = "registration"
              action = "create"
          }
          "/login"{
              controller = "login"
              action = "auth"
          }
          "/users/edit/$username"{
              controller = "tekUser"
              action = "edit"
          }
          "/users/$username"{
              controller = "tekUser"
              action = "show"
          }
          "/user/$id"{
              controller = "tekUser"
              action = "show"
          }
          "/users"{
              controller = "tekUser"
              action = "list"
          }
          "/login"{
              controller = "login"
              action = "auth"
          }
          "/sponsors/$id"{
              controller = "sponsor"
              action = "show"
          }
          "/events/$id/dashboard"{
              controller = "dashboard"
              action = "dashboard"
          }
          "/forums/topic/$id"{
              controller = "message"
              action = "topic"
          }
          name eventForums: "/events/$id/forums/"{
              controller = "message"
              action = "forum"
          }
          "/forums/topic/new/$id"{
              controller = "message"
              action = "create"
          }
          "/"{
              controller = "home"
              action = "index"
          }

}
}
