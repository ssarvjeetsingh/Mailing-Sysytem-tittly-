<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%!
    
String old="",neww="";
PreparedStatement ps;
Connection cn;
ResultSet rs;


%>



<%
  
cn=(Connection)application.getAttribute("con");

old=request.getParameter("oldpass");
neww=request.getParameter("newpass");
try
{
    ps=cn.prepareStatement("select * from ment where pass=? and name=?");
    ps.setString(1,old);
    ps.setString(2,(String)session.getAttribute("name"));
      
    rs=ps.executeQuery();
         
   
    if(rs.next())
    {
   ps.close();
        ps=cn.prepareStatement("update ment set pass=? where name=?");
    ps.setString(1,neww);
    ps.setString(2,(String)session.getAttribute("name"));
    ps.executeUpdate();
   ps.close();
%>

<script>
  alert("new pass updated");
  window.location("passchange.jsp");
    
    </script>


<%
}
else
{
%>
<script>
  alert("your old pass is missmatch");
  window.location("operation.jsp?sunny=wapus");
    
    </script>


<%
}

}catch(Exception e)
{
}

%>
