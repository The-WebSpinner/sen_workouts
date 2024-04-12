<cfoutput>
    <!DOCTYPE html>
<html>
   <head>
		<title>Signup page</title>
		<link rel="icon" type="imageicon" href="./assets/images/add-friend.png">
		<link rel="stylesheet" href="./assets/css/style.css">
		<script src="./assets/js/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    </head>
	
    <body>
		<form name="signupForm" method="post" class=" body container mt-5 mx-auto w-50" id="signupForm">
			<div class="col-sm-12  bg-muted text-white text-center">
				<img src="./assets/images/add-friend.png " height="10%" width="10%" class="image">
				<h2 class="text-warning">New User - Sign up</h2>
				<div class=" container mx-auto">
					<label for="usrTxtbox" class="form-label text-dark mt-2"><h5>Give Your Username</h5></label><br/>
					<input type="text" name="usrTxtbox" id="usrName" class="form-control mx-auto textcss1 w-50 align-center" placeholder="Enter the username">
					<p class="text-danger" id="display1"></p>
				</div>
				<div class=" container mx-auto">
					<label for="usrPassword" class="form-label text-dark mt-2"><h5>Give Your Password</h5></label><br/>
					<input type="text" name="usrPassword" id="usrPass" class="form-control mx-auto w-50 textcss2 " placeholder="Enter the password">
					<div class="mt-2"><b></b><p class="text-danger display2" id="display2"></b></p></div>
				</div>
				<input type="submit" value="Sign Up" name="signupBtn" class=" btn-dark mt-5 mb-5
					btn-lg btn" ></br>
				<a href="index.cfm" class="text-warning">Back to Login</a>
			</div>
		</form>


		<cfif structKeyExists(form,"signupBtn")>
			<cfset application.userObj.insertData(username=form.usrTxtbox, password=form.usrPassword)>
		</cfif>
		<style>
			body::after {
				content: "";
				background: url(./assets/images/h.jpg);
				opacity:100%;
				top: 0;
				left: 0;
				bottom: 0;
				right: 0;
				position: absolute;
				z-index: -1;   
			}
			.display2	{
				text-shadow: 0 0 10px ##ffff00;
			}
			.textcss1	{
				box-shadow: 2px 2px 3px ##FF0000, 0 0 5px ##0000FF;
			}
			.textcss2 	{
							
				box-shadow: 2px 2px 3px ##FF0000, 0 0 5px ##0000FF;
			}	
			.btn{
				box-shadow:2px 2px px ##41D3BD, 0 0 5px ##FFFFF2;
			}
		
		</style>
		
    </body>
	<script>
		$(document).ready(function(){
			$("##display2").css("display","none")
		})
		$("##signupForm").on("submit", function(){
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
			}else{
				alert("Signup Successfull")
				$('form').reset();
			}	
  		});		
		
	</script>
</cfoutput>