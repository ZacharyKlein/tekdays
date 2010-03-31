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
              triggers="[show:[id:'sponsorContact', on:'click']]">
              <input type="hidden" name="id" value="${sponsorInstance.id}" />
            <p>oh hai! u wunt dis spnsr 2 spnsr ur evnt? wich 1?</p>
            <g:select optionKey="id" from="${organizerEvents}" name="event.id" value="${it?.id}" ></g:select><br /><br />
            <textarea name="organizerMessage" id="organizerMessage" style="width: 600px; height: 120px;">Type your message to the sponsor's representative here.</textarea>
        </gui:dialog>
        </g:isLoggedIn>
        <div class="body">

            <div id="sponsorHeader" style="padding-bottom:15px;">
                 <img style="height:120px; width:1000px" src='<g:resource dir="${sponsorInstance.bannerLocation}" file="${sponsorInstance.bannerName}" />' />
            </div>

            <div id="sponsorContent" style="float:left;">
                <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
                </g:if>



                <div id="sponsorContentInset">
	                <h2><a style="font-size:18pt" href="${sponsorInstance.website}">${sponsorInstance.website}</a></h2>
                  <p>${sponsorInstance.description}</p>


                  <div id="sponsorRep">
                      <div style="float:left">
                          <h2 style="color:black">Representative for ${sponsorInstance.name}:</h2>
                          <h3><g:link controller="tekUser" action="show" id="${sponsorInstance.rep.id}" style="color:black">${sponsorInstance.rep.username}</g:link></h3>
                          <p style="color:black">${sponsorInstance.rep.profile?.bio}</p>
                      </div>
                      <div style="float:right">
                          <td:showAvatar height='100px' username="${sponsorInstance.rep.username}"/>
                      </div>
                  </div>
                  <div id="sponsorTags" style="padding:10px; border:1px solid #000080; background:#f4f4f4">
                      <h2>${sponsorInstance.name} is interested in sponsoring events relating to:
                      <p>
                          <g:each var="t" in="${sponsorInstance.tags}">
                            <td:linkToSearchByTag id="${t?.id}" />
                          </g:each>
                      </p>
                  </div>
								 <span class="button"><link:editSponsor slug="${sponsorInstance?.slug}">Edit</link:editSponsor></span>
                </div>

            </div>

            <div id="sponsorSecondaryContent">
		            &nbsp;
                <td:eventsSponsoredBy sponsor="${sponsorInstance?.id}"/>
                <td:sponsorContact sponsorId="${sponsorInstance?.id}" />
            </div>

            <div id="clear"><g:form>
                    <input type="hidden" name="id" value="${sponsorInstance?.id}" />
                   
                </g:form>
            </div>

        </div>
    </body>
</html>

