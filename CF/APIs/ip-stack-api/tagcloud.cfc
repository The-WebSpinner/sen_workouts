<cfcomponent>
    <cffunction name="getData" access="public" returnType="struct">
            <cfargument name="IPaddress" required="true" type="string">
            
            <cfhttp result="result" method="GET" url="http://api.ipstack.com/#arguments.IPaddress#">
                <cfhttpparam name="access_key" type="url" value="57c2a93a6a2d2d2d480b832cee917f54">
            </cfhttp>

            <cfreturn result>
    </cffunction>
</cfcomponent>