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
	<%@ page language="java" %>
    <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
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
		      </li>&nbsp;&nbsp;
		     <li class="nav-item active">
		        <form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="Nokia" /><input type="image" src="images/nok.png" /></form>
		      </li>&nbsp;&nbsp;
		      <li class="nav-item active">
		       <form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="Sony" /><input type="image" src="images/son.png" /></form>
		      </li>&nbsp;&nbsp;
		     <li class="nav-item active">
		        <form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="Htc" /><input type="image" src="images/htc.png" /></form>
		      </li>&nbsp;&nbsp;
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
		
		 <% 
       PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ashutosh","ashu");
      
         Statement st=conn.createStatement();
		 String sql = "SELECT * from register1 where name=?"; 
		 ps = conn.prepareStatement (sql); 
%> 

<p>
<%
String e1="";
String e2="";
 String uname=(String)session.getAttribute("uname"); 
 if(session.getAttribute("uname")!=null) {
	 session.setAttribute("product",request.getParameter("name"));
	 ps.setString(1,uname);
	 rs = ps.executeQuery (); %>
	 Please <span class="italics"><strong>confirm</strong></span> your latest information, or if any of the info, which you see is not correct then you may press the <span class="italics">Edit</span> button below:
     <%
	 while(rs.next())
	 { %>
</p>
<table width="981" height="108" border="0" cellspacing="0">
  <tr>
    <td width="134" height="29">&nbsp;</td>
    <td width="303" align="center"><form action="buyedit.jsp"><input type="Submit" name="Edit" value="Edit" />
    <input type="hidden" name="mid" value=<%=rs.getString(2)%> /></form></td>
  </tr>
  <tr>
    <td height="29" align="right"><strong>NAME:</strong></td>
    <td><%=rs.getString(1)%></td>
  </tr>
   <tr>
    <td height="29" align="right"><strong>Email:</strong></td>
    <td><%=rs.getString(7)%></td>
  </tr>
  <tr>
    <td height="29" align="right"><strong>Phone No.</strong></td>
    <td><%=rs.getString(6)%></td>
  </tr>
  <tr>
    <td height="50" align="right"><strong>Address:</strong></td>
    <td><%=rs.getString(5)%></td>
  </tr>
</table>
<%
e1=rs.getString(7);
e2=rs.getString(6);
session.setAttribute("id",rs.getString(2));
}%>
<p><form action="payment.jsp">
	<input type="hidden" name="email" value=<%=e1%>>
	<input type="hidden" id="location" name="location">
	<input type="hidden" name="phone" value=<%=e2%>>
	<script>
	if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function (position) {
      document.getElementById("location").value=position.coords.latitude + ", " + position.coords.longitude;
        }
      );
}
</script>

<input type="Submit" name="Confirm" value="Confirm" />
</form></p>
<p>
  <%}
else {
	 session.setAttribute("product",request.getParameter("name"));%>
	Enter the following details:
</p>
<p>
<form action="payment.jsp">
<table width="450" height="142" border="0">
  <tr>
    <td height="33" >Name:</td>
    <td><input type="text" name="name" size="30" align="left" /></td>
  </tr>
  <tr>
    <td height="32" >Phone No.</td>
    <td><input type="text" name="phone" size="20"/></td>
  </tr>
  <tr>
    <td height="32">Email id:</td>
    <td><input type="text" name="email" size="20"/></td>
  </tr>
  <tr>
    <td height="60">Address:</td>
    <td><input type="text" name="address" size="120"/></td>
  </tr>
</table>
<input type="hidden" id="location" name="location">
	<script>
	if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function (position) {
      document.getElementById("location").value=position.coords.latitude + ", " + position.coords.longitude;
        }
      );
}
</script>
<%
session.setAttribute("id","GUEST");
%>
<input type="submit" name="submit" value="Confirm" />
</form>
</p>
<%}%>



	</main>
	<footer>
		
	</footer>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>



</body>
</html>