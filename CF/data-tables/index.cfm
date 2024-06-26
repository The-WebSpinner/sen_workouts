<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">

<cfoutput>
	<cfset dataOBJ= createObject("component","todo")>
	<cfset dataInfo =dataOBJ.getdata()> 
		
	<div class="container mt-5 pt-5">
		<h4 class="text-success text-center">Data tables</h4>
		<table id="example" class="table table-striped table-hover table-bordered">
			<thead>
				<tr>
					<th>Name</th>
					<th>Course</th>
					<th>Department</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="#dataInfo#">
					<tr>
						<td>#dataInfo.Name#</td>
						<td>#dataInfo.Title#</td>
						<td>#dataInfo.Department#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>

		<script>
			$(document).ready(function () {
				var $showEntry = 5;
				$('##example').DataTable({
					pageLength : $showEntry,
					order: [0, 'asc']
				});

				$('div.dataTables_wrapper div.dataTables_length select').prepend( `<option value="${$showEntry}" selected> ${$showEntry} </option>` );
			});
		</script>
	</div>
</cfoutput>