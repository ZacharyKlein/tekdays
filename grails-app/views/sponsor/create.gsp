<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="public" />
    <g:set var="entityName" value="${message(code:'sponsor.label', default:'Sponsor')}" />
    <title>TekDays &rarr; Sponsor Signup</title>
    <gui:resources components="['autoComplete', 'richEditor']" />
  </head>
  <body>

    <div class="body" style="margin-top:50px">
      <h1>Sponsor Signup</h1>
      <br/>
      <h3>Welcome! Thank you so much for your interest.</h3>
      <p>Enter your <strong>company name</strong> and <strong>website</strong>, a <strong>description</strong> of your work and interests, and a <strong>logo</strong> and <strong>banner</strong> for your new home page. (This information is public.)</p>
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
            <fieldset style="width:460px;float:left; height:260px;">
              <legend>Company Details</legend>
              <p>
                <label for="name">
                  <g:message code="sponsor.name.label" default="Company Name" />
                </label><br/>
                <input type="text" id="name" name="name" value="${fieldValue(bean:sponsorInstance,field:'name')}"/>
              <p>
              <p>
                <label for="website">
                  <g:message code="sponsor.website.label" default="Company Website" />
                </label><br/>
                <input type="text" id="website" name="website" value="${fieldValue(bean:sponsorInstance,field:'website')}"/>
              </p>
              <div class="tagsDiv">
                <p>
                  <label for="tagList">Tags:</label>
                  <gui:autoComplete id="tagList" resultName="tagList" labelField="name" idField="id" controller="sponsor" action="autoTags" delimChar=","/><br/>
                  <p style="font-size:9pt; width:450px">(comma-separated list of event topics you would be interested in sponsoring)</p>
                 </p>
              </div>
            </fieldset>
            
            <fieldset style="width:460px;float:right; height:260px;">
              <legend>Logo/Banner</legend>
              <p>
                <label for="logo">Logo</label><br/>
                <input type="file" id="logo" name="logo" /><br/>
                <p>Logo will be displayed at 120x120 pixels</p>
              </p>

              <p>
                <label for="banner">
                  <g:message code="sponsor.banner.labelr" default="Banner" />
                </label><br/>
                <input type="file" id="banner" name="banner" /><br/>
                <p>Banner will be displayed at 120x1000 pixels</p>
              </p>
            </fieldset>
            
            <div style="clear:both">
              <gui:richEditor id="description"
                name="description"
                width="1000px"
                dompath="false"
                height="220px"
                value="${sponsorInstance?.description}" />
              <script type="text/javascript">
                GRAILSUI.description._defaultToolbar.titlebar = 'Description:';
              </script>
            </div>

          <g:isNotLoggedIn>
            <fieldset style="float:left; width:460px; height:260px;">
              <legend>User Details</legend>
                <p>
                <label for="rep.username" class="editdetail">Username:</label>
                <input type="text" id="rep.username" name="rep.username" class="editdetail" value="${sponsorInstance.rep?.username}"/>
              </p>
              <p>
                <label for="rep.email" class="editdetail">Email:</label>
                <input type="text" id="rep.email" name="rep.email" class="editdetail" value="${sponsorInstance.rep?.email}"/>
              </p>
              <p>
                Your email will only be shared when you <b>choose to form a Sponsorship</b> with an event organizer.
              </p>

            </fieldset>
            
            <fieldset style="float:right; width:460px; height:260px;">
              <legend>Password</legend>
              <p>
                <label for="rep.passwd" class="editdetail">Password:</label>
                <input type="password" id="rep.passwd" name="rep.passwd" value="${sponsorInstance.rep?.passwd}"/>
              </p>
              <p>
                <label for="rep.confirmpasswd" class="editdetail">Confirm Password:</label>
                <input type="password" id="rep.confirmpassword" name="rep.confirmpassword"/>
              </p>
              <p>
                <strong>Please Note: </strong>This user account will be the Sponsor's Representative. You will be able to form Sponsorships and participate in other activities using this account. If you have another user account you'd rather use, please <g:link controller="login" action="auth">login</g:link> first.
              </p>
              <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
              </g:if>
              <g:hasErrors bean="${sponsorInstance.rep}">
                <div class="errors">
                  <g:renderErrors bean="${sponsorInstance.rep}" as="list" />
                </div>
              </g:hasErrors>
             </fieldset>
 
          </g:isNotLoggedIn>

          <g:isLoggedIn>
            <fieldset>
              <legend>Warning!</legend>
              <p style="font-weight:bold;">The currently logged in <link:profile username="${loggedInUserInfo(field:'username')}">user account</link:profile> wil be used as the Sponsor's Representative. If this is not what you want, please <a href="${createLink(controller:'logout', action:'index')}">logout</a> first.</p>
              <p>
                     
              <p>
                <label class="editdetail">User Name:</label>
                ${loggedInUserInfo(field:'username')}
              </p>
            </fieldset>
          </g:isLoggedIn>

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
          <span class="button"><input class="save" type="submit" value="Submit" /></span>
        </div>
      </g:form>
    </div>
  </body>
</html>

