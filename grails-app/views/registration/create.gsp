

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'registration.label', default:'Registration')}" />
        <title>TekDays &rarr; Register for event</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
        </div>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${registrationInstance}">
            <div class="errors">
                <g:renderErrors bean="${registrationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
              <fieldset>
                <legend>Register for event</legend>
                  <p>Cool, dude. You want to register for this event? It's simple. All we need is your name and email.</p>
                  <p>
                    <label for="firstName" class="editdetail">First name:</label>
                    <input type="text" id="firstName" name="firstName" class="editdetail" value="${fieldValue(bean:registrationInstance,field:'firstName')}"/>
                  </p>
                  <p>
                    <label for="lastName" class="editdetail">Last name:</label>
                    <input type="text" id="lastName" name="lastName" class="editdetail" value="${fieldValue(bean:registrationInstance,field:'lastName')}"/>
                  </p>
                  <p>
                    <label for="email" class="editdetail">Email address:</label>
                    <input type="text" id="email" name="email" class="editdetail" value="${fieldValue(bean:registrationInstance,field:'email')}"/>
                  </p>
                  <p>
                    <input type="hidden" name="eventId" id="eventId" value="${params.eventId}">
                    <input type="hidden" name="event.id" value="${eventId}" />
                    <input type="hidden" name="id" value="${registrationInstance.id}" />
                  </p>
              </fieldset><br />
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
