<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="sponsor" />
        <g:set var="entityName" value="${message(code:'sponsor.label', default:'Sponsor')}" />
        <title>Show ${entityName}</title>
    </head>
    <body>
 
        <div class="body">
        
            <div id="sponsorHeader" style="padding-bottom:15px;">
                 <img style="height:120px; width:auto" src="${createLink(action:'displayLogo', id:sponsorInstance?.id)}" />
            </div>
        
            <div id="sponsorContent" style="float:left; width:575px;">
                <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
                </g:if>
               
               

                <div id="sponsorContentInset" style="border:1px solid #C0C0C0; padding:10px 10px 40px 10px;">
                    <p>${sponsorInstance.description}</p>
                    <h2><a style="font-size:18pt" href="${sponsorInstance.website}">${sponsorInstance.website}</a></h2>
                      
                    <div id="sponsorRep" style="border:1px solid #000080; background-color:#F3F3F3; padding:10px; width:530px; height:100px; margin-bottom:25px">
                        <div style="float:left">
                            <h2 style="color:black">Representative for ${sponsorInstance.name}:</h2>
                            <h3><g:link controller="tekUser" action="show" id="${sponsorInstance.rep.id}" style="color:black">${sponsorInstance.rep.username}</g:link></h3>
                            <p style="color:black">${sponsorInstance.rep.profile?.bio}</p>
                        </div>
                        <div style="float:right">
                            <td:showAvatar height='100px' username="${sponsorInstance.rep.username}"/>
                        </div>
                    </div>
                    <div id="sponsorTags" style="padding:10px; border:1px solid #000080">
                        <h2>${sponsorInstance.name} is interested in sponsering events relating to:
                        <p>
                            <g:each var="t" in="${sponsorInstance.tags}">
                               <g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link>
                            </g:each>
                        </p>
                    </div>
                </div>
                             
            </div>
            
            <div id="sponsorSecondaryContent" style="float:right; width:400px;">
                <div id="sponsorshipList" style="border:1px solid #000080; padding:10px; min-height:350px; background-color:#F3F3F3">
                    <h2>Events sponsored by ${sponsorInstance.name}</h2>
                    <ul>
                        <li style="height:80px;border:1px solid #000080; background-color:white; padding:5px;margin:10px 0 10px 0;"><h2>Sponsored Event 1</h2></li>
                        <li style="height:80px;border:1px solid #000080; background-color:white; padding:5px;margin:10px 0 10px 0;"><h2>Sponsored Event 2</h2></li>
                    </ul>
                    <g:each var="s" in="${sponsorInstance.sponsorships}">
                    <g:link controller="sponsorship" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link>
                    </g:each>            
                </div>
                <span style="position:relative; bottom:-40px; left:15px; margin-top:50px;">
                    <a id="sponsorContact" style="padding:20px; background:#000080; color:white; text-decoration:none; font-weight:bold; font-size:28px;" href="#">Contact this Sponsor!</a>
                </span>
            </div>

            <div id="clear"><g:form>
                    <input type="hidden" name="id" value="${sponsorInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                </g:form>  
            </div>

        </div>
    </body>
</html>
