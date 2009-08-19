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
          "/signup"{
              controller = "tekUser"
              action = "create"
          }
          name registerForEvent: "/register/for/$nickname"{
              controller = "registration"
              action = "create"
          }
          "/you-registered/thanks"{
              controller = "registration"
              action = "thanks"
          }
          "/login"{
              controller = "tekUser"
              action = "login"
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
          "/"(view:"index")
}
}
