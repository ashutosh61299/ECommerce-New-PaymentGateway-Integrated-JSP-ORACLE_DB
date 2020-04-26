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
	<%
         Integer hitsCount = (Integer)application.getAttribute("hitCounter");
         if( hitsCount ==null || hitsCount == 0 ) {
            /* First visit */
            hitsCount = 1;
         } else {
            /* return visit */
            hitsCount += 1;
         }
         application.setAttribute("hitCounter", hitsCount);
      %>




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
		      </li>&nbsp;&nbsp;
		      <li class="nav-item active">
		        <form action="admin.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="LG" /><input type="image" src="images/adm.png" /></form>
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
<%String user=request.getHeader("user-agent");
   String ip=request.getRemoteAddr();
PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ashutosh","ashu");
      
         Statement st=conn.createStatement();
     String sql = "insert into visitors values(?,?)";
     ps = conn.prepareStatement (sql);
     ps.setString(1,user);
     ps.setString(2,ip);
     ps.executeUpdate();



 %>







<!---------------------------------------------------------------------->
<table align="center">	
<td><table width="725" height="684" border="0">
      <tr class="normal">
        <td height="30" class="title">NEW ARRIVALS</td>
      </tr>
      <tr>
        <td height="261"><table width="714" height="258" border="0">
          <tr>
            <td width="228"><table width="120" height="173" border="0" align="center">
              <tr>
                <td><form action="product.jsp"> 
                <input type="hidden" name="product" value="h1"> 
                <input name="buy" type="image" value="grand" src="images/htc1.jpeg" width="114" height="165"> 
                </form></td>
              </tr>
            </table>
              <p class="center1">HTC One M9+</p>
              <p class="center1">Rs. 15,999</p>
            </td>
            <td width="240" class="center1"><table width="117" height="173" border="0" align="center">
              <tr>
                <td width="111"><form action="product.jsp"> 
                <input type="hidden" name="product" value="lg1">
                <input name="buy" type="image" value="s4" src="images/lg1.jpg" width="100" height="165"> 
                </form></td>
              </tr>
            </table></p>
              <p>LG V40 ThinQ</p>
              <p>Rs. 29,990</p></td>
            <td width="224"><table width="120" height="173" border="0" align="center">
              <tr>
                <td><form action="product.jsp"> 
                <input type="hidden" name="product" value="s1"> 
                <input name="buy" type="image" value="g pro" src="images/sam1.jpg" width="104" height="165"> 
                </form></td>
              </tr>
                </table>
                  <p class="center1">Samsung Galaxy M30</p>
                  <p class="center1">Rs. 12,999</p>
                </td>
              </tr>
            </table>
          </td>
          </tr>
      <tr class="normal">
        <td height="31" class="title">FEATURED MOBILES</td>
      </tr>
      <tr><!--from here-->
        <td height="261"><table width="714" height="258" border="0">
          <tr>
            <td width="228"><table width="120" height="173" border="0" align="center">
              <tr>
                <td><form action="product.jsp"> 
                <input type="hidden" name="product" value="n1"> 
                <input name="buy" type="image" value="grand" src="images/nokia1.jpg" width="114" height="165"> 
                </form></td>
              </tr>
            </table>
              <p class="center1">Nokia 3310</p>
              <p class="center1">Rs. 3,249</p>
            </td>
            <td width="240" class="center1"><table width="117" height="173" border="0" align="center">
              <tr>
                <td width="111"><form action="product.jsp"> 
                <input type="hidden" name="product" value="h2">
                <input name="buy" type="image" value="s4" src="images/htc2.jpg" width="100" height="165"> 
                </form></td>
              </tr>
            </table></p>
              <p>HTC Desire 12+</p>
              <p>Rs. 19,900</p></td>
            <td width="224"><table width="120" height="173" border="0" align="center">
              <tr>
                <td><form action="product.jsp"> 
                <input type="hidden" name="product" value="s3"> 
                <input name="buy" type="image" value="g pro" src="images/sam3.jpg" width="104" height="165"> 
                </form></td>
              </tr>
                </table>
                  <p class="center1">Samsung Galaxy A70</p>
                  <p class="center1">Rs. 30,999</p>
                </td>
              </tr>
            </table>
          </td>
      <!--till here-->
      </tr>
      <tr class="normal">
        <td height="27" class="title">BESTSELLING MOBILES</td>
      </tr>
      <tr>
<td height="261"><table width="714" height="258" border="0">
          <tr>
            <td width="228"><table width="120" height="173" border="0" align="center">
              <tr>
                <td><form action="product.jsp"> 
                <input type="hidden" name="product" value="n2"> 
                <input name="buy" type="image" value="grand" src="images/nokia2.jpg" width="114" height="165"> 
                </form></td>
              </tr>
            </table>
              <p class="center1">Nokia 6.1 Plus</p>
              <p class="center1">Rs. 9,999</p>
            </td>
            <td width="240" class="center1"><table width="117" height="173" border="0" align="center">
              <tr>
                <td width="111"><form action="product.jsp"> 
                <input type="hidden" name="product" value="s2">
                <input name="buy" type="image" value="s4" src="images/sam2.jpg" width="100" height="165"> 
                </form></td>
              </tr>
            </table></p>
              <p>Samsung Galaxy Note 10</p>
              <p>Rs. 69,999</p></td>
            <td width="224"><table width="120" height="173" border="0" align="center">
              <tr>
                <td><form action="product.jsp"> 
                <input type="hidden" name="product" value="so1"> 
                <input name="buy" type="image" value="g pro" src="images/sony1.jpg" width="104" height="165"> 
                </form></td>
              </tr>
                </table>
                  <p class="center1">Sony Xperia XA dual</p>
                  <p class="center1">Rs. 15,999</p>
                </td>
              </tr>
            </table>      </tr>
 </table></td>
    </tr>
    </table>

	</main>
	



	<footer>
		
	</footer>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>