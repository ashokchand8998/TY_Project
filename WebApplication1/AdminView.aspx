<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminView.aspx.cs" Inherits="WebApplication1.AdminView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" style="margin-right: 30%; margin-left: 30%; border: groove; border-color: blue; border-radius: 25px; padding: 10px;">

        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="If type of content is syllabus then please select only year. Else if type of content is curriculum then sem must be selected. Otherwise you may or may not select the sem and year as per content being uploaded."></asp:Label>
        <br />
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        or<br />
        <asp:TextBox ID="content_name" runat="server"></asp:TextBox>
        <br />
        <br />
        Select Sem:
        <asp:RadioButtonList ID="select_sem" runat="server" CellPadding="1" CellSpacing="1" Height="73px" Width="86px">
            <asp:ListItem>Sem1</asp:ListItem>
            <asp:ListItem>Sem2</asp:ListItem>
            <asp:ListItem>Sem3</asp:ListItem>
            <asp:ListItem>Sem4</asp:ListItem>
            <asp:ListItem>Sem5</asp:ListItem>
            <asp:ListItem>Sem6</asp:ListItem>
        </asp:RadioButtonList>
        <br />

        <br />
        Select subject:        
        <asp:DropDownList ID="select_sub" runat="server">
            <asp:ListItem>Others</asp:ListItem>
            <asp:ListItem>Sem1</asp:ListItem>
            <asp:ListItem>Imperative Programming</asp:ListItem>
            <asp:ListItem>Digital Electronics</asp:ListItem>
            <asp:ListItem>Operating Systems</asp:ListItem>
            <asp:ListItem>Discrete Mathematics</asp:ListItem>
            <asp:ListItem>Communication Skills</asp:ListItem>
            <asp:ListItem>Imperative Programming Practical</asp:ListItem>
            <asp:ListItem>Digital Electronics Practical</asp:ListItem>
            <asp:ListItem>Operating Systems Practical</asp:ListItem>
            <asp:ListItem>Discrete Mathematics Practical</asp:ListItem>
            <asp:ListItem>Communication Skills Practical</asp:ListItem>
            <asp:ListItem>Sem2</asp:ListItem>
            <asp:ListItem>Object oriented Programming</asp:ListItem>
            <asp:ListItem>Microprocessor Architecture</asp:ListItem>
            <asp:ListItem>Web Programming</asp:ListItem>
            <asp:ListItem>Numerical and Statistical Methods</asp:ListItem>
            <asp:ListItem>Green Computing</asp:ListItem>
            <asp:ListItem>Object Oriented Programming Practical</asp:ListItem>
            <asp:ListItem>Microprocessor Architecture Practical</asp:ListItem>
            <asp:ListItem>Web Programming Practical</asp:ListItem>
            <asp:ListItem>Numerical and Statistical Methods Practical</asp:ListItem>
            <asp:ListItem>Green Computing Practical</asp:ListItem>
            <asp:ListItem>Sem3</asp:ListItem>
            <asp:ListItem>Python Programming</asp:ListItem>
            <asp:ListItem>Data Structures</asp:ListItem>
            <asp:ListItem>Computer Networks</asp:ListItem>
            <asp:ListItem>Database Management Systems</asp:ListItem>
            <asp:ListItem>Applied Mathematics</asp:ListItem>
            <asp:ListItem>Python Programming Practical</asp:ListItem>
            <asp:ListItem>Data Structures Practical</asp:ListItem>
            <asp:ListItem>Computer Networks Practical</asp:ListItem>
            <asp:ListItem>Database Management Systems Practical</asp:ListItem>
            <asp:ListItem>Mobile Programming Practical</asp:ListItem>
            <asp:ListItem>Sem4</asp:ListItem>
            <asp:ListItem>Core Java</asp:ListItem>
            <asp:ListItem>Introduction to Embedded Systems</asp:ListItem>
            <asp:ListItem>Computer Oriented Statistical Techniques</asp:ListItem>
            <asp:ListItem>Software Engineering</asp:ListItem>
            <asp:ListItem>Computer Graphics and Animation</asp:ListItem>
            <asp:ListItem>Core Java Practical</asp:ListItem>
            <asp:ListItem>Introduction to Embedded Systems Practical</asp:ListItem>
            <asp:ListItem>Computer Oriented Statistical Techniques Practical</asp:ListItem>
            <asp:ListItem>Software Engineering Practical</asp:ListItem>
            <asp:ListItem>Computer Graphics and Animation Practical</asp:ListItem>
            <asp:ListItem>Sem5</asp:ListItem>
            <asp:ListItem>Software Project Management</asp:ListItem>
            <asp:ListItem>Internet of Things</asp:ListItem>
            <asp:ListItem>Advanced Web Programming</asp:ListItem>
            <asp:ListItem>Linux System Administration</asp:ListItem>
            <asp:ListItem>Next Generation Technologies</asp:ListItem>
            <asp:ListItem>Project Dissertation</asp:ListItem>
            <asp:ListItem>Internet of Things Practical</asp:ListItem>
            <asp:ListItem>Advanced Web Programming Practical</asp:ListItem>
            <asp:ListItem>Linux Administration Practical</asp:ListItem>
            <asp:ListItem>Next Generation Technologies Practical</asp:ListItem>
            <asp:ListItem>Sem6</asp:ListItem>
            <asp:ListItem>Software Quality Assurance</asp:ListItem>
            <asp:ListItem>Security in Computing</asp:ListItem>
            <asp:ListItem>Business Intelligence</asp:ListItem>
            <asp:ListItem>Principles of Geographic Information Systems</asp:ListItem>
            <asp:ListItem>IT Service Management</asp:ListItem>
            <asp:ListItem>Project Implementation</asp:ListItem>
            <asp:ListItem>Security in Computing Practical</asp:ListItem>
            <asp:ListItem>Business Intelligence Practical</asp:ListItem>
            <asp:ListItem>Principles of Geographic Information Systems Practical</asp:ListItem>
            <asp:ListItem>Advanced Mobile Programming</asp:ListItem>
        </asp:DropDownList>


        <br />

        <br />

        <br />
        Select Year:<asp:RadioButtonList ID="select_year" runat="server">
            <asp:ListItem>I</asp:ListItem>
            <asp:ListItem>II</asp:ListItem>
            <asp:ListItem>III</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        Select content location:
        <asp:DropDownList ID="select_location" runat="server" DataValueField="Curriculum(Local)">
            <asp:ListItem>Others</asp:ListItem>
            <asp:ListItem>Curriculum(Local)</asp:ListItem>
            <asp:ListItem>Syllabus</asp:ListItem>
            <asp:ListItem>External_Link</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        Select content type: 
        <asp:RadioButtonList ID="select_content_type" runat="server">
            <asp:ListItem>Course</asp:ListItem>
            <asp:ListItem>Question Paper</asp:ListItem>
            <asp:ListItem>Book</asp:ListItem>
            <asp:ListItem>Notes</asp:ListItem>
            <asp:ListItem>Syllabus</asp:ListItem>
            <asp:ListItem>Others</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Height="44px" Text="Save data" Width="310px" OnClick="Button1_Click" />
    </div>

</asp:Content>
