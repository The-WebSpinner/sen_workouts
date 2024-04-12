<cfoutput>
    <!DOCTYPE html>
    <head>
		<title>Login Page</title>
		<link rel="icon" type="imageicon" href="./assets/images/add-friend.png">
		<link rel="stylesheet" href="./assets/css/style.css">
		<script src="./assets/js/jquery.min.js"></script>
    </head>
	
    <body>
		<form name="loginForm" method="post" class=" container mt-5 mx-auto w-50" id="loginForm">
			<div class="col-sm-12  bg-muted text-white text-center rounded">
				<div class="col-sm-12  text-center mx-auto w-50">
					<img src="./assets/images/password.png " height="10%" width="10%">
					<h2 class="text-light">USER LOGIN </h2>
				</div>
				<div class=" container mx-auto">
					<label for="usrTxtbox" class="form-label text-info mt-2"><h5>Username</h5></label><br/>
					<input type="text" name="usrTxtbox" id="usrName" class="form-control mx-auto  w-50 align-center" placeholder="Enter the username" value="">
					<h5 class="text-danger" id="display1"></h5>
				</div>
				<div class=" container mx-auto">
					<label for="usrPassword" class="form-label text-info mt-2"><h5>Password</h5></label><br/>
					<input type="text" name="usrPassword" id="usrPass" class="form-control mx-auto w-50 " placeholder="Enter the password">
					<div class="mt-2"><h5 class="text-danger" id="display2"></h5></div>
					<cfif structKeyExists(form,"LoginBtn")>
						<cfset checkLogin =application.userObj.getData(username=form.usrTxtbox, password=form.usrPassword)>
						<cfif checkLogin.recordcount>
							<cfset session.username = checkLogin.username />
							<cfdump var="#session#">
							<cflocation url="welcomepage.cfm" addToken="false">
						<cfelse>
							<div class="mt-2"><h5 class="text-danger" id="inval">INVALID LOGIN CREDENTIALS</h5></div>
						</cfif>
					</cfif>
				</div>
				<input type="submit" value="Login" name="LoginBtn" id="submit" class=" btn-dark text-white
				btn-lg  btn"></br>
				<div class="p-2" >
					<span>New User?</span>
					<a href="signup.cfm" class="text-warning">Sign Up</a>
				</div>
			</div>
		</form>
		<style>
        body {
            background-image: url('./assets/images/rr.jpg');
        	background-size: cover;
            }
		.btn{
			width:175px;
		}
        </style>
    </body>
	<script>
		$(document).ready(function(){
			$("##display2").css("display","none")
			$('##usrName,##usrPass').on('input', function(e) {
				$('##inval').hide();
			})
			$('##usrName').focus();
		})

		
		$("##loginForm").on("submit", function(){
			$("##display2").css("display","block")
			let usrName = $("##usrName").val();
			let pass = $("##usrPass").val();
			
			if(usrName == "" && pass == "") {
				$("##display2").text("Enter Username and Password");
			return false;
			}else if(usrName == ""){
				$("##display1").text("Enter Username");
				$("##display2").css("display","none")
			return false;
			}else if(pass == ""){
				$("##display2").text("Enter Password");
				$("##display1").css("display","block")
			return false;
			}else{}
		})
	</script>
</cfoutput>
