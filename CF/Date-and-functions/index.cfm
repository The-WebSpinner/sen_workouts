<cfoutput>
    <head>
		<title>Date and Functions</title>
		<link rel="icon" type="imageicon" href="./assets/images/calendar.png">
		<link rel="stylesheet" href="./assets/css/style.css">
		<link rel="stylesheet" href="./assets/css/style1.css">
		<script src="./assets/js/jquery.min.js"></script>
		<script src="./assets/js/script.js"></script>
    </head>
    
	<cfset todayDate = now()>
	<cfset firstOfThisMonth = createDate(year(todayDate), month(todayDate), 1)>
	<cfset lastOfThisMonth = dateAdd("d", -1, dateAdd("m",1, firstOfThisMonth))>

	<cfloop from="1" to="7" index="i">
		<cfif dateFormat(dateAdd('d', -i, now()), 'EEEE') EQ 'Wednesday'>
			<cfset lastWednesdayDate = dateFormat(dateAdd('d', -i, now()), 'dd/mm/yyyy')>
		</cfif>
	</cfloop>


	<body class="body">
		<div class="bg-warning shadow-lg  w-25 mt-2 text-center mx-auto p-3">
			<h4 class="text-dark">Date Functions</h4>
		</div>

		<div class="bgg shadow-lg text-light w-25 mt-2 text-center mx-auto p-3">
			<p class="text-dark">Today date :<label class="text-primary">#dateFormat(todayDate, 'dd/mm/yyyy')#</label></p>
			<p class="text-dark">Current Month in numeric:<label class="text-primary">#dateFormat(todayDate, "mm")#</label></p>
			<p class="text-dark">Current Month in word:<label class="text-primary">#monthAsString(month(todayDate))#</label></p>
			<p class="text-dark">Last Wednesday date:<label class="text-primary">#lastWednesdayDate#</label></p>
			<p class="text-dark">Last day of Current Month:<label class="text-primary">#dateFormat(lastOfThisMonth, "EEEE")#</label></p>
		</div>
		<div class="bg-dark shadow-lg text-light w-25 mt-2 text-center mx-auto p-3">
			<h4 class="text-info">Last 5 dates & days</h4>
			<p class="textcolor">#dateFormat(dateAdd("d", -1,now()), 'dd-mmmm-yyyy-EEEE')#</p>
			<p class="textcolor">#dateFormat(dateAdd("d", -2,now()), 'dd-mmmm-yyyy-EEEE')#</p>
			<p class="textcolor">#dateFormat(dateAdd("d", -3,now()), 'dd-mmmm-yyyy-EEEE')#</p>
			<p class="textcolor">#dateFormat(dateAdd("d", -4,now()), 'dd-mmmm-yyyy-EEEE')#</p>
			<p class="textcolor">#dateFormat(dateAdd("d", -5,now()), 'dd-mmmm-yyyy-EEEE')#</p>
		</div>
	</body>
</cfoutput>