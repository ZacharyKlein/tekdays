

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays &rarr; Account</title>
        <g:javascript library="prototype" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
        </div>
        <div class="body">
            <h1>Your Account</h1>
                <input type="hidden" name="version" value="${tekUserInstance?.version}" />
                <div class="dialog">
                <g:formRemote name="billyBob" url="[controller:'tekUser', action:'updateUsername', id:tekUserInstance?.id]" method="post" enctype="multipart/form-data" >
                <fieldset>
                  <legend>Username</legend>
                   <p>
                     <input name="username" id="username" value="${tekUserInstance}" />
                     <input type="hidden" name="id" id="id" value="${tekUserInstance?.id}">
                     <g:actionSubmit action="updateUsername" value="Submit" />
                   </p>
                </fieldset>
                </g:formRemote>

                </div>
        </div>
    </body>
</html>

