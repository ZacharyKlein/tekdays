<html>
  <head>
    <title><g:layoutTitle default="Grails" /></title>
    <link rel="stylesheet" 
          href="${resource(dir:'css',file:'main.css')}" />
    <link rel="shortcut icon" 
          href="${resource(dir:'images',file:'favicon.ico')}" 
          type="image/x-icon" />
    <g:layoutHead />
    <g:javascript library="application" />				
  </head>
  <!-- START:skin -->
  <body class="yui-skin-sam">
    <div id="wrapper">
        <!-- END:skin -->
          <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner"/>
          </div>
          <div class="logo">
            <img src="${resource(dir:'images',file:'td_logo.png')}" alt="TekDays"/>
           
          </div> 
           <g:loginToggle />
          <g:layoutBody />
              </div>
          <div id="footer">
              <br/>
              <p>Copyright 2009 by <a href="http://www.silver-chalice.com">Silverchalice</a></p>
          </div>
    

    
  </body>	
</html>

