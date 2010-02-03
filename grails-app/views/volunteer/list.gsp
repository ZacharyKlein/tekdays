

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'volunteer.label', default: 'Volunteer')}" />
        <title>TekDays &rarr; ${event?.name} Volunteers</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><link:eventHome slug="${event.slug}">Event Home</link:eventHome></span>
        </div>
        <div class="body">
            <br /><h1>${event?.name} Volunteers</h1><br />
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:if test="${!volunteerInstanceTotal}">
                <p id="grayBox">No one has volunteered for ${event.name} yet.</p>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="user" title="User" />

                            <g:sortableColumn property="lastUpdated" title="Last updated" />

                            <g:sortableColumn property="dateCreated" title="Originally volunteered" />

                            <g:sortableColumn property="active" title="Approved" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${volunteerInstanceList}" status="i" var="volunteerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>
                                <g:if test="${volunteerInstance.active}">
                                    ${volunteerInstance.user.profile?.fullName ?: volunteerInstance.user.username}
                                </g:if>
                                <g:else>
                                    <strong>${volunteerInstance.user.profile?.fullName ?: volunteerInstance.user.username}</strong>
                                </g:else>
                            </td>

                            <td>
                                <g:if test="${volunteerInstance.active}">
                                    <g:formatDate format="EEEEE, MMMM dd, yyyy" date="${volunteerInstance.lastUpdated}"/> at <g:formatDate format="hh:mm aa" date="${volunteerInstance.lastUpdated}"/>
                                </g:if>
                                <g:else>
                                    <strong><g:formatDate format="EEEEE, MMMM dd, yyyy" date="${volunteerInstance.lastUpdated}"/> at <g:formatDate format="hh:mm aa" date="${volunteerInstance.lastUpdated}"/></strong>
                                </g:else>
                            </td>

                            <td>
                                <g:if test="${volunteerInstance.active}">
                                    <g:formatDate format="EEEEE, MMMM dd, yyyy" date="${volunteerInstance.dateCreated}"/>
                                </g:if>
                                <g:else>
                                    <strong><g:formatDate format="EEEEE, MMMM dd, yyyy" date="${volunteerInstance.dateCreated}"/></strong>
                                </g:else>
                            </td>

                            <td>
                                <g:if test="${volunteerInstance.active}">
                                    Yes
                                </g:if>
                                <g:else>
                                    <strong>No</strong>
                                </g:else>
                            </td>

                            <td><g:link action="edit" id="${volunteerInstance.id}">Edit</g:link></td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${volunteerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

