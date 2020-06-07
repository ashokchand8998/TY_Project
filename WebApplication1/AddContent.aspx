<%@ Page Title="Add Contents" Language="C#" MasterPageFile="~/Site1.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="AddContent.aspx.cs" Inherits="WebApplication1.AddContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .page {
            background-color: rgba(0,0,0,0.8);
            width: 100%;
        }

        .main_container {
            margin-left: auto;
            margin-right: auto;
            width: 50%;
            min-width: 400px;
            padding: 10px;
            color: skyblue;
            font-size: large;
            padding-top:70px;
        }

        .title_lbl {
            font-weight: bold;
            font-size: larger;
            color: chartreuse;
        }

        .dd {
            color: #fff;
            padding: 5px 10px;
            border-radius: 5px;
            background-color: green;
            font-weight: bold;
        }

        .main_container .space {
            padding: 5px;
            border: 2px dashed skyblue;
            border-radius: 5px;
        }

        ul {
            list-style-position: inside;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page" class="page">
        <div class="main_container" runat="server">
            <div id="note_div" class="space">
                <asp:Label ID="note_title" runat="server" CssClass="title_lbl" Text="Note:"></asp:Label><br />
                <ul>
                    <li>If type of content is syllabus then please select only year.</li>
                    <li>Else if type of content is curriculum then sem must be selected.</li>
                    <li>Otherwise you may or may not select the sem and year as per content being uploaded.</li>
                    <li>Please follow (numbered) sequence</li>
                </ul>
            </div>
            <br />
            <br />
            <div id="adding_content_div" class="space">
                <asp:Label ID="content_dropdown_title" CssClass="title_lbl" runat="server" Text="1) Content to be Added:"></asp:Label>
                <br />
                <asp:DropDownList ID="add_content" runat="server" CssClass="dd" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                    <asp:ListItem>Select content to be added</asp:ListItem>
                    <asp:ListItem>Add File</asp:ListItem>
                    <asp:ListItem Value="Add Link">Add Link</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="add_content" ErrorMessage="Required"></asp:RequiredFieldValidator>

                <div runat="server" id="adding_title_div" visible="False">
                    <br />
                    <asp:Label ID="adding_title" CssClass="title_lbl" runat="server" Text="Add here:"></asp:Label>
                </div>
                <asp:FileUpload ID="upload_file" class="file_up" runat="server" Visible="False" />

                <asp:TextBox ID="content_name" class="link_up" runat="server" Visible="False"></asp:TextBox>
            </div>
            <br />
            <br />
            <div id="deciding_location_div" class="space">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Label ID="select_location_title" CssClass="title_lbl" runat="server" Text="2) Select content location:"></asp:Label><br />
                        <asp:DropDownList class="s_location" ID="select_location" CssClass="dd" runat="server" DataValueField="Curriculum(Local)" AutoPostBack="True" OnSelectedIndexChanged="select_location_SelectedIndexChanged" ToolTip="Please select appropriate option as per content being uploaded.">
                            <asp:ListItem>Curriculum(Local)</asp:ListItem>
                            <asp:ListItem>Curriculum(Link)</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                            <asp:ListItem>Others(Link)</asp:ListItem>
                            <asp:ListItem>Syllabus</asp:ListItem>
                        </asp:DropDownList>
                        <br />

                        <div id="options_for_curriculum_upload" runat="server">
                            <br />
                        <asp:Label ID="select_year_title" CssClass="title_lbl" runat="server" Text="2.1) Select Year (Please select year if content being added is syllabus):"></asp:Label>
                            <br />
                            <asp:RadioButtonList ID="select_year" class="s_year" runat="server">
                                <asp:ListItem>I</asp:ListItem>
                                <asp:ListItem>II</asp:ListItem>
                                <asp:ListItem>III</asp:ListItem>
                            </asp:RadioButtonList>

                            <br />
                            <asp:Label ID="select_sem_title" CssClass="title_lbl" runat="server" Text="2.2) Select Sem:"></asp:Label><br />
                            <asp:RadioButtonList ID="select_sem" class="s_sem" runat="server" CellPadding="1" CellSpacing="1" Height="73px" Width="86px" AutoPostBack="True" OnSelectedIndexChanged="select_sem_SelectedIndexChanged">
                                <asp:ListItem>Sem1</asp:ListItem>
                                <asp:ListItem>Sem2</asp:ListItem>
                                <asp:ListItem>Sem3</asp:ListItem>
                                <asp:ListItem>Sem4</asp:ListItem>
                                <asp:ListItem>Sem5</asp:ListItem>
                                <asp:ListItem>Sem6</asp:ListItem>
                            </asp:RadioButtonList>

                        </div>
                        <br />
                        <asp:Label ID="select_sub_title" CssClass="title_lbl" runat="server" Text="3) Select subject:"></asp:Label><br />
                        <asp:DropDownList ID="select_sub" CssClass="dd" runat="server"></asp:DropDownList>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="select_sem" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <br />
            <br />
            <div id="select_type_div" class="space">
                <asp:Label ID="select_type_title" runat="server" CssClass="title_lbl" Text="4) Select content type:"></asp:Label><br />
                <asp:RadioButtonList ID="select_content_type" class="s_ctype" runat="server">
                    <asp:ListItem>Course</asp:ListItem>
                    <asp:ListItem>Question_Paper</asp:ListItem>
                    <asp:ListItem>Book</asp:ListItem>
                    <asp:ListItem>Notes</asp:ListItem>
                    <asp:ListItem>Syllabus</asp:ListItem>
                    <asp:ListItem>Others</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <br />
            <div style="text-align: center">
                <asp:Button ID="Button1" CssClass="dd" BorderStyle="Double" runat="server" Height="44px" Text="Save data" Width="310px" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</asp:Content>
