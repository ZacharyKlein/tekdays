<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="event" />
        <meta name="headerTemplate" content="eventPublic" />
        <gui:resources components="['dialog']"/>
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
            <div id="eventBlog">
                <h1>Latest News</h1>
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

        </div>

        <div id="eventSecondaryContent">
            <div id="eventDescription">
                <h2>${tekEventInstance.name}</h2>
                <h4>
                    <g:formatDate format="MMMM dd, yyyy" date="${tekEventInstance.startDate}"/> -
                    <g:formatDate format="MMMM dd, yyyy" date="${tekEventInstance.endDate}"/>
                </h4>

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
                </p>

                <p><a href="${tekEventInstance.venueMapLink}">${tekEventInstance.venue}, ${tekEventInstance.city}</a></p>
                <g:blurb name="custom_${tekEventInstance?.id}" />
            </div>

            <div id="eventDownloadList">
            <h4>Downloads</h4>
            <ul>
                <li>Schedule-Rev-03</li>
                <li>Advertising Brochure</li>
                <li>Speaker/Session List</li>
            </ul>
            </div>
            <div id="eventSponsorList">
                <h4>${tekEventInstance.name} is <a href="#">Sponsored</a> By:</h4>
                <br/>
                <ul>
                    <g:each var="s" in="${tekEventInstance.sponsorships}">
                        <li><g:link controller="sponsorship" action="show" id="${s.id}">
                        ${s.sponsor?.encodeAsHTML()}
                    </g:link></li>
                    </g:each>
                    <li style="height:120px; line-height:100px;"><img src="${resource(dir:'images',file:'google.gif')}" /></li>
                    <li style="height:120px; line-height:100px;"><img src="${resource(dir:'images',file:'springsource.png')}" /></li>
                    <li style="height:120px; line-height:100px;"><img src="${resource(dir:'images',file:'ubuntu_logo.jpg')}" /></li>
                    <li style="height:120px; line-height:100px;"><img src="${resource(dir:'images',file:'caseydel.png')}" /></li>
                </ul>
            </div>
        </div>

        <div>
            <g:form>
                <input type="hidden" name="name" value="${tekEventInstance?.name?.toLowerCase().encodeAsHyphen()}" />


                <td:ifIsAssociated id="${tekEventInstance?.id}">
                    <g:actionSubmit class="edit" value="Edit Event Details" action="edit" />
                    <g:actionSubmit action="delete" onclick="return confirm('Are you sure?');" value="Delete" />
                </td:ifIsAssociated>

            </g:form><br />
        </div>

    </body>

</html>

