<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="True" CodeBehind="Forgot_Password.aspx.cs" Inherits="WebApplication1.Forgot_Password" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
<table align="center" class="auto-style10" border="0">
    <tr>
        <td class="auto-style1" style="height: 80px; font-size: xx-large" colspan="2"><strong style="text-align: center"><span class="auto-style6" style="font-size: x-large; text-decoration: underline; color: #FF3300">Forgot Password / Change Password</span></strong></td>
    </tr>
            
    <tr>
                <td class="auto-style8" style="font-size: medium">Username:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="u_name" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Email" AutoCompleteType="Email" Font-Size="Medium" ToolTip="registered email" Style="font-size: medium"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="u_name" ErrorMessage="Username Required" ValidationGroup="inside">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style15" style="font-size: medium" colspan="2">
                    <asp:Button ID="get_otp" runat="server" Font-Bold="True" Width="177px" align="center" Font-Size="Medium" ForeColor="#6666FF" Text="Get OTP" ToolTip="Recieve OTP on registered mail id" OnClick="get_otp_Click" ValidationGroup="inside" />
                    <br />
                <asp:Label ID="msg" runat="server" CssClass="auto-style7" ForeColor="Red" Text="Unrecognized Username" Visible="False"></asp:Label>
                </td>
            </tr>
        
             
    </table>

    <div class="change_pass" style="display:none">
    <table align="center" class="auto-style11" border="0">
   <tr>
        <td class="auto-style17" style="font-size: medium">Enter OTP</td>
        <td class="auto-style18">
            <asp:TextBox ID="otp_box" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Password" AutoCompleteType="Email" Font-Size="Medium" style="font-size: medium"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="otp_box" ErrorMessage="OTP Required">*</asp:RequiredFieldValidator>
        </td>
    </tr>
   <tr>
        <td class="auto-style17" style="font-size: medium">New Password:</td>
        <td class="auto-style18">
            <asp:TextBox ID="n_passwd" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Password" AutoCompleteType="Email" Font-Size="Medium" style="font-size: medium"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="n_passwd" ErrorMessage="Password Required">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style17" style="font-size: medium">Confirm Password:</td>
        <td class="auto-style18">
            <asp:TextBox ID="c_passwd" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Password" AutoCompleteType="Email" Font-Size="Medium" style="font-size: medium"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="n_passwd" ControlToValidate="c_passwd" ErrorMessage="Pleas enter same passwords">*</asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style10" colspan="2" style="height: 150px">
            <asp:Button ID="submit" runat="server" Font-Bold="True" Height="42px" OnClick="submit_Click" Text="Submit" Width="177px" align="center" Font-Size="Medium" ForeColor="#6666FF"/>
            <br />
            <asp:Label ID="display_msg" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Blue" />
        </td>
    </tr>
        
</table></div>
<br />
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style7 {
            font-size: large;
        }
        .auto-style8 {
            width: 235px;
            height: 75px;
        }
        .auto-style9 {
            height: 75px;
        }
        .auto-style10 {
            text-align: center;
            width: 617px;
            height: 275px;
        }
        .auto-style11 {
            text-align: center;
            width: 617px;
            height: 353px;
        }
        </style>
</asp:Content>

