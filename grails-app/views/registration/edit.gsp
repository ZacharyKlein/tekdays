

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'registration.label', default:'Registration')}" />
        <title>Edit ${entityName}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
        </div>
        <div class="body">
            <h1>Edit ${entityName}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${registrationInstance}">
            <div class="errors">
                <g:renderErrors bean="${registrationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${registrationInstance?.id}" />
                <input type="hidden" name="version" value="${registrationInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="firstName">
                                    <g:message code="registration.firstName.label" default="First Name" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:registrationInstance,field:'firstName','errors')}">
                                    <input type="text" id="firstName" name="firstName" value="${fieldValue(bean:registrationInstance,field:'firstName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastName">
                                    <g:message code="registration.lastName.label" default="Last Name" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:registrationInstance,field:'lastName','errors')}">
                                    <input type="text" id="lastName" name="lastName" value="${fieldValue(bean:registrationInstance,field:'lastName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email">
                                    <g:message code="registration.email.label" default="Email" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:registrationInstance,field:'email','errors')}">
                                    <input type="text" id="email" name="email" value="${fieldValue(bean:registrationInstance,field:'email')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="confirmed">
                                    <g:message code="registration.confirmed.label" default="Confirmed" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:registrationInstance,field:'confirmed','errors')}">
                                    <g:checkBox name="confirmed" value="${registrationInstance?.confirmed}" ></g:checkBox>
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
