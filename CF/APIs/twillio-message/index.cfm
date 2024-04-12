<cfset account_ID = "AC6a05d015310a265957d065162080f3ce">
<cfset auth_token = "36c4b36d32f6d73090d238fe23753f3c">
<cfset message = "Hi senthil">

 <cfhttp result="result" method="post" url="https://api.twilio.com/2010-04-01/Accounts/#account_ID#/Messages.json">
    <cfhttpparam name="Authorization" type="header" value="Basic #toBase64('AC6a05d015310a265957d065162080f3ce:' & auth_Token)#">
    <cfhttpparam name="To" type="formfield" value="+916383908433">
    <cfhttpparam name="From" type="formfield" value="+12567403809">
    <cfhttpparam name="Body" type="formfield"  value="#replacenocase(message,'Sent from your Twillio trial account -','')#">
</cfhttp>


<cfif result.statuscode contains '201'>
    <h3 style="margin: auto;text-align: center;">Message sent successfully</h3>
</cfif>






