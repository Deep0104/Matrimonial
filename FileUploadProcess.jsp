<%-- 
    Document   : FileUploadProcess
    Created on : 9 Jul, 2020, 9:01:40 PM
    Author     : dprisky
--%>

<%@page contentType="text/html" import="java.sql.*,java.io.*" pageEncoding="UTF-8"%>
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
            for(int i=1;i<c.length;i++){
                if(c[i].getName().equals("user")){
                    email=c[i].getValue();
                    break;
                }
            }
            
            if(email !=null && session.getAttribute(email) !=null){
                String contentType = request.getContentType();

                String imageSave=null;
                byte dataBytes[]=null;
                String saveFile=null;
                if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)){
                    DataInputStream in = new DataInputStream(request.getInputStream());
                    int formDataLength = request.getContentLength();
                    dataBytes = new byte[formDataLength];
                    int byteRead = 0;
                    int totalBytesRead = 0;
                    while (totalBytesRead < formDataLength)
                    {
                    byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                    totalBytesRead += byteRead;
                    }
                    String code="";
                    
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/matri","root","");
                        Statement st=cn.createStatement();
                        ResultSet rs=st.executeQuery("select * from base where email='"+email+"'");
                        
                        if(rs.next()){
                            code=rs.getString("code");
                        }
                        cn.close();

                    } 
                    catch(Exception er){

                    }
                    String file = new String(dataBytes);
                    /*saveFile = file.substring(file.indexOf("filename=\"") + 10);
                    saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                    saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));*/
                     saveFile = code+".jpg";
                    // out.print(dataBytes);
                    int lastIndex = contentType.lastIndexOf("=");
                    String boundary = contentType.substring(lastIndex + 1, contentType.length());
                    // out.println(boundary);
                    int pos;
                    pos = file.indexOf("filename=\"");
                    pos = file.indexOf("\n", pos) + 1;
                    pos = file.indexOf("\n", pos) + 1;
                    pos = file.indexOf("\n", pos) + 1;
                    int boundaryLocation = file.indexOf(boundary, pos) - 4;
                    int startPos = ((file.substring(0, pos)).getBytes()).length;
                    int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
                    try{
                    FileOutputStream fileOut = new FileOutputStream(request.getRealPath("/")+"/images/"+saveFile);

                    // fileOut.write(dataBytes);
                    fileOut.write(dataBytes, startPos, (endPos - startPos));
                    fileOut.flush();
                    fileOut.close();
                    imageSave="Success";
                    response.sendRedirect("photo_upload.jsp?success=1");
                    }catch (Exception e)
                    {

                    imageSave="Failure";
                    }
                }
            }
            else{
                response.sendRedirect("index.jsp");
     }
%>
    </body>
</html>
