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
          name editEvent: "/events/$name/edit"{
              controller = "tekEvent"
              action = "edit"
          }
          "/search/$query"{
              controller = "tekEvent"
              action = "search"
          }
          "/start"{
              controller = "tekEvent"
              action = "create"
          }
          "/new"{
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
          name registrations: "/events/$name/registrations"{
              controller = "registration"
              action = "list"
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
          name allSponsors: "/sponsors"{
              controller = "sponsor"
              action = "list"
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
          name eventForum: "/events/$name/forum/"{
              controller = "message"
              action = "forum"
          }
          "/"{
              controller = "home"
              action = "index"
          }
          name newTask: "/events/$name/task/new"{
              controller = "task"
              action = "create"
          }
          name allTasks: "/events/$name/tasks"{
              controller = "task"
              action = "list"
          }
          name newSponsorship: "/events/$name/sponsorship/new"{
              controller = "sponsorship"
              action = "create"
          }
          name sponsorshipList: "/events/$name/sponsors"{
              controller = "sponsorship"
              action = "list"
          }
          "/sponsorships"{
              controller = "sponsorship"
              action = "all"
          }
          name newAttachment: "/events/$name/files/new"{
              controller = "attachment"
              action = "create"
          }

          "404"(controller:"errors", action: "notfound")
          "500"(controller:"errors", action: "internalservererror")

}
}

