
<cfcomponent accessors="true" output="false" persistent="false">

	<!--Insert record into Employee table  -->
	<cffunction name="addEmployee" returntype="boolean">

		<cfargument name="formData" type="struct" required="true">
		<cfset var check = false>
		<cftry>
			<cfquery>
				INSERT INTO [dbOrganisation].[Employee].[Employee]
				(
				 [FirstName],
				 [MiddleName],
				 [LastName],
				 [Gender],
				 [DateOfBirth],
				 [JobTitle],
				 [Department],
				 [Email],
				 [Username],
				 [UserType]
				)
				VALUES
				(
				<cfqueryparam value="#formData.first_name#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#formData.middle_name#" cfsqltype="CF_SQL_VARCHAR" null="#not len(formData.middle_name)#">,
				<cfqueryparam value="#formData.last_name#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#formData.gender#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#formData.date_of_birth#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#formData.job_title#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#formData.department#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#formData.email#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#formData.username#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#formData.userType#" cfsqltype="CF_SQL_VARCHAR">
				);
			</cfquery>

			<cfset var check = true>

		<cfcatch type="database">
  			<p><strong>Apologies, a database error has occurred.
			 Please try again later.<strong><p>
			 <cfdump var="#cfcatch.message#">
		</cfcatch>

		<cffinally>
			<cfreturn check/>
		</cffinally>

		</cftry>
	</cffunction>



	<!--Checking of email & username existance  -->
	<cffunction name="checkAvailability" access = "remote" returnType="boolean" returnFormat="json">
		<cfargument name="username" type="string" required="true"/>
		<cfset var recordFound=false/>
		<cfset var record=""/>
		<cftry>

			<cfquery name="record">
				SELECT EmployeeID FROM [dbOrganisation].[Employee].[Employee]
				WHERE UserName = '#arguments.username#' AND ActiveStatus = 1;
			</cfquery>
			<cfif #record.recordCount#>
				<cfset recordFound=false/>
				<cfelse>
					<cfset recordFound=true/>
			</cfif>
		<cfcatch type="database">
  			<p><strong>Apologies, a database error has occurred.
			 Please try again later.<strong><p>
		</cfcatch>

		<cffinally>
			<cfreturn recordFound/>
		</cffinally>

  		</cftry>
	</cffunction>

	<cffunction name="getAllEmployee" returnType="query">
		<cfset var rsDetails=""/>
		<cftry>

			<cfquery name="record">
				SELECT
				Emp.[EmployeeID],
				(ISNULL(Emp.FirstName,'') +' '+ ISNULL(Emp.MiddleName,'') +' '+ ISNULL(Emp.LastName,''))
				AS FullName,
				Emp.[Gender],
				Emp.[DateOfBirth],
				Emp.[JobTitle],
				Emp.[Department],
				Emp.[Email],
				Emp.[Username],
				Emp.[UserType],
				Emp.[ActiveStatus]
				FROM [dbOrganisation].[Employee].[Employee] AS Emp
				ORDER BY Emp.[EmployeeID] DESC
			</cfquery>

		<cfcatch type="database">
  			<p><strong>Apologies, a database error has occurred.
			 Please try again later.<strong><p>
		</cfcatch>

		<cffinally>
			<cfreturn record/>
		</cffinally>

  		</cftry>
	</cffunction>

	<cffunction name="getEmployeeById" access = "remote" returnType="array" returnFormat="json">
		<cfargument name="employeeId" type="string" required="true">
		<cfset var rsDetails=""/>
		<cfset var empArray = ArrayNew(1)>
		<cftry>
			<cfset var Id = LSParseNumber(employeeId)/>

			<cfquery name="rsDetails">
				SELECT
				Emp.[FirstName],
				Emp.[MiddleName],
				Emp.[LastName],
				Emp.[Gender],
				Emp.[DateOfBirth],
				Emp.[JobTitle],
				Emp.[Department],
				Emp.[Email],
				Emp.[UserType]
				FROM [dbOrganisation].[Employee].[Employee] AS Emp
				WHERE EmployeeID= #Id#;
			</cfquery>

			<CFLOOP QUERY="rsDetails">
				<cfset ArrayAppend(empArray, FirstName )>
				<cfset ArrayAppend(empArray, MiddleName)>
				<cfset ArrayAppend(empArray, LastName)>
				<cfset ArrayAppend(empArray, Gender)>
				<cfset ArrayAppend(empArray, DateOfBirth)>
				<cfset ArrayAppend(empArray, JobTitle)>
				<cfset ArrayAppend(empArray, Department)>
				<cfset ArrayAppend(empArray, Email)>
				<cfset ArrayAppend(empArray, UserType)>
			</CFLOOP>

		<cfcatch type="database">
  			<p><strong>Apologies, a database error has occurred.
			 Please try again later.<strong><p>
			 <cfdump var="#cfcatch.message#">
		</cfcatch>

		<cffinally>
			<cfreturn empArray/>
		</cffinally>

  		</cftry>
	</cffunction>

	<cffunction name="editEmployee"  returnType="boolean">


		<cfargument name="formData" type="struct" required="true">
		<cfset var check = false>
		<cftry>
			<cfset var Id = LSParseNumber(formData.edit_employeeId)/>

			<cfquery>
				UPDATE [dbOrganisation].[Employee].[Employee]
				SET
				[FirstName] = '#formData.first_name#',
				[MiddleName] = <cfqueryparam value="#formData.middle_name#" cfsqltype="CF_SQL_VARCHAR" null="#not len(formData.middle_name)#">,
				[LastName] = '#formData.last_name#',
				[Gender] = '#formData.edit_gender#',
				[DateOfBirth] = '#formData.date_of_birth#',
				[JobTitle] = '#formData.job_title#',
				[Department] = '#formData.department#',
				[Email] = '#formData.email#',
				[UserType] = '#formData.userType#',
				[ModifiedDate] = DEFAULT
				WHERE EmployeeID= #Id# ;
			</cfquery>

			<cfset  check = true>

		<cfcatch type="database">
  			<p><strong>Apologies, a database error has occurred.
			 Please try again later.<strong><p>
			 <cfdump var="#cfcatch.message#">
		</cfcatch>

		<cffinally>
			<cfreturn check/>
		</cffinally>

		</cftry>
	</cffunction>


	<!--deactivate employee function -->
	<cffunction name="deactiveEmployee"  access = "remote" returnType="boolean" returnFormat="json">

		<cfargument name="employeeId" type="string" required="true">
		<cfset var check = false>
		<cftry>
			<cfset var Id = LSParseNumber(employeeId)/>

			<cfquery>
				UPDATE [dbOrganisation].[Employee].[Employee]
				SET [ActiveStatus] = 0,
				[ModifiedDate] = DEFAULT
				WHERE EmployeeID= #Id# ;
			</cfquery>

			<cfset  check = true>
		<cfcatch type="database">
  			<p><strong>Apologies, a database error has occurred.
			 Please try again later.<strong><p>
		</cfcatch>

		<cffinally>
			<cfreturn check/>
		</cffinally>

		</cftry>


	</cffunction>

</cfcomponent>

