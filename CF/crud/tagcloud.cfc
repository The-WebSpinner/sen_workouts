<cfcomponent>
    <cffunction name="insertData" access="remote" returnType="void">
        <cfargument name="Firstname" required="true" type="string">
        <cfargument name="last" required="true" type="string">
        <cfargument name="email" required="true" type="string">
        <cfargument name="age" required="true" type="numeric">
        <cfargument name="gender" required="true" type="string">
        <cfargument name="location" required="true" type="string">


        <cfquery name="employeeTbl" dataSource="sen_dsn">
            INSERT INTO test(FirstName,LastName,Email,age,Gender,Location) 
            values(
                <cfqueryparam value="#arguments.Firstname#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.last#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.age#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#arguments.gender#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.location#" cfsqltype="cf_sql_varchar">
                
            )
        </cfquery>
    </cffunction>

    <cffunction name="getData" access="public" returnType="query">
         <cfargument name="ID" required="false" type="string" default="">
        <!---  <cfdump  var="#arguments#">
         <cfabort> --->

        <cfquery name="employeeTbl" dataSource="sen_dsn">
            SELECT * FROM test
            <cfif len(arguments.id)>
                 WHERE Id= <cfqueryparam value="#arguments.ID#" cfsqltype="cf_sql_integer">;
            </cfif>
        </cfquery>

        <cfreturn employeeTbl>
    </cffunction>

    <cffunction name="updateData" access="Public" returnType="void">
        <cfargument name="ID" required="true" type="numeric">
        <cfargument name="Firstname" required="true" type="string">
        <cfargument name="last" required="true" type="string">
        <cfargument name="email" required="true" type="string">
        <cfargument name="age" required="true" type="numeric">
        <cfargument name="gender" required="true" type="string">
        <cfargument name="location" required="true" type="string">

        <cfquery name="employeeTbl" dataSource="sen_dsn">
            UPDATE test
            SET FirstName =  <cfqueryparam value="#arguments.Firstname#" cfsqltype="cf_sql_varchar">,
                LastName =  <cfqueryparam value="#arguments.last#" cfsqltype="cf_sql_varchar">,
                Email =  <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
                age =  <cfqueryparam value="#arguments.age#" cfsqltype="cf_sql_integer">,
                Gender =  <cfqueryparam value="#arguments.gender#" cfsqltype="cf_sql_varchar">,
                Location =  <cfqueryparam value="#arguments.location#" cfsqltype="cf_sql_varchar">
            WHERE Id= <cfqueryparam value="#arguments.ID#" cfsqltype="cf_sql_integer">;
    
        </cfquery>
    </cffunction>

    <cffunction name="deleteData" access="Public" returnType="void">
        <cfargument name="ID" required="true" type="numeric">
        <cfquery name="employeeTbl" dataSource="sen_dsn">
            DELETE FROM test WHERE ID = <cfqueryparam value="#arguments.ID#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>
</cfcomponent>