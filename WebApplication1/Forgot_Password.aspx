<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="True" CodeBehind="Forgot_Password.aspx.cs" Inherits="WebApplication1.Forgot_Password" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<table align="center" class="auto-style1" border="0" style="width: 617px; height: 401px">
    <tr>
        <td class="auto-style1" colspan="2" style="height: 80px; font-size: xx-large"><strong style="text-align: center"><span class="auto-style6" style="font-size: x-large; text-decoration: underline; color: #FF3300">Forgot Password/Change Password</span></strong></td>
    </tr>
    <tr>
        <td class="auto-style17" style="font-size: medium">Username:</td>
        <td class="auto-style18">
            <asp:TextBox ID="TextBox1" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Email" AutoCompleteType="Email" Font-Size="Medium" ToolTip="registered email" style="font-size: medium"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style15" style="font-size: medium">DOB:</td>
        <td class="auto-style16">
            <asp:TextBox ID="TextBox2" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Date" style="font-size: medium" ToolTip="Date of Birth"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style17" style="font-size: medium">New Password:</td>
        <td class="auto-style18">
            <asp:TextBox ID="TextBox3" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Password" AutoCompleteType="Email" Font-Size="Medium" style="font-size: medium"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style17" style="font-size: medium">Confirm Password:</td>
        <td class="auto-style18">
            <asp:TextBox ID="TextBox4" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Password" AutoCompleteType="Email" Font-Size="Medium" style="font-size: medium"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style10" colspan="2">
            <asp:Button ID="Button1" runat="server" Font-Bold="True" Height="42px" OnClick="Button1_Click" Text="Submit" Width="177px" align="center" Font-Size="Medium" ForeColor="#6666FF"/>
            <br /></td>
    </tr>
</table>
<br />
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</asp:Content>

