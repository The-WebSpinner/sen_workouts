<cfoutput>
    <!DOCTYPE html>
    <head>
		<title>Login Page</title>
		<link rel="icon" type="imageicon" href="./assets/images/login.png">
		<link rel="stylesheet" href="./assets/css/style.css">
		<link rel="stylesheet" href="./assets/css/style1.css">
		<script src="./assets/js/jquery.min.js"></script>
    </head>
	
    
    <cfif structKeyExists(form,"LoginBtn")>
        <cfset checkLogin = APPLICATION.dataOBJ.getData(username=form.usrTxtbox, password=form.passTxtbox)>
        <cfif checkLogin.recordcount>
			<cfset SESSION.Role = checkLogin.Role />
            <cflocation url="list.cfm" addToken="false">
        <cfelse>
            <div class="mt-5 mx-auto text-center"><h5 class="text-danger" id="inval">INVALID LOGIN CREDENTIALS</h5></div>
        </cfif>
    </cfif>
    <body>
		<form name="loginForm" method="post" class=" container mt-5 mx-auto w-50 " id="loginForm">
			<div class="col-sm-12 p-3 bg-white button-27 text-white text-center rounded">
				<div class="col-sm-12  text-center mx-auto w-50 ">
					<img src="./assets/images/password.png " height="10%" width="10%">
					<h2 class="text-light">LOGIN</h2>
				</div>
				<div class=" container mx-auto">
					<label for="usrTxtbox" class="form-label text-dark mt-2"><h5>Username *</h5></label><br/>
					<input type="text" name="usrTxtbox" id="usrName" class="form-control mx-auto  w-50 align-center" placeholder="Enter the username" value="">
					<h5 class="text-danger" id="display1"></h5>
				</div>
                <div class=" container mx-auto p-3">
					<label for="usrTxtbox" class="form-label text-dark mt-2"><h5>Password *</h5></label><br/>
					<input type="text" name="passTxtbox" id="passWord" class="form-control mx-auto  w-50 align-center" placeholder="Enter the password" value="">
					<h5 class="text-danger" id="display1"></h5>
					<h5 class="text-danger" id="display2"></h5>
				</div>
                <div class=" container mx-auto p-3 text-center ">
					<input type="submit" value="Login" name="LoginBtn" id="submit" class=" btn-success button-69 text-dark 
				      btn"></br>
				</div>
        </form>
		<style>
			body {
				background-color: ##000000;
			} 
		</style>
    </body>

	<script>
		 $(document).ready(function(){
			$("##display2").css("display","none")
			$('##usrName,##passWord').on('input', function(e) {
				$('##inval').hide();
				$("##display2").css("display","none")
				$("##display1").css("display","none")
			})
			$('##usrName').focus();
		}); 
		
		$("##loginForm").on("submit", function(){
			$("##display2").css("display","block")
			$("##display1").css("display","block")
			
			let usrName = $("##usrName").val();
			let pass = $("##passWord").val();
			
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
