

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'sponsor.label', default:'Sponsor')}" />
        <title>Create ${entityName}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
        </div>
        <div class="body">
            <h1>Create ${entityName}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${sponsorInstance}">
            <div class="errors">
                <g:renderErrors bean="${sponsorInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post"  enctype="multipart/form-data">
                <div class="dialog">
                    <fieldset>
                        <legend>Sponsor Details</legend>
                        <p>
                              <label for="name">
                                  <g:message code="sponsor.name.label" default="Name" />
                              </label><br/>
                              <input type="text" id="name" name="name" value="${fieldValue(bean:sponsorInstance,field:'name')}"/>
                          <p>
                          <p>
                              <label for="website">
                                  <g:message code="sponsor.website.label" default="Website" />
                              </label><br/>
                              <input type="text" id="website" name="website" value="${fieldValue(bean:sponsorInstance,field:'website')}"/>
                          </p>

                          <p>
                              <label for="description">
                                  <g:message code="sponsor.description.label" default="Description" />
                              </label><br/>
                              <textarea rows="5" cols="40" name="description">${fieldValue(bean:sponsorInstance, field:'description')}</textarea>
                          </p>        

                          <p>
                              <label for="logo">
                                  <g:message code="sponsor.logo.label" default="Logo" />
                              </label><br/>
                              <input type="file" id="logo" name="logo" />
                          </p>

                          <p> 
                              <label for="tag.name">
                                  <g:message code="tag.name.label" default="Tags" />
                              </label><br/>
                              <input type="text" id="tag.name" name="tag.name" value=""/>
                          </p>
                      </fieldset>

                      <h1>Sponsor Representative</h1>

                      <g:isLoggedIn>
                          <fieldset>
                              <legend>Warning!</legend>
                              <p style="font-weight:bold;">The currently logged in <link:profile username="${loggedInUserInfo(field:'username')}">user account</link:profile> wil be used as the Sponsor's Representative. If this is not what you want, please <a href="${createLink(controller:'logout', action:'index')}">logout</a> first.</p>
                              <p>
                                <label class="editdetail">Full Name:</label>
                                ${loggedInUserInfo(field:'fullName')}
                              </p>
                              <p>
                                <label class="editdetail">User Name:</label>
                                ${loggedInUserInfo(field:'username')}
                              </p>
                          </fieldset>
                      </g:isLoggedIn>

                      <g:isNotLoggedIn>
                          <p>This user account will be the Sponsor's Representative. If you have another user account you'd rather use, please <g:link controller="login" action="auth">login</g:link> first</p>
                          <g:if test="${flash.message}">
                          <div class="message">${flash.message}</div>
                          </g:if>
                          <g:hasErrors bean="${sponsorInstance.rep}">
                          <div class="errors">
                              <g:renderErrors bean="${sponsorInstance.rep}" as="list" />
                          </div>
                          </g:hasErrors>

                          <fieldset>
                            <legend>Required Info</legend>
                              <p class="explanation">We need to have this stuff, or you're out the window.</p>
                              <p>
                                <label for="rep.fullName" class="editdetail">Full Name:</label>
                                <input type="text" id="rep.fullName" name="rep.fullName" class="editdetail" value="${sponsorInstance.rep?.fullName}"/>
                              </p>
                              <p>
                                <label for="rep.username" class="editdetail">Username:</label>
                                <input type="text" id="rep.username" name="rep.username" class="editdetail" value="${sponsorInstance.rep?.username}"/>
                              </p>
                              <p>
                                <label for="rep.email" class="editdetail">Email:</label>
                                <input type="text" id="rep.email" name="rep.email" class="editdetail" value="${sponsorInstance.rep?.email}"/>
                              </p>
                          </fieldset><br />
                          <fieldset>
                            <legend>Optional</legend>
                              <p class="explanation">You don't need to fill this out, but nobody will mind if you do.</p>
                              <p>
                                <label for="rep.fullNameShow">Show full name</label>
                                <g:checkBox name="rep.fullNameShow" value="${sponsorInstance.rep?.fullNameShow}" ></g:checkBox>
                              </p>
                              <p>
                                <label for="rep.website" class="editdetail">Website:</label>
                                <input type="text" id="rep.website" name="rep.website" class="editdetail" value="${sponsorInstance.rep?.website}"/>                        
                              </p>
                              <p>
                                <label for="rep.bio" class="editdetail">Bio:</label> 
                                <textarea rows="5" cols="40" name="rep.bio" class="rep.bio">${sponsorInstance.rep?.bio}</textarea> 
                              </p>
                          </fieldset><br />
                          <fieldset>
                            <legend>Profile Image</legend>
                              <p class="explanation">Choose your avatar image here; this will show up next to your username on your profile, etc.</p>
                              <p>
                                <label for="rep.avatar" class="editdetail">Avatar:</label>
                                <input type="file" id="rep.avatar" name="rep.avatar" />
                              </p>
                          </fieldset><br />
                          <fieldset>
                            <legend>Password</legend>
                              <p class="explanation"></p>
                              <p>
                                <label for="rep.passwd" class="editdetail">Password:</label>
                                <input type="password" id="rep.passwd" name="rep.passwd" value="${sponsorInstance.rep?.passwd}"/>
                              </p>
                              <p>
                                <label for="rep.confirmpasswd" class="editdetail">Confirm Password:</label>
                                <input type="password" id="rep.confirmpassword" name="rep.confirmpassword"/>
                              </p>
                          </fieldset><br />
                      </g:isNotLoggedIn>

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
               
                <div class="formbuttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
