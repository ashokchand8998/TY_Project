<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="True" CodeBehind="Forgot_Password.aspx.cs" Inherits="WebApplication1.Forgot_Password" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
<table align="center" class="auto-style1" border="0" style="width: 617px; height: 401px">
    <tr>
        <td class="auto-style1" style="height: 80px; font-size: xx-large"><strong style="text-align: center"><span class="auto-style6" style="font-size: x-large; text-decoration: underline; color: #FF3300">Forgot Password/Change Password</span></strong></td>
    </tr>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            
    <tr>
                <td class="auto-style17" style="font-size: medium">Username:</td>
                <td class="auto-style18">
                    <asp:TextBox ID="u_name" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Email" AutoCompleteType="Email" Font-Size="Medium" ToolTip="registered email" Style="font-size: medium"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="u_name" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style15" style="font-size: medium" colspan="2">
                    <asp:Button ID="get_otp" runat="server" Font-Bold="True" Width="177px" align="center" Font-Size="Medium" ForeColor="#6666FF" Text="Get OTP" ToolTip="Recieve OTP on registered mail id" OnClick="get_otp_Click" />
                    <br />
                <asp:Label ID="msg" runat="server" CssClass="auto-style7" ForeColor="Red" Text="Unrecognized Username or DOB" Visible="False"></asp:Label>
                </td>
            </tr>
        
             </ContentTemplate>
    </asp:UpdatePanel>
    </table>

    <table align="center" class="auto-style1" border="0" style="width: 617px; height: 401px">
   <tr>
        <td class="auto-style17" style="font-size: medium">Enter OTP</td>
        <td class="auto-style18">
            <asp:TextBox ID="otp_box" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Password" AutoCompleteType="Email" Font-Size="Medium" style="font-size: medium"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="otp_box" ErrorMessage="Required">*</asp:RequiredFieldValidator>
        </td>
    </tr>
   <tr>
        <td class="auto-style17" style="font-size: medium">New Password:</td>
        <td class="auto-style18">
            <asp:TextBox ID="n_passwd" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Password" AutoCompleteType="Email" Font-Size="Medium" style="font-size: medium"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="n_passwd" ErrorMessage="Required">*</asp:RequiredFieldValidator>
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
        <td class="auto-style10" colspan="2">
            <asp:Button ID="submit" runat="server" Font-Bold="True" Height="42px" OnClick="submit_Click" Text="Submit" Width="177px" align="center" Font-Size="Medium" ForeColor="#6666FF"/>
            <br />
            <asp:Label ID="err_msg" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Blue" />
        </td>
    </tr>
        
</table>
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
        </style>
</asp:Content>

