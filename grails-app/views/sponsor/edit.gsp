

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'sponsor.label', default:'Sponsor')}" />
        <title>Edit ${entityName}</title>
        <gui:resources components="['autoComplete']" />
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
            <g:form method="post"  enctype="multipart/form-data">
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
                              <textarea rows="5" cols="40" name="description">${fieldValue(bean:sponsorInstance, field:'description')}</textarea>
                          </p>

                              <label for="logo">
                                  <g:message code="sponsor.logo.label" default="Logo" />
                              </label><br/>
                              <input type="file" id="#" name="#" /><br/>
                              <p style="text-decoration: line-through;">Logo will be displayed at 120x120 pixels</p><b>Unavailable</b>
                          </p>                          

                          <p>
                              <label for="banner">
                                  <g:message code="sponsor.banner.labelr" default="Banner" />
                              </label><br/>
                              <input type="file" id="banner" name="banner" /><br/>
                              <p>(Optional) Banner will be displayed at 120x1000 pixels</p>
                          </p>

                        <div class="tagsDiv">
                            <p>
                                <label for="tagList" class="editdetail">Tags:</label>
                                <gui:autoComplete id="tagList" resultName="tagList" width="500px" labelField="name" idField="id" controller="sponsor" value="${sponsorInstance.tags}" action="autoTags" delimChar=","/>
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
