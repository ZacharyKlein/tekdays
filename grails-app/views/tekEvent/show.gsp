<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <gui:resources components="['dialog']"/>
    <title>TekDays &rarr; ${tekEventInstance.name}</title>
  </head>
<!-- END:head -->
  <body>
<!-- START:volunteerButton -->
    <div class="nav">
      <span class="menuButton">
        <a class="home" href="${resource(dir:'')}">Home</a>
      </span>
      <span class="menuButton">
        <g:link class="list" action="list">Event List</g:link>
      </span>
      <span class="menuButton">
        <link:dashboard name="${tekEventInstance.name.encodeAsHyphen()}">Event Dashboard</link:dashboard>
      </span>
      <span class="menuButton">
        <g:link controller="registration" action="create" id="${tekEventInstance.id}">Register for this event</g:link>
      </span>
      <td:volunteerButton eventId="${tekEventInstance.id}" />
    </div>
    <g:isLoggedIn>
    <gui:dialog
          title="${'Volunteer for ' + tekEventInstance.name}"
          form="true"
          controller="tekEvent"
          action="volunteer"
          update="volunteerSpan"
          triggers="[show:[id:'volunteerButton', on:'click']]">
          <input type="hidden" name="id" value="${tekEventInstance.id}" />
        Welcome to the team!
        Your help will make a huge difference.
    </gui:dialog>
    </g:isLoggedIn>

<!-- START:body -->
    <div class="body">
      <h1>${tekEventInstance.name}</h1>
      <!-- END:name -->
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <div class="tekEventShow" style="width:1000px;">
          <h4><g:formatDate format="MMMM dd, yyyy" date="${tekEventInstance.startDate}"/> -
		   <g:formatDate format="MMMM dd, yyyy" date="${tekEventInstance.endDate}"/>
	  </h4>

	  <div style="width:500px; float:left">
	      <p>${tekEventInstance.description}</p>
	      <p><a href="${tekEventInstance.venueMapLink}">${tekEventInstance.venue}, ${tekEventInstance.city}</a></p>
          </div>
	  <div id="eventSponsorList" style="width:475px; float:right">
           <h4>${tekEventInstance.name} is <a href="#">Sponsored</a> By:</h4>
	   <br/>
                <ul style="width:450px; margin: 0 auto">
                  <g:each var="s" in="${tekEventInstance.sponsorships}">
                    <li><g:link controller="sponsorship" action="show" id="${s.id}">
                      ${s.sponsor?.encodeAsHTML()}
                    </g:link></li>
                  </g:each>
		    <li style="height:120px; line-height:100px;"><img src="${resource(dir:'images',file:'google.gif')}" /></li>
		    <li style="height:120px; line-height:100px;"><img src="${resource(dir:'images',file:'springsource.png')}" /></li>
		    <li style="height:120px; line-height:100px;"><img src="${resource(dir:'images',file:'ubuntu_logo.jpg')}" /></li>
                    <li style="height:120px; line-height:100px;"><img src="${resource(dir:'images',file:'caseydel.gif')}" /></li>
                </ul>
	   </div>
<!-- START_HIGHLIGHT -->
        <div style="width:100%; border-stype:solid;border-width:1px">
          <g:blurb name="custom_${tekEventInstance?.id}" />
        </div>
<!-- END_HIGHLIGHT -->
      </div>
      <div style="clear:both">
        <g:form>
          <input type="hidden" name="id" value="${tekEventInstance?.id}" />

            <g:actionSubmit class="edit" value="Edit" />


            <g:actionSubmit class="delete"
               onclick="return confirm('Are you sure?');" value="Delete" />

        </g:form>
      </div>
    </div>
  </body>
<!-- END:body -->
</html>

