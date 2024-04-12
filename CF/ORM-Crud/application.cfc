<cfset THIS.name = "#createUUID()#">
<cfset THIS.ormenabled = "true">
<cfset THIS.datasource = "sen_dsn">
<cfset THIS.ormsettings={dbcreate="update"}>

<cffunction name ="onError" returnType="void">
    <cfargument name="Exception" required='true'>
   <!---  <cfdump  var="#arguments.exception#"> --->


    <cfsavecontent  variable="log">
        <cfoutput>
        
            #arguments.exception.message#<br>
            #arguments.exception.Detail#<br>
            #arguments.exception.tagcontext[1].raw_trace#<br>

        </cfoutput>
    </cfsavecontent>
    <cflog file="myAppLog" text="#log#" type="information" >
    <cfmail  to="sen@gmail.com" from="senthilkumar1410kamaraj@gmail.com" subject="Exception from ORM Task" server="localhost" type="html">
        <cfdump var="#arguments.exception#">
    </cfmail>
    

    <cfinclude template="404.cfm">
</cffunction> 