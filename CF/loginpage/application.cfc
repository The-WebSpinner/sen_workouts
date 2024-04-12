<cfcomponent>
    <cfset this.name="te2562s">
    <cfset this.sessionmanagement=true>
    <cfset this.dataSource="sen_dsn">

    <cffunction name="onApplicationStart">
        <cfset application.userObj= createObject("component","tagcloud")>
    </cffunction>

    <cffunction name="onRequestStart">
        <cfif NOT isDefined('session.userName') AND listLast(cgi.SCRIPT_NAME, '/') EQ 'welcomepage.cfm'>
            <cflocation  url="index.cfm" addtoken="false">
        <cfelseif ( isDefined('session.userName') AND listLast(cgi.SCRIPT_NAME, '/') EQ 'index.cfm')OR  (isDefined('session.userName') AND listLast(cgi.SCRIPT_NAME, '/') EQ 'signup.cfm') > 
            <cflocation  url="welcomepage.cfm" addtoken="false">
        </cfif>
    </cffunction>
</cfcomponent>