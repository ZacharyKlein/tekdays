

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays &rarr; Edit Profile</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">TekUser List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New TekUser</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Profile</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tekUserInstance}">
            <div class="errors">
                <g:renderErrors bean="${tekUserInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="version" value="${tekUserInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fullName">Full Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'fullName','errors')}">
                                    <input type="text" id="fullName" name="fullName" value="${fieldValue(bean:tekUserInstance,field:'fullName')}"/>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fullNameShow">Show full name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'fullNameShow','errors')}">
                                    <g:checkBox name="fullNameShow" value="${tekUserInstance?.fullNameShow}" ></g:checkBox>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username">User Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'username','errors')}">
                                    <input type="text" id="username" name="username" value="${fieldValue(bean:tekUserInstance,field:'username')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'email','errors')}">
                                    <input type="text" id="email" name="email" value="${fieldValue(bean:tekUserInstance,field:'email')}"/>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="emailShow">Show email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'emailShow','errors')}">
                                    <g:checkBox name="emailShow" value="${tekUserInstance?.emailShow}" ></g:checkBox>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="website">Website:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'website','errors')}">
                                    <input type="text" id="website" name="website" value="${fieldValue(bean:tekUserInstance,field:'website')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bio">Bio:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'bio','errors')}">
                                    <textarea rows="5" cols="40" name="bio">${fieldValue(bean:tekUserInstance, field:'bio')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="passwd">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'passwd','errors')}">
                                    <input type="text" id="passwd" name="passwd" value="${fieldValue(bean:tekUserInstance,field:'passwd')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name"><label for="authorities">Roles:</label></td>
                                <td valign="top" class="value ${hasErrors(bean:person,field:'authorities','errors')}">
                                    <ul>
                                        <g:each var="entry" in="${roleMap}">
                                            <li>${entry.key.authority.encodeAsHTML()}
                                                <g:checkBox name="${entry.key.authority}" value="${entry.value}"/>
                                            </li>
                                        </g:each>
                                    </ul>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="Update Profile" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
