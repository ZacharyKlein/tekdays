<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="event" />
        <meta name="headerTemplate" content="eventPublic" />
        <gui:resources components="['dialog', 'toolTip']"/>
        <g:javascript library="scriptaculous" />
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

        <div id="eventContent">
        <g:if test="${flash.message}">
          <div class="message">
            ${flash.message} <br />
          </div>
        </g:if>

        <td:ifIsOrganizer id="${tekEventInstance.id}">
        <g:if test="${tekEventInstance?.nonApprovedVolunteers()}">
            <div class="message">
                <strong>${tekEventInstance?.nonApprovedVolunteers()?.size()} new  ${tekEventInstance?.nonApprovedVolunteers()?.size() > 1 ? 'volunteers' : 'volunteer'} for this event. </strong> &nbsp; <link:volunteerList slug="${tekEventInstance?.slug}">View all</link:volunteerList>  &raquo;
            </div>
        </g:if>
        </td:ifIsOrganizer>

        <h1>What is it?</h1>
        <p>
          <td:editInPlace id="eventDescription${tekEventInstance.id}"
                          url="[controller: 'tekEvent', action: 'editDescription', id:tekEventInstance.id]"
                          rows="4"
                          cols="15"
                          paramName="description"
                          eventId="${tekEventInstance.id}"
                          otherwise="${tekEventInstance.description}">
                              ${tekEventInstance.description}
         </td:editInPlace>
       </p><br />

       <g:if test="${tekEventInstance.startDate}">
       <h1>When is it?</h1>
       <p>
         <g:if test="${tekEventInstance.endDate}">
           ${tekEventInstance.name} will be held from <strong><g:formatDate format="MMMM dd, yyyy" date="${tekEventInstance.startDate}"/></strong> to <strong><g:formatDate format="MMMM dd, yyyy" date="${tekEventInstance.endDate}"/>.</strong>
         </g:if>
         <g:else>
           ${tekEventInstance.name} will start on <strong><g:formatDate format="MMMM dd, yyyy" date="${tekEventInstance.startDate}"/>.</strong>
         </g:else>
       </p>
       <br />
       </g:if>

       <g:if test="${posts}">
            <div id="eventBlog">
                <h1>Latest News</h1>
                <td:ifIsAssociated id="${tekEventInstance?.id}">
                  <p>
                    <link:newPost slug="${tekEventInstance?.slug}">New post</link:newPost>
                  </p>
                </td:ifIsAssociated>
                <g:each in="${posts}" var="post">
                    <div class="eventPost">
                        <h2>${post?.title}</h2>
                        ${post?.content} <br />
                        <p>Posted <g:formatDate format="MMMM dd, yyyy" date="${post?.dateCreated}" /></p>
                        <td:ifIsAssociated id="${tekEventInstance.id}">
                          <g:link controller="post" action="edit" id ="${post?.id}">Edit</g:link>
                        </td:ifIsAssociated>
                    </div>
                </g:each>
              </div>
        </g:if>

        </div>

        <div id="eventSecondaryContent">
            <div id="eventDescription">
                <h2>${tekEventInstance.name}</h2>
                <g:if test="${tekEventInstance.startDate}">
                <h4>
                    <g:formatDate format="MMMM dd, yyyy" date="${tekEventInstance.startDate}"/>
                </g:if>
                <g:if test="${tekEventInstance.endDate}">
                 - <g:formatDate format="MMMM dd, yyyy" date="${tekEventInstance.endDate}"/>
                </h4>
                </g:if>
                <g:else>
                </h4>
                </g:else>

                <p><a href="${tekEventInstance.venueMapLink}">
                <g:if test="${tekEventInstance.venue}">
                ${tekEventInstance.venue},
                </g:if>
                ${tekEventInstance.city}, ${tekEventInstance?.state}, ${tekEventInstance.country}</a></p>
                <g:blurb name="custom_${tekEventInstance?.id}" />

               <br />
               <g:form>
                <input type="hidden" name="slug" value="${tekEventInstance?.slug}" />
                <td:ifIsAssociated id="${tekEventInstance?.id}">
                    <link:editEvent slug="${tekEventInstance?.slug}"><button>Edit Event Details</button></link:editEvent>
                </td:ifIsAssociated>
                <td:ifIsOrganizer id="${tekEventInstance?.id}">
                    <g:actionSubmit action="delete" onclick="return confirm('Are you sure?');" value="Delete" />
                </td:ifIsOrganizer>
            </g:form>
            </div>

            <td:volunteerInfo eventId="${tekEventInstance.id}" />

            <td:downloadList id="${tekEventInstance?.id}" />

            <g:if test="${tekEventInstance.sponsorships}">
            <div id="eventSponsorList">
                <h4>${tekEventInstance.name} is <a href="#">Sponsored</a> By:</h4>
                <br/>
                <ul>
                    <g:each var="s" in="${tekEventInstance.sponsorships}">
                        <li><g:link controller="sponsorship" action="show" id="${s.id}">
                        <td:showLogo id="${s?.sponsor.id}" />
                    </g:link></li>
                    </g:each>
                    <li style="height:120px; line-height:100px;"><img src="${resource(dir:'images',file:'google.gif')}" /></li>
                    <li style="height:120px; line-height:100px;"><img src="${resource(dir:'images',file:'springsource.png')}" /></li>
                    <li style="height:120px; line-height:100px;"><img src="${resource(dir:'images',file:'ubuntu_logo.jpg')}" /></li>
                    <li style="height:120px; line-height:100px;"><img src="${resource(dir:'images',file:'caseydel.png')}" /></li>
                </ul>
            </div>
        </g:if>

        </div>

        <div>
        </div>

    </body>

</html>

