<!--component for login and logout operation -->

<cfcomponent>

	<!--Checking username existance  -->
	<cffunction name="checkUserAvailability" access = "remote" returnType="boolean" returnFormat="json">
		<cfargument name="username" type="string" required="true"/>
		<cfset var recordFound=false/>
		<cfset var record=""/>
		<cftry>
			<cfquery name="record">
				SELECT EmployeeID FROM [dbOrganisation].[Employee].[Employee]
				WHERE UserName = '#arguments.username#' AND ActiveStatus = 1;
			</cfquery>
			<cfif #record.recordCount# >
				<cfset recordFound=true/>
			</cfif>
			<cfcatch type="database">
				<p>
					<strong>
					Apologies, a database error has occurred. Please try again later.
					<strong>
				</p>
			</cfcatch>
			<cffinally> <cfreturn recordFound/> </cffinally>
		</cftry>
	</cffunction>

	<!--authenticateUser user for login  -->
 	<cffunction name="authenticateUser" access = "remote" returnType="string" returnFormat="json" output="true">
		 <cfargument name="username" type="string" required="true"/>
		 <cfargument name="password" type="string" required="true"/>
		 <cfargument name="type" type="string" required="true"/>
		 <cfset var userType=""/>
		 <cfset var session.stLoggedInUser = structNew() />
		 <cfset var record=""/>
		 <cftry>


			 <cfquery name="record">
			 	SELECT EmployeeID,FirstName,UserType FROM [dbOrganisation].[Employee].[Employee]
				WHERE UserName = '#arguments.username#' AND Password = HASHBYTES('SHA1','#arguments.password#') AND ActiveStatus = 1;
			 </cfquery>

			 <cfif #record.recordCount# >
			 	<cfset fetchType = #record.UserType#>
				<cfset enterType = #arguments.type#>
				<cfset role = "">

			 	<cfif fetchType EQ "Admin" and enterType EQ "Admin">
				 	<cfset role = "Admin">
				<cfelseif fetchType EQ "Admin" and enterType EQ "Employee">
					<cfset role = "Employee">
				<cfelse>
					<cfset role = "Employee">
			 	</cfif>

				<cfset idSession = #Session.sessionid#>
				<cfset session.stLoggedInUser={'userName'=record.FirstName, 'employeeId'=record.EmployeeID, 'role'=role}>


				<cfquery name="userExistanceInSession">
			 		SELECT EmployeeID
			 		FROM [dbOrganisation].[Employee].[LoginDetails]
					WHERE EmployeeID = '#record.EmployeeID#'
			 	</cfquery>



			 	<cfif #userExistanceInSession.recordCount#>

				 	<cfquery name="updatesessionId">
						UPDATE [dbOrganisation].[Employee].[LoginDetails]
						SET
						[SessionID] =<cfqueryparam value="#idSession#" cfsqltype="CF_SQL_VARCHAR">,
						[ModifiedDate] = DEFAULT
						WHERE EmployeeID = <cfqueryparam value="#record.EmployeeID#" cfsqltype="CF_SQL_INTEGER">
					</cfquery>

				<cfelse>

					<cfquery name="unsertsessionId">
						INSERT INTO [dbOrganisation].[Employee].[LoginDetails] ([EmployeeID],[SessionID])
					    VALUES(
						<cfqueryparam value="#record.EmployeeID#" cfsqltype="CF_SQL_INTEGER">,
						<cfqueryparam value="#idSession#" cfsqltype="CF_SQL_VARCHAR">
						);
					</cfquery>

				</cfif>
			 <cfset  userType=#record.UserType#/>
			 </cfif>

		  <cfcatch type="database">
			   <p><strong>Apologies, a database error has occurred. Please try again later.<strong><p>
		  </cfcatch>
		  </cftry>
		  <cfreturn userType/>
	</cffunction>

		<!--user logout function  -->
 	<cffunction name="userLogout" access = "remote" returnType="boolean" returnFormat="json">
		<cfset var logout=false/>
		 <cftry>
		   <cfquery>
	  			DELETE FROM [dbOrganisation].[Employee].[LoginDetails]
				WHERE
				sessionid=<cfqueryPARAM value = '#Session.sessionid#'CFSQLType = 'CF_SQL_VARCHAR'>;
			</cfquery>
			<cfset structdelete(session,'stLoggedInUser')>
			<cfset  logout=true/>
			<cfcatch>
				<p><strong>Apologies, a database error has occurred. Please try again later.<strong><p>
				<cfdump var="#cfcatch.message#">
			</cfcatch>
		</cftry>
		<cfreturn logout/>
	</cffunction>

</cfcomponent>
