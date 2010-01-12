<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="sponsor" />
        <g:set var="entityName" value="${message(code:'sponsor.label', default:'Sponsor')}" />
        <title>Show ${entityName}</title>
    </head>
    <body>
 
        <div class="body">
        
            <div id="sponsorContent" style="float:left; width:540px">
                <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
                </g:if>
               
                <div id="sponsorHeader" style="width:540px; padding-bottom:15px; height:100px; color:#009999; font: normal normal bold 68  normal inherit;">
                    <img style="height:80px; width:auto" src="${createLink(action:'displayLogo', id:sponsorInstance?.id)}" /> ${sponsorInstance.name}
                </div>

                <h1><a style="font-size:24pt" href="${sponsorInstance.website}">${sponsorInstance.website}</a></h1>
                <p>${sponsorInstance.description}</p>
                    
                    
                <h2>${sponsorInstance.name} is interested in sponsering events relating to:
                <p>
                    <g:each var="t" in="${sponsorInstance.tags}">
                       <g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link>
                    </g:each>
                </p>
                
                             
            </div>
            
            <div id="sponsorSecondaryContent" style="float:right; width:420px">
                <ul>
                    <li>Sponsored Event 1</li>
                    <li>Sponsored Event 2</li>
                </ul>
                <g:each var="s" in="${sponsorInstance.sponsorships}">
                <g:link controller="sponsorship" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link>
                </g:each>            
            </div>
            
            <div id="clear"><g:form>
                    <input type="hidden" name="id" value="${sponsorInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                </g:form>  
            </div>

        </div>
    </body>
</html>
