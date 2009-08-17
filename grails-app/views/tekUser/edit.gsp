

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays &rarr; Edit Profile</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">All Users</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Profile</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tekUserInstance}">
            <div class="errors">
                <g:renderErrors bean="${tekUserInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" enctype="multipart/form-data" >
                <input type="hidden" name="version" value="${tekUserInstance?.version}" />
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
                   <legend>Avatar</legend>
                     <p class="explanation"><strong>If you'd like to keep your current avatar, skip this.</strong> If you want to use a different avatar, choose one here.</p>
                     <p>
                       <label for="newavatar" class="editdetail">New Avatar:</label>
                       <input type="file" id="newavatar" name="newavatar" />
                     </p>
                 </fieldset><br />
                 <fieldset>
                   <legend>Password</legend>
                     <p class="explanation"><strong>If you'd rather keep your current password, leave these blank.</strong> If you want to change your password, fill these out.</p>
                     <p>
                       <label for="currentpasswd" class="editdetail">Password:</label>
                       <input type="password" id="currentpasswd" name="currentpasswd" class="editdetail" value=""/>
                     </p>
                     <p>
                       <label for="newpasswd" class="editdetail">New Password:</label>
                       <input type="password" id="newpasswd" name="newpasswd" class="editdetail" value=""/>
                     </p>
                     <p>
                       <label for="confirmpasswd" class="editdetail">Confirm New Password:</label>
                       <input type="password" id="confirmpasswd" name="confirmpasswd" class="editdetail" value=""/>
                     </p>
                 </fieldset><br />

                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="Update Profile" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
