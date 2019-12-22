<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<script runat="server">
</script>


<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
      <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width"/>
    <meta name="description" content="Affordable and professional web design"/>
	<meta name="keywords" content="web design, affordable web design, professional web design"/>
  	<meta name="author" content="Omkar Surve"/>
    <title>Home Page</title>
    <link rel="stylesheet" href="style.css"/>
      <style type="text/css">
          .auto-style1 {
              margin-top: 0px;
          }
      </style>
</head>

<body>
    
    <form id="form1" runat="server">
    
    <header>
      <div class="container">
        <div id="branding">
          <h1>E-Learning Site</h1>
        </div>
        <nav class="auto-style1">
          <ul>
            <li class="current"><a href="index.aspx">Home</a></li>
            <li><a href="curriculum.aspx">Curriculum</a></li>
            <li><a href="more.aspx">More</a></li>
            <li><a href="LogIn.aspx" >Login</a></li>
            <li><a href="Profile.aspx">Profile</a></li>
          </ul>
        </nav>
      </div>
    </header>

     <section id="showcase">
      <div class="container">
        <h1>E-Learning Site</h1>
        <p>E-Learning is the process of using technology to assist learning and tutoring. Enhancement in how the Internet works has allowed websites to deliver a visual and immersive learning experience on a computer or mobile device, perfect for stimulating a student and encouraging learning.</p>
      </div>
    </section>

     <section id="boxes">
      <div class="container">
        <div class="box">
          <img src="img/development.png"/>
          <h3>Devlopment</h3>
          <p><span style="color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Software development is a process by which standalone or individual software is created using a specific programming language.</span></p>
        </div>
        <div class="box">
          <img src="img/hacking.png"/>
          <h3>Ethical Hacking</h3>
          <p style="color: #000000"><span style="color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">The purpose of ethical hacking is to evaluate the security of and identify vulnerabilities in systems, networks or system infrastructure.</span></p>
        </div>
        <div class="box">
          <img src="img/database.png"/>
          <h3>Database</h3>
          <p style="font-family: Arial, sans-serif; color: rgb(0, 0, 0); font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">A database 
              management system (DBMS) is a software package designed to define, manipulate, retrieve and manage data in a database.</p></div>
      </div>
    </section>
   
    <footer>
      <p>E-Learning Site, Copyright &copy; 2019</p>
      <p><a href="about.html">About</a></p>
    </footer>

    </form>

</body>
</html>
