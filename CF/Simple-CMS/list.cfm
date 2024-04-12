<cfoutput>
	<!DOCTYPE html>
	<html>
		<head>
			<title>Table Entry</title>
			<link rel="icon" type="imageicon" href="./assets/images/list.png">
			<link rel="stylesheet" href="./assets/css/style.css">
			<link rel="stylesheet" href="./assets/css/style1.css">
			<script src="./assets/js/jquery.min.js"></script>
		</head>
		<cfif structKeyExists(FORM,"LogoutBtn")>
			<cfset StructClear(SESSION)>
			<cflocation url="index.cfm" addToken="false">
		</cfif>
		<cfset dataInfo = APPLICATION.dataOBJ.getformData()> 
		<cfif structKeyExists(URL,"id")>
			<cfset empInfo = APPLICATION.dataOBJ.deleteData("#URL.id#")> 
			<cflocation url="list.cfm" addToken="false">
		</cfif>
		<body>
			<form method="post">
				<div class="text-center mx-auto mt-4"><input type="submit" value="Logout" name="LogoutBtn" id="logout" class="btn btn-danger button-92 btn-md"></div>
			</form>
				
			<div class="col-sm-12 bg-muted text-white w-25 mt-3 p-3 mx-auto text-center"><h5>List of Details</h5></div>
			<table class="table table-hover table-bordered w-50 table-fixed mx-auto text-center mt-2">
				<thead>
					<tr class="table-info">
						<th>Page Name</th>
						<th>Description</th>
						<cfif SESSION.role EQ "Editor" OR SESSION.role EQ "Admin">
							<th colspan = "2">Actions</th>
						</cfif>
					</tr>
				</thead>
				<tbody>
					<cfloop query="#datainfo#">
						<tr class="table-dark">
							<td>#datainfo.Name#</td>
							<td>#datainfo.Description#</td>
							<cfif SESSION.role EQ "Admin">
								<td><a href="form.cfm?id=#dataInfo.id#" class="btn button-91 btn-sm">Edit</a></td>
								<td><input type="button" class="btn btn-danger delete_btn btn-md button-62" id="delete_btn" data-id="#dataInfo.ID#"
								 value="Delete"></td>
							</cfif>
							<cfif SESSION.role EQ "Editor">
								<td><a href="form.cfm?id=#dataInfo.id#" class="btn button-91 btn-md">Edit</a></td>
							</cfif>
						</tr>
					</cfloop>
				</tbody>
			</table>
			<cfif SESSION.role EQ "Admin" OR SESSION.role EQ "Editor">
				<div class= "text-center mx-auto">
					<a href="form.cfm" class="btn button-85 btn-md">ADD NEW</a>
				</div>
			</cfif>
		<body>
	</html>
	<style>
		body {
			background-image: linear-gradient(to right, ##0099f7, ##f11712);
		}
	</style>
</cfoutput>

<script>
	$(".delete_btn").on("click",function(){
		var tblId = $(this).data('id'); 
		if (confirm("You Sure you want to delete?") == true) {
			window.location.href = `${window.location.href.split('?')[0]}?id=${tblId}`;
		} else {
			window.location.href = window.location.href;
		}
	});
</script>  

