<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="event" />
        <meta name="headerTemplate" content="eventPublic" />
        <gui:resources components="['dialog', 'toolTip']"/>
        <g:javascript library="scriptaculous" />
        <tm:resources />
        <title>TekDays &rarr; ${tekEventInstance.name}</title>
    </head>

    <body>
      <g:if test="${flash.message}">
        <div id="transparentMsg">
          ${flash.message}
        </div>
      </g:if>
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

        <td:ifIsSponsor>
        <gui:dialog
              title="${'Offer to Sponsor ' + tekEventInstance.name}"
              form="true"
              controller="sponsorship"
              action="offerSponsorship"
              update="sponsorSpan"
              form="true"
              triggers="[show:[id:'sponsorButton', on:'click']]">
              <input type="hidden" name="id" value="${tekEventInstance.id}" />
              <input type="hidden" name="contributionType" value="Other" />
              <p>oh hai! u want 2 spnsr dis event? wif cheezburgrs? srsly?</p>
              <textarea id="sponsorMessage" name="sponsorMessage" style="width: 600px; height: 120px;">Type your message to the event organizer here.</textarea>
        </gui:dialog>
        </td:ifIsSponsor>
        </g:isLoggedIn>

        <div id="eventContent">

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
                    <link:newPost slug="${tekEventInstance?.slug}">Add Blog Post</link:newPost>
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
                <%--<td:eventFlyerDownload schedule="${tekEventInstance.getFileName(tekEventInstance?.schedule)}" id="${tekEventInstance.id}">Schedule</td:eventScheduleDownload >--%>

                <br />
                <g:form>
                <input type="hidden" name="slug" value="${tekEventInstance?.slug}" />
                <td:ifIsAssociated id="${tekEventInstance?.id}">
                    <span id="dashLink"><link:dashboard slug="${tekEventInstance?.slug}">Dashboard</link:dashboard></span>
                </td:ifIsAssociated>
            </g:form>
            </div>


            <td:sponsorInfo eventId="${tekEventInstance.id}" />
            <td:volunteerInfo eventId="${tekEventInstance.id}" />

            <td:downloadList id="${tekEventInstance?.id}" />

            <br />
            <g:if test="${tekEventInstance.sponsorships}">
            <div id="eventSponsorList">
                <h4>${tekEventInstance.name} is <a href="#">Sponsored</a> By:</h4>
                <br/>
                <ul>
                    <g:each var="s" in="${tekEventInstance.sponsorships}">
                        <li><link:showSponsor slug="${s?.sponsor.slug}">
                        <img src="${createLink(controller:'sponsor', action:'displayLogo', params:'[slug:s.sponsor.slug]')}" />
                    </link:showSponsor></li>
                    </g:each>
                </ul>
            </div>
        </g:if>

        <div>
          <h4>Tags</h4>
          <p>
            <g:set var="tagCount" value="${tekEventInstance.tags.size() - 1}" />
            <g:each var="t" status="i" in="${tekEventInstance.tags}">
              <td:linkToSearchByTag id="${t?.id}" />
              <g:if test="${!(i == tagCount)}">,</g:if>
            </g:each>
          </p>
        </div>

        </div>

        <div>
        </div>

    </body>

</html>

