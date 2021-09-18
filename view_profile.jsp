<%-- 
    Document   : view_profile
    Created on : 4 Jul, 2020, 6:44:14 PM
    Author     : dprisky
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href='//fonts.googleapis.com/css?family=Oswald:300,400,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Ubuntu:300,400,500,700' rel='stylesheet' type='text/css'>
<!----font-Awesome----->
<link href="css/font-awesome.css" rel="stylesheet">
   <script>
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
});
</script>
    </head>
    <body>
        
         <%
            Cookie c[]=request.getCookies();
            String email=null;
            for(int i=0;i<c.length;i++){
                    if(c[i].getName().equals("user")){
                        email=c[i].getValue();
                        break;
                    }
                }
            if(email !=null && session.getAttribute(email)!=null){
                String code=request.getParameter("id");
                    if(code!=null){
                       try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/matri","root","");
                            Statement st=cn.createStatement();
                            ResultSet rs=st.executeQuery("select * from base where code='"+code+"'");
                            if(rs.next()){
                                
                        %>
            
        
        
        <!-- ============================  Navigation Start =========================== -->
 <div class="navbar navbar-inverse-blue navbar">
    <!--<div class="navbar navbar-inverse-blue navbar-fixed-top">-->
      <div class="navbar-inner navbar-inner_1">
        <div class="container">
           <div class="navigation">
             <nav id="colorNav">
			   <ul>
				<li class="green">
					<a href="#" class="icon-home"></a>
					<ul>
						
					    <li><a href="register.php">Register</a></li>
					    <li><a href="login.php">Logout</a></li>
					</ul>
				</li>
			   </ul>
             </nav>
           </div>
           <a class="brand" href="index.html"><img src="images/logo.png" alt="logo"></a>
           <div class="pull-right">
          	<nav class="navbar nav_bottom" role="navigation">
 
		 <!-- Brand and toggle get grouped for better mobile display -->
		  <div class="navbar-header nav_2">
		      <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">Menu
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#"></a>
		   </div> 
		   <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
		        <ul class="nav navbar-nav nav_1">
		           <li><a href="profile.php">Home</a></li>
		            <li><a href="edit.php">Edit Profile</a></li>
					<li><a href="photo.php">Upload Profile Photo</a></li>
		            <li><a href="matches.html">New Matches</a></li>		                
					<li><a href="search.jsp">Regular Search</a></li>
					<li><a href="inbox.jsp">Inbox</a></li>
		                
		            <li class="last"><a href="contact.html">Contacts</a></li>
		        </ul>
		     </div><!-- /.navbar-collapse -->
		    </nav>
		   </div> <!-- end pull-right -->
          <div class="clearfix"> </div>
        </div> <!-- end container -->
      </div> <!-- end navbar-inner -->
    </div> <!-- end navbar-inverse-blue -->
<!-- ============================  Navigation End ============================ -->
<div class="grid_3">
  <div class="container">
   <div class="breadcrumb1">
     <ul>
        <a href="index.html"><i class="fa fa-home home_1"></i></a>
        <span class="divider">&nbsp;|&nbsp;</span>
        <li class="current-page">View Profile</li>
     </ul>
   </div>
     
   <div class="profile">
   	 <div class="col-md-8 profile_left">
   	 	<h2>Profile Id : 254870</h2>
   	 	<div class="col_3">
		<%
			if(request.getParameter("success")!=null){
		%>
			<div class="alert alert-success">Message Sent</div>
		<%
			}
		%>
   	        <div class="col-sm-4 row_2">
				<div class="flexslider">
					 <ul class="slides">
						<li data-thumb="images/p1.jpg">
							<img src="images/p1.jpg" />
						</li>
						<li data-thumb="images/p2.jpg">
							<img src="images/p2.jpg" />
						</li>
						<li data-thumb="images/p3.jpg">
							<img src="images/p3.jpg" />
						</li>
						<li data-thumb="images/p4.jpg">
							<img src="images/p4.jpg" />
						</li>
					 </ul>
				  </div>
			</div>
			<div class="col-sm-8 row_1">
				<table class="table_working_hours">
		        	<tbody>
		        		<tr class="opened_1">
							<td class="day_label">First Name :</td>
							<td class="day_value"><%=rs.getString("fname")%></td>
						</tr>
					    <tr class="opened">
							<td class="day_label">Last Name :</td>
							<td class="day_value"><%=rs.getString("lname")%></td>
						</tr>
					    <tr class="opened">
							<td class="day_label">Religion :</td>
							<td class="day_value"><%=rs.getString("religion")%></td>
						</tr>
						<tr class="opened">
							<td class="day_label">Caste :</td>
							<td class="day_value"><%=rs.getString("caste")%></td>
						</tr>
						<tr class="opened">
							<td class="day_label">Occupation :</td>
							<td class="day_value"><%=rs.getString("occupation")%></td>
						</tr>
						<tr class="opened">
							<td class="day_label">Date Of Birth :</td>
							<td class="day_value"><%=rs.getString("dob")%></td>
						</tr>
						
						
						
				    </tbody>
				</table>
		
				<form method="post" action="msg.jsp?id=<%=rs.getString("code")%>">
					Message<textarea class="form-control" name="msg" placeholder="Enter Message..." style="resize:none" required rows="3"></textarea> 
					<div class="form-actions" >
	    				<input type="submit" value="Send Message" class="btn btn danger">
	    			</div>
				</form>
				<!--<ul class="login_details">
			      <li><h2 style="color:#FF0000">Change Password</h2><a href="Change_pass.php">Change Pass </a></li>
			      <li>If not a member? <a href="register.html">Register Now</a></li>
			    </ul>-->
			</div>
			<div class="clearfix"> </div>
		</div>
		
	<%
                            }
                            cn.close();
                        }
                        catch(ClassNotFoundException e){
                            out.println(e.getMessage());
                        }
                        catch(SQLException e){
                            out.println(e.getMessage());
                        }
                    }
                    else{
                        response.sendRedirect("search.jsp");
                    }
                }
                else{
                    response.sendRedirect("index.jsp");
                }
            

            
            %>
			
	
       <div class="clearfix"> </div>
    </div>
  </div>
</div>

<div class="footer">
    	<div class="container">
    		<div class="col-md-4 col_2">
    			<h4>About Us</h4>
    			<p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris."</p>
    		</div>
    		<div class="col-md-2 col_2">
    			<h4>Help & Support</h4>
    			<ul class="footer_links">
    				<li><a href="#">24x7 Live help</a></li>
    				<li><a href="contact.html">Contact us</a></li>
    				<li><a href="#">Feedback</a></li>
    				<li><a href="faq.html">FAQs</a></li>
    			</ul>
    		</div>
    		<div class="col-md-2 col_2">
    			<h4>Quick Links</h4>
    			<ul class="footer_links">
    				<li><a href="privacy.html">Privacy Policy</a></li>
    				<li><a href="terms.html">Terms and Conditions</a></li>
    				<li><a href="services.html">Services</a></li>
    			</ul>
    		</div>
    		<div class="col-md-2 col_2">
    			<h4>Social</h4>
    			<ul class="footer_social">
				  <li><a href="#"><i class="fa fa-facebook fa1"> </i></a></li>
				  <li><a href="#"><i class="fa fa-twitter fa1"> </i></a></li>
				  <li><a href="#"><i class="fa fa-google-plus fa1"> </i></a></li>
				  <li><a href="#"><i class="fa fa-youtube fa1"> </i></a></li>
			    </ul>
    		</div>
    		<div class="clearfix"> </div>
    		<div class="copy">
		      <p>Copyright © 2015 Marital . All Rights Reserved  | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
	        </div>
    	</div>
</div>
<script defer src="js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>
    </body>
</html>
