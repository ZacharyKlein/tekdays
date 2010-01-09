

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays  &rarr; Edit Event Details: ${tekEventInstance?.name}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">TekEvent List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New TekEvent</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Details: ${tekEventInstance?.name}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tekEventInstance}">
            <div class="errors">
                <g:renderErrors bean="${tekEventInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="name" value="${tekEventInstance?.name.encodeAsHyphen()}" />
                <input type="hidden" name="version" value="${tekEventInstance?.version}" />
                <div class="dialog">
                <fieldset>
                  <legend>Required Info</legend>
                  <p>
                    <label for="name" class="editdetail">Name:</label>
                    <input type="text" id="name" name="name" value="${tekEventInstance?.name}"/>
                  </p>

                  <p>
                    <label for="city" class="editdetail">City:</label>
                    <input type="text" id="city" name="city" value="${tekEventInstance?.city}"/>
                  </p>

                  <p>
                    <label for="description" class="editdetail">Description:</label>
                    <textarea rows="5" cols="40" name="description">${tekEventInstance?.description}</textarea>
                  </p>

                  <p>
                    <input type="hidden" name="organizer.id" id="organizer.id" value="${tekEventInstance?.organizer?.id}" />
                  </p>
                </fieldset>

                                <fieldset>
                  <legend>Many and Varied Miscellaneous Details</legend>

                  <p>
                    <label for="venue" class="editdetail">Venue:</label>
                    <input type="text" id="venue" name="venue" value="${tekEventInstance?.venue}"/>
                  </p>
                  <p>
                    <label for="startDate" class="editdetail">Start Date:</label>
                    <g:datePicker name="startDate" value="${tekEventInstance?.startDate}" precision="day" noSelection="['':'']"></g:datePicker>
                  </p>
                  <p>
                    <label for="endDate" class="editdetail">End Date:</label>
                    <g:datePicker name="endDate" value="${tekEventInstance?.endDate}" precision="day" noSelection="['':'']"></g:datePicker>
                  </p>
                  <p>

                  <p>
                    <label for="twitterId" class="editdetail">Twitter id:</label>
                    <input type="text" id="twitterId" name="twitterId" value="${fieldValue(bean:tekEventInstance,field:'twitterId')}"/>
                  </p>

                  <p>
                    <label for="twitterPassword" class="editdetail">Twitter password:</label>
                    <input type="password" id="twitterPassword"
                    name="twitterPassword" value="${tekEventInstance?.twitterPassword}"/>
                  </p>

                  <p>
                    <label for="tag.name" class="editdetail">Tags:</label>
                    <input type="text" id="tag.name" name="tag.name" value="${tekEventInstance?.tags}"/>
                  </p>

                </fieldset>
                </div>
                <div class="formbuttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

