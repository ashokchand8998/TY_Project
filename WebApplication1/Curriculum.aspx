<%@ Page Title="Curriculum" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Curriculum.aspx.cs" Inherits="WebApplication1.Properties.Curriculum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            padding: 0px;
        }

        .years_table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

            .years_table th {
                font-size: 25px;
                padding: 5px;
                border-top: 2px solid black;
                border-bottom: 2px solid black;
                background-color: gray;
            }

            .years_table td {
                font-size: 20px;
                padding: 5px;
                background-color: orange;
            }

        .content {
            height: 100vh;
            padding: 0px;
        }

        .auto-style4 {
            height: 27px;
        }

        .auto-style5 {
            position: fixed;
            z-index: 1;
            top: 75px;
            left: 0px;
            overflow-x: hidden;
            padding: 8px 0;
            width: 18.4%;
            font-size: medium;
            padding: 0px;
            vertical-align: top;
            border: 2px solid black;
        }


        .auto-style6 {
            height: 500px;
            padding: 0px;
        }

        .heading {
            font-size: 50px;
            background-color: grey;
            font-family: 'Times New Roman';
            font-weight: bold;
            color: orange;
            border-radius: 10px;
            border: 2px solid black;
        }

        .table {
            margin-left: auto;
            margin-right: auto;
            width: 90%;
            text-align: center;
            background-color: rgba(0,0,0,0.8);
        }

        .s_sub {
            color: #fff;
            font-size: 18px;
            padding: 5px 10px;
            border-radius: 5px 12px;
            background-color: #292929;
            font-weight: bold;
        }
        .sub_list_div{
            position: fixed;
            z-index: 1;
            top: 430px;
            left: 0px;
            overflow-x: hidden;
            vertical-align: top;
            width:18.4%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style5">
                <div class="table_div">
                    <table class="years_table">
                        <tr>
                            <th>FY</th>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:HyperLink ID="sem1" runat="server" NavigateUrl="~/Curriculum.aspx?sem=Sem1&year=I" ForeColor="Blue">SEM I</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="sem2" runat="server" NavigateUrl="~/Curriculum.aspx?sem=Sem2&year=I" ForeColor="Blue">SEM II</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <th>SY</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="sem3" runat="server" NavigateUrl="~/Curriculum.aspx?sem=Sem3&year=II" ForeColor="Blue">SEM III</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="sem4" runat="server" NavigateUrl="~/Curriculum.aspx?sem=Sem4&year=II" ForeColor="Blue">SEM IV</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <th>TY</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="sem5" runat="server" NavigateUrl="~/Curriculum.aspx?sem=Sem5&year=III" ForeColor="Blue">SEM V</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:HyperLink ID="sem6" runat="server" NavigateUrl="~/Curriculum.aspx?sem=Sem6&year=III" ForeColor="Blue">SEM VI</asp:HyperLink>
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td class="auto-style6">
                <div id="d1" style="margin-left: 18.7%; height: 100%" runat="server">
                    <div id="default_div" style="height: 100%" runat="server">
                        <asp:Image ID="Image1" runat="server" Height="100%" ImageUrl="~/img/syllabus_diagram.jpg" Width="100%" />
                    </div>

                    <div id="sem_page" style="height: 100%; text-align: center; margin-top: 10px" runat="server">
                        <asp:Label ID="Heading" CssClass="heading" runat="server"></asp:Label>
                        <div id="subject_list" class="sub_list_div">
                            <asp:DropDownList ID="select_sub" class="s_sub" runat="server" AutoPostBack="True" AppendDataBoundItems="True" DataSourceID="get_sub" DataTextField="field" DataValueField="field" Width="100%">
                                <asp:ListItem Text="Please select any subject" Value="" />
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="get_sub" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT field FROM [Subjects] UNPIVOT( field FOR [sub] IN ([Sub1], [Sub2], [Sub3], [Sub4],[Sub5])) unpvt where sem=@sem">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="Sem" QueryStringField="sem" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <br />
                        <div id="syllabus_div" style="margin-top: 10px">
                            <fieldset style="border-radius: 50px; border-width: 5px; text-align: center; margin-bottom: 20px; margin-right: auto; margin-left: auto; width: 70%">
                                <legend>
                                    <asp:Label ID="syllabus_title" runat="server" Width="100%" Font-Bold="False" Font-Names="Stencil" Font-Size="X-Large" ForeColor="#0066FF">Syllabus</asp:Label>
                                </legend>
                                <asp:GridView ID="Syllabus" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="get_syllabus">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Orange" Text='<%# Bind("Id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="File / Link" SortExpression="Name">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Location") %>' Target="_blank" Font-Bold="True" ForeColor="#9999FF" ToolTip="click to view" Text='<%# Eval("Name") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" Visible="False" />
                                    </Columns>
                                    <HeaderStyle BackColor="#ffa500" />
                                    <RowStyle Font-Size="Large" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="get_syllabus" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [Id], [Name], [Location] FROM [Content] WHERE (([Year] = @Year) AND ([Type] = @Type))">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="Year" QueryStringField="year" Type="String" />
                                        <asp:Parameter DefaultValue="Syllabus" Name="Type" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </fieldset>
                        </div>
                        <br />
                        <div id="notes_div">
                            <fieldset style="border-radius: 50px; border-width: 5px; text-align: center; margin-bottom: 20px; margin-right: auto; margin-left: auto; width: 70%">
                                <legend>
                                    <asp:Label ID="notes_title" Text="Notes" runat="server" Width="100%" Font-Bold="False" Font-Names="Stencil" Font-Size="X-Large" ForeColor="#0066FF"></asp:Label>
                                </legend>
                                <asp:GridView ID="Notes" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="get_notes">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Orange" Text='<%# Bind("Id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="File / Link" SortExpression="Name">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" ForeColor="#9999FF" ToolTip="click to view" NavigateUrl='<%# Eval("Location") %>' Target="_blank" Text='<%# Eval("Name") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" Visible="False" />
                                    </Columns>
                                    <HeaderStyle BackColor="#ffa500" />
                                    <RowStyle Font-Size="Large" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="get_notes" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [Id], [Name], [Location] FROM [Content] WHERE (([Sem] = @Sem) AND ([Subject] = @Subject) AND ([Type] = @Type))">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="Sem" QueryStringField="sem" Type="String" />
                                        <asp:ControlParameter ControlID="select_sub" Name="Subject" PropertyName="SelectedValue" Type="String" />
                                        <asp:Parameter DefaultValue="Notes" Name="Type" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </fieldset>
                        </div>
                        <br />
                        <div id="books_div">
                            <fieldset style="border-radius: 50px; border-width: 5px; text-align: center; margin-bottom: 20px; margin-right: auto; margin-left: auto; width: 70%">
                                <legend>
                                    <asp:Label ID="books_title" runat="server" Text="Books" Width="100%" Font-Bold="False" Font-Names="Stencil" Font-Size="X-Large" ForeColor="#0066FF"></asp:Label>
                                </legend>
                                <asp:GridView ID="Book" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="get_books">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">

                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Orange" Text='<%# Bind("Id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="File / Link" SortExpression="Name">

                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" ForeColor="#9999FF" ToolTip="click to view" NavigateUrl='<%# Eval("Location") %>' Target="_blank" Text='<%# Eval("Name") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" Visible="False" />
                                    </Columns>
                                    <HeaderStyle BackColor="#ffa500" />
                                    <RowStyle Font-Size="Large" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="get_books" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [Id], [Name], [Location] FROM [Content] WHERE (([Sem] = @Sem) AND ([Subject] = @Subject) AND ([Type] = @Type))">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="Sem" QueryStringField="sem" Type="String" />
                                        <asp:ControlParameter ControlID="select_sub" Name="Subject" PropertyName="SelectedValue" Type="String" />
                                        <asp:Parameter DefaultValue="Book" Name="Type" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </fieldset>
                        </div>
                        <br />
                        <div id="qp_div">
                            <fieldset style="border-radius: 50px; border-width: 5px; text-align: center; margin-bottom: 20px; margin-right: auto; margin-left: auto; width: 70%">
                                <legend>
                                    <asp:Label ID="qp_title" runat="server" Text="Question Papers" Width="100%" Font-Bold="False" Font-Names="Stencil" Font-Size="X-Large" ForeColor="#0066FF"></asp:Label>
                                </legend>
                                <asp:GridView ID="Question_Paper" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="get_qp">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Orange" Text='<%# Bind("Id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="File / Link" SortExpression="Name">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" ForeColor="#9999FF" ToolTip="click to view" NavigateUrl='<%# Eval("Location") %>' Target="_blank" Text='<%# Eval("Name") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" Visible="False" />
                                    </Columns>
                                    <HeaderStyle BackColor="#ffa500" />
                                    <RowStyle Font-Size="Large" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="get_qp" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [Id], [Name], [Location] FROM [Content] WHERE (([Sem] = @Sem) AND ([Subject] = @Subject) AND ([Type] = @Type))">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="Sem" QueryStringField="sem" Type="String" />
                                        <asp:ControlParameter ControlID="select_sub" Name="Subject" PropertyName="SelectedValue" Type="String" />
                                        <asp:Parameter DefaultValue="Question_Paper" Name="Type" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </fieldset>
                        </div>
                        <br />
                        <div id="course_div">
                            <fieldset style="border-radius: 50px; border-width: 5px; text-align: center; margin-bottom: 20px; margin-right: auto; margin-left: auto; width: 70%">
                                <legend>
                                    <asp:Label ID="course_title" runat="server" Text="Courses" Width="100%" Font-Bold="False" Font-Names="Stencil" Font-Size="X-Large" ForeColor="#0066FF"></asp:Label>
                                </legend>
                                <asp:GridView ID="Course" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="get_course">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Orange" Text='<%# Bind("Id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="File / Link" SortExpression="Name">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" ForeColor="#9999FF" ToolTip="click to view" NavigateUrl='<%# Eval("Location") %>' Target="_blank" Text='<%# Eval("Name") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" Visible="False" />
                                    </Columns>
                                    <HeaderStyle BackColor="#ffa500" />
                                    <RowStyle Font-Size="Large" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="get_course" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [Id], [Name], [Location] FROM [Content] WHERE (([Sem] = @Sem) AND ([Subject] = @Subject) AND ([Type] = @Type))">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="Sem" QueryStringField="sem" Type="String" />
                                        <asp:ControlParameter ControlID="select_sub" Name="Subject" PropertyName="SelectedValue" Type="String" />
                                        <asp:Parameter DefaultValue="Course" Name="Type" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </fieldset>
                        </div>
                        <br />
                        <div id="others_div">
                            <fieldset style="border-radius: 50px; border-width: 5px; text-align: center; margin-bottom: 20px; margin-right: auto; margin-left: auto; width: 70%">
                                <legend>
                                    <asp:Label ID="others_title" runat="server" Text="Others" Width="100%" Font-Bold="False" Font-Names="Stencil" Font-Size="X-Large" ForeColor="#0066FF"></asp:Label>
                                </legend>
                                <asp:GridView ID="Others" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="get_others">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Orange" Text='<%# Bind("Id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="File / Link" SortExpression="Name">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" ForeColor="#9999FF" ToolTip="click to view" NavigateUrl='<%# Eval("Location") %>' Target="_blank" Text='<%# Eval("Name") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" Visible="False" />
                                    </Columns>
                                    <HeaderStyle BackColor="#ffa500" />
                                    <RowStyle Font-Size="Large" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="get_others" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [Id], [Name], [Location] FROM [Content] WHERE (([Sem] = @Sem) AND ([Subject] = @Subject) AND ([Type] = @Type))">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="Sem" QueryStringField="sem" Type="String" />
                                        <asp:ControlParameter ControlID="select_sub" Name="Subject" PropertyName="SelectedValue" Type="String" />
                                        <asp:Parameter DefaultValue="Others" Name="Type" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
