 <!DOCTYPE html>
<cfoutput>
    <head>
		<title>Login Page</title>
		<link rel="icon" type="imageicon" href="./assets/images/password.png">
		<link rel="stylesheet" href="./assets/css/style.css">
		<script src="./assets/js/jquery.min.js"></script>
    </head>
    <body class="bg-dark" background="./assets/images/R.jpg">
    
    <cfif structKeyExists(form,"LogoutBtn")>
        <cfset StructClear(Session)>
        <cflocation url="index.cfm" addToken="false">
    </cfif>
        <form method="post" name="logoutform" class="mx-auto text-center">
           <!---  <img src="./images/R.jpg" alt="bgimage" > --->
           <img src="./assets/images/welcome.png " height="10%" width="10%" class="image">
            <h1 class="text-center text-light mt-3">#Session.username#</h1>
            
            <input type="submit" value="Logout" name="LogoutBtn" id="logout" class=" btn-success btn-md mt-3">
        </form>
    <style>
        body {
            background-image: url('./assets/images/R.jpg');
                }
        </style>
    </body>
</cfoutput>
