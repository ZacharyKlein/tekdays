

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays &rarr; Register</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">TekUser List</g:link></span>
        </div>
        <div class="body">
            <h1>Register</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tekUserInstance}">
            <div class="errors">
                <g:renderErrors bean="${tekUserInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" enctype="multipart/form-data" >
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
                                    <label for="userName">Username:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'userName','errors')}">
                                    <input type="text" id="userName" name="userName" value="${fieldValue(bean:tekUserInstance,field:'userName')}"/>
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
                                    <label for="website">Website:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'website','errors')}">
                                    <input type="text" id="website" name="website" value="${fieldValue(bean:tekUserInstance,field:'website')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="avatar">Avatar:</label>
                                </td>
                                <td valign="top">
                                    <input type="file" id="avatar" name="avatar" />
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
                                    <label for="password">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'password','errors')}">
                                    <input type="password" id="password" name="password" value="${fieldValue(bean:tekUserInstance,field:'password')}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password">Confirm Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'password','errors')}">
                                    <input type="password" id="confirmpassword" name="confirmpassword"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Register" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
