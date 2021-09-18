<%-- 
    Document   : search_record
    Created on : 4 Jul, 2020, 10:31:28 AM
    Author     : dprisky
--%>


<%@page contentType="text/html"import="java.util.*,java.lang.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            
            #aid{
                color:#FFFFFF;
            }

        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
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
<!----font-Awesome----->
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
                String gender=request.getParameter("gender");
                String religion=request.getParameter("religion");
                String caste=request.getParameter("caste");
                String id=request.getParameter("id");
                int i=0;
                if(gender!=null && religion!=null && caste!=null){
                    if(id!=null){
                         i=Integer.parseInt(id);
                    }
                    int start=i*1;
                    int next=i+1;
                    int previous=i-1;
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
						
					    <li><a href="logout.jsp">Logout</a></li>
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
                            <li><a href="profile.jsp">Home</a></li>
		            <li><a href="edit.jsp">Edit Profile</a></li>
                            <li><a href="photo.jsp">Upload Profile Photo</a></li>
		            <li><a href="matches.html">New Matches</a></li>		                
                            <li><a href="search.jsp">Regular Search</a></li>
                            <li><a href="inbox.php">Inbox</a></li>
		                
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
        <li class="current-page">Profile</li>
      </ul>
   </div>
  <div class="col-md-9 profile_left1">
  	<h1>Recently Viewed Profile</h1>
    
	
	
	
	
	<%
		
		try{
                     Class.forName("com.mysql.jdbc.Driver");
                        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/matri","root","");
                        Statement st=cn.createStatement();
                        ResultSet rs=st.executeQuery("select * from base where gender='"+gender+"' AND caste='"+caste+"' AND religion='"+religion+"' order by sn desc limit "+start+",1");
                        int flag=0;
                        while(rs.next()){
                            flag=1;
	%>
	
	
	
	
	<div class="profile_top"><a href="view_profile.jsp">
      <h2>254879</h2>
	    <div class="col-sm-3 profile_left-top">
	    	<img src="images/p2.jpg" class="img-responsive" alt=""/>
	    </div>
	    <div class="col-sm-3">
	      <ul class="login_details1">
			 <li>Last Login : 5 days ago</li>
			 <li><p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor." More....</p></li>
		  </ul>
	    </div>
	    <div class="col-sm-6">
	    	<table class="table_working_hours">
	        	<tbody>
	        		<tr class="opened_1">
						<td class="day_label1">Name :</td>
						<td class="day_value"><%=rs.getString("fname")%></td>
					</tr>
				    <tr class="opened">
						<td class="day_label1">Last Name :</td>
						<td class="day_value"><%=rs.getString("lname")%></td>
					</tr>
					<tr class="opened">
						<td class="day_label1">Caste :</td>
						<td class="day_value"><%=rs.getString("caste")%></td>
					</tr>
				    <tr class="opened">
						<td class="day_label1">Religion :</td>
						<td class="day_value"><%=rs.getString("religion")%></td>
					</tr>
				   
			    </tbody>
		   </table>
			<div class="buttons">
				<div class="vertical"><a href="view_profile.jsp?id=<%=rs.getString("code")%>">View Profile</a></div>
				<div class="vertical">Shortlisted</div>
				<div class="vertical">Send Interest</div>
		   </div>
	    </div>
	    <div class="clearfix"> </div>
    	</div>
	
	
	<%
		}
		if(flag==0){
                    response.sendRedirect("search_record.jsp?gender=gender&caste=caste&religion=religion");
                    
                }
			
	%>
	
	
	
		
	<div class="profile_top"><a href="view_profile.html">
     
	   
	    <div class="col-sm-6">
	   
		   <div class="buttons">
			    <div class="vertical"><a href="search_record.jsp?gender=<%=gender%>&caste=<%=caste%>&religion=<%=religion%>&id=<%=previous%>" id="aid">Previous</a></div>
			    <div class="vertical"><a href="search_record.jsp?gender=<%=gender%>&caste=<%=caste%>&religion=<%=religion%>&id=<%=next%>" style="color:#FFFFFF">Next</a></div>
		   </div>
	    </div>
	    <div class="clearfix"> </div>
    </a></div>
                <%
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
                response.sendRedirect("search.jsp?err=1");
            }
        }
        else{
            response.sendRedirect("index.jsp");
        }

   
                %>
    </body>
</html>
