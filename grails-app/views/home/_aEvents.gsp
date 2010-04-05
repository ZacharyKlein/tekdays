	              <g:each in="${organizerEvents}" var="event" status="i">
	                <div class="associatedEvent">
	                  <link:eventHome slug="${event?.slug}"><img src="${createLink(action:'displayLogo', params:['slug':event.slug])}" style="float:left; margin:10px"/></link:eventHome>
                          <img src="${resource(dir:'images', file:'org.png')}" align="right" />
	                  <h3><link:eventHome slug="${event?.slug}">${event?.name}</link:eventHome></h3> ${message(code:'home.loggedin.associated.in')} ${event?.city} ${event?.state ? event?.state : ""}, ${event?.country ? event?.country : ""} <br />
	                  <b><em><g:formatDate format="MM/dd/yy" date="${event?.startDate}" /> ${event?.endDate ? " - " + g.formatDate(format:"MM/dd/yy", date:event.endDate) : ""}</em></b>
	                  <g:if test="${event?.currentUserTasks()}">
	                      <p>${event?.currentUserTasks()?.size()} open tasks assigned to you</p>
	                  </g:if>
	                  <g:if test="${event?.findSponsors()}">
	                      <p>${event.findSponsors()?.size()} sponsors</p>
	                  </g:if>
	                  <td:volunteersHomeAssociated id="${event?.id}" />
	                  </div>
	                </g:each>

	                <g:each in="${volunteerEvents}" var="event" status="i">
	                  <div class="associatedEvent">
                            <link:eventHome slug="${event?.slug}"><img src="${createLink(action:'displayLogo', params:['slug':event.slug])}" style="float:left; margin:10px"/></link:eventHome>
	                    <img src="${resource(dir:'images', file:'vol.png')}" align="right" />
	                    <h3><link:eventHome slug="${event?.slug}">${event?.name}</link:eventHome></h3> in ${event?.city} ${event?.state ? event?.state : ""}, ${event?.country ? event?.country : ""} <br />
	                    <b><em><g:formatDate format="MM/dd/yy" date="${event?.startDate}" /> ${event?.endDate ? " - " + g.formatDate(format:"MM/dd/yy", date:event.endDate) : ""}</em></b>
	                    <g:if test="${event?.currentUserTasks()}">
	                      <p>${event?.currentUserTasks()?.size()} open tasks assigned to you</p>
	                    </g:if>
	                    <g:if test="${event?.findSponsors()}">
	                      <p>${event.findSponsors()?.size()} sponsors</p>
	                    </g:if>
	                    <td:volunteersHomeAssociated id="${event?.id}" />
	                  </div>
	              </g:each>

	              <g:each in="${sponsoredEvents}" var="event" status="i">
	                <div class="associatedEvent">
                          <link:eventHome slug="${event?.slug}"><img src="${createLink(action:'displayLogo', params:['slug':event.slug])}" style="float:left; margin:10px"/></link:eventHome>
	                  <img src="${resource(dir:'images', file:'sponsor.png')}" align="right" />
	                  <h3><link:eventHome slug="${event?.slug}">${event?.name}</link:eventHome></h3> in ${event?.city} ${event?.state ? event?.state : ""}, ${event?.country ? event?.country : ""} <br />
	                  <b><em><g:formatDate format="MM/dd/yy" date="${event?.startDate}" /> ${event?.endDate ? " - " + g.formatDate(format:"MM/dd/yy", date:event.eventDate) : ""}</em></b>
	                  <g:if test="${event?.currentUserTasks()}">
	                      <p>${event?.currentUserTasks()?.size()} open tasks assigned to you</p>
	                  </g:if>
	                  <g:if test="${event?.findSponsors()}">
	                      <p>${event.findSponsors()?.size()} sponsors</p>
	                  </g:if>
	                  <td:volunteersHomeAssociated id="${event?.id}" />
	                </div>
	              </g:each>
