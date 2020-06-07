<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="More.aspx.cs" Inherits="WebApplication1.More" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            padding: 50px;
        }

        .card {
            box-shadow: 0 4px 8px 0 rgba(255,0,0,0.5);
            transition: 0.3s;
            width: 300px;
            margin-left: auto;
            margin-right: auto;
            padding: 5px;
            border-radius: 50px;
            text-align: center;
            background-color: white;
        }

            .card:hover {
                box-shadow: 10px 10px 10px 0 rgba(0,255,0,0.7);
            }

        .container {
            padding: 2px 16px;
        }

        .topic_img {
            width: 100%;
            border-radius: 50px;
        }

        .link {
            text-decoration: none;
            color: black;
        }

        .m_div {
            background-image: url('/img/background.jpg');
            background-repeat: no-repeat;
            background-size: 100% 100%;
            background-attachment: fixed;
            width: 100%;
        }

        .table {
            margin-left: auto;
            margin-right: auto;
            width: 90%;
            text-align: center;
            background-color: rgba(0,0,0,0.7);
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_div" class="m_div" runat="server">
        <div id="main_icons" runat="server">
            <table class="auto-style1">
                <tr>
                    <td>
                        <div class="card">
                            <asp:HyperLink ID="development" CssClass="link" runat="server" NavigateUrl="More.aspx?topic=Web_Development">
                                <asp:Image ID="Image1" CssClass="topic_img" runat="server" src="img/development.png" />
                                <div class="container">
                                    <h2><b>Web Development</b></h2>
                                </div>
                            </asp:HyperLink>
                        </div>
                    </td>
                    <td>
                        <div class="card">
                            <asp:HyperLink ID="HyperLink1" CssClass="link" runat="server" NavigateUrl="More.aspx?topic=Ethical_Hacking">
                                <asp:Image ID="Image2" runat="server" CssClass="topic_img" ImageUrl="~/img/hack.png" />
                                <div class="container">
                                    <h2><b>Ethical Hacking</b></h2>
                                </div>
                            </asp:HyperLink>

                        </div>
                    </td>
                    <td>
                        <div class="card">
                            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="link" NavigateUrl="More.aspx?topic=Database_Management_Systems">
                                <asp:Image ID="Image3" runat="server" src="img/database.png" CssClass="topic_img" />
                                <div class="container">
                                    <h2><b>Database</b></h2>
                                </div>
                            </asp:HyperLink>

                        </div>
                    </td>
                </tr>
            </table>

            <table class="auto-style1">
                <tr>
                    <td>
                        <div class="card">
                            <asp:HyperLink ID="HyperLink3" runat="server" CssClass="link" NavigateUrl="More.aspx?topic=Networking">
                                <asp:Image ID="Image4" runat="server" CssClass="topic_img" ImageUrl="~/img/network-icon.png" />
                                <div class="container">
                                    <h2><b>Networking</b></h2>
                                </div>
                            </asp:HyperLink>

                        </div>
                    </td>
                    <td>
                        <div class="card">
                            <asp:HyperLink ID="HyperLink4" runat="server" CssClass="link" NavigateUrl="More.aspx?topic=Others">
                                <asp:Image ID="Image5" CssClass="topic_img" runat="server" ImageUrl="~/img/others.png" />
                                <div class="container">
                                    <h2><b>Others</b></h2>
                                </div>
                            </asp:HyperLink>

                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div id="content_div" style="margin: 0; padding: 10px" runat="server" visible="false">
            <div id="main_table" style="padding-top: 20px" runat="server">
                <fieldset style="border-radius: 50px; border-width: 5px; text-align: center; margin-bottom: 20px; margin-right: auto; margin-left: auto; width: 70%">
                    <legend>
                        <asp:Label ID="Label1" runat="server" Width="100%" Font-Bold="False" Font-Names="Stencil" Font-Size="X-Large" ForeColor="Orange" BackColor="Black"></asp:Label>
                    </legend>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="get_content" CssClass="table" Height="100%">

                        <Columns>
                            <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">

                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Bind("Id") %>' ForeColor="Orange"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="20%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="File/Link" SortExpression="Name">

                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl='<%# Eval("Name") %>' Text='<%# Eval("Name") %>' Target="_blank" Font-Bold="True" ForeColor="#9999FF" ToolTip="click to view"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#ffa500" />
                        <RowStyle Font-Size="Large" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="get_content" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [Name], [Id] FROM [Content] WHERE (([Subject] = @Subject))">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Subject" QueryStringField="topic" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </fieldset>
            </div>
            <div id="extra_table" style="margin-top: 20px" runat="server">
                <fieldset style="border-radius: 50px; border-width: 5px; text-align: center; margin-bottom: 20px; margin-right: auto; margin-left: auto; width: 70%">
                    <legend>
                        <asp:Label ID="Label3" runat="server" Width="100%" Font-Bold="False" Font-Names="Stencil" Font-Size="X-Large" ForeColor="Orange" BackColor="Black" Text="Others/Extra">Others/Extra</asp:Label>
                    </legend>
                    <asp:GridView ID="GridView2" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="get_others">
                        <Columns>
                            <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">

                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Bind("Id") %>' ForeColor="Orange"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="20%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="File/Link" SortExpression="Name">

                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl='<%# Eval("Name") %>' Text='<%# Eval("Name") %>' Target="_blank" Font-Bold="True" ForeColor="#9999FF" ToolTip="click to view"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type">

                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Type") %>' Font-Bold="True" ForeColor="Orange"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#ffa500" />
                        <RowStyle Font-Size="Large" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="get_others" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [Id], [Name], [Type] FROM [Content] WHERE (([Sem] = @Sem) AND ([Subject] = @Subject))">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="No_Sem" Name="Sem" Type="String" />
                            <asp:Parameter DefaultValue="Others" Name="Subject" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>
