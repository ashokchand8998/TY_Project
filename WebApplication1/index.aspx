<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<script runat="server">
</script>


<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <meta name="description" content="Affordable and professional web design" />
    <meta name="keywords" content="web design, affordable web design, professional web design" />
    <meta name="author" content="Omkar Surve" />
    <title>Home Page</title>

    <link rel="stylesheet" href="style.css" />
</head>

<body>

    <form id="form1" runat="server">

        <header id="navbar">
            <div class="container">
                <div id="branding">
                    <h1>Learn IT</h1>
                </div>
                <nav>
                    <ul>
                        <li class="current"><a href="index.aspx">Home</a></li>
                        <li><a href="Curriculum.aspx">Curriculum</a></li>
                        <li><a href="More.aspx">More</a></li>
                        <li><a href="LogIn.aspx">Login</a></li>
                        <li><a href="Profile.aspx">Profile</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <div id="add_padd">
            <section id="showcase">
                <div class="container">
                    <div id="inside_container">
                        <h1>Learn IT:</h1><h2> An E-Learning Site</h2>
                        <p>E-Learning is the process of using technology to assist learning and tutoring. Enhancement in how the Internet works has allowed websites to deliver a visual and immersive learning experience on a computer or mobile device, perfect for stimulating a student and encouraging learning.</p>
                    </div>
                </div>
            </section>

            <section id="boxes">
                <div class="container">
                    <div class="box">
                        <asp:HyperLink ID="development" Style="text-decoration: none; color: black;" runat="server" NavigateUrl="More.aspx?topic=Web_Development" ToolTip="Click to view">
                              <img src="img/development.png" />
                    <h3>Devlopment</h3>
                    <p style="color: rgb(0, 0, 0); font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Software development is a process by which standalone or individual software is created using a specific programming language.</p>
                        </asp:HyperLink>
                    </div>
                    <div class="box">
                       <asp:HyperLink ID="HyperLink2" Style="text-decoration: none; color: black;" runat="server" NavigateUrl="More.aspx?topic=Ethical_Hacking" ToolTip="Click to view">
                         <img src="img/hack.png" />
                        <h3>Ethical Hacking</h3>
                        <p style="color: rgb(0, 0, 0); font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">The purpose of ethical hacking is to evaluate the security of and identify vulnerabilities in systems, networks or system infrastructure.</p>
                    </asp:HyperLink></div>
                    <div class="box">
                        <asp:HyperLink ID="HyperLink1" Style="text-decoration: none; color: black;" runat="server" NavigateUrl="More.aspx?topic=Database_Management_Systems" ToolTip="Click to view">
                         <img src="img/database.png" />
                        <h3>Database</h3>
                        <p style="color: rgb(0, 0, 0); font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                            A database 
              management system (DBMS) is a software package designed to define, manipulate, retrieve and manage data in a database.
                        </p></asp:HyperLink>
                    </div>
                </div>
            </section>
        </div>
        <footer>
            <p>E-Learning Site, Copyright &copy; 2019</p>
            <p><a href="About.aspx">About</a></p>
        </footer>

    </form>
    <script type="text/javascript">
        window.onscroll = function () { myFunction() };

        var navbar = document.getElementById("navbar");
        var sticky = navbar.offsetTop;

        function myFunction() {
            if (window.pageYOffset >= sticky) {
                navbar.classList.add("sticky")
            } else {
                navbar.classList.remove("sticky");
            }
        }
    </script>
</body>
</html>
