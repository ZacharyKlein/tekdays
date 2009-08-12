

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Message</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Message List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Message</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Message</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${messageInstance}">
            <div class="errors">
                <g:renderErrors bean="${messageInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${messageInstance?.id}" />
                <input type="hidden" name="version" value="${messageInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="subject">Subject:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:messageInstance,field:'subject','errors')}">
                                    <input type="text" id="subject" name="subject" value="${fieldValue(bean:messageInstance,field:'subject')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="content">Content:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:messageInstance,field:'content','errors')}">
                                    <textarea rows="5" cols="40" name="content">${fieldValue(bean:messageInstance, field:'content')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="parent">Parent:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:messageInstance,field:'parent','errors')}">
                                    <g:select optionKey="id" from="${Message.list()}" name="parent.id" value="${messageInstance?.parent?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="author">Author:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:messageInstance,field:'author','errors')}">
                                    <g:select optionKey="id" from="${TekUser.list()}" name="author.id" value="${messageInstance?.author?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="event">Event:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:messageInstance,field:'event','errors')}">
                                    <g:select optionKey="id" from="${TekEvent.list()}" name="event.id" value="${messageInstance?.event?.id}" ></g:select>
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
