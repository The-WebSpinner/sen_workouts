 <cfoutput>
	<!DOCTYPE html>
	<head>
		<title>ORM</title>
		<link rel="stylesheet" href="./assets/css/style.css">
		<script src="./assets/js/jquery.min.js"></script>

	</head>
	<cfset crud = EntityLoad("table")>
	<cfif structKeyExists(url,"id")>
		<cfset deleteData = EntityLoadbypk("table",url.id)>
		<cfset EntityDelete(deleteData)>
		<cflocation  url="list.cfm" addtoken="false">
	</cfif>
	<div class = "mx-auto text-center p-3">
		<a href="index.cfm" class="btn btn-success btn-sm ">ADD NEW </a>
	</div>
	<table class="table table-hover table-bordered w-auto table-fixed mx-auto text-center">
		<thead>
			<tr class="table-dark">
				<th>First Name</th>
				<th>Last Name</th>
				<th>Age</th>
				<th>Location</th>
				<th colspan = "2">Update/Delete</th>
			</tr>
		</thead>
		<tbody>
			<cfloop array="#crud#" index="item">
				<tr class="table-primary">
					<td>#item.getFirstName()#</td>
					<td>#item.getLastName()#</td>
					<td>#item.getage()#</td>
					<td>#item.getlocation()#</td>
					<td><a href="edit.cfm?id=#item.getid()#" class="btn btn-info">Edit</a></td>
					<td><a href="list.cfm?id=#item.getid()#" class="btn btn-danger">Delete</a></td>
				</tr>
			</cfloop>
		</tbody>
	</table>
</cfoutput>