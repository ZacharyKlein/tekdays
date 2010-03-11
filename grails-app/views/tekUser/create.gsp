

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays &rarr; Register</title>
    </head>
    <body>
        <a href="${request.contextPath}/">
          <img src="${resource(dir:'images',file:'td_logo.png')}" style='float:left; border:none;' alt="TekDays"/>
        </a>
        <p>&nbsp;</p>
        <div class="body">
            <h1>Register</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tekUserInstance}">
            <div class="errors">
                <g:renderErrors bean="${tekUserInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" enctype="multipart/form-data" >
                <div class="dialog">
                 <fieldset>
                   <legend>Sign Up</legend>
                     <p>
                       <label for="username" class="editdetail">Username:</label>
                       <input type="text" id="username" name="username" class="editdetail" value="${fieldValue(bean:tekUserInstance,field:'username')}"/>
                     </p>
                     <p>
                       <label for="email" class="editdetail">Email:</label>
                       <input type="text" id="email" name="email" class="editdetail" value="${fieldValue(bean:tekUserInstance,field:'email')}"/>
                     </p>
                     <p>
                       <label for="passwd" class="editdetail">Password:</label>
                       <input type="password" id="passwd" name="passwd" value="${fieldValue(bean:tekUserInstance,field:'passwd')}"/>
                     </p>
                     <p>
                       <label for="confirmpasswd" class="editdetail">Confirm Password:</label>
                       <input type="password" id="confirmpassword" name="confirmpassword"/>
                     </p>
                 </fieldset><br />
                 <fieldset>
                   <legend>Are you an evil robot?</legend>
                     <p class="explanation">Type in the code shown in the image, just so we know you aren't an evil robot trying to fill our application with spam.</p>
                     <p>
                       <label for='code'>Enter Code: </label>
                       <input type="text" name="captcha" size="8"/>
                       <img src="${createLink(controller:'captcha', action:'index')}" align="absmiddle"/>
                     </p>
                 </fieldset>
                </div>
                <div>
                    <input class="save" type="submit" value="Register" />
                </div>
            </g:form>
        </div>
    </body>
</html>

