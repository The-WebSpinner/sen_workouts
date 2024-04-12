<cfoutput>
<!DOCTYPE html>
<html>
   <head>
		<title>Table Entry</title>
		<link rel="icon" type="imageicon" href="./assets/images/table.png">
		<link rel="stylesheet" href="./assets/css/style.css">
		<script src="./assets/js/jquery.min.js"></script>
   </head>
   <cfset employeeObJ = createObject("component","tagcloud")>
   <cfif structKeyExists(url,"id")>
    <cfset empInfo = employeeObj.deleteData("#url.id#")> 
	<cflocation url="form.cfm" addToken="false">
    </cfif>
   
      <cfset empInfo = employeeObj.getData()> 
	 
    <table class="table table-hover table-bordered w-auto table-fixed mx-auto text-center">
		<thead>
			<th><a href="index.cfm" class="btn btn-warning btn-sm">Back</a></th>
			<th><a href="index.cfm" class="btn btn-success btn-sm ">ADD NEW </a></th>
			<tr class="table-dark">
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
			<th>Age</th>
			<th>Gender</th>
			<th>Location</th>
			<th colspan = "2">Update/Delete</th>
			</tr>
		</thead>
      	<tbody>
			<cfloop query="#empinfo#">
				<tr class="table-primary">
				<td>#empinfo.FirstName#</td>
				<td>#empinfo.LastName#</td>
				<td>#empinfo.Email#</td>
				<td>#empinfo.age#</td>
				<td>#empinfo.gender#</td>
				<td>#empinfo.Location#</td>
				<td>
				<a href="index.cfm?id=#empinfo.ID#" class="btn btn-info">Edit</a>
				</td>
				<td><input type="button" class="btn btn-danger delete_btn" id="delete_btn" data-id="#empinfo.ID#" value="Delete"></td>
				</tr>
          </cfloop>
      </tbody>
    </table>
    <body>
	<script>
		$(".delete_btn").on("click",function(){
			var tblId = $(this).attr('data-id');
			/* var tblId = $(this).data('id'); */
			if (confirm("You Sure you want to delete?") == true) {
				window.location.href = `${window.location.href}?id=${tblId}`;
			} else {
				window.location.href = window.location.href;
			}
		});
	</script>    
</html>

</cfoutput>