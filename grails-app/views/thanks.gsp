

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'registration.label', default:'Registration')}" />
        <title>TekDays &rarr; Thanks for registering for this event!</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
        </div>
        <div class="body">
            <h1>Thanks for registering, dude!</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <fieldset>
                   <legend>Thanks for Registering!</legend>
                     <p>Wow, dude. You're great! You registered for this event! We can't say enough good things about you!</p>
                    <input type="hidden" name="username" value="${tekUserInstance?.username}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" username="${tekUserInstance.username}" value="Edit Profile" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" onclick="return confirm('Are you sure?');" value="Delete this account" /></span>
                 </fieldset><br />
        </div>
    </body>
</html>
