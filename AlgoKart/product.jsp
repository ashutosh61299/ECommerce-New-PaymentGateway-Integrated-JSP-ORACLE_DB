<!DOCTYPE html>
<html>
<head>
	<title>Welcome to AlgoKart</title>
<!--Bootstrap CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!--FONT Awesome CDN-->
<script src="https://kit.fontawesome.com/5feaab6567.js" crossorigin="anonymous"></script>

<!--Custom Stylesheet-->
<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
	<!--header-->
	<header>
    <div class="container">
      <div class="row">
      <div class="col-md-4 col-sm-12 col-12">
        <div class="btn-group">
          <button class="btn border dropdown-toggle my-md-4 my-2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">IND</button>

          <div class="dropdown-menu">
            <a href="#" class="dropdown-item">USD</a>
          </div>  
        </div>
      </div>  
      <div class="col-md-4 col-12 text-center linkss">
        <a href="./index.jsp" text-decoration="none"><h2 class="my-md-3 site-title text-white" >AlgoKart</h2></a>
      </div>
      <div class="col-md-4 col-12 text-right">
        <p class="my-md-4 header-links">
          <a href="./index.jsp" class="px-2">Home</a>

          <% if(session.getAttribute("uname")==null) {
      %>
          <a href="login.jsp" class="px-2">Login</a>
          <a href="register.jsp" class="px-2">Signup</a>
          <%} else {
        %>Hi,<%=session.getAttribute("uname")%>&nbsp;
                <a href="logout.jsp" class="px-2">Logout</a>
                <a href="myorders.jsp" class="px-2">My Orders</a>
                <%}%>
        </p>
      </div>
    </div>
    </div>

    <div class="container-fluid p-0">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
 
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item active">
            <form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="Samsung" /><input type="image" src="images/sam.png" /></form>
          </li>
         <li class="nav-item active">
            <form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="Nokia" /><input type="image" src="images/nok.png" /></form>
          </li>
          <li class="nav-item active">
           <form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="Sony" /><input type="image" src="images/son.png" /></form>
          </li>
         <li class="nav-item active">
            <form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="Htc" /><input type="image" src="images/htc.png" /></form>
          </li>
          <li class="nav-item active">
            <form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="LG" /><input type="image" src="images/lg.png" /></form>
          </li>
        </ul>
      </div>
    <form name="form1" method="post" action="search.jsp" >
    <input name="search" type="text" id="search" size="60" />
    <input class="nav-item border rounded-circle mx-2 search-icon" type="submit" name="submit" id="button" value="Search">
    </form>
    </nav>
        </div>
</header>
	<!--header-->
	<main>
			<p>
  <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
  <%
		String pid=request.getParameter("product");
		String hname="Grand";
		 PreparedStatement ps;
        Connection con;
        ResultSet rs= null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ashutosh","ashu");
      
         Statement st=con.createStatement();
		ps=con.prepareStatement("select * from mtable where prod_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
		 while(rs.next())
		 {
		 %>
<p class="name"><%=rs.getString(3)%> <%=rs.getString(2)%> </p>
         <%}
		 ps=con.prepareStatement("select * from pics where pic_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
		 while(rs.next())
		 {
		 %>
</p>
<table width="997" height="399" border="0">
  <tr>
    <td width="358" class="center1"><img src=<%=rs.getString(2)%> width="200" height="300" alt=hname/></td>
    <%}
    ps=con.prepareStatement("select * from mtable where prod_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
		 while(rs.next())
		 {
		 %>
    <td width="623" class="center1"><table width="466" height="200" border="0">
      <tr>
        <td width="179" class="center1">Model Name :</td>
        <td width="277" class="normal"><%=rs.getString(2)%></td>
      </tr>
      <tr>
        <td class="center1">Brand :</td>
        <td><%=rs.getString(3)%></td>
      </tr>
      <tr>
        <td class="center1">Price :</td>
        <td><%=rs.getString(4)%></td>
      </tr>
      <%
      session.setAttribute("price",rs.getString(4));
    }%>
    </table>
    <p>
    <form action="buy.jsp"> 
<input type="hidden" name="name" value=<%=pid%>> 
<input type="image" src="images/bbutton.jpg" name="buy" value="grand"> 
</form></p></td>
  </tr>
</table>
<p class="gnrl">GENERAL FEATURES</p>
<% 
rs.close();
ps=con.prepareStatement("select * from gnrl_specs where gs_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
		 %>
         <%
          while(rs.next())
		 {
		 %>
         <table width="630" border="1" cellspacing="0">
  <tr>
    <td width="127" class="norm">Form</td>
    <td width="493"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">SIM Type</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Touch Screen</td>
    <td><%=rs.getString(4)%></td>
  </tr>
  <tr>
    <td class="norm">Keypad</td>
    <td><%=rs.getString(5)%></td>
  </tr>
  <tr>
    <td class="norm">Sales Package</td>
    <td><%=rs.getString(6)%></td>
  </tr>
</table>
<p class="gnrl">
  <%}%>
  <% 
rs.close();
ps=con.prepareStatement("select * from platform where plat_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
PLATFORM</p>
<table width="629" border="1" cellspacing="0">
  <tr>
    <td width="127" class="norm">OS</td>
    <td width="492"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Java</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Processor</td>
    <td><%=rs.getString(4)%></td>
  </tr>
</table>
<p class="gnrl">
  <%}%>
  <% 
rs.close();
ps=con.prepareStatement("select * from display where disp_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
DISPLAY</p>
<table width="629" border="1" cellspacing="0">
  <tr>
    <td width="127" class="norm">Type</td>
    <td width="492"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Size</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Resolution</td>
    <td><%=rs.getString(4)%></td>
  </tr>
  <tr>
    <td class="norm">Colors</td>
    <td><%=rs.getString(5)%></td>
  </tr>
</table>
<p class="gnrl">
  <%}%>
  <% 
rs.close();
ps=con.prepareStatement("select * from camera where cam_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
CAMERA</p>
         <table width="628" border="1" cellspacing="0">
  <tr>
    <td width="126" class="norm">Primary</td>
    <td width="492"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Secondary</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Flash</td>
    <td><%=rs.getString(4)%></td>
  </tr>
  <tr>
    <td class="norm">Video Recording</td>
    <td><%=rs.getString(5)%></td>
  </tr>
  <tr>
    <td class="norm">Other Features</td>
    <td><%=rs.getString(6)%></td>
  </tr>
</table>
<p>
  <%}%>
  <% 
rs.close();
ps=con.prepareStatement("select * from dimension where dim_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
<span class="gnrl">DIMENSION</span> </p><table width="627" border="1" cellspacing="0">
  <tr>
    <td width="125" class="norm">Size </td>
    <td width="486"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Weight</td>
    <td><%=rs.getString(3)%></td>
  </tr>
</table>
  <%}%>
<p>
  <% 
rs.close();
ps=con.prepareStatement("select * from BATTERY where bat_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
<span class="gnrl">BATTERY</span> </p><table width="627" border="1" cellspacing="0">
  <tr>
    <td width="126" class="norm">Type</td>
    <td width="485"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Capacity</td>
    <td><%=rs.getString(3)%></td>
  </tr>
</table>
  <%}%>
<p>
  <% 
rs.close();
ps=con.prepareStatement("select * from memory where mem_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
<span class="gnrl">MEMORY AND STORAGE</span> </p>
<table width="627" border="1" cellspacing="0">
  <tr>
    <td width="125" class="norm">Internal</td>
    <td width="486"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">RAM</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Expandable</td>
    <td><%=rs.getString(4)%></td>
  </tr>
</table>
<p>
  <%}%>
  <% 
rs.close();
ps=con.prepareStatement("select * from netNconn where net_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
  <span class="gnrl">INTERNET AND CONNECTIVITY</span> 
</p>
</p>
<table width="627" border="1" cellspacing="0">
  <tr>
    <td width="127" class="norm">GPRS</td>
    <td width="484"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">3G</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">4G</td>
    <td><%=rs.getString(4)%></td>
  </tr>
  <tr>
    <td class="norm">WiFi</td>
    <td><%=rs.getString(5)%></td>
  </tr>
  <tr>
    <td class="norm">USB Connectivity</td>
    <td><%=rs.getString(6)%></td>
  </tr>
  <tr>
    <td class="norm">Tethering</td>
    <td><%=rs.getString(7)%></td>
  </tr>
  <tr>
    <td class="norm">Navigation</td>
    <td><%=rs.getString(8)%></td>
  </tr>
  <tr>
    <td class="norm">Bluetooth</td>
    <td><%=rs.getString(9)%></td>
  </tr>
  <tr>
    <td class="norm">Audio Jack</td>
    <td><%=rs.getString(10)%></td>
  </tr>
  <tr>
    <td class="norm">DLNA</td>
    <td><%=rs.getString(11)%></td>
  </tr>
</table>
<%}%>
<p>
  <% 
rs.close();
ps=con.prepareStatement("select * from MULTIMEDIA where media_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
<span class="gnrl">MULTIMEDIA</span> </p>
<table width="627" border="1" cellspacing="0">
  <tr>
    <td width="127" class="norm">Music Player</td>
    <td width="484"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Video Player</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">FM</td>
    <td><%=rs.getString(4)%></td>
  </tr>
</table>
<%}%>
<p>
  <% 
rs.close();
ps=con.prepareStatement("select * from OTHERS where other_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
<span class="gnrl">OTHERS</span> </p>
<table width="627" border="1" cellspacing="0">
  <tr>
    <td width="141" class="norm">SAR value</td>
    <td width="476"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Sensors</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Additional Features</td>
    <td><%=rs.getString(4)%></td>
  </tr>
</table>
<%}%>




	</main>
	<footer>
		
	</footer>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>



</body>
</html>