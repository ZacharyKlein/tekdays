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
	  name eventShowWId: "/event/$id"{
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
          "/sponsors/$id"{
              controller = "sponsor"
              action = "show"
          }
          "/events/$id/dashboard"{
              controller = "dashboard"
              action = "dashboard"
          }
          "/task/new/$id"{
              controller = "task"
              action = "create"
          }
          "/tasks/$id"{
              controller = "task"
              action = "list"
          }
          "/event/$eventid/tasks/$id"{
              controller = "task"
              action = "show"
          }
          "/"(view:"index")
}
}
