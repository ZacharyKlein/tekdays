class UrlMappings {
    static mappings = {
      "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
	  name eventHome: "/events/$slug"{
	      controller = "tekEvent"
	      action = "show"
	  }
          name forum: "/events/$slug/forum/"{
              controller = "message"
              action = "forum"
          }
          name newTopic: "/events/$slug/forum/topic/new/"{
              controller = "message"
              action = "create"
          }
          name editEvent: "/events/$slug/edit"{
              controller = "tekEvent"
              action = "edit"
          }
          //That one thing you must remember...
          name search: "/search/$query"{
              controller = "tekEvent"
              action = "search"
          }
          name sponsorSearch: "/sponsors/search/$query"{
              controller = "sponsor"
              action = "search"
          }
          //or nothing that follows will seem wondrous.
          //Um. Why are you whispering?
          //It's for dramatic emphasis.
          //Oh.
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
              action = "search"
          }
          "/signup"{
              controller = "tekUser"
              action = "create"
          }
          name register: "/events/$slug/register"{
              controller = "registration"
              action = "create"
          }
          name registrations: "/events/$slug/registrations"{
              controller = "registration"
              action = "list"
          }
          "/login"{
              controller = "login"
              action = "auth"
          }
          name userEdit: "/users/$username/edit"{
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
          name showSponsor: "/sponsors/$slug"{
              controller = "sponsor"
              action = "show"
          }
          "/sponsor/new"{
              controller = "sponsor"
              action = "create"
          }
          name editSponsor: "/sponsors/$slug/edit"{
              controller = "sponsor"
              action = "edit"
          }
          name dashboard: "/events/$slug/dashboard"{
              controller = "dashboard"
              action = "dashboard"
          }
          "/forums/topic/$id"{
              controller = "message"
              action = "topic"
          }
          name eventForum: "/events/$slug/forum/"{
              controller = "message"
              action = "forum"
          }
          "/"{
              controller = "home"
              action = "index"
          }
          name newTask: "/events/$slug/task/new"{
              controller = "task"
              action = "create"
          }
          name allTasks: "/events/$slug/tasks"{
              controller = "task"
              action = "list"
          }
          name newSponsorship: "/events/$slug/sponsorship/new"{
              controller = "sponsorship"
              action = "create"
          }
          name sponsorshipList: "/events/$slug/sponsors"{
              controller = "sponsorship"
              action = "list"
          }
          "/sponsorships"{
              controller = "sponsorship"
              action = "all"
          }
          name newAttachment: "/events/$slug/files/new"{
              controller = "attachment"
              action = "create"
          }
          name eventAttachments: "/events/$slug/files/"{
              controller = "attachment"
              action = "list"
          }
          name newPost: "/events/$slug/post/new"{
              controller = "post"
              action = "create"
          }

          name volunteerList: "/events/$slug/volunteers"{
              controller = "volunteer"
              action = "list"
          }
          name volunteerApprove: "/volunteers/approve/$id"{
              controller = "volunteer"
              action = "edit"
          }
          name sponsorApprove: "/sponsors/approve/$id"{
              controller="sponsorship"
              action="edit"
          }
          name leaveFeedback: "/feedback"(view:"feedback")
          "/blog"{
              controller="tekPost"
              action="list"
          }
          "/events/$slug/blog" {
              controller = "post"
              action = "list"
          }
          "/events/$slug/logo" {
              controller = "tekEvent"
              action = "editLogo"
          }
          "/events/$slug/date" {
              controller = "tekEvent"
              action = "editDate"
          }
          "/hide/$id"{
              controller = "tekUser"
              action = "hideHelp"
					}

          "404"(controller:"errors", action: "notfound")
          "500"(controller:"errors", action: "internalservererror")

}
}

