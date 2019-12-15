<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="True" CodeBehind="LogIn.aspx.cs" Inherits="WebApplication1.WebForm2" %>
<%@ MasterType virtualPath="~/Site1.Master"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    &nbsp;<br />
    <table align="center" class="auto-style1" border="0">
        <tr>
            <td class="auto-style14" colspan="2">
    <strong style="text-align: center"><span class="auto-style6">Login</span></strong></td>
        </tr>
        <tr>
            <td class="auto-style12">Username:</td>
            <td class="auto-style13">
                <asp:TextBox ID="TextBox1" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Email" AutoCompleteType="Email" Font-Size="Medium" ToolTip="registered email"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style12">Password:</td>
            <td class="auto-style13">
                <asp:TextBox ID="TextBox2" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style10" colspan="2">
    <asp:Button ID="Button1" runat="server" Font-Bold="True" Height="52px" OnClick="Button1_Click" Text="Login" Width="173px" align="center" Font-Size="Medium" ForeColor="#6666FF" BorderStyle="None"/>
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" CssClass="auto-style7" ForeColor="Red" Text="Unrecognized Username or Password!" Visible="False"></asp:Label>
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Forgot_Password.aspx">Forgot Password</asp:HyperLink>
                <br />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <style type="text/css">
        .auto-style1 {
            width: 43%;
            height: 400px;
        }
        .auto-style6 {
            font-size: xx-large;
        }
        .auto-style7 {
            font-size: large;
        }
        .auto-style10 {
            height: 56px;
            text-align: center;
            font-size: large;
        }
        .auto-style12 {
            width: 252px;
            height: 84px;
            text-align: center;
            font-size: large;
        }
        .auto-style13 {
            width: 210px;
            height: 84px;
        }
        .auto-style14 {
            height: 101px;
            text-align: center;
            font-size: large;
            text-decoration: underline;
        }
    </style>
</asp:Content>

