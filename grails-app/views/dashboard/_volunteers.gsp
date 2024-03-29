<h1>${tekEventInstance?.name} - Volunteers</h1><br />
            <div style="background:white; padding:5px; border:1px solid #CCCCCC">
                <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
                </g:if>
                    <table>
                        <thead>
                            <tr>

                                <g:sortableColumn property="user" title="User" />

                                <g:sortableColumn property="lastUpdated" title="Last updated" />

                                <g:sortableColumn property="dateCreated" title="Originally volunteered" />

                                <g:sortableColumn property="active" title="Approved" />


															  <th> </th>

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
                        <g:if test="${volunteerInstanceList.size() == 0}">
                            <tr>
                                <td id="noTopics" colspan="4"><h2>No Volunteers</h2> <p>No users have volunteered for this event yet</p></td>
                            </tr>
                        </g:if>
                        </tbody>
                    </table>
                </div>
