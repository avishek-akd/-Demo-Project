<cfcomponent
    displayname="Application"
    output="true"
    hint="Handle the application.">


    <!--- Set up the applicatiosn. --->
    <cfset THIS.Name = "xxxgmmmmvvmccxx" />
    <cfset THIS.ApplicationTimeout = CreateTimeSpan( 0, 2, 0, 0 ) />
    <cfset THIS.datasource = "dsOrganisation" />
	<cfset THIS.sessionmanagement = "yes" />
	<cfset THIS.clientmanagement = "yes" />
	<cfset THIS.sessiontimeout = CreateTimeSpan( 0, 1, 0, 0 ) />



    <cffunction
        name="OnApplicationStart"
        returntype="boolean">

		<!--Creating Objects of components -->

		<cfset application.employeeService = createObject(
		"component",'Demo.components.service.employeeService')/>

		<cfset application.employeeDao = createObject(
		"component",'Demo.components.dao.employeeDao')/>

		<cfset application.loginDao = createObject(
		"component",'Demo.components.dao.loginDao')/>

		<cfset session.stLoggedInUser = structNew() />



        <cfreturn true />
    </cffunction>




</cfcomponent>