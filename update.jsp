<%-- 
    Document   : data
    Created on : 1 Jul, 2020, 2:07:40 PM
    Author     : dprisky
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
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
            
            
            if(email !=null && session.getAttribute(email)!=null){
            String sname=request.getParameter("sname");
            String lname=request.getParameter("lname");
            String d=request.getParameter("dob");
            String m=request.getParameter("month");
            String y=request.getParameter("year");
            
            String religion=request.getParameter("religion");
            String caste=request.getParameter("caste");
            String occupation=request.getParameter("occupation");
            
            String mob=request.getParameter("mob");
            String dob=d+"-"+m+"-"+y;
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/matri","root","");
                Statement st=cn.createStatement();
                
                    PreparedStatement ps=cn.prepareStatement("update base set fname=?,lname=?,mobile=?,caste=?,religion=?,dob=?,occupation=? where email=?");
                    
                    
                    ps.setString(1,sname);
                    ps.setString(2,lname);
                    ps.setString(3,mob);
                    ps.setString(4,caste);
                    ps.setString(5,religion);
                    ps.setString(6,dob);
                    ps.setString(7,occupation);
                    ps.setString(8,email);
                    
                    
                    
                    ps.execute();
                    response.sendRedirect("edit.jsp?success=1");
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
            
    </body>
</html>
