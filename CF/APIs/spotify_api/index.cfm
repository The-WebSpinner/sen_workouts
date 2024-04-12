<!doctype html>
<html lang="en">
	<head>
		<title>Spotify API</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/style.css">
		<script src="js/jquery.min.js"></script>
		<script src="js/popper.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/main.js"></script>
	</head>

	<cfoutput>

		<body>
			
			<cfset client_id = '6460cbebd2f24281ba7dcbc1619fd345'>
			<cfset client_secret = 'e5a890664f644dd5aa190da34879a406'>
			<cfset playlistID = '3tLK8il04VhdcF5pRrFI1N'>

			
			<cfhttp url="https://accounts.spotify.com/api/token" method="post" result="result">
				<cfhttpparam type="header" name="Authorization" value="Basic #toBase64(client_id & ':' &client_secret)#">
				<cfhttpparam type="header" name="Content-Type" value="application/x-www-form-urlencoded">
				<cfhttpparam type="formfield" name="grant_type" value="client_credentials">
			</cfhttp>

			<img src="images/spotify.png" width="8%" height="8%" style="margin-top:20px;">
				

			<cfif result.statusCode eq '200 OK'>
				<cfset accessToken = deserializeJSON(result.filecontent).access_token />
				
				<cfhttp url= "https://api.spotify.com/v1/playlists/#playlistID#/tracks" method="get" result="getArtist">
				<cfhttpparam type="header" name="Authorization" value="Bearer #accessToken#">
				</cfhttp>
				
				<cfif getArtist.statusCode eq '200 OK'>
					<cfset playlist_tracks = deserializeJSON(getArtist.filecontent).items>
					<!--- <cfdump  var="#playlist_tracks#"> --->

					<section class="">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-md-6 text-center">
									<h2 class="heading-section mbottom" style="color:##ffff">Your Playlist Tracks</h2>
								</div>
							 </div>
						
							<div class="row">
								<div class="col-md-12">
									<div class="table-wrap">
										<table class="table" style="text-align:center">
											<thead style="background-color:##1ed760">
												<tr>
													<th style="color:##191414">Track number</th>
													<th style="color:##191414">Album preview</th>
													<th style="color:##191414">Track name</th>
												</tr>
											</thead>

											<tbody>
												<cfset count = 1 />
												<cfloop array="#playlist_tracks#" index="item">
													<cfif item.track.type EQ 'track'>
														<cfif arraylen(item.track.album.images)>
															<tr class="alert" role="alert">
																<td style="padding:2px;vertical-align: inherit;">#count#</th>
																<td style="padding:2px;text-align:center">
																	<a style="color:black;"target="blank" href = "#item.track.external_urls.spotify#">
																		<img src="#item.track.album.images[3].url#" style="border-radius:50%;">
																	</a>
																</td>
																<td style="padding:2px;vertical-align: inherit;">
																	<a style="color:black;"target="blank" href = "#item.track.external_urls.spotify#">#item.track.name#</a>
																</td>
																
																<cfset count += 1 />
															</tr>
														</cfif> 
													</cfif>
												</cfloop> 
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</section>

				</cfif>
			</cfif>

			<style>
				body{
					background-color:##191414;
				}
			</style>
		
		</body>
	
	</cfoutput>

</html>

