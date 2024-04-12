<cfcomponent>
    
    <cffunction  name="getdata" access="remote" returntype = "query">
        <cfquery name="ajaxget" dataSource="sen_dsn">

            SELECT * FROM datatable
        </cfquery>

        <cfreturn ajaxget>
    </cffunction>



</cfcomponent>



