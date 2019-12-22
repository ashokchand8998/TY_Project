<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WebApplication1.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 100%;
        }
        .profile_pic{
            margin-top:15px;
            margin-bottom:10px;
            height: 250px;
            width: 250px;
            
        }
        .image {
            border-radius:145px;
            border:5px solid Black;
            height: 100%;
            width: 100%;
        }
        .upload_img{
            width: 250px;
            margin-top:15px;
            border:2px solid Black;
            display:none;
        }
        .card {
            margin: 15px 50px 5px 50px;
            border-radius: 50px;
            background-color: #CC00FF;
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
            background-color: #CC00FF;
            border: none;
            border-bottom: 1px solid black;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <center>
        <div class="profile_pic">
            <img class="image" src="img/profile.jpg" id="dp" /><br />
            </div>
        <div><asp:Label ID="name_label" runat="server" Text="Welcome!!" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Larger" ForeColor="Red"></asp:Label></div>
        <div class="upload_img"><asp:FileUpload ID="FileUpload1" runat="server" Width="250px" />
</div>

    <div class="card">
        <table class="auto-style1">
            <tr>
                <th scope="col">user name:</th>
                <td>
                    <asp:TextBox ID="uname" class="text" runat="server" ReadOnly="True" TextMode="Email" ToolTip="user name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="uname" Display="Dynamic" ErrorMessage="Email id required" Font-Size="Medium" ForeColor="Red" ToolTip="required field">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th scope="col">DOB:</th>
                
                <td>
                    <asp:TextBox ID="dob" runat="server" class="text" TextMode="Date" ToolTip="Date of Birth" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="dob" Display="Dynamic" ErrorMessage="Date of Birth required" Font-Size="Medium" ForeColor="Red" ToolTip="required field">*</asp:RequiredFieldValidator>
                 </td>
                        </tr>
                        <tr>
                            <th scope="col">Roll NO.:</th>
               
                            <td>
                    <asp:TextBox ID="roll_no" class="text" runat="server" TextMode="Number" ToolTip="Roll number" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="roll_no" Display="Dynamic" ErrorMessage="Roll no. required" Font-Size="Medium" ForeColor="Red" ToolTip="required field">*</asp:RequiredFieldValidator>
                 </td>
           </tr>
                        
            <tr>
                <th scope="col">First Name:</th>
                <td>
                    <asp:TextBox ID="fname" runat="server" class="text" ToolTip="First Name" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fname" Display="Dynamic" ErrorMessage="First name required" Font-Size="Medium" ForeColor="Red" ToolTip="required field">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th scope="col">Last_name:</th>
                            <td>
                    <asp:TextBox ID="lname" runat="server" class="text" ToolTip="Last Name" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lname" Display="Dynamic" ErrorMessage="Last name required" Font-Size="Medium" ForeColor="Red" ToolTip="required field">*</asp:RequiredFieldValidator>
                </td>
            </tr>
       </table>
    </div>
        <asp:Button ID="Button1" runat="server" Text="Edit Profile" Height="41px" OnClick="Button1_Click" Width="148px"></asp:Button>
        </center>

</asp:Content>
