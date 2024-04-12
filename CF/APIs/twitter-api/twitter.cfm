<!--- <cfset bearer_token = "AAAAAAAAAAAAAAAAAAAAABZUogEAAAAAkdMjjsYZIl8P39CeHvExNh8rw1I%3DE5XSqYMEpDa4CTEjT2qfoPJCwFgdE9ykRubUKlzqixueDlOSos ">
<cfset api_key = "o3ko2zief41u7UVietQLFwBU3">
<cfset apikey_secret = "nJzCqNjpiiNCS7lsInoT1GFQUiElNNTlphxxT07xVGfzWTp8nF">
<cfset access_token = "1675854763248824322-as9crGg1t29YshXfvrhQnM7VEgrP32">
<cfset access_token_secret = "sI2piccZ4MWr0bODLUWedZlEAewVkcXjEUBu9dsIIfuHF">
<cfset projectId = "27415574">

 
 <cfhttp result="tweets" method="get" url="https://api.twitter.com/2/users/:id/tweets">
    <cfhttpparam type="header" name="Authorization" value="Bearer #bearer_token#">
     <cfhttpparam type="url" name="id" value="USER_ID">
</cfhttp>

<cfdump  var="#tweets#"> --->


<cfset apiKey = "LJtrukTuvxXtqSd4Rb3spp3xh">
<cfset apiSecretKey = "CYfK60WqlFHnrwA7C35DmJPXDwlYpFj4HvDENSlQZruOlmCeIy">

<!--- <cfset authUrl = "https://api.twitter.com/oauth2/token?" &

        "client_id=" & urlEncodedFormat(clientId) &

        "&redirect_uri=" & urlEncodedFormat(redirectUri)> --->

<cfhttp url="https://api.twitter.com/oauth2/token" method="POST" result="auth">
<cfhttpparam type="header" name="Authorization" value="Basic #ToBase64(apiKey & ':' & apiSecretKey)#">
<cfhttpparam type="header" name="Content-Type" value="application/x-www-form-urlencoded;charset=UTF-8">
<cfhttpparam type="body" value="grant_type=client_credentials">
</cfhttp>

<cfset bearerToken = deserializeJSON(auth.filecontent).access_token>

<cfdump var="#auth#"> <cfabort>
<cfset username = "amigo_sen"> 
<cfhttp url="https://api.twitter.com/2/users/910827454746451968/tweets" method="GET" result="tweet">
            <cfhttpparam type="header" name="Authorization" value="Bearer #bearerToken#">
</cfhttp>

<!--- Step 4: Handle the response --->



<cfdump var="#tweet#">