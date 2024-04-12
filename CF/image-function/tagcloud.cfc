<cfcomponent>
    <cffunction name="insertData" access="public" returnType="void">
        <cfargument name="imageName" required="true" type="string">

        
        <cfargument name="Description" required="true" type="string">
        <cfargument name="originalName" required="true" type="string">
    
    <cfquery name="imageTbl" dataSource="sen_dsn">
            INSERT INTO images(ImageName,Description,orgimgName) 
            values(
                <cfqueryparam value="#arguments.imageName#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.Description#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.originalName#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
    </cffunction>

     <cffunction name="getData" access="public" returnType="query">
         <cfargument name="ID" required="false" type="string" default="">
         <cfquery name="imageTbl" dataSource="sen_dsn">
            SELECT * FROM images
            <cfif len(arguments.id)>
                 WHERE Id= <cfqueryparam value="#arguments.ID#" cfsqltype="cf_sql_integer">
            </cfif>
        </cfquery>
        <cfreturn imageTbl>
    </cffunction>
</cfcomponent>