
<!-- START:beginning -->
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
<!-- END:beginning -->    
<!-- START:js -->
    <g:javascript library="prototype" />
<!-- END:js -->
<!-- START:beginning -->
    <title>Messages</title>
  </head>
  <body>

    <div class="nav">
      <span class="menuButton">
        <a class="home" href="${resource(dir:'')}">Home</a>
      </span>
      <span class="menuButton">
        <g:link class="create" action="create" 
            params='[eventId:"${event?.id}"]'>New Message
        </g:link>
      </span>
    </div>
   
<!-- END:beginning -->
<!-- START:list -->
    <div class="body">
      <h1>${event?.name} - Forum Messages</h1>
<!-- START:tag -->
      <div id="list" class="dialog" style="overflow:auto">
      <!-- START_HIGHLIGHT -->
        <g:messageThread messages="${messageInstanceList}" />
      <!-- END_HIGHLIGHT -->
      </div>
<!-- END:tag -->
      <br/>
<!--      <h3>Message Details</h3>-->
      <div id="details">
      </div>  
    </div>    
<!-- END:list -->
<!-- START:beginning --> 
       
  </body>
</html>
<!-- END:beginning -->
