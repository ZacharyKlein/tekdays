<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="sponsor" />
        <g:set var="entityName" value="${message(code:'sponsor.label', default:'Sponsor')}" />
        <gui:resources components="['dialog']" />
        <title>Show ${entityName}</title>
    </head>
    <body>
        <g:isLoggedIn>
        <gui:dialog
              title="Request Sponsorship"
              form="true"
              controller="sponsorship"
              action="requestSponsorship"
              update="sponsorContactSpan"
              triggers="[show:[id:'sponsorContactButton', on:'click']]">
              <input type="hidden" name="id" value="${sponsorInstance.id}" />
            <p>oh hai! u wunt dis spnsr 2 spnsr ur evnt? wich 1?</p>
            <g:select optionKey="id" from="${organizerEvents}" name="event.id" value="${it?.id}" ></g:select><br /><br />
            <textarea name="message" id="message" style="width: 600px; height: 120px;">Type your message to the sponsor's representative here.</textarea>
        </gui:dialog>
        </g:isLoggedIn>
        <div class="body">

            <div id="sponsorHeader" style="padding-bottom:15px;">
                 <img style="height:120px; width:auto" src='<g:resource dir="${sponsorInstance.bannerLocation}" file="${sponsorInstance.bannerName}" />' />
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

            <td:sponsorContact sponsorId="${sponsorInstance?.id}" />

            <div id="sponsorSecondaryContent" style="float:right; width:400px;">
                <td:eventsSponsoredBy sponsor="${sponsorInstance?.id}"/>
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

