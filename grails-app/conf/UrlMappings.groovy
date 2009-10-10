class UrlMappings {
    static mappings = {
      "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
	  name eventHome: "/events/$name"{
	      controller = "tekEvent"
	      action = "show"  	
	  }
          name forum: "/events/$name/forum/"{
              controller = "message"
              action = "forum"
          }
          name newTopic: "/events/$name/forum/topic/new/"{
              controller = "message"
              action = "create"
          }
          "/start"{
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
          name profile: "/users/$username"{
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
          name dashboard: "/events/$name/dashboard"{
              controller = "dashboard"
              action = "dashboard"
          }
          "/forums/topic/$id"{
              controller = "message"
              action = "topic"
          }
          name eventForums: "/events/$id/forum/"{
              controller = "message"
              action = "forum"
          }
          "/"{
              controller = "home"
              action = "index"
          }
          name newTask: "/events/$id/task/new"{
              controller = "task"
              action = "create"
          }

}
}
