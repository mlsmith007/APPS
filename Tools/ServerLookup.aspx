<%@ Page Language="VB" Debug="true" %>
<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Web.Script.Services" %>

<script runat="server">
	Public Function CountCharacter(ByVal value As String, ByVal ch As Char) As Integer
		Dim cnt As Integer = 0
		For Each c As Char In value
			If c = ch Then cnt += 1
		Next
		Return cnt
	End Function

	'Public Class online_order_bulb
	'Inherits System.Web.UI.Page
	'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
	'End Sub

	<WebMethod()>
	Public Shared Function ServerLookUpOld(ByVal ServerInput As String) As String
		Return "Hello" & ServerInput & Environment.NewLine & "The Current Time is: " & DateAndTime.Now.ToString()
	End Function

	'Private DotCounter As Integer = CountCharacter(ServerInput, ".")
	
	'If not, we have a server name. All we want is the first Word, strip the rest off.
</script>
