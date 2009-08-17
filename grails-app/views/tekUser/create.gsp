

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays &rarr; Register</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">All Users</g:link></span>
        </div>
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
                   <legend>Required Info</legend>
                     <p class="explanation">We need to have this stuff, or you're out the window.</p>
                     <p>
                       <label for="fullName" class="editdetail">Full Name:</label>
                       <input type="text" id="fullName" name="fullName" class="editdetail" value="${fieldValue(bean:tekUserInstance,field:'fullName')}"/>
                     </p>
                     <p>
                       <label for="username" class="editdetail">Username:</label>
                       <input type="text" id="username" name="username" class="editdetail" value="${fieldValue(bean:tekUserInstance,field:'username')}"/>
                     </p>
                     <p>
                       <label for="email" class="editdetail">Email:</label>
                       <input type="text" id="email" name="email" class="editdetail" value="${fieldValue(bean:tekUserInstance,field:'email')}"/>
                     </p>
                 </fieldset><br />
                 <fieldset>
                   <legend>Optional</legend>
                     <p class="explanation">You don't need to fill this out, but nobody will mind if you do.</p>
                     <p>
                       <label for="fullNameShow">Show full name</label>
                       <g:checkBox name="fullNameShow" value="${tekUserInstance?.fullNameShow}" ></g:checkBox>
                     </p>
                     <p>
                       <label for="website" class="editdetail">Website:</label>
                       <input type="text" id="website" name="website" class="editdetail" value="${fieldValue(bean:tekUserInstance,field:'website')}"/>                        
                     </p>
                     <p>
                       <label for="bio" class="editdetail">Bio:</label> 
                       <textarea rows="5" cols="40" name="bio" class="bio">${fieldValue(bean:tekUserInstance, field:'bio')}</textarea> 
                     </p>
                 </fieldset><br />
                 <fieldset>
                   <legend>Profile Image</legend>
                     <p class="explanation">Choose your avatar image here; this will show up next to your username on your profile, etc.</p>
                     <p>
                       <label for="avatar" class="editdetail">Avatar:</label>
                       <input type="file" id="avatar" name="avatar" />
                     </p>
                 </fieldset><br />
                 <fieldset>
                   <legend>Password</legend>
                     <p class="explanation"></p>
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
                 </fieldset><br />
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Register" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
