<%@ Page Title="Reset Password" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Site1.Master" AutoEventWireup="True" CodeBehind="Reset_Password.aspx.cs" Inherits="WebApplication1.Reset_Password" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <table class="auto-style13" border="0">
        <tr>
            <td class="auto-style1" style="font-size: xx-large" colspan="2"><strong style="text-align: center"><span class="auto-style6" style="font-size: x-large; text-decoration: underline; color: #FF3300">Forgot Password / Change Password</span></strong></td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <tr>
                            <td class="auto-style8" style="font-size: medium">Username:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="u_name" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Email" AutoCompleteType="Email" Font-Size="Medium" ToolTip="registered email" Style="font-size: medium"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="u_name" ErrorMessage="Username Required" ValidationGroup="inside" ForeColor="Red">Username Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style15" style="font-size: medium" colspan="2">
                                <table style="width: 100%">
                                    <tr>
                                        <td>
                                            <asp:Button ID="get_otp" runat="server" CssClass="button" Width="177px" Font-Size="Medium" ForeColor="Black" Text="Get OTP" ToolTip="Recieve OTP on registered mail id" OnClick="cp_Click" ValidationGroup="inside" Height="44px" />
                                        </td>
                                        <td>
                                            <asp:Button ID="use_pass" runat="server" CssClass="button" Width="177px" Font-Size="Medium" ForeColor="Black" Text="Use Password" ToolTip="Enter old password" OnClick="cp_Click" ValidationGroup="inside" Height="44px" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:Label ID="msg" runat="server" CssClass="auto-style7" ForeColor="Red" Text="Unrecognized Username" Visible="False"></asp:Label>
                            </td>
                        </tr>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>

    <div runat="server" id="change_pass" style="margin-top:10px;" visible="false">
        <table class="auto-style11" border="0">
            <tr>
                <td class="auto-style14" style="font-size: medium">
                    <asp:Label ID="pass_label" runat="server" Text="Enter Password:"></asp:Label></td>
                <td class="auto-style18">
                    <asp:TextBox ID="otp_box" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Password" Font-Size="Medium" Style="font-size: medium" Visible="False" ToolTip="Enter recieved otp"></asp:TextBox>

                    <asp:TextBox ID="pass_box" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Password" Font-Size="Medium" Style="font-size: medium" Visible="False" ToolTip="Enter old password"></asp:TextBox>

                    <br />

                    <asp:RequiredFieldValidator ID="OtpRequiredValidator" runat="server" ControlToValidate="otp_box" ErrorMessage="OTP Required" Visible="False">*</asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="OPRequiredValidator" runat="server" ControlToValidate="pass_box" ErrorMessage="Old Pasword Required" Visible="False">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style14" style="font-size: medium">New Password:</td>
                <td class="auto-style18">
                    <asp:TextBox ID="n_passwd" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Password" AutoCompleteType="Email" Font-Size="Medium" Style="font-size: medium"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="n_passwd" ErrorMessage="Password Required">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style14" style="font-size: medium">Confirm Password:</td>
                <td class="auto-style18">
                    <asp:TextBox ID="c_passwd" runat="server" Height="36px" Width="252px" CssClass="auto-style7" TextMode="Password" Font-Size="Medium" Style="font-size: medium"></asp:TextBox>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="n_passwd" ControlToValidate="c_passwd" ErrorMessage="Pleas enter same passwords">*</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style10" colspan="2" style="height: 150px">
                    <asp:Button ID="submit" runat="server" CssClass="button" Height="42px" OnClick="submit_Click" Text="Submit" Width="177px" Font-Size="Medium" ForeColor="Black" />
                    <br />
                    <asp:Label ID="display_msg" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                    <br />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Blue" DisplayMode="List" />
                </td>
            </tr>

        </table>
    </div>
    <br />
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            height: 80px;
        }

        .auto-style7 {
            font-size: large;
        }

        .auto-style8 {
            width: 236px;
            height: 66px;
        }

        .auto-style9 {
            height: 66px;
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
            margin: 0 auto;
        }

        .auto-style13 {
            text-align: center;
            width: 617px;
            height: 249px;
            margin: 0 auto;
        }

        .auto-style14 {
            width: 236px;
        }

        .button {
            margin-top: 10px;
            margin-bottom:15px;
            padding: 15px 25px;
            font-weight: bold;
            text-align: center;
            cursor: pointer;
            outline: none;
            border: 1px solid;
            border-radius: 15px;
            box-shadow: 0 9px #999;
        }

            .button:hover {
                background-color: orange;
            }

            .button:active {
                background-color: orange;
                box-shadow: 0 5px #666;
                transform: translateY(4px);
            }
    </style>
</asp:Content>

