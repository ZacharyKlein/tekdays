

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="dashboard" />
        <meta name="dashTab" content="volunteers" />
        <g:set var="entityName" value="${message(code: 'volunteer.label', default: 'Volunteer')}" />
        <title>TekDays &rarr; ${tekEventInstance?.name} Volunteers</title>
    </head>
    <body>
			<div class="nav">
				<span>Volunteers</span>
	    </div>
      <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
      </g:if>

      <div class="list">
          <table>
              <thead>
                  <tr>

                      <th>Username</th>

                      <th>Last updated</th>

                      <th>Originally volunteered</th>

                      <th>Approved</th>

											<th></th>
                  </tr>
              </thead>
              <tbody>
              <g:each in="${volunteerInstanceList}" status="i" var="volunteerInstance">
                  <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                      <td>
	                      <strong>
                          <g:if test="${volunteerInstance.active}">
                              ${volunteerInstance.user.profile?.fullName ?: volunteerInstance.user.username}
                          </g:if>
                          <g:else>
                              ${volunteerInstance.user.profile?.fullName ?: volunteerInstance.user.username}
                          </g:else>
                        </strong>
                      </td>

                      <td>
                          <g:if test="${volunteerInstance.active}">
                              <g:formatDate format="EEEEE, MM/dd/yy" date="${volunteerInstance.lastUpdated}"/>
                               at <g:formatDate format="hh:MM, aa" date="${volunteerInstance.lastUpdated}"/>
                          </g:if>
                          <g:else>
                              <g:formatDate format="EEEEE, MM/dd/yy" date="${volunteerInstance.lastUpdated}"/>
                               at <g:formatDate format="hh:MM, aa" date="${volunteerInstance.lastUpdated}"/>
                          </g:else>
                      </td>

                      <td>
                          <g:if test="${volunteerInstance.active}">
                              <g:formatDate format="EEEEE, MM/dd/yy" date="${volunteerInstance.dateCreated}"/>
                          </g:if>
                          <g:else>
                              <g:formatDate format="EEEEE, MM/dd/yy" date="${volunteerInstance.dateCreated}"/>
                          </g:else>
                      </td>

                      <td>
                          <g:if test="${volunteerInstance.active}">
                              <strong>Yes</strong>
                          </g:if>
                          <g:else>
                              <strong>No</strong>
                          </g:else>
                      </td>

                      <td><g:link action="edit" id="${volunteerInstance.id}" params="[slug:tekEventInstance.slug]">View</g:link></td>

                  </tr>
              </g:each>
                <g:if test="${volunteerInstanceList.size() == 0}">
                  <tr>
                    <td id="noTopics" colspan="4" style="border-bottom-color:#ccc"><h2>No Volunteers</h2> <p>No users have volunteered for this event yet</p></td>
                  </tr>
                </g:if>
              </tbody>
          </table>
      </div>
      <div class="paginateButtons">
          <g:paginate total="${volunteerInstanceTotal}" />
      </div>
      
    </body>
</html>

