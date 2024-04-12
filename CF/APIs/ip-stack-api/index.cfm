

<cfoutput>
    <!DOCTYPE html>
    <head>
		<title></title>
		<link rel="icon" type="imageicon" href="./assets/images/login.png">
		<link rel="stylesheet" href="./assets/css/style.css">
		<script src="./assets/js/jquery.min.js"></script>
    </head>
    
    <body>
		<form name="form1" method="post" class=" container mt-5 mx-auto w-50" id="form1">
			<div class="col-sm-12 p-3 bg-primary text-white text-center rounded">
				<div class="col-sm-12  text-center mx-auto w-50 ">
					<h2 class="text-warning">Enter Your IP ADDRESS</h2>
				</div>
				<div class=" container mx-auto">
					<input type="text" name="usrTxtbox" id="IP" class="form-control mx-auto  w-50 align-center" placeholder="Enter IP" value="">
				</div>
                <div class=" container mx-auto p-3 text-center ">
					<input type="submit" value="submit" name="submit" id="submit" class=" btn-success text-light btn"></br>
				</div>
            </div>
            <h5 class="text-danger mx-auto text-center mt-3" id="display2"></h5>
        </form>

        
        <cfif structKeyExists(form,"submit")>
            <cfset dataOBJ = createObject("component","tagcloud")>
            <cfset IP = dataOBJ.getData(IpAddress=form.usrTxtbox)>
            <cfif IP.Statuscode EQ '200 OK'>
                <cfset result2=deserializeJSON(IP.filecontent)>
                <table class="table table-hover table-bordered w-50 table-fixed mx-auto text-center mt-2">
                    <tbody> 
                        <cfloop collection ="#result2#" item="key">
                            <cfif key NEQ "location">
                                <tr class="table-dark">
                                    <td>#key#</td>
                                    <td>#result2[key]#</td>
                                </tr>
                            <cfelseif key NEQ "languages">
                                <cfloop collection ="#result2.location#" item="locationKey">
                                    <cfif locationKey NEQ 'languages'>
                                        <tr class="table-dark">
                                            <td>#locationKey#</td>
                                            <td>#result2.location[locationKey]#</td>
                                        </tr>
                                    </cfif>
                                </cfloop>
                            </cfif>
                        </cfloop>
                    </tbody>
                </table>
            </cfif>
        </cfif>
    </body>

    <script>
		 $(document).ready(function(){
            $('##IP').focus();
            $('##IP').on('input', function(e) {
				$("##display2").css("display","none")
			})
         })
        $("##form1").on("submit", function(){
		$("##display2").css("display","block")
		$("##display1").css("display","block")
         
        let ipBox = $("##IP").val();
        if(ipBox == "") {
            $("##display2").text("Enter IP Address to proceed");
            $('##IP').focus();
            return false;
        }
         })
    </script>

</cfoutput>
