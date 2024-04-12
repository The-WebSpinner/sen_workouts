<cfoutput>
    <!DOCTYPE html>
    <head>
		<title>Sending Mail</title>
		<link rel="icon" type="imageicon" href="./images/password.png">
		<link rel="stylesheet" href="./assets/css/style.css">
		<script src="./assets/jquery/jquery.min.js"></script>
    </head>

	<cfif NOT directoryExists(expandpath('./assets/uploaded'))>
		<cfset directoryCreate(expandpath('./assets/uploaded'))>
	</cfif>

    <cfif structKeyExists(form,"submit")>
        <cfset name = form.nameTxt>
        <cfset mail = form.maidId>
        <cfset wish = form.Message>
        <cffile 
			action="upload"  
			destination="#expandpath('./assets/uploaded/test.jpeg')#" 
			nameconflict="MakeUnique" 
			result="uploadedimg"
                
        >
        <cfmail to="#mail#" from="senthilkumar1410kamaraj@gmail.com" subject="Birthday Mail" type="html" server="localhost">
                 Dear,#name#
                <p>"#wish#"</p>

                <cfimage
	            action="writeToBrowser"
	            source="#expandpath('./assets/uploaded/#uploadedimg.serverfile#')#"
                width="150" 
                height="150 "
	            />
        </cfmail>
    </cfif>

    <body>
		<form name="birthdayForm" method="post" class=" container mt-5 mx-auto w-50 " id="birthdayForm" enctype="multipart/form-data".>
			<div class="col-sm-12 bg-dark text-white text-center rounded">
				<div class="col-sm-12  text-center mx-auto w-50">
					<h2 class="text-warning">Send wishes to your favorites </h2>
				</div>
				<div class=" container mx-auto">
					<label for="name" class="form-label text-info mt-2"><h5>Name of Birthday Celebrant</h5></label><br/>
					<input type="text" name="nameTxt" id="nameTxt" class="form-control mx-auto  w-50 align-center" placeholder="Enter the name" >
				</div>         
                <div class=" container mx-auto">
					<label for="mailID" class="form-label text-info mt-2"><h5>Birthday Celebrant MailId</h5></label><br/>
					<input type="text" name="maidId" id="maidId" class="form-control mx-auto  w-50 align-center" placeholder="Enter the mailId" value="">
				</div>       
                <div class=" container mx-auto p-3">
					<label for="file" class="form-label text-info mt-2"><h5>Greeting Image</h5></label><br/>
					<input type="file" name="greetFile" id="greetFile" class="form-control mx-auto  w-50 align-center" placeholder="Enter the username" >
				</div> 
                <div class=" container row-sm-12 mx-auto">
					<label for="wishes" class ="form-label text-info mt-2"><h5>Birthday Wish</h5></label><br/>
					<textarea id="Message" name="Message" class="form-control"></textarea>
				</div> 
                <button type= "submit" class="btn-success btn-lg mt-3 mb-1 "  name="submit">Send Mail</button>
                <h4 class="text-center mx-auto text-danger p-3" id="display1"></h4>        
            </div>
        </form>

    </body>
    <script>
		$("##birthdayForm").on("submit", function(){
            let Name = $("##nameTxt").val();
            let MailId=$("##maidId").val();
            var mailExp = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            let myfile=$("##greetFile").val();

			if(Name== "" ){
				$("##display1").text("Give Birthday Celebrant name to proceed");
			    return false;
			}else if(MailId == ""){
				$("##display1").text("Give Celebrant mailID to proceed");
			    return false;
			}else if(!(mailExp.test(MailId))) {
				$("##display1").text("Enter a valid email");
			return false;
            }else if(myfile == ""){
				$("##display1").text("Upload Greeting image to proceed");
			return false;
			}else{}
		})
    </script>
</cfoutput>    
