<html>
    <head>
        <title>TekDays &rarr; Event Dashboard</title>
        <gui:resources components="['richEditor', 'tabView', 'datePicker', 'accordion']" />
        <g:javascript library="prototype" />
        <meta name="layout" content="dashboard" />
        <meta name="dashTab" content="home" />
        <gui:resources components="['datePicker', 'accordion']" />

        <script type="text/javascript">
            function clearPost(e) {
                $('title').value='';
                $('notes').value='';
            }

            function showSpinner() {
                document.getElementById('spinner').style.display = 'inline';
                document.getElementById('error').style.display = 'none';
            }

            function hideSpinner() {
                document.getElementById('spinner').style.display = 'none';
                document.getElementById('error').style.display = 'none';
            }

        </script>
    </head>

    <body>


			<div class="nav">
				<span>Dashboard</span>&nbsp; > &nbsp;${tekEventInstance.name}
			</div>
        <td:ifIsOrganizer id="${tekEventInstance?.id}">
        <g:if test="${tekEventInstance?.nonApprovedVolunteers()}">
            <div class="message">
                <strong>${tekEventInstance?.nonApprovedVolunteers()?.size()}   ${tekEventInstance?.nonApprovedVolunteers()?.size() > 1 ? 'volunteers' : 'volunteer'} waiting for approval. </strong> &nbsp; <link:volunteerList slug="${tekEventInstance?.slug}">View all</link:volunteerList>  &raquo;
            </div>
        </g:if>
        </td:ifIsOrganizer>

			<p class="homesum">
			<table>
			  <tr>
			    <td>
			      Start Date: <g:formatDate format="MMM/dd/yyyy" date="${tekEventInstance?.startDate}"/>
			    </td>
			    <td>
			      <g:if test="${tekEventInstance?.endDate}">
			        End Date: <g:formatDate format="MMM/dd/yyyy" date="${tekEventInstance?.endDate}"/>
			      </g:if>
			    </td>
			  </tr>
			  <tr>
			    <td>
			      Venue: ${tekEventInstance?.venue}
			    </td>
			    <td>
			      Number of potential attendees: ${tekEventInstance?.respondents?.size()}
			    </td>
			  </tr>
			</table>
			</p>

			<div class="dashView">
				<h3>Things to do</h3>
					<table>
					  <thead>
					    <tr>
					      <th>Task Title</th>
					      <th>Due Date</th>
					      <th>Assigned To</th>
					    </tr>
					    </thead>
					    <g:each in="${tasks}" var="task">
					      <tr>
					        <td><g:link controller="task" action="show" id="${task?.id}">${task?.title}</g:link></td>
					        <td>
					          <g:if test="${task?.dueDate}">
					            <g:formatDate format="MM/dd/yyyy" date="${task?.dueDate}" /></td>
					          </g:if>
					          <g:else>
					            <strong>No date selected</strong>
					          </g:else>
					        <td>
					          <g:if test="${task?.assignedTo}">
					            <link:profile username="${task?.assignedTo.username}">${task?.assignedTo}</link:profile>
					          </g:if>
					          <g:else>
					            <strong>Not assigned yet</strong>
					          </g:else>
					        </td>
					      </tr>
					  </g:each>
					</table>
					<link:allTasks slug="${tekEventInstance?.slug}">
					  View all ${tekEventInstance?.tasks?.size()} tasks for this event.
					</link:allTasks>
				</div>

				<div class="dashView">
					<h3>Volunteers</h3>
					<table>
					  <thead>
					    <tr>
					      <th>Name</th>
					      <th>Email Address</th>
					      <th>Web Site</th>
					    </tr>
					  </thead>
					  <g:each in="${volunteers}" var="volunteer">
					    <tr>
					      <td>
					        <link:profile username="${volunteer?.user.username}">
					          ${volunteer?.user.profile?.fullName}
					        </link:profile>
					      </td>
					      <td><a href="mailto:${volunteer?.user.email}">${volunteer?.user.email}</a></td>
					      <td><a href="http://${volunteer?.user.profile?.website}">${volunteer?.user.profile?.website}</a></td>
					    </tr>
					  </g:each>
					</table>
				</div>

				<div class="dashView">
					<h3>Latest Forum Posts</h3>
					<table>
					  <thead>
					    <tr>
					      <th>Author</th>
					      <th>Subject</th>
					      <th>Content</th>
					    </tr>
					  </thead>
					  <g:each in="${messages}" var="msg">
					    <tr>
					      <td>
					        <link:profile username="${msg?.author.username}">
					          ${msg?.author}
					        </link:profile>
					      </td>
					      <td>
					        <g:link controller="message" action="topic" id="${msg.id}">
					          ${msg?.subject}
					        </g:link>
					      </td>
					      <td>
					        ${msg.content[0..Math.min(msg?.content?.size() -1, 24)]}
					        ${msg.content.size() > 25 ? '...' : ''}
					      </td>
					    </tr>
					  </g:each>
					</table>
					<link:eventForum slug="${tekEventInstance?.slug}">
					  View Forum.
					</link:eventForum>
				</div>

				<div class="dashView">
					<h3>Sponsors</h3>
					<table>
					  <thead>
					    <tr>
					      <th>Name</th>
					      <th>Web Site</th>
					      <th>Contribution</th>
					    </tr>
					  </thead>
					  <g:each in="${sponsorships}" var="s">
					    <tr>
					      <td>
					        <g:link controller="sponsor" action="show" id="${s.sponsor.id}">
					          ${s.sponsor.name}
					        </g:link>
					      </td>
					      <td><a href="http://${s.sponsor.website}">${s.sponsor.website}</a></td>
					      <td>${s.contributionType}</td>
					    </tr>
					  </g:each>
					</table>
				</div>

				<div class="dashView">
					<h3>Uploaded Files</h3>
					<table>
					  <thead>
					    <tr>
					      <th>File Name</th>
					      <th>Date Uploaded</th>
					    </tr>
					  </thead>
					  <g:each in="${attachments}" var="attachment">
					    <tr>
					      <td><a href="${attachment.location}">${attachment.name}</a></td>
					      <td>${attachment.dateCreated}</td>
					    </tr>
					  </g:each>
					</table>
					<link:newAttachment slug="${tekEventInstance?.slug}">Add attachment</link:newAttachment>
				</div>

    </body>
</html>

