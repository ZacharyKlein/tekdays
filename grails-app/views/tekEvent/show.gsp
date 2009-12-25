<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <meta name="headerTemplate" content="eventPublic" />
    <gui:resources components="['dialog']"/>
    <title>TekDays &rarr; ${tekEventInstance.name}</title>
  </head>
  <body>
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

    <div class="body">
      <h1>${tekEventInstance.name}</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
          <h4><g:formatDate format="MMMM dd, yyyy" date="${tekEventInstance.startDate}"/> -
		   <g:formatDate format="MMMM dd, yyyy" date="${tekEventInstance.endDate}"/>
	       </h4>
	      <p>${tekEventInstance.description}</p>
	      <p><a href="${tekEventInstance.venueMapLink}">${tekEventInstance.venue}, ${tekEventInstance.city}</a></p>
          <g:blurb name="custom_${tekEventInstance?.id}" />
      <p>&nbsp;</p>
      </div>

      <div id="posts" style="clear:both;">
        <g:each in="${posts}" var="post">
         <div id="grayBox">
            <h2>${post?.title}</h2>
            <p><g:formatDate format="MMMM dd, yyyy" date="${post?.dateCreated}" /></p>
            ${post?.content} <br />
            <td:ifIsAssociated id="${tekEventInstance.id}">
              <g:link controller="post" action="edit" id ="${post?.id}">Edit</g:link>
            </td:ifIsAssociated>
            </div>
        </g:each>
      </div><br />

      <div id="grayBox">
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

      <div style="clear:both">
        <g:form>
            <input type="hidden" name="name" value="${tekEventInstance?.name?.toLowerCase().encodeAsHyphen()}" />

            <g:actionSubmit class="edit" value="Edit Event Details" action="edit" />


            <g:actionSubmit class="delete"
               onclick="return confirm('Are you sure?');" value="Delete" />

        </g:form><br />
      </div>
    </div>
  </body>
<!-- END:body -->
</html>

