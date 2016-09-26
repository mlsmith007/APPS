<%@ WebService Language="VB" Class="ToolsService" %>

Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols

Public Class EmployeeAutoComplete
	Public Property EmployeeID() As String
	Public Property EmployeeName() As String
End Class

Public Class EmployeeInfo
	Public Property EmployeeID() As String
	Public Property EmployeeName() As String
	Public Property L10() As String
	Public Property EmailAlias() As String
	Public Property JobTitle() As String
	Public Property CountryName() As String
	Public Property ManagerName() As String
	Public Property ManagerEmployeeID() As String
	Public Property ManagerEmailAlias() As String
End Class
' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://localhost/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
Public Class ToolsService
	Inherits System.Web.Services.WebService
	<WebMethod()> _
	Public Function EmployeeL10AutoComplete(ByVal InputString As String) As List(Of EmployeeAutoComplete)
		' Take the InputString, search the Database, then return the results.
		Dim db As New DataClassesDataContext
		Dim Employees = From EmployeeL10 In db.EmployeeL10s
		Where EmployeeL10.Employee_ID Like InputString Or
		EmployeeL10.Employee_Name Like InputString Or
		EmployeeL10.Email_Alias Like InputString
						Order By EmployeeL10.Employee_Name
						Select EmployeeL10.Employee_ID, EmployeeL10.Employee_Name
		Dim EmployeeList As New List(Of EmployeeAutoComplete)()
		For Each EmployeesL10s In Employees
			EmployeeList.Add(New EmployeeAutoComplete() With {
							 .EmployeeID = Employees("Employee ID").ToString(),
							 .EmployeeName = Employees("Employee Name").ToString()
						 })
		Next
		Return EmployeeList
	End Function
End Class
