<%@ Page Title="Profile" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WebApplication1.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 100%;
            margin-left: auto;
            margin-right: auto;
        }

        .profile_pic {
            margin-top: 10px;
            margin-bottom: 15px;
            height: 250px;
            width: 250px;
            margin-right: auto;
            margin-left: auto;
        }

        .image {
            border-radius: 145px;
            border: 5px solid Black;
            height: 100%;
            width: 100%;
        }

        .upload_img {
            width: 393px;
            margin-top: 15px;
            border: 2px solid Black;
            border-radius: 50px;
            margin-right: auto;
            margin-left: auto;
        }

        .card {
            margin: 15px auto 5px auto;
            border-radius: 50px;
            background-color: tomato;
            border-color: Black;
            border-width: 5px;
            border-style: Solid;
            width: 500px;
            height: 75%;
        }

        th, td {
            width: 200px;
            height: 80px;
            padding: 10px;
            font-size: 19px;
        }

        .text {
            height: 40px;
            width: 300px;
            font: normal 17px 'Comic Sans MS';
            background-color: tomato;
            border: none;
            border-bottom: 1px solid black;
        }

        .center {
            margin-right: auto;
            margin-left: auto;
            width: 500px;
        }

        .aligning {
            text-align: center;
        }

        .auto-style2 {
            height: 80px;
        }

        .u_button_class {
            border-radius: 50px;
            transition-duration: 0.4s;
            border: 2px solid black;
            background-color: #CC00FF;
        }

        .rs_button_class {
            border-radius: 50px;
            transition-duration: 0.4s;
            border: 2px solid black;
            background-color: aqua;
        }

        .e_button_class {
            border-radius: 50px;
            transition-duration: 0.4s;
            border: 2px solid black;
            background-color: yellow;
        }

        .lo_button_class {
            border-radius: 50px;
            transition-duration: 0.4s;
            border: 2px solid black;
            background-color: lightgreen;
        }

            .u_button_class:hover, .rs_button_class:hover, .e_button_class:hover, .lo_button_class:hover, .cancel_button_class:hover {
                background-color: black;
                color: white;
            }

        .FU {
            border-radius: 50px;
        }

        .da_button_class {
            border-radius: 50px;
            border: 2px solid black;
            background-color: red;
        }

            .da_button_class:hover {
                animation: blinkingText 1.0s infinite;
            }

        .cancel_button_class {
            border-radius: 50px;
            border: 2px solid black;
            background-color: green;
        }

        @keyframes blinkingText {
            0% {
                color: #000;
            }

            60% {
                color: transparent;
            }

            100% {
                color: #000;
            }
        }

        .auto-style3 {
            margin: 0;
            padding: 0;
            height: 40px;
        }

        .connect_link {
            text-decoration: none;
            font-weight: bold;
            font-size: 25px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" class="center">
        <div style="margin-left: auto; margin-top: 15px; margin-right: auto; text-align: center" runat="server" id="blink_privilege" visible="false">

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" Interval="500" OnTick="Timer1_Tick1">
                    </asp:Timer>
                    <asp:Label ID="show_privilege" runat="server" Font-Bold="True" Font-Names="Copperplate Gothic Bold" Font-Size="XX-Large" ForeColor="Red" server="" Text="*Privilege*" ToolTip="You are an Admin. Scroll down to access admin controlled pages."></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="profile_pic">
            <img runat="server" class="image" src="http://localhost:51802/img/profile.jpg" id="dp" alt="Click update button to view changes/updates applied." /><br />
        </div>

        <div style="text-align: center">
            <asp:Label ID="name_label" runat="server" Text="Welcome!!" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Larger" ForeColor="Red"></asp:Label>
        </div>
        <div runat="server" id="upload_img" class="upload_img" visible="false">
            <asp:FileUpload ID="FileUpload1" runat="server" Width="250px" CssClass="FU" />
            &nbsp;<asp:Button ID="Button1" CssClass="u_button_class" runat="server" Text="Upload Profile Pic" Width="136px" OnClick="upload_btn_Click"></asp:Button>
        </div>

        <div class="card">
            <table class="auto-style1">
                <tr>
                    <th scope="col">user name:</th>
                    <td>
                        <asp:TextBox ID="uname" class="text" runat="server" ReadOnly="True" TextMode="Email" ToolTip="user name"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th scope="col">DOB:</th>

                    <td>
                        <asp:TextBox ID="dob" runat="server" class="text" TextMode="Date" ToolTip="Date of Birth" ReadOnly="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="dob" Display="Dynamic" ErrorMessage="Date of Birth required" Font-Size="Medium" ForeColor="Red" ToolTip="required field" Visible="False">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <th scope="col">Roll NO.:</th>

                    <td>
                        <asp:TextBox ID="roll_no" class="text" runat="server" TextMode="Number" ToolTip="Roll number" ReadOnly="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="roll_no" Display="Dynamic" ErrorMessage="Roll no. required" Font-Size="Medium" ForeColor="Red" ToolTip="required field" Visible="False">*</asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <th scope="col">First Name:</th>
                    <td>
                        <asp:TextBox ID="fname" runat="server" class="text" ToolTip="First Name" ReadOnly="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="fname" Display="Dynamic" ErrorMessage="First name required" Font-Size="Medium" ForeColor="Red" ToolTip="required field" Visible="False">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <th scope="col">Last_name:</th>
                    <td>
                        <asp:TextBox ID="lname" runat="server" class="text" ToolTip="Last Name" ReadOnly="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="lname" Display="Dynamic" ErrorMessage="Last name required" Font-Size="Medium" ForeColor="Red" ToolTip="required field" Visible="False">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </div>
        <table class="center">
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="reset_pass" CssClass="rs_button_class" runat="server" Height="41px" Text="Reset Password" Width="148px" PostBackUrl="~/Reset_Password.aspx" Font-Bold="True" Font-Names="DejaVu Sans Condensed" Font-Size="Small" />
                </td>
                <td class="auto-style2">
                    <asp:Button ID="chng_button" CssClass="e_button_class" runat="server" Height="41px" OnClick="Edit_Click" Text="Edit Profile" Width="148px" Font-Bold="True" Font-Names="Showcard Gothic" Font-Size="Small" />
                </td>
                <td class="auto-style2">
                    <asp:Button ID="log_out_btn" CssClass="lo_button_class" runat="server" Height="41px" Text="Log Out" Width="148px" Font-Bold="True" Font-Names="Bahnschrift SemiCondensed" Font-Size="Medium" OnClick="lo_account_Click1" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="3" style="text-align: center">
                    <asp:HyperLink ID="HyperLink3" CssClass="connect_link" runat="server" NavigateUrl="mailto:tyelearnit@gmail.com" ForeColor="Blue" Target="_blank" ToolTip="Mail Admin/Author">Connect to Admin/Author</asp:HyperLink>
                    <br />
                    <asp:Label ID="Label2" runat="server" Width="100%" Text="(For suggesting a content upload, feedback, issues etc..)" Font-Italic="True" ForeColor="#6BCA02"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center; width: 100%">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Button ID="rmv_account" CssClass="da_button_class" runat="server" Height="51px" Text="Delete Account" Width="239px" Font-Bold="True" Font-Names="Times New Roman" Font-Size="X-Large" OnClick="da_account_Click1" Font-Overline="False" />
                            <br />
                            <div id="delete_div" runat="server" visible="false">
                                <asp:TextBox ID="verify_pass" CssClass="FU" runat="server" placeholder="Enter your password" TextMode="Password"></asp:TextBox>
                                <br />
                                <asp:Button ID="confirm_delete" CssClass="da_button_class" runat="server" Text="Confirm" Font-Bold="True" Font-Names="Algerian" OnClick="Confirm_Click" Width="110px" />
                                &nbsp;<asp:Button ID="cancel_delete" runat="server" CssClass="cancel_button_class" Font-Bold="True" Font-Names="Algerian" OnClick="Cancel_Click" Text="Cancel" Width="110px" />
                                <br />
                                <asp:Label ID="error_label" runat="server" Font-Bold="True" ForeColor="#0033CC" Text="Label" Visible="False"></asp:Label>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="auto-style2">
                    <div id="admin_content_div" runat="server" visible="false" class="auto-style1">
                        <fieldset style="border-radius: 50px; border-width: 5px; text-align: center">
                            <legend>
                                <asp:Label ID="Label1" runat="server" Width="100%" Text="Pages under admin control." Font-Bold="False" Font-Names="Stencil"></asp:Label>
                            </legend>
                            <div style="">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminView.aspx" ForeColor="Blue">Manage Site&#39;s Data</asp:HyperLink>
                                <br />
                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AddContent.aspx" ForeColor="Blue">Add Contents</asp:HyperLink>
                            </div>
                        </fieldset>
                    </div>
                    &nbsp;</td>
            </tr>

            <tr>
                <td colspan="3" class="auto-style2">
                    <asp:ValidationSummary ID="ValidationSummary" runat="server" Font-Size="Medium" ForeColor="Blue" HeaderText="Errors:" ShowMessageBox="True" ShowSummary="False" Width="100%" />
                    <br />
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
