<cfoutput>
	<html>
		<head>
			<title>List Function</title>
			<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
			<script src="./assets/js/jquery.js"></script>
			<link rel="icon" href="./images/task.png">
		</head>
		<body>
			<form  method="post" name="newform" id="form1" >
				<div class="container 3 margin-auto w-25  bg-dark text-center  mx-auto p-3 rounded mt-5">
				<h3 class = "text-warning mx-auto text-light text-center  ">List Function(divisible by 3)</h3>
					<label class = "text-warning">Enter a list: </label>
					<input type ="text" class = "textbox1 mt-3" id="textbox" name="textbox1">
					<p id ="display" class= "text-danger"></p>
					<button type="submit" id = "submit_button" class ="btn btn-success btn-sm mt-1" name="submit">Submit</button>
				</div>
			</form>
			<cfif StructKeyExists(form,"submit")>
				<cfset numbers = form.textbox1>
				<cfset newList = "">
				<cfloop index="result" list = "#numbers#">
					<cfif result mod 3 eq 0>
						<cfset newList=listAppend(newList,result)>
					</cfif> 
				</cfloop>
				<p class = "container mt-3 margin-auto w-25  bg-dark text-center text-light  mx-auto p-3 rounded">#newList#</p>
			</cfif>
		</body>
		<script>
			var array_regex = /^(\d|\w+( )*)(( )*,{1}( )*((\d|\w+(.){1}\d|\w+)|([\d|\w]+))( )*)+$/;
			$(".textbox1").focus();
			$('##form1').on("submit",function(){  
				var form_1 = $("##textbox").val();
				if(form_1==""){
					$("##display").html("TextBox Cannot be empty");
					$("##display").css("color","red");
					return false;
				}else if((isNaN(form_1)) && !(form_1.includes(","))){
					$("##display").html("Numeric values only allowed");
					$("##display").css("color","red");
					return false;  
				} else if (!array_regex.test(form_1)) {
					$("##display").html("Enter Valid List");
					$("##display").css("color","red");
					return false;
				}else{
					$("##display").hide(); 
				}
			});
		</script>
	</html>
</cfoutput>