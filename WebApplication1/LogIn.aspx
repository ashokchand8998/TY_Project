<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="True" CodeBehind="LogIn.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<%@ MasterType VirtualPath="~/Site1.Master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    &nbsp;<br />
    <table class="auto-style1" border="0">
        <tr>
            <td class="auto-style14" colspan="2">
                <strong style="text-align: center"><span class="auto-style6">Login</span></strong></td>
        </tr>
        <tr>
            <td class="auto-style12">Username:</td>
            <td class="auto-style13">
                <asp:TextBox ID="uname" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Email" AutoCompleteType="Email" Font-Size="Medium" ToolTip="registered email"></asp:TextBox>
                <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="uname" Display="Dynamic" ErrorMessage="Email id required" Font-Size="Medium" ForeColor="Red" ToolTip="required field"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style12">Password:</td>
            <td class="auto-style13">
                <asp:TextBox ID="password" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Password"></asp:TextBox>
                <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="Password required" Font-Size="Medium" ForeColor="Red" ToolTip="required field"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style10" colspan="2">
                <asp:Button ID="Button1" runat="server" ForeColor="Black" CssClass="button" OnClick="Button1_Click" Text="Login" Font-Size="Medium" />
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" CssClass="auto-style7" ForeColor="Red" Text="Unrecognized Username or Password!" Visible="False"></asp:Label>
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Reset_Password.aspx">Forgot Password</asp:HyperLink>
                <br />
                <a href="SignUp.aspx">SignUp</a><br />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <style type="text/css">
        .auto-style1 {
            width: 43%;
            height: 400px;
            margin: 0 auto;
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

        .button {
            margin-top:10px;
            padding: 15px 25px;
            font-weight:bold;
            text-align: center;
            cursor: pointer;
            outline: none;
            color: #6666FF;
            border:1px solid;
            border-radius: 15px;
            box-shadow: 0 9px #999;
            width:177px;
            height:42px;
            
        }

            .button:hover {
                background-color:orange;
            }

            .button:active {
                background-color: orange;
                box-shadow: 0 5px #666;
                transform: translateY(4px);
            }
    </style>
</asp:Content>

