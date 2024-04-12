<cfoutput>
	<!DOCTYPE html>
	<head>
		<title>Captcha</title>
		<link rel="icon" type="imageicon" href="./images/password.png">
		<link rel="stylesheet" href="./assets/css/style.css">
		<script src="./assets/js/jquery.min.js"></script>
		<script src="./assets/js/bootstrap.min.js"></script>
	</head>
	<cfif structKeyExists(form,"submitbtn")>
		<cfset reMatch ="#reMatch(form.cap,form.captchabox)#">
		<cfif reMatch.len() NEQ 0 >
			<cfmail to="#form.mail#" from="senthilkumar1410kamaraj@gmail.com" subject="Subscription Mail" type="html" server="localhost">
					Hi #form.usrName# <p>Thanks for subscribing</p>
			</cfmail>
			<cflocation url="welcome.cfm" addToken="false">
		<cfelse>
			<h3 class="text-center mx-auto text-danger">INVALID CAPTCHA</h3>
		</cfif>
	</cfif>
	<body>
		<button type="button" class="btn btn-primary invisible modalBtn" data-bs-toggle="modal" data-bs-target="##staticBackdrop">
			Launch static backdrop modal
		</button>

		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" 	 aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">OOPS!</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p id="display1" class="text-danger"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<form name="captchaForm" method= "post" class="mx-5 mt-3"  id="captchaForm">
			<h3 class="text-center mx-auto text-light mt-3">Subscribe to our newsletter</h3>
			<cfset randCaptcha = createUUID()>
			<cfset newCaptcha = listFirst(randCaptcha ,"-")>
			<div class="col-sm-12 w-25 bg-light text-white text-center rounded mx-auto text-center">
				<div class="col-sm text-center mt-5 p-3">
					<label class="text-info">Enter the username:</label>
					<input type="text" name="usrName" id="usrName" class="form-control mx-auto w-50 " placeholder="Enter your name">
				</div>
				<div class="col-sm text-center mt-2 p-3">
					<label class="text-info">Enter your email:</label>
					<input type="text" name="mail" id="mailID" class="form-control mx-auto w-50 " placeholder="Enter the email">
					<input type="hidden" name="cap" value="#newCaptcha#">
				</div>
				<div class="col-sm text-center p-3">
					<div><cfimage action="captcha" width="200" height="50" text="#newCaptcha#" difficulty="low" fontSize="18" fonts="Comic Sans MS,Times New Roman"></div>
					<input type="text" name="captchabox" id="captchabox" class="form-control mx-auto w-50 mt-2" placeholder="Enter the captcha here">
				</div>
				<div class="col-sm text-center mt-2 p-3">
					<input type="submit" value="Subscribe" name="submitbtn" id="submit" class=" btn-warning text-dark
				btn-lg  btn">
				</div>
			</div>
		</form>		

		<script>
			$("##usrName").focus();
			$("form").on("submit", function(){
				var username = $("##usrName").val();
				var mail = $("##mailID").val();
				var capID = $("##captchabox").val();
				var mail_regex =  /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
				
				if(username ==""){
					$("##display1").html("Give your name to proceed");
					$('.modalBtn').trigger('click');
					return false;
				}else if(mail==""){
					$("##display1").html("Give your mailID to proceed");
					$('.modalBtn').trigger('click');
					return false;
				}else if(!mail_regex.test(mail)){
					$("##display1").html("Enter a valid email");
					$('.modalBtn').trigger('click');
					return false;
				}else if(capID ==""){
					$("##display1").html("Enter the Captcha");
					$('.modalBtn').trigger('click');
					return false;
				}else{}
			});
		</script>
		<style>
			body {
				background-image: url('./assets/images/h.jpg');
			}
		</style>
	</body>

</cfoutput>