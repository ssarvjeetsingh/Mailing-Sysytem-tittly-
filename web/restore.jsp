
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%!
     String id="",op="",cbox[],which="",name="";
     int count=0,count1=0;
 PreparedStatement ps;
 Connection cn;
 ResultSet rs;

%>


<%
cn=(Connection)application.getAttribute("con");


           id=request.getParameter("user");
           
           which=request.getParameter("table");
           cbox=request.getParameterValues("cbox");
     count=0;
     count1=0;   
   
     
     try
 {
   
 if(cbox!=null)
     {   
         for(int i=0;i<cbox.length;i++)
     {
        StringTokenizer st=new StringTokenizer(cbox[i],"!");
        
        while(st.hasMoreTokens())
        {
        
        String ID=st.nextToken();
        
        if(st.nextToken().equals("Sent"))
        {
            ps=cn.prepareStatement("update data set fdel=? where ffrom=? and id=?");
            count1++;
        }
            else 
           
                {
                    ps=cn.prepareStatement("update data set tdel=? where too=? and id=?");
                    count++;
                }
        ps.setString(1,"n");
         ps.setString(2,(String)session.getAttribute("name"));
         ps.setString(3,ID);
        ps.executeUpdate(); 
         
        }
     }
         if(count1==0)
         {
    %>
 
 <script>
    
    alert("<%=count%>  message restore in Inbox");
    window.location("operation.jsp");
    </script>

 <%
     }
else
if(count==0)
{
%>
<script>
    
    alert("<%=count1%>  message restore in Sent");
    window.location("operation.jsp");
    </script>

    <%
}
else
{
%>
<script>
    
    alert("<%=count1%>  message restore in Sent and <%=count%>  message restore in Inbox");
    window.location("operation.jsp");
    </script>

<%
}
     }
    
     
else
 {     
     
     
     
 if(which.equals("Sent"))
 {
ps=cn.prepareStatement("update data set fdel=? where ffrom=? and id=?");

  
   ps.setString(1,"n");
ps.setString(2,(String)session.getAttribute("name"));
ps.setString(3,id);
ps.executeUpdate();
count++;
 }
 else
     if(which.equals("Inbox"))
     {
ps=cn.prepareStatement("update data set tdel=? where too=? and id=?");      
ps.setString(1,"n");
ps.setString(3,id);
ps.setString(2,(String)session.getAttribute("name"));
ps.executeUpdate();          
count++;     

}
 
  
 %>
 
 <script>
    
    alert("<%=count%>  message restore in <%=which%>");
    window.location("operation.jsp");
    </script>

 <%
 }    
}
 catch(Exception e)
 {
     out.print(e);
 }
 %>
     




