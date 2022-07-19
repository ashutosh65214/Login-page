<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SendMail.aspx.cs" Inherits="WebApplication1.WebForm3" %>
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
                        <label>From UserId</label>
                    </td>
                    <td>
                        <asp:Label ID="lblUserId" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <label>ToMailUserId</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtToMailUserId" runat="server" />
                        <asp:RequiredFieldValidator Text="*" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter UserId" ControlToValidate="TxtToMailUserId" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <label>Subject</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtSubject" runat="server" />
                        <asp:RequiredFieldValidator Text="*" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter UserId" ControlToValidate="TxtSubject" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <label>Text</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtText" runat="server" Height="97px" TextMode="MultiLine" />
                        <asp:RequiredFieldValidator Text="*" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter UserId" ControlToValidate="TxtText" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>New or Not</label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlNewOrNot" runat="server">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button Text="Send" ID="BtnSend" runat="server" OnClick="BtnSend_Click"/>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>
