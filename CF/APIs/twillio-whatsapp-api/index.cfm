<cfset account_ID = "AC6a05d015310a265957d065162080f3ce">
<cfset auth_token = "45913f25f89bbc97639781d06cc64abc">
<cfset message = "sathya">

 <cfhttp result="result" method="post" url="https://api.twilio.com/2010-04-01/Accounts/#account_ID#/Messages.json">
    <cfhttpparam name="Authorization" type="header" value="Basic #toBase64('AC6a05d015310a265957d065162080f3ce:' & auth_Token)#">
    <cfhttpparam name="To" type="formfield" value='whatsapp:+916383908433'>
    <cfhttpparam name="From" type="formfield" value="whatsapp:+14155238886">
    <cfhttpparam  name="Body"type="formfield" value="#message#">
</cfhttp>


