<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminView.aspx.cs" Inherits="WebApplication1.AdminView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" style="margin-right: 30%; margin-left: 30%; border: groove; border-color: blue; border-radius: 25px; padding: 10px;">

        <br />
        <asp:Label ID="problem_finder" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="Label1" runat="server" Text="If type of content is syllabus then please select only year. Else if type of content is curriculum then sem must be selected. Otherwise you may or may not select the sem and year as per content being uploaded."></asp:Label>
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional"><ContentTemplate>
        Content to be Added:
        <asp:DropDownList ID="add_content" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
            <asp:ListItem>Select content to be added</asp:ListItem>
            <asp:ListItem>Add File</asp:ListItem>
            <asp:ListItem Value="Add Link">Add Link</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="add_content" ErrorMessage="Required"></asp:RequiredFieldValidator>
        <br />
        <br />
        Add here:
        <div>
            <asp:FileUpload ID="FileUpload1" class="file_up" runat="server" Visible="False" />
            
            <asp:TextBox ID="content_name" class="link_up" runat="server" Visible="False"></asp:TextBox>
        </div>
        </ContentTemplate></asp:UpdatePanel>
            
        <br />
        <br />
        Select content location:
        <asp:DropDownList class="s_location" ID="select_location" runat="server" DataValueField="Curriculum(Local)" AutoPostBack="True" OnSelectedIndexChanged="select_location_SelectedIndexChanged">
            <asp:ListItem>Curriculum(Local)</asp:ListItem>
            <asp:ListItem>Curriculum(Link)</asp:ListItem>
            <asp:ListItem>Others</asp:ListItem>
            <asp:ListItem>Others(Link)</asp:ListItem>
            <asp:ListItem>Syllabus</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
        <div id="options_for_curriculum_upload" runat="server">
        Select Year (Please select year if content being added is syllabus):
            
            <asp:RadioButtonList ID="select_year" class="s_year" runat="server">
            <asp:ListItem>I</asp:ListItem>
            <asp:ListItem>II</asp:ListItem>
            <asp:ListItem>III</asp:ListItem>
        </asp:RadioButtonList>
        
        <br />
        Select Sem:
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
        Select subject:        
        <asp:DropDownList ID="select_sub" class="s_sub" runat="server"></asp:DropDownList>
                
                </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="select_sem" EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
            
        <br />
        <br />
        Select content type: 
        <asp:RadioButtonList ID="select_content_type" class="s_ctype" runat="server">
            <asp:ListItem>Course</asp:ListItem>
            <asp:ListItem>Question Paper</asp:ListItem>
            <asp:ListItem>Book</asp:ListItem>
            <asp:ListItem>Notes</asp:ListItem>
            <asp:ListItem>Syllabus</asp:ListItem>
            <asp:ListItem>Others</asp:ListItem>
        </asp:RadioButtonList>
           
        <br />
        <br />
        <asp:Button ID="Button1" class="save_button" runat="server" Height="44px" Text="Save data" Width="310px" OnClick="Button1_Click" />
    </div>

</asp:Content>
