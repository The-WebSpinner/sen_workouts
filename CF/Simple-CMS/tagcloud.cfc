
<cfcomponent>
    <cffunction name="getData" access="public" returnType="query">
        <cfargument name="username" required="true" type="string">
        <cfargument name="password" required="true" type="string">

        <cfquery name="credTbl">
            SELECT * FROM simplecms
            WHERE username= <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
            AND   pwd= <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar"> 
        </cfquery>

        <cfreturn credTbl>
    </cffunction>

    <cffunction name="insertformData" access="public" returnType="void">
        <cfargument name="pageName" required="true" type="string">
        <cfargument name="desc" required="true" type="string">

         <cfquery name="dataTbl">
            INSERT INTO list(Name,Description) 
            values(
                <cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.desc#" cfsqltype="cf_sql_varchar"> 
            )
        </cfquery>
    </cffunction>

    <cffunction name="getformdata" access="public" returnType="query">
        <cfargument name="ID" required="false" type="string" default="">

        <cfquery name="formdataTbl">
            SELECT * FROM list
            <cfif len(arguments.ID)>
                WHERE ID= <cfqueryparam value="#arguments.ID#" cfsqltype="cf_sql_integer">
            </cfif>
        </cfquery>

        <cfreturn formdataTbl>
    </cffunction>

    <cffunction name="deleteData" access="Public" returnType="void">
        <cfargument name="ID" required="true" type="numeric">
        
        <cfquery name="formdataTbl">
            DELETE FROM list  WHERE ID = <cfqueryparam value="#arguments.ID#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>

    <cffunction name="updateformData" access="Public" returnType="void">
        <cfargument name="pageName" required="true" type="string">
        <cfargument name="desc" required="true" type="string">

        <cfquery name="updateTbl">
            UPDATE list SET 
            Name =  <cfqueryparam value="#arguments.pageName#" cfsqltype="cf_sql_varchar">,
            Description =  <cfqueryparam value="#arguments.desc#" cfsqltype="cf_sql_varchar">
            WHERE Id= <cfqueryparam value="#arguments.ID#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>
</cfcomponent>