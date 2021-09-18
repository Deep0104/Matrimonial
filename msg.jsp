<%-- 
    Document   : msg
    Created on : 4 Jul, 2020, 7:10:56 PM
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
                
                String fcode="";
                String temail="";
                String tcode=request.getParameter("id");
                String msg=request.getParameter("msg");
                if(tcode!=null){
                    if(msg!=null){
                        int sn=0;
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/matri","root","");
                            Statement st=cn.createStatement();
                            
                            ResultSet rs=st.executeQuery("select MAX(sn) from inbox");
                            if(rs.next()){
                                sn=rs.getInt(1);
                            }
                            rs.close();
                            sn++;
                            String code="";
                            LinkedList l =new LinkedList();
                            for(char a='A';a<='Z';a++){
                                l.add(a+"");
                            }
                            for(char a='a';a<='z';a++){
                                l.add(a+"");
                            }
                            for(int i=1;i<=9;i++){
                                l.add(new Integer(i));
                            }
                            Collections.shuffle(l);
                            for(int i=1;i<7;i++){
                                code=code+l.get(i);
                            }
                            code=code+"_"+sn;
                            
                            ResultSet rt=st.executeQuery("select * from base where code='"+tcode+"'");
                            if(rt.next()){
                                temail=rt.getString("email");
                            }
                            rt.close();
                            ResultSet rm=st.executeQuery("select * from base where email='"+email+"'");
                            if(rm.next()){
                                fcode=rm.getString("code");
                            }
                            rm.close();
                            //java.util.Date dt=new java.util.Date();
                            
                            String dt="10-7-2020";
                            PreparedStatement ps=cn.prepareStatement("insert into inbox values(?,?,?,?,?,?,?,?)");
                            
                            ps.setInt(1,sn);
                            ps.setString(2,code);
                            ps.setString(3,tcode);
                            ps.setString(4,temail);
                            ps.setString(5,fcode);
                            ps.setString(6,email);
                            ps.setString(7,dt);
                            ps.setString(8,msg);
                            ps.execute();
                            cn.close();
                           
                            response.sendRedirect("view_profile.jsp?id="+tcode+"&success=1");
                            
                    }
                    catch(ClassNotFoundException e){
                        out.println(e.getMessage());
                    }
                    catch(SQLException e){
                        out.println(e.getMessage());
                    }
                        
                }
                else{
                    response.sendRedirect("view_profile.jsp?id="+tcode+"&err=1");
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
    </body>
</html>
