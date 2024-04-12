<cfcomponent>
    <cffunction  name="insertdata" access="remote" returntype = "string" returnformat="json">
        <cfargument  name="todo" required="True" type="string">

            <cfquery name="ajaxinsert" datasource = "sen_dsn">
                INSERT into todos (todo,isactive)
                values(
                        <cfqueryparam value="#arguments.todo#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="1" cfsqltype="cf_sql_integer">
                )
                select scope_identity()  as ID from todos
            </cfquery>
            
        <cfreturn ajaxinsert.ID>
    </cffunction>
   
    <cffunction  name="getdata" access="remote" returntype = "string" returnformat="json">
        <cfargument  name="ID" required="false" type="string" default="">
        <cfargument  name="state_check" required="false" type="string" default="">
        <cfquery name="ajaxget" dataSource="sen_dsn">

            SELECT * FROM todos
             <cfif len(arguments.ID)> 
                WHERE ID= <cfqueryparam value="#arguments.ID#" cfsqltype="cf_sql_integer">
            </cfif>

             <cfif len(arguments.state_check)> 
                WHERE isactive= <cfqueryparam value="#arguments.state_check#" cfsqltype="cf_sql_integer">
            </cfif>
        </cfquery>
        
        <cfreturn serializeJSON("#ajaxget#")>
    </cffunction>




    <cffunction name="deleteData" access="remote" returntype = "void" >
        <cfargument name="ID" required="true" type="numeric">
        
        <cfquery name="deletedata" datasource = "sen_dsn">
            DELETE FROM todos WHERE ID in (<cfqueryparam value="#arguments.ID#" cfsqltype="cf_sql_integer">)
        </cfquery>

    </cffunction> 



    <cffunction name="updateData" access="remote" returnType="void">
        <cfargument name="ID" required="true" type="numeric">
        <cfargument name="data" required="true" type="string">
        <cfargument name="state_check" required="true" type="string">


        <cfquery name="updateTbl" datasource = "sen_dsn">
            UPDATE todos SET  
            todo= <cfqueryparam value="#arguments.data#" cfsqltype="cf_sql_varchar">,
            isactive= <cfqueryparam value="#arguments.state_check#" cfsqltype="cf_sql_integer">
            WHERE   Id= <cfqueryparam value="#arguments.ID#" cfsqltype="cf_sql_integer">
                   
        </cfquery>
    </cffunction>



    <cffunction name="countData" access="remote" returnType="numeric" returnFormat = "json">

        <cfquery name="countData" datasource = "sen_dsn">
            select count(*) as itemleft from todos where isactive = '1'   
        </cfquery>
        <cfreturn countData.itemleft >
    </cffunction>



    <cffunction name="testdata" access="remote" returnType="query" returnFormat = "json">

        <cfargument name="custName" required="true" type="string">

        <cfquery name="testdat" datasource = "sen_test_dsn" >
            select fname as custnames from employee  WHERE fname LIKE  '#arguments.custName#%'
        </cfquery>
        
        <cfreturn testdat>
    </cffunction>

</cfcomponent>



