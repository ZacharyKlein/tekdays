<html>
  <head>
      <title>TekDays &rarr; Home</title>
    <meta name="layout" content="main" />
      <tm:resources />
  </head>
  <body>
    <div class="logo">
      <a href="${request.contextPath}/">
          <img src="${resource(dir:'images',file:'td_logo.png')}" alt="TekDays"/>
      </a>
      </div>

      <div id="publicContent" style="float:left; width:580px">
      <g:if test="${flash.message}">
        <div id="transparentMsg">
          ${flash.message}
        </div>
      </g:if>
      <br/>
      <h1 style="font-size:15pt; line-height:24px">The Days of the Mega Conferences Are Coming to an End.</h1>

        <p style="font-size:12pt; margin:10px;"">Who wants to spend two grand on admission and travel halfway across the country for a conference - when free or nearly free local conferences are popping up all over? We've got Bar Camps, Code Camps, Tech Fests and more.</p>
        <h2 style="margin-left:14px; text-align:center;">There may already be a conference in your area, covering your interests. <br/> If not, then why not start one?</h1>
        <p style="font-size:12pt; margin:10px;">TekDays makes it easy for visionary individuals such as yourself to connect and put together exciting technology conferences. We'll provide you with the tools to communicate, organize and promote your event. We'll even help you hook up with sponsors to help keep the costs down.</p>
        <h2 style="margin-left:14px; text-align:center;">A good technology conference is a big win for any community; <span style="font-size:18pt; font-weight:bold;">sign up </span>to get started!</h1><br />
      <div id="bookPlug" style="background:#F8F8F8; border:1px solid #c0c0c0; padding:20px; width:580px; margin-bottom:40px">
	      <img src="${resource(dir:'images', file:'dkgrails.png')}" style="float:left; margin-right:20px" />
	      tekdays.com is based on the sample app from <a href="http://www.pragprog.com/titles/dkgrails/grails"><span style="font-weight:bold">Grails - A Quick Start Guide</span></a> by Dave Klein</br>
				<br/>
	      Using the principle of convention-over-configuration and the dynamic Groovy programming language,
				Grails takes the pain out of web development and brings back the fun. This book will get you up and running
				with Grails by putting it to use in constructing an original, working application from start to finish.
				</p>
				<p>
				
				<div class="clear"></div>
      </div>
      <td:displayAd />
    </div>

		<div id="publicSecondaryContent" style="float:right; width:360px; margin-top:55px">


			<div style="background:#F8F8F8; border:1px solid #c0c0c0; padding:20px; width:360px; margin-bottom:30px;">
        <div>
          <h2>How to Get Started...</h2>
          <p>Sign up for a free account, </p>
        </div>
			  <div><img src="${resource(dir:'images', file:'event_thumb.png')}" style="float:left; margin-bottom:40px;"/>
					<p style="float: right; font-size: 10pt; width: 160px; padding-top: 0pt;">Ready to take the plunge?
						You never know how many people are just waiting for the same tech event you've been itching to see. Take matters into
					  your own hands - sign up and get your new event rolling!
					</p>
				  <div class="clear"></div>		
				</div>
					
			  <div>
				  <img src="${resource(dir:'images', file:'search_thumb.png')}" style="float:right; margin-bottom:40px;"/>
					<p style="float: left; font-size: 10pt; width: 160px; padding-top: 0pt;">Can you say “howdy partner”?
					You can be an invaluable help to folks in your community by offering to assist in pulling off a community tech event –
					and it can be a lot of fun! Sign up and lend a helping hand!
					</p>
				  <div class="clear"></div>
			  </div>
			  
			  <div><img src="${resource(dir:'images', file:'sponsor_thumb.png')}" style="float:left; margin-bottom:40px;"/>
					<p style="float: right; font-size: 10pt; width: 160px; padding-top: 0pt;">Here's your chance to get
					your name in front of developers from all technical  fields; sign up as a Sponsor and help folks get their ideas off
					the ground – and share your big ideas at the same time!
					</p>
				  <div class="clear"></div>
			  </div>
			  <div class="clear"></div>
			</div>

		</div>

    <br />
  </body>
</html>

