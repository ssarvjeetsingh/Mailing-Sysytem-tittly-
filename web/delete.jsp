<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%!
     String id="",op="",cbox[];
     int count=0;
 PreparedStatement ps;
 Connection cn;
 ResultSet rs;

%>


<%
cn=(Connection)application.getAttribute("con");


           id=request.getParameter("user");
           
           op=request.getParameter("sentorinordft");
           cbox=request.getParameterValues("cbox");
     count=0;   
    
 try
 {
     
 if(op.equals("Sent"))
 {
ps=cn.prepareStatement("update data set fdel=? where ffrom=? and id=?");
if(cbox!=null)
     {   
         for(int i=0;i<cbox.length;i++)
     {
         
        ps.setString(1,"y");
         ps.setString(2,(String)session.getAttribute("name"));
         ps.setString(3,cbox[i]);
        ps.executeUpdate(); 
         count++;  
     }

     }
else
{
   
   ps.setString(1,"y");
ps.setString(2,(String)session.getAttribute("name"));
ps.setString(3,id);
ps.executeUpdate();
count++;
}
 }
 else
     if(op.equals("Inbox"))
     {
ps=cn.prepareStatement("update data set tdel=? where too=? and id=?");
if(cbox!=null)
     {   
         for(int i=0;i<cbox.length;i++)
     {
         
        ps.setString(1,"y");
         ps.setString(2,(String)session.getAttribute("name"));
         ps.setString(3,cbox[i]);
        ps.executeUpdate(); 
         count++;  
     }

     }
else
{
     
ps.setString(1,"y");
ps.setString(3,id);
ps.setString(2,(String)session.getAttribute("name"));
ps.executeUpdate();          
 count++;     
}
}
 else
     if(op.equals("Draft"))
     {
ps=cn.prepareStatement("delete from save where ffrom=? and id=?");
if(cbox!=null)
     {   
         for(int i=0;i<cbox.length;i++)
     {
         
       
         ps.setString(1,(String)session.getAttribute("name"));
         ps.setString(2,cbox[i]);
        ps.executeUpdate(); 
         count++;  
     }

     }
else
{
 
ps.setString(2,id);
ps.setString(1,(String)session.getAttribute("name"));
ps.executeUpdate(); 
count++; 
     } 
     }
 
 %>
 <script>
    
    alert("<%=count%>  message deleted");
    window.location("operation.jsp");
    </script>

 <%
     }
 catch(Exception e)
 {
     out.print(e);
 }
    
%> 




