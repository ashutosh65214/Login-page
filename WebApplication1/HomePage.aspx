<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="WebApplication1.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        table,tr,td{
            padding:5px;
        }
        .font14{
            font-family:Verdana, Geneva, Tahoma, sans-serif;
            font-size:14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div>
            <table>
                <tr>
                    <td>
                        
                         <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label>
                        
                    </td>
                </tr>
            </table>
             <asp:GridView ID="GridDepartment" runat="server"></asp:GridView>
        <div>
            <asp:Button ID="btnSignOut" runat="server" Text="SignOut" OnClick="btnSignOut_Click" />
            <asp:Button ID="btnSendMail" runat="server" Text="Send Mail" OnClick="btnSendMail_Click" />
        </div>
        </div>
   
</asp:Content>
