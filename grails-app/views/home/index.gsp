<html>
    <head>
        <title>TekDays &rarr; Home</title>
	    <meta name="layout" content="main" />
        <tm:resources />
    </head>
    <body>
            <g:if test="${flash.message}">
              <div id="transparentMsg">
                ${flash.message}
              </div>
            </g:if>
        <br/>
              <h1>Hi, <g:loggedInUserInfo field="username" />...</h1>
              <br />
              <g:if test="${sponsor}">
                  <div class="grayBox"><strong>YOU ARE A REPRESENTATIVE FOR <link:showSponsor slug="${sponsor.slug}">${sponsor?.name.toUpperCase()}</link:showSponsor></strong></div>
             </g:if>

             <div id="homeAssociated">
                 <g:each in="${organizerEvents}" var="event" status="i">

                     <div class="grayBox" style="height:80px;">
                     <img src="${resource(dir:'images', file:'org.png')}" align="right" />
                     <h3><link:eventHome slug="${event?.slug}">${event?.name}</link:eventHome></h3> in ${event?.city} ${event?.state ? event?.state : ""}, ${event?.country ? event?.country : ""} <br />
                     <b><em><g:formatDate format="MM/DD/YY" date="${event?.startDate}" /> ${event?.endDate ? " - " + g.formatDate(format:"MM/DD/YY", date:event.date) : ""}</em></b>
                     <g:if test="${event?.currentUserTasks()}">
                         <p>${event?.currentUserTasks().size()} open tasks assigned to you</p>
                     </g:if>
                     <g:if test="${event?.findSponsors()}">
                         <p>${event.findSponsors().size()} sponsors</p>
                     </g:if>
                     <td:volunteersHomeAssociated id="${event?.id}" />
                     </div>
                 </g:each>
                 <g:each in="${volunteerEvents}" var="event" status="i">
                     <div class="grayBox">
                     <img src="${resource(dir:'images', file:'vol.png')}" align="right" />
                     <h3><link:eventHome slug="${event?.slug}">${event?.name}</link:eventHome></h3> in ${event?.city} ${event?.state ? event?.state : ""}, ${event?.country ? event?.country : ""} <br />
                     <b><em><g:formatDate format="MM/DD/YY" date="${event?.startDate}" /> ${event?.endDate ? " - " + g.formatDate(format:"MM/DD/YY", date:event.date) : ""}</em></b>
                     <g:if test="${event?.currentUserTasks()}">
                         <p>${event?.currentUserTasks().size()} open tasks assigned to you</p>
                     </g:if>
                     <g:if test="${event?.findSponsors()}">
                         <p>${event.findSponsors().size()} sponsors</p>
                     </g:if>
                     <td:volunteersHomeAssociated id="${event?.id}" />
                 </g:each>
                 <g:each in="${sponsorEvents}" var="event" status="i">
                     <div class="grayBox">
                     <img src="${resource(dir:'images', file:'org.png')}" align="right" />
                     <h3><link:eventHome slug="${event?.slug}">${event?.name}</link:eventHome></h3> in ${event?.city} ${event?.state ? event?.state : ""}, ${event?.country ? event?.country : ""} <br />
                     <b><em><g:formatDate format="MM/DD/YY" date="${event?.startDate}" /> ${event?.endDate ? " - " + g.formatDate(format:"MM/DD/YY", date:event.date) : ""}</em></b>
                     <g:if test="${event?.currentUserTasks()}">
                         <p>${event?.currentUserTasks().size()} open tasks assigned to you</p>
                     </g:if>
                     <g:if test="${event?.findSponsors()}">
                         <p>${event.findSponsors().size()} sponsors</p>
                     </g:if>
                     <td:volunteersHomeAssociated id="${event?.id}" />
                 </g:each>
                 <g:each in="${pendingVolunteers}" var="p">
                   ${p}
                 </g:each>
                 <g:each in="${pendingSponsorRequests}" var="p">
                   ${p}
                 </g:each>
                 <g:each in="${pendingSponsorOffers}" var="p">
                   ${p}
                 </g:each>
            </div>
            <div id="pendingRelationships">
            <g:each in="${pendingSponsorRequests}" var="p">
            <div class="grayBox">
            <p>Awaiting reply from ${p?.sponsor.name} on request to sponsor ${p?.event.name}</p>
            </div>
            </g:each>
            <g:each in="${pendingSponsorOffers}" var="p">
            <div class="grayBox">
            <p>Offer from ${p?.sponsor.name} to sponsor ${p?.event.name}</p>
            </div>
            </g:each>
            </div>
            <g:each in="${pendingVolunteers}" var="p">
            <div class="grayBox">
            <p>${p?.user} has volunteered for ${p?.event.name}</p>
            </div>
            </g:each>
            <br />
  </body>
</html>

