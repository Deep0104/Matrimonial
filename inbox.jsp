<%-- 
    Document   : inbox
    Created on : 7 Jul, 2020, 7:45:27 AM
    Author     : dprisky
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
					<li><a href="photo_upload.jsp">Upload Profile Photo</a></li>
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
        <li class="current-page">Inbox</li>
     </ul>
   </div>

   <div class="col-md-9 members_box2">
   	   <h3>Inbox</h3>
   	   
       <div class="col_4">
		    <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
			   <ul id="myTab" class="nav nav-tabs nav-tabs1" role="tablist">
				  <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">All</a></li>
				  <li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">New</a></li>
				  <li role="presentation"><a href="#profile1" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">Read</a></li>
				  <li role="presentation"><a href="#profile2" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">Accepted</a></li>
				  <li role="presentation"><a href="#profile2" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">Not Interested</a></li>
			   </ul>
			   <div id="myTabContent" class="tab-content">
				  <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
				    <ul class="pagination pagination_1">
				 	  <li class="active"><a href="#">1</a></li>
				 	  <li><a href="#">2</a></li>
				 	  <li><a href="#">3</a></li>
				 	  <li><a href="#">4</a></li>
				 	  <li><a href="#">5</a></li>
				 	  <li><a href="#">...</a></li>
				 	  <li><a href="#">Next</a></li>
	                </ul>
	                <div class="clearfix"> </div>
                                  </div>
                           </div>
                    </div>
	                

					<!--Inbox Start-->

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
						String sn =request.getParameter("id");
                                                try{
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/matri","root","");
                                                        Statement st=cn.createStatement();
                                                        Statement st1=cn.createStatement();
                                                        ResultSet rs=st.executeQuery("select * from base where email='"+email+"'");
                                                        if(rs.next()){
                                                            int id=0;
                                                            if(sn !=null){
                                                                id=Integer.parseInt(sn);
                                                            }
                                                            int start=id*2;
                                                            int next=id+1;
                                                            int previous=id-1;
                                                            if(id==0){
                                                                previous=0;
                                                            }
                                                            int flag=0;
                                                            ResultSet rm=st1.executeQuery("select * from inbox where tos='"+email+"'  order by sn desc limit "+start+",2");
                                                            while(rm.next()){
                                                                String femail=rm.getString("froms");
                                                                ResultSet sr=st.executeQuery("select * from base where email='"+femail+"'");
                                                                if(sr.next()){
                                                                    
                                                                flag=1;
                                                            

								
						%>	
							
							
							
							
							
							<div class="jobs-item with-thumb">
							   <div class="thumb_top">
								<div class="thumb"><img src="images/p1.jpg" class="img-responsive" alt=""/></div>
								<div class="jobs_right">
									<h6 class="title"><a href="view_profile.jsp?id=<%=sr.getString("code")%>"><%=sr.getString("fname")%> <%=sr.getString("lname")%></a></h6>
									<ul class="top-btns">
									  <li><a href="#" class="fa fa-facebook"></a></li>
									  <li><a href="#" class="fa fa-twitter"></a></li>
									  <li><a href="#" class="fa fa-google-plus"></a></li>
									</ul>
                                                                        <%
                                                                            }
									if(flag==0){
										response.sendRedirect("inbox.jsp?id=0");
									}
                                                                            %>
									<ul class="login_details1">
									  <li><%=rm.getString("date")%></li>
									</ul>
									<p class="description">
									<pre><%=rm.getString("msg")%></pre>
									
									
									</p>
								</div>
								<div class="clearfix"> </div>
							   </div>
							  
							  </div>
							  
							
							<%
								}
							%>  
							  
				 <!-- Inbox End-->
				 
				  <div class="col-sm-6">
	   
		   <div class="buttons">
			    <div class="vertical"><a href="inbox.jsp?id=<%=previous%>" style="color:#FFFFFF">Previous</a></div>
			    <div class="vertical"><a href="inbox.jsp?id=<%=next%>" style="color:#FFFFFF">Next</a></div>
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
                        response.sendRedirect("index.jsp");
                    }
                                
                                %>
                                  </div>
            </div>
   </div>
  </body>
</html>
