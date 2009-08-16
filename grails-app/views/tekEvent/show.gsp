<html>
<!-- START:head -->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
<!-- START_HIGHLIGHT -->
    <gui:resources components="['dialog']"/>
<!-- END_HIGHLIGHT -->
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
        <g:link class="list" action="list">TekEvent List</g:link>
      </span>
      <span class="menuButton">
        <g:link class="create" action="create">New TekEvent</g:link>
      </span>
      <span class="menuButton">
        <g:link class="list" controller="dashboard" action="dashboard" 
                id="${tekEventInstance.id}">Event Dashboard</g:link>
      </span>
      <span class="menuButton">
        <g:link controller="registration" action="create" id="${tekEventInstance.id}">Register for this event</g:link>
      </span>
<!-- START_HIGHLIGHT -->
      <g:volunteerButton eventId="${tekEventInstance.id}" />
<!-- END_HIGHTLIGHT-->
    </div>
<!-- END:volunteerButton -->

<!-- START:gui -->
    <gui:dialog
          title="${'Volunteer for ' + tekEventInstance.name}"
          form="true"
          controller="tekEvent"
          action="volunteer"
          update="volunteerSpan"
          triggers="[show:[id:'volunteerButton', on:'click']]">
          <input type="hidden" name="id" value="${tekEventInstance.id}" />
        Welcome to the team!  
        You're help will make a huge difference.
    </gui:dialog>
<!-- END:gui -->

<!-- START:body -->
    <div class="body">
      <h1>${tekEventInstance.name}</h1>
      <!-- END:name -->
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <div class="tekEventShow">
          <h4>Date:<g:formatDate format="MMMM dd, yyyy" date="${tekEventInstance.startDate}"/> - 
		   <g:formatDate format="MMMM dd, yyyy" date="${tekEventInstance.endDate}"/>
	  </h4>
	  <p>${tekEventInstance.description}</p>
	  <p>${tekEventInstance.venue}, ${tekEventInstance.city}</p>
             
	  <div id="eventSponsorList">
           <h4>Sponsored By:</h4>
	   <br/>
                <ul>
                  <g:each var="s" in="${tekEventInstance.sponsorships}">
                    <li><g:link controller="sponsorship" action="show" id="${s.id}">
                      ${s.sponsor?.encodeAsHTML()}
                    </g:link></li>
                  </g:each>
                </ul>
	   </div>
<!-- START_HIGHLIGHT -->
        <div style="width:100%; border-stype:solid;border-width:1px">
          <g:blurb name="custom_${tekEventInstance?.id}" />
        </div>
<!-- END_HIGHLIGHT -->
      </div>
      <div class="buttons">
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
