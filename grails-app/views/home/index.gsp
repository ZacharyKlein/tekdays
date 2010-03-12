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

            <div id="userHomeContent">
              <div style="background:none repeat scroll 0 0 #F8F8F8; border:1px solid #CCCCCC; padding:10px; width:618px; margin-bottom:20px">
							  <td:showAvatar username="${user?.username}" height="75" width="65" />
	              <div style="float:right; padding-right:80px;">
		              <h2>Hi, <td:displayUserName id="${user?.id}" />...</h2>
		              <p></p>
		              <br />
		              <g:if test="${sponsor}">
		                  <div class="grayBox"><strong>YOU ARE A REPRESENTATIVE FOR <link:showSponsor slug="${sponsor.slug}">${sponsor?.name.toUpperCase()}</link:showSponsor></strong></div>
		              </g:if>
	              </div>
						  </div>
						 
	            <div id="associatedEvents">

		            <div>
	                  <img src="${resource(dir:'images', file:'help.png')}" style="float:right" />
	                  <h3>Associated Events</h3>
	                      <p>Here you'll find all the events you are currently associated with - events you are <a href="blank">organizing</a>, assisting as a <a href="blank">vounteer</a>, or <a href="blank">sponsoring</a>. &nbsp; &nbsp; <a href="blank">Hide</a></p>
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
							<div style="padding:10px; background:white; border: 1px solid #ccc; margin-bottom:25px;">
								<img src="${resource(dir:'images', file:'help-small.png')}" style="float:right" />
								<h2>Updates</h2>
								<p>This is where we show items in need of your attention. Sponsorships and volunteers waiting for approval will be listed below so you can keep in the game.&nbsp; &nbsp; &nbsp; &nbsp; <a href="blank">Hide</a></p>
							</div>

		          <h2>Sponsorships</h2>
		          <div style="padding:10px; background:white; border: 1px solid #ccc; margin-bottom:25px;">
			          <g:if test="${pendingSponsorRequests}">
			            <g:each in="${pendingSponsorRequests}" var="p">
				            <div>
				            <h3>Pending Requests (${pendingSponsorRequests?.size()})</h3>
				            <p>Awaiting reply from <link:showSponsor slug="${p?.sponsor.slug}">${p?.sponsor.name}</link:showSponsor> on request to sponsor <link:eventHome slug="${p?.event.slug}">${p?.event.name}</link:eventHome></p>
				            </div><br />
			            </g:each>
		            </g:if>
		            <g:else>
		              <div>
						<h3>Pending Requests (0)</h3>
					  </div><br />
		            </g:else>

								<g:if test="${pendingSponsorOffers}">
			            <g:each in="${pendingSponsorOffers}" var="p">
				            <div>
				            <h3>Pending Offers (${pendingSponsorOffers?.size()})</h3>
				            <p><link:sponsorApprove id="${p?.id}">Offer from ${p?.sponsor.name} to sponsor ${p?.event.name}</link:sponsorApprove></p>
				            </div><br />
			            </g:each>
		            </g:if>
		            <g:else>
		              <div>
			    		<h3>Pending Offers (0)</h3>
			    	  </div><br />
		            </g:else>
							</div>

							<h2>Volunteers (${pendingVolunteers?.size()})</h2>
							<div style="padding:10px; background:white; border: 1px solid #ccc;">
							<g:if test="${pendingVolunteers?.size()}">
		            <g:each in="${pendingVolunteers}" var="p">
			            <div>
			            <h3>Pending Volunteers (${pendingVolunteers.size()})</h3>
			            <g:if test="${user.id == p?.user.id}">
			              <p><b><link:profile username="${user.username}">you</b></link:profile> have volunteered for <>${p?.event.name}</p>
			            </g:if>
			            <g:else>
			              <p><b><link:profile username="${p?.user.username}">${p?.user}</link:profile></b> has volunteered for ${p?.event.name}</p>
			            </g:else>
			            </div><br />
		            </g:each>
              </g:if>
							<g:else>
							  <div>
								<h3>Pending Volunteers (0)</h3>
							  </div><br />
					        </g:else>
	            </div>
	            <br />
            </div>
  </body>
</html>

