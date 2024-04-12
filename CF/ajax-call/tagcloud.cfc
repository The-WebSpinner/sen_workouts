<cfcomponent>
    <cffunction  name="insertdata" access="remote" returntype = "string" returnformat="json">
            <cfquery name="ajaxinsert" datasource = "sen_dsn">
                INSERT into ajax (Name,email)
                values(
                     <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar">,
                      <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
            <cfreturn 0>
        
    </cffunction>


    <cffunction  name="getdata" access="remote" returntype = "string" returnformat="json">

        <cfargument  name="name" required="True" type="string">
        <cfargument  name="email" required="True" type="string">
    
        <cfquery name="ajaxget" dataSource="sen_dsn">
            SELECT * FROM ajax
            WHERE email = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfif ajaxget.recordcount>
            <cfreturn 1>
        <cfelse>
            <cfreturn 0>
        </cfif>
        
    </cffunction>
</cfcomponent>