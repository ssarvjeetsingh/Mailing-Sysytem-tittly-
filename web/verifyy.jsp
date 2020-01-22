<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%!
    
    PreparedStatement ps;
    ResultSet rs;
    Connection cn;
 String name="",pass="",button="";
 



%>
<%
    
    cn=(Connection)application.getAttribute("con");
   name=request.getParameter("na");
   pass=request.getParameter("pa");
   button=request.getParameter("but");
   



  if(button.equals("Login"))
  {
  ps=(PreparedStatement)cn.prepareStatement("select * from ment where name=? and pass=?");
  
             ps.setString(1,name);
             ps.setString(2,pass);
             rs=ps.executeQuery();
     
                 if(rs.next())
             {
                 session.setAttribute("name",name);
             %>
             <jsp:forward page="operation.jsp"/>
<%
  }
else
{
out.print("something Wrong");
}
}
else
if(button.equals("Signup"))
{
        
             ps=(PreparedStatement)cn.prepareStatement("select name from ment where name=?");
             ps.setString(1,name);
             rs=ps.executeQuery();
          
             
             if(rs.next())
             {
                
             %>       
             <script>
                 alert("Acoount already exists");
                 
                 
             </script>
             
             <%
        
        ps.close();
        
            }
             else
             {
              ps=(PreparedStatement)cn.prepareStatement("insert into ment(name,pass) values(?,?)");
              ps.setString(1,name);
              ps.setString(2,pass);
              
              ps.executeUpdate();
           %>
           <script>
                 alert("Acoount created succ...");
                 
                 
             </script>
             
           <%
              
             }
}
%> 
 

 
  