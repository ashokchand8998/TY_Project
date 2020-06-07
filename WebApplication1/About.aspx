<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication1.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style1 {
            height: 535px;
        }

        .auto-style2 {
            height: 92%;
            width: 100%;
        }

        .gitlink:hover {
            margin-left:auto;
            margin-right:auto;
            border-radius: 145px;
            border: 5px solid #ff6a00;
        }
        .gitlink{
            background-color:white;
            border-radius: 145px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color:rgba(0,0,0,0.8)">
        <table style="width: 100%; height: 400px">
            <tr>
                <td style="width: 20%">
                    <div id="github_link" runat="server" style="text-align: center;width:100%">
                        <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" ToolTip="View Creaters Profile" NavigateUrl="https://github.com/ashokchand8998">
                            <asp:Image ID="Image1" class="gitlink" runat="server" ImageUrl="~/img/github_logo.png" Width="200px" Height="200px" />
                        </asp:HyperLink>
                    </div>
                </td>
                <td>
                    <div id="doc" style="margin-left: auto; margin-right: auto; margin-top: 0; text-align:center;" class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Text="Project Document (Black Book)" Font-Bold="True" Font-Names="Algerian" Font-Size="XX-Large" ForeColor="#FF6600"></asp:Label>
                        <iframe src="Contents/Project_BlackBook.pdf" class="auto-style2"></iframe>
                    </div>

                </td>
            </tr>
        </table>
    </div>

</asp:Content>
