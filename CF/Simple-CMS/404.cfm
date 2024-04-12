<script src="./assets/js/jquery.min.js"></script>
<link rel="stylesheet" href="./assets/css/style.css">


<cfif structkeyexists(form,"submit")>
    <cflocation url="index.cfm" addToken="false">
</cfif>


<body>
    <form method="post">
        <input  type="submit" name="submit" value= "Go to Home" id="gobackbtn "class=" btn bg-dark rounded text-warning p-2" 
        style="position:absolute; top: 80%;left: 47%;">
    </form>
</body>

<style>
    body {
    width:100%; height:100%; 
      background:#fff url("./assets/images/error.jpg") center center no-repeat;
      background-attachment: fixed;
      background-size:100% auto;
    
    }
</style>

