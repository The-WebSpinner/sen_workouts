<cfoutput>
<cfparam name="empInfo.FirstName" default="">
<cfparam name="empInfo.LastName" default="">
<cfparam name="empInfo.Email" default="">
<cfparam name="empInfo.age" default="">
<cfparam name="empInfo.Gender" default="">
<cfparam name="empInfo.location" default="">

<html>
   <head>
		<title>Simple CMS</title>
		<link rel="icon" type="imageicon" href="./assets/images/table.png">
		<link rel="stylesheet" href="./assets/css/style.css">
		<script src="./assets/js/jquery.min.js"></script>
   </head>
   <cfset employeeObJ = createObject("component","tagcloud")>

   <cfif structKeyExists(url,"id")>
    <cfset empInfo = employeeObj.getData("#url.id#")> 
    </cfif>

    <cfif structKeyExists(form,"submit")>
        <cfif structKeyExists(url,"id")>
            <cfset employeeObj.updateData(id=url.id,Firstname=form.fName,last=form.lName,email=form.mailId,age=form.age_box,gender=form.gender,location=form.location_box)>
        <cfelse>
            <cfset employeeObj.insertData(Firstname=form.fName, last=form.lName,email=form.mailId,age=form.age_box,gender=form.gender,location=form.location_box)>
        </cfif>
        <cflocation url="form.cfm" addToken="false">
    </cfif>
     
<form name="newform" method="post" onSubmit="return validateform();" class="mt-5" id="myform">
          <div class=" container-fluid mx-auto w-50">
              <div class="row text-center">
                <div class="col-sm-12 p-3 bg-primary text-white"><h3>Simple CMS </h3></div>
              </div>
              <div class="row mt-0 p-3 bg-dark text-white rounded">
                <div class="row">
                    <div class="col-sm-6">
                      <label for="firstName" class="form-label text-info"> FirstName:*</label><br />
                    </div>
                    <div class="col-sm-6">
                      <label for="LastName" class="form-label text-info"> LastName:*</label><br />
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                      <input type="text" placeholder="enter your FirstName" class="form-control" name="fName" id="FNAME" value="#empInfo.FirstName#" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" placeholder="enter your lastname" class="form-control" name="lName"id="LNAME"value="#empInfo.LastName#" /><br />
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                      <label for="firstName" class="form-label text-info"> E-mail:*</label>
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col-sm-12">
                      <input type="text" placeholder="enter your email" class="form-control" name="mailId"id="EMAIL"value="#empInfo.Email#" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4 ">
                      <label for="gender" class="form-label text-info">Gender:*</label>
                    </div>
                    <div class="col-sm-4">
                      <label for="age" class="form-label text-info"> Age:*</label>
                    </div>
                    <div class="col-sm-4">
                      <label for="Location" class="form-label text-info"> Location:*</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                      <input type="radio" id="male" name="gender" value="male"<cfif empInfo.Gender eq "male">Checked</cfif>/>
                      <label for="gender" class="name"> Male</label>
                      <input type="radio" id="female" name="gender" value="Female" <cfif empInfo.Gender eq "female">Checked</cfif>/>
                      <label for="gender" class="name"> Female</label>
                    </div>
                    <div class="col-sm-4">
                      <input type="text" placeholder="enter your age" name="age_box" id="AGE" value="#empInfo.age#" />
                      
                    </div>
                    <div class="col-sm-4">
                      <input type="text" placeholder="enter your location" name="location_box" id="location" value="#empInfo.Location#" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4 mx-auto text-center">
                    <button type="reset" id="clear" class="btn btn-sm btn-outline-Danger mt-5">Clear Form</button>
                    </div>
                    <div class="col-sm-4 mx-auto text-center">
                    <a href="form.cfm" class="btn btn-outline-warning btn-sm mt-5 ">View Data</a>
                    </div>
                    <div class="col-sm-4 mx-auto text-center">
                    <input type="submit" value="submit" name="submit" class="btn-sm btn-success mt-5">
                    </div>
                    
                </div>
              </div>
          </div>
          </div>
        </form>
    </body>
    <script>
  function validateform() {

    let fname = document.forms["newform"]["fName"].value;
    let lname = document.forms["newform"]["lName"].value;
    let email = document.forms["newform"]["mailId"].value;
    let agecheck = document.forms["newform"]["age_box"].value;
    let arealocation = document.forms["newform"]["location_box"].value;

    var mailExp = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    
    if(fname == "") {
      alert("First Name must be filled")
      return false;
    }else if(lname == "") {
      alert(" LastName must be filled");
      return false;
    }else if (email == "") {
      alert("Email field must be filled");
      return false;
    }else if (!(mailExp.test(email))) {
		alert("Please enter valid email");
		return false;
	}else if (agecheck == "") {
      alert("Enter your age");
	  return false;
	 } 
	 else if (arealocation==""){
      alert("Enter your location");
    return false;
   }
   else{}
	 }
  
  
</script>
</cfoutput>