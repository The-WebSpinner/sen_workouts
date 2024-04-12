<cfcomponent>
	<cfset this.name="zdghssdadasdsgha">
	<cfset this.sessionmanagement = "true">
	<cfset this.dataSource="sen_dsn">

	<cffunction name="onApplicationStart">
		<cfset APPLICATION.dataOBJ = createObject("component","tagcloud")>
	</cffunction>
	
	<cffunction name="onRequestStart">
		<cfif (NOT isDefined('SESSION.role') AND listLast(CGI.SCRIPT_NAME, '/') EQ 'list.cfm') OR (NOT isDefined('SESSION.role') 
			AND listLast(CGI.SCRIPT_NAME, '/') EQ 'form.cfm')>
			<cflocation  url="index.cfm" addtoken="false">
		<cfelseif ( isDefined('SESSION.role') AND listLast(CGI.SCRIPT_NAME, '/') EQ 'index.cfm')
			OR (( isDefined('SESSION.role') AND  SESSION.role EQ 'User')  AND listLast(CGI.SCRIPT_NAME, '/') EQ 'form.cfm')> 
			<cflocation  url="list.cfm" addtoken="false">
		<cfelseif (isDefined('SESSION.role') AND ((  SESSION.role EQ 'Admin' OR SESSION.role EQ 'Editor') 
			AND listLast(CGI.SCRIPT_NAME, '/') EQ 'index.cfm'))> 
			<cflocation  url="list.cfm" addtoken="false">
		<cfelseif (isDefined('SESSION.role') AND ((  SESSION.role EQ 'Admin' OR SESSION.role EQ 'Editor') 
			AND listLast(CGI.SCRIPT_NAME, '/') EQ 'index.cfm'))> 
			<cflocation  url="list.cfm" addtoken="false">
		</cfif>
	</cffunction>
</cfcomponent>
