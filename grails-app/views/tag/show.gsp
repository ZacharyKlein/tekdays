

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'tag.label', default:'Tag')}" />
        <title>Show ${entityName}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
        </div>
        <div class="body">
            <h1>Show ${entityName}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>


                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="tag.id.label" default="Id" />:
                            </td>

                            <td valign="top" class="value">${fieldValue(bean:tagInstance, field:'id')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="tag.events.label" default="Events" />:
                            </td>

                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="e" in="${tagInstance.events}">
                                    <li><g:link controller="tekEvent" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="tag.sponsors.label" default="Sponsors" />:
                            </td>

                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="s" in="${tagInstance.sponsors}">
                                    <li><g:link controller="sponsor" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="tag.name.label" default="Name" />:
                            </td>

                            <td valign="top" class="value">${fieldValue(bean:tagInstance, field:'name')}</td>

                        </tr>

                    </tbody>
                </table><td:linkToSearchByTag id="${tagInstance?.id}"/>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${tagInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>

