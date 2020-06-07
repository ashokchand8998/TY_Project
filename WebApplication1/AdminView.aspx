<%@ Page Title="Admin View" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminView.aspx.cs" Inherits="WebApplication1.AdminView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want to save data?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>

    <style type="text/css">
        .mydatagrid {
            width: 80%;
            border: solid 2px black;
            min-width: 80%;
            margin-left: auto;
            margin-right: auto;
        }

        .header {
            background-color: #000;
            font-family: Arial;
            color: White;
            height: 25px;
            text-align: center;
            font-size: 16px;
        }

        .rows {
            background-color: #fff;
            font-family: Arial;
            font-size: 14px;
            color: #000;
            min-height: 25px;
            text-align: center;
        }

            .rows:hover {
                background-color: #ff4f53;
                color: #fff;
            }

        .mydatagrid a /** FOR THE PAGING ICONS  **/ {
            background-color: Transparent;
            padding: 5px 5px 5px 5px;
            text-decoration: none;
            font-weight: bold;
        }

            .mydatagrid a:hover /** FOR THE PAGING ICONS  HOVER STYLES**/ {
                color: #000;
            }
        /*
        .mydatagrid span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/
        /*{
            padding: 5px 5px 5px 5px;
            background-color: #000;
            color: #fff;
        }
*/
        .pager {
            background-color: #ff4f53;
            font-family: Arial;
            color: White;
            height: 30px;
            text-align: left;
        }

        .mydatagrid td {
            padding: 5px;
        }

        .mydatagrid th {
            padding: 5px;
        }

        .tables_div div {
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            margin: 10px;
        }

        .s_sub {
            color: #fff;
            font-size: 18px;
            padding: 5px 10px;
            border-radius: 5px 12px;
            background-color: #ff4f53;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="tables_div" class="tables_div">
        <div id="select_table_div">
            <asp:Label ID="Label6" runat="server" Text="Select Table:" Font-Bold="True" Font-Size="Larger"></asp:Label>
            <br />
            <asp:DropDownList ID="select_table" runat="server" CssClass="s_sub" AutoPostBack="True" OnSelectedIndexChanged="select_table_SelectedIndexChanged">
            </asp:DropDownList>

            <br />

            <br />
            <asp:Label ID="Label7" runat="server" Text="!Keep Caution while editing or deleting!*Deleting data is irreversible process* " Font-Size="Larger" ForeColor="Red" BorderColor="Black" BorderStyle="Dashed"></asp:Label>

        </div>


        <div id="Users" runat="server" class="table" visible="False">
            <asp:GridView ID="users_table" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="user_name" DataSourceID="get_users" PageSize="15">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" CausesValidation="False" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="user_name" HeaderText="username" ReadOnly="True" SortExpression="user_name" />
                    <asp:BoundField DataField="First_name" HeaderText="First Name" SortExpression="First_name" />
                    <asp:BoundField DataField="Last_name" HeaderText="Last Name" SortExpression="Last_name" />
                    <asp:BoundField DataField="roll_no" HeaderText="Roll No." SortExpression="roll_no" />
                    <asp:TemplateField HeaderText="Date Of Birth" SortExpression="dob">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("dob", "{0:dd, MMM yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Profile Pic" SortExpression="profile_pic">
                        <EditItemTemplate>
                            <asp:Image ID="Image1" runat="server" AlternateText='<%# Eval("First_name")%>' Height="58px" ImageUrl='<%# Eval("profile_pic") %>' Width="106px" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" AlternateText='<%# Eval("First_name")%>' ImageUrl='<%# Eval("profile_pic") %>' Height="58px" Width="106px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="privilege" HeaderText="Privilege" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="get_users" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DBCS %>" DeleteCommand="DELETE FROM [Users] WHERE [user_name] = @original_user_name" InsertCommand="INSERT INTO [Users] ([user_name], [dob], [roll_no], [Last_name], [First_name], [profile_pic]) VALUES (@user_name, @dob, @roll_no, @Last_name, @First_name, @profile_pic)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [user_name], [dob], [roll_no], [Last_name], [First_name], [profile_pic], [privilege] FROM [Users]" UpdateCommand="UPDATE [Users] SET [dob] = @dob, [roll_no] = @roll_no, [Last_name] = @Last_name, [First_name] = @First_name, [profile_pic] = @profile_pic WHERE [user_name] = @original_user_name">
                <DeleteParameters>
                    <asp:Parameter Name="original_user_name" Type="String" />
                    <asp:Parameter DbType="Date" Name="original_dob" />
                    <asp:Parameter Name="original_roll_no" Type="Int32" />
                    <asp:Parameter Name="original_Last_name" Type="String" />
                    <asp:Parameter Name="original_First_name" Type="String" />
                    <asp:Parameter Name="original_profile_pic" Type="String" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
        <div runat="server" id="Content" class="table" visible="false">
            <asp:GridView ID="GridView1" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="get_content">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
                    <asp:BoundField DataField="Type" HeaderText="Type" />
                    <asp:TemplateField HeaderText="Location" SortExpression="Location">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Location") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Location") %>' Target="_blank" Text='<%# Eval("Location") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Sem" HeaderText="Sem" SortExpression="Sem" />
                    <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="get_content" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DBCS %>" DeleteCommand="DELETE FROM [Content] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [Content] ([Name], [Type], [Sem], [Year], [Location], [Subject]) VALUES (@Name, @Type, @Sem, @Year, @Location, @Subject)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Content]" UpdateCommand="UPDATE [Content] SET [Name] = @Name, [Type] = @Type, [Sem] = @Sem, [Year] = @Year, [Location] = @Location, [Subject] = @Subject WHERE [Id] = @original_Id">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Sem" Type="String" />
                    <asp:Parameter Name="original_Year" Type="String" />
                    <asp:Parameter Name="original_Location" Type="String" />
                    <asp:Parameter Name="original_Subject" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Sem" Type="String" />
                    <asp:Parameter Name="Year" Type="String" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="Subject" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Sem" Type="String" />
                    <asp:Parameter Name="Year" Type="String" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="Subject" Type="String" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Sem" Type="String" />
                    <asp:Parameter Name="original_Year" Type="String" />
                    <asp:Parameter Name="original_Location" Type="String" />
                    <asp:Parameter Name="original_Subject" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div id="Subjects" runat="server" class="table" visible="false">

            <asp:GridView ID="GridView2" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AutoGenerateColumns="False" DataKeyNames="Sem" DataSourceID="get_subjects">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="Sem" HeaderText="Sem" ReadOnly="True" SortExpression="Sem" />
                    <asp:TemplateField HeaderText="Sub1" SortExpression="Sub1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Sub1") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Sub1") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sub2" SortExpression="Sub2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Sub2") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Sub2") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sub3" SortExpression="Sub3">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Sub3") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Sub3") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sub4" SortExpression="Sub4">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Sub4") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Sub4") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sub5" SortExpression="Sub5">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Sub5") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Sub5") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="get_subjects" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DBCS %>" DeleteCommand="DELETE FROM [Subjects] WHERE [Sem] = @original_Sem" InsertCommand="INSERT INTO [Subjects] ([Sem], [Sub1], [Sub2], [Sub3], [Sub4], [Sub5]) VALUES (@Sem, @Sub1, @Sub2, @Sub3, @Sub4, @Sub5)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Subjects]" UpdateCommand="UPDATE [Subjects] SET [Sub1] = @Sub1, [Sub2] = @Sub2, [Sub3] = @Sub3, [Sub4] = @Sub4, [Sub5] = @Sub5 WHERE [Sem] = @original_Sem">
                <DeleteParameters>
                    <asp:Parameter Name="original_Sem" Type="String" />
                    <asp:Parameter Name="original_Sub1" Type="String" />
                    <asp:Parameter Name="original_Sub2" Type="String" />
                    <asp:Parameter Name="original_Sub3" Type="String" />
                    <asp:Parameter Name="original_Sub4" Type="String" />
                    <asp:Parameter Name="original_Sub5" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Sem" Type="String" />
                    <asp:Parameter Name="Sub1" Type="String" />
                    <asp:Parameter Name="Sub2" Type="String" />
                    <asp:Parameter Name="Sub3" Type="String" />
                    <asp:Parameter Name="Sub4" Type="String" />
                    <asp:Parameter Name="Sub5" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Sub1" Type="String" />
                    <asp:Parameter Name="Sub2" Type="String" />
                    <asp:Parameter Name="Sub3" Type="String" />
                    <asp:Parameter Name="Sub4" Type="String" />
                    <asp:Parameter Name="Sub5" Type="String" />
                    <asp:Parameter Name="original_Sem" Type="String" />
                    <asp:Parameter Name="original_Sub1" Type="String" />
                    <asp:Parameter Name="original_Sub2" Type="String" />
                    <asp:Parameter Name="original_Sub3" Type="String" />
                    <asp:Parameter Name="original_Sub4" Type="String" />
                    <asp:Parameter Name="original_Sub5" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
        <br />


    </div>
</asp:Content>
