<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .d1 {
            margin: auto;
            border: 1px solid;
            margin-top: 20px;
            border-radius: 20px;
            width: 30%;
        }

        table, tr {
            padding: 20px;
        }

        td {
            padding-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
     <div class="d1">
            <table>
                <tr>
                    <td colspan="2">
                        <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary1" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <label>MailUserId</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtUsrId" runat="server" />
                        <asp:RequiredFieldValidator Text="*" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter UserId" ControlToValidate="TxtUsrId" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Password</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtPassword" TextMode="Password" runat="server" />
                        <asp:RequiredFieldValidator ID="RfvPassword" Text="*" ForeColor="Red" ErrorMessage="Password is required" ControlToValidate="TxtPassword" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button Text="SignIn" ID="BtnSignIn" runat="server" OnClick="BtnSignIn_Click"/>
                    </td>
                    <td>
                        <asp:Button Text="SignUp" ID="BtnSignUp" runat="server" OnClick="BtnSignUp_Click"/>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>
