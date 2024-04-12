<cfoutput>
    <head>
        <link rel="stylesheet" href="./assets/css/style.css">	
    </head>

    <cfset apiKey = "AIzaSyBCZ1bMOOJRNg2pN0NEXpdFwSN0Wda1WFY">
    <cfset channelId = "UCnZyxD7FbXaknqXh7OPwSEw">
    
    <cfhttp url="https://www.googleapis.com/youtube/v3/search" method="get">
        <cfhttpparam type="url" name="part" value="snippet">
        <cfhttpparam type="url" name="channelId" value="#channelId#">
        <cfhttpparam type="url" name="maxResults" value="10">
        <cfhttpparam type="url" name="key" value="#apiKey#">
    </cfhttp>

    <cfset responseData = DeserializeJSON(cfhttp.fileContent)>
    <cfset videoid=''>
    <cfloop collection="#responsedata#" item = "video">
        <cfset count=1>
        <cfloop array="#responseData["items"]#" index = "item">
            <cfif structKeyExists(item["id"],"videoid")>
                <cfif count EQ 1>
                    <cfset videoid=item["id"].videoid> 
                </cfif>
            </cfif>
            <cfset count = count+1>
        </cfloop>
    </cfloop>

    <cfif len(videoid)>
        <div class = "mx-auto text-center mt-5">
            <iframe width="500" height="300" src="https://www.youtube.com/embed/#videoid#" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"  allowfullscreen controls autoplay></iframe>
        </div>
    </cfif>
</cfoutput>