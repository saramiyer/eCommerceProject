﻿Imports System.Data
Partial Class Admin_Settings
    Inherits System.Web.UI.Page

    Protected Sub passChange_Click(sender As Object, e As EventArgs) Handles passChange.Click
        Dim adminpass As String = TryCast(Me.Master, SiteMaster).Hash(adminPassText.Text)
        Dim userDV As DataView = CType(sqlAdminPass.Select(DataSourceSelectArguments.Empty), DataView)

        If newPass.Text = newPassConfirm.Text Then
            If newPass.Text.Length > 6 Then
                If adminpass = userDV(0)(0) Then
                    sqldsUsers.UpdateParameters("userID").DefaultValue = Session("selected")
                    sqldsUsers.UpdateParameters("pass").DefaultValue = TryCast(Me.Master, SiteMaster).Hash(newPass.Text)
                    sqldsUsers.Update()
                    PassChanged.Text = "Password changed."
                    adminPassWrong.Text = ""
                    wronglength.Text = ""
                    mismatch.Text = ""

                ElseIf adminpass <> userDV(0)(0) Then
                    adminPassWrong.Text = "Admin password is not correct."
                    PassChanged.Text = ""
                    wronglength.Text = ""
                    mismatch.Text = ""
                End If
            ElseIf newPass.Text.Length <= 6 Then
                wronglength.Text = "Password is not long enough."
                adminPassWrong.Text = ""
                PassChanged.Text = ""
                mismatch.Text = ""
            End If
        ElseIf newPass.Text <> newPassConfirm.Text Then
            mismatch.Text = "Passwords do not match."
            adminPassWrong.Text = ""
            wronglength.Text = ""
            PassChanged.Text = ""
        End If
    End Sub
    Protected Sub roleButton_Click(sender As Object, e As EventArgs) Handles roleButton.Click
        sqldsRoles.UpdateParameters("type").DefaultValue = ddlRoles.SelectedValue
        sqldsRoles.UpdateParameters("userID").DefaultValue = Session("selected")
        sqldsRoles.Update()
        roleChanged.Text = "Role updated."


    End Sub

    Protected Sub gvUsers_RowCommand(grid As GridView, e As GridViewCommandEventArgs)
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim userId As Integer = grid.DataKeys(index).Value
        Session("selected") = userId
    End Sub
End Class
