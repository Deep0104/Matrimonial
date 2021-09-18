<%-- 
    Document   : password_update
    Created on : 3 Jul, 2020, 9:41:10 PM
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
            
            
            if(email !=null && session.getAttribute(email)!=null){
               
                 String cp=request.getParameter("cp");
                String np=request.getParameter("np");
                String rp=request.getParameter("rp");
             
                 if(cp!=null && np!=null && rp!=null){
                     
                     try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/matri","root","");
                                Statement st=cn.createStatement();
                                ResultSet rs=st.executeQuery("select * from base where email='"+email+"'");
                                if(rs.next()){
                                    if(rs.getString(11).equals(cp)){
                                        if(np.equals(rp)){
                                            PreparedStatement ps=cn.prepareStatement("update base set pass=? where email=?");
                                            ps.setString(1,np);
                                            ps.setString(2,email);
                                            ps.execute();
                                            response.sendRedirect("profile.jsp?success=1");
                                        }
                                        else{
                                            response.sendRedirect("pass_change.jsp?mismatch=1");
                                        }
                                    }
                                    else{
                                        response.sendRedirect("pass_change.jsp?invalid_pass=1");
                                    }
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
                     response.sendRedirect("pass_change?err=1");
                 }
             }
             else{
                 response.sendRedirect("index.jsp");
             }
             %>
    </body>
</html>
