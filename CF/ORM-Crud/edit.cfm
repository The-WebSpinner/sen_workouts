<cfoutput>
    <head>
		<title>ORM EDIT</title>
		<link rel="stylesheet" href="./assets/css/style.css">
		<script src="./assets/js/jquery.min.js"></script>
    </head>
    <cfset editData= EntityLoadbypk("table",url.id)>
    <cfif structKeyExists(form,"submitBtn")>
        <cfif  structKeyExists(url,"id")>
            <cfset editData.setFIRSTNAME(FORM.firstName)>
            <cfset editData.setLASTNAME(FORM.secondName)>
            <cfset editData.setAge(FORM.Age)>
            <cfset editData.setLocation(FORM.Location)>
            <cfset EntitySave(editData)>
            <cflocation  url="list.cfm">
        </cfif>
    </cfif>
    <cfdump  var="var">

    

    <form method="post" class=" container mt-5 mx-auto w-50">
        <div class="col-sm-12  bg-dark text-white text-center rounded">
            <div>
                <label for="textbox1" class="form-label text-info mt-2">First Name:</label>
                <input type="text" name="firstName" class="form-control mx-auto  w-50 align-center" value="#editData.getFIRSTNAME()#">
            </div>
            <div>
                <label for="textbox2" class="form-label text-info mt-2">Second Name:</label>
                <input type="text" name="secondName" class="form-control mx-auto  w-50 align-center"  value="#editData.getLASTNAME()#">
            </div>
            <div>
                <label for="textbox3" class="form-label text-info mt-2">Age:</label>
                <input type="text" name="Age" class="form-control mx-auto  w-50 align-center"  value="#editData.getAge()#">
            </div>
            <div>
                <label for="textbox4" class="form-label text-info mt-2">Location:</label>
                <input type="text" name="Location" class="form-control mx-auto  w-50 align-center"  value="#editData.getLocation()#">
            </div>
            <div class="mt-3 p-3">
                <input type = "submit" name="submitBtn" class=" buttton btn-success  mx-auto align-center">
            </div>
        </div>
    </form>
</cfoutput>