

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'sponsor.label', default:'Sponsor')}" />
        <title>Edit ${entityName}</title>
        <gui:resources components="['autoComplete', 'richEditor']" />
    </head>
    <body>
        <div class="body">
            <h1>Edit ${entityName}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${sponsorInstance}">
            <div class="errors">
                <g:renderErrors bean="${sponsorInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post"  action="update" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${sponsorInstance?.id}" />
                <input type="hidden" name="version" value="${sponsorInstance?.version}" />
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
					                    <gui:richEditor id="description"
					                                    name="description"
					                                    height="350px"
					                                    width="960px"
					                                    dompath="false"
					                                    value="${sponsorInstance?.description}" />
					                    <script type="text/javascript">
					                        GRAILSUI.description._defaultToolbar.titlebar = 'Description:';
					                    </script>
                          </p>

                              <label for="logo">
                                  Logo
                              </label><br/>
                              <input type="file" id="logo" name="logo" /><br/>
                              <p>Logo will be displayed at 120x120 pixels</p>
                          </p>

                          <p>
                              <label for="banner">
                                  <g:message code="sponsor.banner.label" default="Banner" />
                              </label><br/>
                              <input type="file" id="banner" name="banner" /><br/>
                              <p>(Optional) Banner will be displayed at 120x1000 pixels</p>
                          </p>

                        <div class="tagsDiv">
                            <p>
                                <label for="tagList" class="editdetail">Add Tags:</label>
                                <gui:autoComplete id="tagList" resultName="tagList" width="500px" labelField="name" idField="id" controller="sponsor" action="autoTags" delimChar=","/>
															  <p style="margin-top:30px"><strong>Current tags</strong>: ${sponsorInstance?.tags}</p>
                             </p>
                        </div>
                      </fieldset>

                  </div>


                <div class="formbuttons">
                    <span class="button"><input class="save" type="submit" value="Update" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

