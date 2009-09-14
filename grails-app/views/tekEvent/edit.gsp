

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit TekEvent</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">TekEvent List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New TekEvent</g:link></span>
        </div>
        <div class="body">
            <h1>Edit TekEvent</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tekEventInstance}">
            <div class="errors">
                <g:renderErrors bean="${tekEventInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${tekEventInstance?.id}" />
                <input type="hidden" name="version" value="${tekEventInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:tekEventInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city">City:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'city','errors')}">
                                    <input type="text" id="city" name="city" value="${fieldValue(bean:tekEventInstance,field:'city')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'description','errors')}">
                                    <textarea rows="5" cols="40" name="description">${fieldValue(bean:tekEventInstance, field:'description')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="organizer">Organizer:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'organizer','errors')}">
                                    <g:select optionKey="id" from="${TekUser.list()}" name="organizer.id" value="${tekEventInstance?.organizer?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="venue">Venue:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'venue','errors')}">
                                    <input type="text" id="venue" name="venue" value="${fieldValue(bean:tekEventInstance,field:'venue')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="venueMapLink">Venue:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'venueMapLink','errors')}">
                                    <input type="text" id="venueMapLink" name="venueMapLink" value="${fieldValue(bean:tekEventInstance,field:'venueMapLink')}"/>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${tekEventInstance?.startDate}" precision="minute" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'endDate','errors')}">
                                    <g:datePicker name="endDate" value="${tekEventInstance?.endDate}" precision="minute" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="volunteers">Volunteers:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'volunteers','errors')}">
                                    <g:select name="volunteers"
from="${TekUser.list()}"
size="5" multiple="yes" optionKey="id"
value="${tekEventInstance?.volunteers}" />

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sponsorships">Sponsorships:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'sponsorships','errors')}">
                                    
<ul>
<g:each var="s" in="${tekEventInstance?.sponsorships?}">
    <li><g:link controller="sponsorship" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="sponsorship" params="['tekEvent.id':tekEventInstance?.id]" action="create">Add Sponsorship</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tasks">Tasks:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'tasks','errors')}">
                                    
<ul>
<g:each var="t" in="${tekEventInstance?.tasks?}">
    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="task" params="['tekEvent.id':tekEventInstance?.id]" action="create">Add Task</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="messages">Messages:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'messages','errors')}">
                                    
<ul>
<g:each var="m" in="${tekEventInstance?.messages?}">
    <li><g:link controller="message" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="message" params="['tekEvent.id':tekEventInstance?.id]" action="create">Add Message</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="twitterId">Twitter Id:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'twitterId','errors')}">
                                    <input type="text" id="twitterId" name="twitterId" value="${fieldValue(bean:tekEventInstance,field:'twitterId')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="twitterPassword">Twitter Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'twitterPassword','errors')}">
                                    <input type="text" id="twitterPassword" name="twitterPassword" value="${fieldValue(bean:tekEventInstance,field:'twitterPassword')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="respondents">Respondents:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'respondents','errors')}">
                                    
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
