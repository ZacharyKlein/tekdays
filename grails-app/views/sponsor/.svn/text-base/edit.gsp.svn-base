

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Sponsor</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Sponsor List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Sponsor</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Sponsor</h1>
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
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:sponsorInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="website">Website:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorInstance,field:'website','errors')}">
                                    <input type="text" id="website" name="website" value="${fieldValue(bean:sponsorInstance,field:'website')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorInstance,field:'description','errors')}">
                                    <textarea rows="5" cols="40" name="description">${fieldValue(bean:sponsorInstance, field:'description')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="logo">Logo:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorInstance,field:'logo','errors')}">
                                    <input type="file" id="logo" name="logo" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sponsorships">Sponsorships:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorInstance,field:'sponsorships','errors')}">
                                    
<ul>
<g:each var="s" in="${sponsorInstance?.sponsorships?}">
    <li><g:link controller="sponsorship" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="sponsorship" params="['sponsor.id':sponsorInstance?.id]" action="create">Add Sponsorship</g:link>

                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
