<!DOCTYPE html>
<html lang="en">

<cfoutput>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
        <title>Playlist</title>
    </head>
    <cfparam name="form.usernametextbox" default="">
    <cfparam name="CHANNEL_USERNAME" default="">
   
    <cfset apiKey = "AIzaSyBCZ1bMOOJRNg2pN0NEXpdFwSN0Wda1WFY">

  
         <cfset CHANNEL_USERNAME = '#form.usernametextbox#'>

    
    <cfif len(CHANNEL_USERNAME)>
        <cfhttp url="https://youtube.googleapis.com/youtube/v3/search" method="GET" result="getchannelid">
            <cfhttpparam type="url" name="part" value="snippet">
            <cfhttpparam type="url" name="q" value="#CHANNEL_USERNAME#">
            <cfhttpparam type="url" name="type" value="channel">
            <cfhttpparam type="url" name="key" value="#apikey#">
            <cfhttpparam type="header" name="Accept" value="application/json">
        </cfhttp>
       
       
        <cfset channelresp = deserializeJSON(getchannelid.filecontent)>
        <cfloop collection="#channelresp#" item="channelinfo">
            <cfif channelinfo EQ 'items'>
                <cfif arrayLen(channelresp['items'])>
                    <cfset channeldata = channelresp['items']>
                    <cfset channelid = channeldata[1].snippet.channelid>
                    <cfset channel_name = channeldata[1].snippet.channeltitle>
                    
                </cfif>
            </cfif>
        </cfloop>

        <cfif len(channelid)>
         
    
                <h3 class="mx-auto text-center mt-3" style="font-family: emoji;"><img style="width: 130px;height: 130px;"src="./playlisticon.gif" alt="playlist_ico">
                    Playlist of <b>#channel_name#</b></h3>
         
            <cfhttp url="https://www.googleapis.com/youtube/v3/playlists" method="get" result="result">
                <cfhttpparam type="url" name="part" value="snippet">
                <cfhttpparam type="url" name="channelId" value="#channelId#">
                <cfhttpparam type="url" name="maxResults" value="10">
                <cfhttpparam type="url" name="key" value="#apiKey#">
            </cfhttp>

            <cfset responseData = DeserializeJSON(result.fileContent)>

            <cfloop collection="#responseData#" item="playlists">
                <cfif playlists EQ 'items'>
                    <cfif arrayLen(responseData['items'])>
                        <cfset playlistdata = responseData['items']>
                        <cfset count = 0> 
                        <div style="margin:auto;width:90%">
                            <div style="display: flex;justify-content: space-between;">
                                <cfloop array="#playlistData#" index="PL">
                                    <cfset PL_id = PL.ID>
                                    <cfset PL_name = PL.snippet.title>
                                    <cfset PL_thumbnail = PL.snippet.thumbnails.high.url>
                                    <div class = "mt-4">
                                        <div class="card" style="width: 18rem;">
                                            <img class="card-img-top" src="#PL_thumbnail#" alt="playlist_thumbnail">
                                            <div class="card-body">
                                                <h5 class="card-title">#PL_name#</h5>
                                                <p class="card-text">Click view to open the playlist</p>
                                                <a href="playlist.cfm?id=#PL_id#&playlistname=#PL_name#" class="btn btn-dark">view</a>
                                            </div>
                                        </div>
                                    </div>
                                    <cfset count = count+1>
                                    <cfif count mod 5 eq 0>
                                        </div>
                                        <div style="display: flex;justify-content: space-between;">
                                    </cfif>
                                </cfloop>
                            </div>
                        </div>
                    </cfif>
                </cfif>
            </cfloop>
        </cfif>
    <cfelse>
        <form  method="post">
            <div class="mx-auto text-center mt-3">
            <div>
                <h3>This API will fetch you the playlist of your favorite youtuber</h3>
            </div>
                <div>
                    <span>Enter the username</span>
                </div>
                <div>
                    <input type="text" name="usernametextbox" class="usernametextbox" value="@">
                </div>
                <div>
                    <input type="submit" id="submitBtn" name="submit" class="submit btn btn-success mt-3" value="Get playlist">
                </div>
            </div>
        </form>
    </cfif>

  
</cfoutput>
</html>
