

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'registration.label', default:'Registration')}" />
        <title>TekDays &rarr; Thanks for registering for this event!</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><link:eventHome slug="${tekEventInstance.slug}">${tekEventInstance.name}</link:eventHome></span>
        </div>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <fieldset>
                     <p>Wow, dude. You're great! You registered for this event! We can't say enough good things about you!</p>
                 </fieldset><br />
        </div>
    </body>
</html>
