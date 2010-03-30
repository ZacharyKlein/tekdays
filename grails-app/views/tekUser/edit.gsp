

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays &rarr; Edit Profile</title>
    </head>
    <body>
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
                      <label for="profile.fullName" class="editdetail">Full Name:</label>
                      <input type="text" id="profile.fullName" name="profile.fullName" class="editdetail" value="${tekUserInstance.profile?.fullName}"/>
                    </p>
                    <p>
                      <label for="username" class="editdetail">Username:</label>
                      <input type="text" id="username" name="username" class="editdetail" value="${tekUserInstance.username}"/>
                    </p>
                    <p>
                      <label for="email" class="editdetail">Email:</label>
                      <input type="text" id="email" name="email" class="editdetail" value="${tekUserInstance.email}"/>
                    </p>
                </fieldset><br />
                <fieldset>
                  <legend>Optional</legend>
                    <p class="explanation">You don't need to fill this out, but nobody will mind if you do.</p>
                    <p>
                      <label for="profile.fullNameShow">Show full name</label>
                      <g:checkBox name="profile.fullNameShow" value="${tekUserInstance?.profile?.fullNameShow}" ></g:checkBox>
                    </p>
                    <p>
                      <label for="profile?.website" class="editdetail">Website:</label>
                      <input type="text" id="profile.website" name="profile.website" class="editdetail" value="${tekUserInstance.profile?.website}"/>
                    </p>
                    <p>
                      <label for="profile.bio" class="editdetail">Bio:</label>
                      <textarea rows="5" cols="40" name="profile.bio" class="profile.bio">${tekUserInstance.profile?.bio}</textarea>
                    </p>

                     
                 </fieldset><br />
                 <fieldset>
                   <legend>Avatar</legend>
                     <p class="explanation"><strong>If you'd like to keep your current avatar, skip this.</strong> If you want to use a different avatar, choose one here.</p>
                     <p>
                       <label for="profile.newavatar" class="editdetail">New Avatar:</label>
                       <input type="file" id="profile.newavatar" name="profile.newavatar" />
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
                <div>
                    <span class="button"><g:actionSubmit class="save" action="update" value="Update Profile" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

