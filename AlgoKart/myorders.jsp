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
     <%@ page import="java.util.*" %>
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
		<center>
		<%
if(session.getAttribute("uname")==null){%>
	<script type="text/javascript">
function Redirect()
{
    window.location="main.jsp";
}
document.write("INVALID ACCESS!!!You will be redirected to main page in a few sec.");
setTimeout('Redirect()', 5000);
</script>
<%
}else{%>
	<%
	String id=(String)session.getAttribute("id");
	String sql="select * from "+id+" order by o_id desc";
	 PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ashutosh","ashu");
      
         Statement st=conn.createStatement(); 
		 ps = conn.prepareStatement (sql,ResultSet.TYPE_SCROLL_INSENSITIVE,
      ResultSet.CONCUR_UPDATABLE);
	 rs = ps.executeQuery ();
    
	 if(!rs.next()){%>
	 <h3>OOPS!! nothing ordered till now!!!</h3>
	<%}else{%>
		<table border="1" cellspacing="0">
		<tr>
    		<td width="66" align="center"><strong>ORDER ID</strong></td>
    		<td width="400" align="center"><strong>Product Name</strong></td>
    	</tr><%
		rs.previous();

	 while(rs.next())
	 {

	 	%>
	 	<tr>
    		<td height="75" align="center">ASKRT-2020<%=rs.getString(1)%></td>
    		<td align="center"><%=rs.getString(2)%></td>
    	</tr>
<%


	 }



%>
</table>
<%}}


%>
	</center>	
	</main>
	<footer>
		
	</footer>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>



</body>
</html>