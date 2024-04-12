<cfoutput>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
        <title>playlist-videos</title>
    </head>

    <cfset apiKey = "AIzaSyBCZ1bMOOJRNg2pN0NEXpdFwSN0Wda1WFY">
    <cfset playlistid = "#url.id#">
    
     <cfhttp url="https://www.googleapis.com/youtube/v3/playlistItems" method="get">
        <cfhttpparam type="url" name="playlistId" value="#playlistid#">
        <cfhttpparam type="url" name="part" value="snippet">
        <cfhttpparam type="url" name="key" value="#apiKey#">
        <cfhttpparam type="url" name="maxResults" value="50">
    </cfhttp>
    
    <cfset responseData = DeserializeJSON(cfhttp.fileContent)>
    <div class="bgimg"></div>  
        <div class="title rounded"style="background-color:white;padding:4px"><p style="color:black">#url.playlistname#</p></div>
        <div style="margin:auto;width:75%" class="content">
            <div style="display: flex;flex-direction:column;">
                <div style="display: flex;justify-content: space-between;">
                    <cfset count = 0> <!--- for three videos per row --->
                    <cfloop array="#responseData["items"]#" index = "item"> 
                        <cfset videoid = item.snippet.resourceid.videoid /> 
                        <cfset videoname = item.snippet.title>
                        <cfset thubmnail = item.snippet.thumbnails.high.url>
                        <div style="display: flex;flex-direction:column;align-items: left;">
                            <div class = "mt-3">
                                <iframe width="400" height="200" src="https://www.youtube.com/embed/#videoid#" title="YouTube video player"     frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"  allowfullscreen controls autoplay>
                                </iframe>
                            </div>
                            <div style="width:400px;word-wrap: break-word;background-color:white;">
                                <p style="color:black">#videoname#</p>
                            </div>
                        </div>
                        <cfset count = count+1>
                        <cfif count mod 3 eq 0>
                            </div>
                            <div style="display: flex;justify-content: space-between;">
                        </cfif>
                    </cfloop>
                </div>
            </div>
        </div>
  

    <style>
        .bgimg {
            /* The image used */
            background-image: url("#thubmnail#");

            /* Add the blur effect */
            filter: blur(8px);
            -webkit-filter: blur(8px);

            /* Full height */
            height: 100%;

            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            }

            .content{
                position: absolute;
                top:11%;
                left: 13%;
            }
            .title{
                position: absolute;
                top: 3%;
                left: 44%;
            }
    </style>

</cfoutput>
