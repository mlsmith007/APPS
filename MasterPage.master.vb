
Imports System.DirectoryServices
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage
    Public Shared Function GetFullName(ByVal UserName As String) As String
        Const DomainName As String = "FNFIS.com"
        Dim ADUserArray() As String = Split(UserName, "\")
        Dim ADUserName As String = ADUserArray(1)
        Dim oDirectory As New DirectoryEntry("LDAP://" & DomainName)
        Dim mySearcher As New DirectorySearcher(oDirectory)
        Dim oResult As SearchResult
        Dim sResult As String = Nothing
        Dim FirstName As String = Nothing
        Dim LastName As String = Nothing
        mySearcher.SearchScope = SearchScope.Subtree
        mySearcher.ReferralChasing = ReferralChasingOption.All
        mySearcher.Filter = "(&(objectClass=user)(sAMAccountName=" & ADUserName & "))"
        Try
            oResult = mySearcher.FindOne
            If Not oResult Is Nothing Then
                Dim NameArray() As String = Split(oResult.GetDirectoryEntry.Properties("DisplayName").Value.ToString(), ",")
                FirstName = NameArray(1)
                LastName = NameArray(0)
                sResult = FirstName & " " & LastName
            End If
        Catch ex As Exception
            Throw ex
        End Try

        oResult = Nothing
        mySearcher.Dispose()
        oDirectory.Dispose()
        Return sResult
    End Function

End Class


