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
              <h2>Hi, <g:loggedInUserInfo field="username" />...</h2>
              <br />
              <g:if test="${sponsor}">
                  <div class="grayBox"><strong>YOU ARE A REPRESENTATIVE FOR <link:showSponsor slug="${sponsor.slug}">${sponsor?.name.toUpperCase()}</link:showSponsor></strong></div>
             </g:if>

            <div id="userHomeContent">
	            <div id="associatedEvents">

		            <div>
	                  <img src="${resource(dir:'images', file:'help.png')}" style="float:right" />
	                  <h3>Associated Events</h3>
	                      <p>Here you'll find all the events you are currently associated with - events you are <a href="blank">organizing</a>, assisting as a <a href="blank">vounteer</a>, or <a href="blank">sponsoring</a>. &nbsp; &nbsp; <a href="blank">Hide</a></p
	               </div>
	                  
	              <g:each in="${organizerEvents}" var="event" status="i">
	                <div>
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
	                  <div class="associatedEvent">
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
	                  </div>
	              </g:each>

	              <g:each in="${sponsorEvents}" var="event" status="i">
	                <div>
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

              </div>
            </div>
            
            <div id="userHomeSecondaryContent">
		          <h2>Sponsorships</h2>
		          <div style="padding:10px; background:white; border: 1px solid #ccc; margin-bottom:25px;">
			          <g:if test="${pendingSponsorRequests}">
			            <g:each in="${pendingSponsorRequests}" var="p">
				            <div>
				            <h3>Pending Requests(${pendingSponsorRequests?.size()})</h3>
				            <p>Awaiting reply from ${p?.sponsor.name} on request to sponsor ${p?.event.name}</p>
				            </div>
			            </g:each>
		            </g:if>
		            <g:else>
									<h3>Pending Requests(0)</h3>
		            </g:else>

								<g:if test="${pendingSponsorOffers}">
			            <g:each in="${pendingSponsorOffers}" var="p">
				            <div>
				            <h3>Pending Offers(${pendingSponsorOffers?.size()})</h3>
				            <p>Offer from ${p?.sponsor.name} to sponsor ${p?.event.name}</p>
				            </div>
			            </g:each>
		            </g:if>
		            <g:else>
									<h3>Pending Offers(0)</h3>
		            </g:else>
							</div>

							<h2>Volunteers(${pendingVolunteers?.size()})</h2>
							<div style="padding:10px; background:white; border: 1px solid #ccc;">
							<g:if test="${pendingVolunteers?.size()}">
		            <g:each in="${pendingVolunteers}" var="p">
			            <div>
			            <h3>Pending Volunteers(${pendingVolunteers.size()})</h3>
			            <p><b>${p?.user}</b> has volunteered for ${p?.event.name}</p>
			            </div>
		            </g:each>
              </g:if>
							<g:else>
								<h3>Pending Volunteers(0)</h3>
					    </g:else>
	            </div>
	            <br />
            </div>
  </body>
</html>

