<%@ Page Title="SignUp" Language="C#" MasterPageFile="~/Site1.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="True" CodeBehind="SignUp.aspx.cs" Inherits="WebApplication1.WebForm3" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
      
    <br />
<table class="auto-style1" border="0" style="width: 768px; height: 515px">
    <tr>
        <td class="auto-style1" colspan="2" style="height: 79px; font-size: xx-large"><strong style="text-align: center"><span class="auto-style6" style="text-decoration: underline; color: #FF3300">Sign Up</span></strong></td>
    </tr>
    <tr>
        <td class="auto-style2" style="font-size: large; ">First Name:</td>
        <td class="auto-style2" style="height: 65px">
            <asp:TextBox ID="fname" runat="server" Height="36px" Width="251px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fname" Display="Dynamic" ErrorMessage="First name required" Font-Size="Medium" ForeColor="Red" ToolTip="required field"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2" style="font-size: large; ">Last Name:</td>
        <td class="auto-style2" style="height: 65px">
            <asp:TextBox ID="lname" runat="server" Height="36px" Width="251px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lname" Display="Dynamic" ErrorMessage="Last name required" Font-Size="Medium" ForeColor="Red" ToolTip="required field"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2" style="font-size: large; ">Email id:</td>
        <td class="auto-style2" style="height: 65px">
            <asp:TextBox ID="uname" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Email" AutoCompleteType="Email" Font-Size="Medium" ToolTip="registered email" style="font-size: medium"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="uname" Display="Dynamic" ErrorMessage="Email id required" Font-Size="Medium" ForeColor="Red" ToolTip="required field"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2" style="font-size: large; ">Roll no:</td>
        <td class="auto-style2" style="height: 65px">
            <asp:TextBox ID="roll_no" runat="server" Height="36px" TextMode="Number" Width="251px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="roll_no" Display="Dynamic" ErrorMessage="Roll no. required" Font-Size="Medium" ForeColor="Red" ToolTip="required field"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="roll_no" Display="Dynamic" ErrorMessage="Roll no. should be positive." Font-Size="Medium" ForeColor="Red" MinimumValue="1" SetFocusOnError="True" MaximumValue="9999"></asp:RangeValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2" style="font-size: large; ">DOB:</td>
        <td class="auto-style2" style="height: 65px; text-align: center">
            <asp:TextBox ID="dob" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Date" style="font-size: medium" ToolTip="Date of Birth"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="dob" Display="Dynamic" ErrorMessage="Date of Birth required" Font-Size="Medium" ForeColor="Red" ToolTip="required field" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="dob" Display="Dynamic" ErrorMessage="Enter Valid Date of Birth" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2" style="font-size: large; ">New Password:</td>
        <td class="auto-style2" style="height: 65px">
            <asp:TextBox ID="passwd1" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Password" AutoCompleteType="Email" Font-Size="Medium" style="font-size: medium"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="passwd1" Display="Dynamic" ErrorMessage="Password required" Font-Size="Medium" ForeColor="Red" ToolTip="required field"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3" style="font-size: large; ">Confirm Password:</td>
        <td class="auto-style2" style="height: 64px">
            <asp:TextBox ID="passwd2" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Password" AutoCompleteType="Email" Font-Size="Medium" style="font-size: medium"></asp:TextBox>
            <br />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="passwd2" ControlToValidate="passwd1" Display="Dynamic" ErrorMessage="Passwords don't match!" Font-Bold="True" Font-Size="Medium" ForeColor="Red" ToolTip="Enter password same as above"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style10" colspan="2">
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="button" OnClick="Button1_Click" Text="Submit" Font-Size="Medium" ForeColor="Black"/>
            <br />
        </td>
    </tr>
</table>
    <br/>
</asp:Content>


<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            margin: 0 auto;
        }
               .button {
            margin-top:10px;
            padding: 15px 25px;
            font-weight:bold;
            text-align: center;
            cursor: pointer;
            outline: none;
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
        .auto-style2 {
            height: 65px;
            width: 256px;
        }
        .auto-style3 {
            height: 64px;
            width: 256px;
        }
    </style>
</asp:Content>



