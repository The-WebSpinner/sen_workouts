 <!DOCTYPE html>
<cfoutput>
    <head>
		<title>Subscribed</title>
		<link rel="stylesheet" href="./assets/css/style.css">
    </head>
    <body class="bg-dark" background="/images/R.jpg">
        <cfif structKeyExists(form,"LogoutBtn")>
            <cflocation url="index.cfm" addToken="false">
        </cfif>
            <form method="post" name="logoutform" class="mx-auto text-center">
                <h3 class="text-center mx-auto text-light mt-3">Email Address successfully subscribed to our newsletter</h3>
                <input type="submit" value="Logout" name="LogoutBtn" id="logout" class=" btn-success btn-md mt-3">
            </form>
        <style>
            body {
                background-image: url('./assets/images/R.jpg');
                    }
            </style> 
    </body>
</cfoutput>
