<%-- 
    Document   : cookie
    Created on : 3 Jul, 2020, 10:26:32 AM
    Author     : dprisky
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                if(email==null){
                    if(request.getParameter("email").length()==0){
                        response.sendRedirect("login.jsp?err=1");
                    }
                    else{
                        email=request.getParameter("email");
                        
                    }
                }
                if(request.getParameter("pass").length()==0){
                    response.sendRedirect("login.jsp?err=1");
                }
                else{
                    String pass=request.getParameter("pass");
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/matri","root","");
                        Statement st=cn.createStatement();
                        ResultSet rs=st.executeQuery("select * from base where email='"+email+"'");
                        if(rs.next()){
                                if(rs.getString(11).equals(pass)){
                                     Cookie ct =new Cookie("user",email);
                                    ct.setMaxAge(3600);
                                    response.addCookie(ct);
                                    
                                    session.setAttribute(email,pass);
                                    session.setMaxInactiveInterval(20);
                                    response.sendRedirect("profile.jsp");
                                    
                                }
                                else{
                                    response.sendRedirect("login.jsp?invalid_pass=1");
                                }
                        }
                        else{
                            response.sendRedirect("login.jsp?invalid_email=1");
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
                %>
    </body>
</html>
