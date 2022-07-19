<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>
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
                        <asp:RequiredFieldValidator Text="*" ID="RfvUserId" runat="server" ErrorMessage="Please enter UserId" ControlToValidate="TxtUsrId" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <label>MailUserName</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtUsrName" runat="server" />
                        <asp:RequiredFieldValidator Text="*" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter UserId" ControlToValidate="TxtUsrName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Password</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtPassword" TextMode="Password" runat="server" />
                        <asp:RequiredFieldValidator ID="RfvPassword" Text="*" ForeColor="Red" ErrorMessage="Password is required" ControlToValidate="TxtPassword" runat="server" />
                        <asp:RegularExpressionValidator ID="RevPassword" ControlToValidate="TxtPassword" runat="server" ErrorMessage="Enter Strong Password" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}"></asp:RegularExpressionValidator>
                       
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Confirm Password</label>
                    </td>
                    <td>
                        <asp:TextBox TextMode="Password" ID="TxtConfirmPassword" runat="server" />
                        <asp:CompareValidator ID="CvPassword" Text="*" ErrorMessage="Password and Confirm Password doesn't match" ControlToValidate="TxtConfirmPassword" ControlToCompare="TxtPassword" ForeColor="Red" runat="server" />

                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Hobbies</label>
                    </td>
                    <td>
                        <asp:CheckBoxList ID="ChkListHobbies" runat="server" RepeatColumns="2">
                            <asp:ListItem Text="Reading" />
                            <asp:ListItem Text="Cricket" />
                            <asp:ListItem Text="Football" />
                            <asp:ListItem Text="Singing" />
                            <asp:ListItem Text="Dancing" />
                            <asp:ListItem Text="Swiming" />
                        </asp:CheckBoxList>
                        <asp:CustomValidator OnServerValidate="cvHobbies_ServerValidate" ID="cvHobbies" Text="*" ForeColor="Red" runat="server" ErrorMessage="Please select only onw"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button Text="Save" ID="BtnSave" runat="server" OnClick="BtnSave_Click"/>
                    </td>
                    <td>
                        <asp:Button Text="Reset" ID="BtnReset" runat="server" OnClick="BtnReset_Click"/>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>
