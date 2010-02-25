<html>
    <head>
        <title>TekDays &rarr; Home</title>
	    <meta name="layout" content="main" />

    </head>
    <body>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
        <br/>
              <h1>Hi, <g:loggedInUserInfo field="username" />...</h1>
              <br />
              <g:if test="${sponsor}">
                  <div class="grayBox"><strong>YOU ARE A REPRESENTATIVE FOR <link:showSponsor slug="${sponsor.slug}">${sponsor?.name.toUpperCase()}</link:showSponsor></strong></div>
             </g:if>

             <div id="homeAssociated">
                 <g:each in="${organizerEvents}" var="event" status="i">
                 
                     <div class="grayBox">
                     <h3>${event?.name}</h3> in ${event?.city} ${event?.state ? event?.state : ""}, ${event?.country ? event?.country : ""} <br />
                     <b><em><g:formatDate format="MM/DD/YY" date="${event?.startDate}" /> ${event?.endDate ? " - " + g.formatDate(format:"MM/DD/YY", date:event.date) : ""}</em></b>
                     <img src="${resource(dir:'images', file:'org.png')}" style="float:left;" />
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
                     <h3>${event?.name}</h3> in ${event?.city} ${event?.state ? event?.state : ""}, ${event?.country ? event?.country : ""} <br />
                     <b><em><g:formatDate format="MM/DD/YY" date="${event?.startDate}" /> ${event?.endDate ? " - " + g.formatDate(format:"MM/DD/YY", date:event.date) : ""}</em></b>
                     <img src="${resource(dir:'images', file:'org.png')}" style="float:left;" />
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
                     <h3>${event?.name}</h3> in ${event?.city} ${event?.state ? event?.state : ""}, ${event?.country ? event?.country : ""} <br />
                     <b><em><g:formatDate format="MM/DD/YY" date="${event?.startDate}" /> ${event?.endDate ? " - " + g.formatDate(format:"MM/DD/YY", date:event.date) : ""}</em></b>
                     <img src="${resource(dir:'images', file:'org.png')}" style="float:left;" />
                     <g:if test="${event?.currentUserTasks()}">
                         <p>${event?.currentUserTasks().size()} open tasks assigned to you</p>
                     </g:if>
                     <g:if test="${event?.findSponsors()}">
                         <p>${event.findSponsors().size()} sponsors</p>
                     </g:if>
                     <td:volunteersHomeAssociated id="${event?.id}" />
                 </g:each>
            </div>
            <br />
  </body>
</html>

