<!DOCTYPE html>
<html>
<head>
	<title>ALGOKART ADMIN</title>
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
				<a href="./adminsuccess.jsp" text-decoration="none"><h2 class="my-md-3 site-title text-white" >AlgoKart|ADMIN</h2></a>
			</div>
		</div>
		</div>
</header>
	<!--header-->
	<main>
		<center>
		<%
if(session.getAttribute("id")==null){%>
	<script type="text/javascript">
function Redirect()
{
    window.location="admin.jsp";
}
document.write("INVALID ACCESS!!!You will be redirected to main page in a few sec.");
setTimeout('Redirect()', 5000);
</script>
<%
}else{%>
	<%
	String sql="select * from register1"; 
	 PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
        ResultSet rs1=null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ashutosh","ashu");
      
         Statement st=conn.createStatement(); 
		 ps = conn.prepareStatement (sql,ResultSet.TYPE_SCROLL_INSENSITIVE,
      ResultSet.CONCUR_UPDATABLE);
	 rs = ps.executeQuery ();
    
	 if(!rs.next()){%>
	 <h3>OOPS!! No Details!</h3>
	<%}else{%>
		<table border="1" cellspacing="0">
			<tr>
    		<td height="75" align="center">ORDER NAME</td>
    		<td align="center">LOCATION</td>
    	</tr>
		<%
		rs.previous();

	 while(rs.next())
	 {
	 	String temp=rs.getString(2);
	 	String sql1="select * from "+temp+" order by o_id desc";
	 	ps = conn.prepareStatement (sql1,ResultSet.TYPE_SCROLL_INSENSITIVE,
      ResultSet.CONCUR_UPDATABLE);
      	 rs1= ps.executeQuery ();
      	 if(!rs1.next()){
      	 continue;
      	}
      	else{
      		rs1.previous();
      		while(rs1.next()){

      
	 	%>
	 	<tr>
    		<td height="75" align="center"><%=rs1.getString(2)%></td>
    		<td align="center"><%=rs1.getString(3)%></td>
    	</tr>
<%
}}

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