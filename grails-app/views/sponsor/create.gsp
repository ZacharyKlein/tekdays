

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
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">
                                      <g:message code="sponsor.name.label" default="Name" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:sponsorInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="website">
                                      <g:message code="sponsor.website.label" default="Website" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorInstance,field:'website','errors')}">
                                    <input type="text" id="website" name="website" value="${fieldValue(bean:sponsorInstance,field:'website')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">
                                      <g:message code="sponsor.description.label" default="Description" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorInstance,field:'description','errors')}">
                                    <textarea rows="5" cols="40" name="description">${fieldValue(bean:sponsorInstance, field:'description')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="logo">
                                      <g:message code="sponsor.logo.label" default="Logo" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorInstance,field:'logo','errors')}">
                                    <input type="file" id="logo" name="logo" />
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="tag.name">
                                    <label for="tag.name">
                                      <g:message code="tag.name.label" default="Tags" />
                                    </label>
                                </td>
                                <td valign="top" class="">
                                    <input type="text" id="tag.name" name="tag.name" value=""/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="formbuttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
