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
            int sn=0;
            String code="";
            LinkedList l =new LinkedList();
            for(char c='A';c<='Z';c++){
                l.add(c+"");
            }
            for(char c='a';c<='z';c++){
                l.add(c+"");
            }
            for(int i=1;i<=9;i++){
                l.add(new Integer(i));
            }
            Collections.shuffle(l);
            for(int i=1;i<6;i++){
                code=code+l.get(i);
                
            }
            code=code+"_"+sn;
            String sname=request.getParameter("sname");
            String lname=request.getParameter("lname");
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
            String d=request.getParameter("dob");
            String m=request.getParameter("month");
            String y=request.getParameter("year");
            String gender=request.getParameter("gender");
            String religion=request.getParameter("religion");
            String caste=request.getParameter("caste");
            String occupation=request.getParameter("occupation");
            String address=request.getParameter("address");
            String mob=request.getParameter("mob");
            
            String dob=d+"-"+m+"-"+y;
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/matri","root","");
                Statement st=cn.createStatement();
                ResultSet rs=st.executeQuery("select MAX(sn) from base");
                    
                    if(rs.next()){
                        sn=rs.getInt(1);
                    }
                    sn++;
                    code=code+sn;
                    PreparedStatement ps=cn.prepareStatement("insert into base values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
                    
                    ps.setInt(1, sn);
                    ps.setString(2,sname);
                    ps.setString(3,lname);
                    ps.setString(4,mob);
                    ps.setString(5,gender);
                    ps.setString(6,caste);
                    ps.setString(7,religion);
                    ps.setString(8,dob);
                    ps.setString(9,address);
                    ps.setString(10,email);
                    ps.setString(11,pass);
                    ps.setString(12,occupation);
                    ps.setString(13,code);
                    ps.execute();
                    response.sendRedirect("login.jsp?success=1");
                    cn.close();
            }
            catch(ClassNotFoundException e){
                    out.println(e.getMessage());
                }
                catch(SQLException e){
                    out.println(e.getMessage());
                }
            

            
        %>
            
    </body>
</html>
