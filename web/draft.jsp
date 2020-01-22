

<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%!
 String data;
 int vd;
 String to="",sub="",date="",status="",time="";
PreparedStatement ps;
Connection cn;
ResultSet rs;
    %>



<%
    
cn=(Connection)application.getAttribute("con");
             

              vd=0;
             data="";
                try
                {
             
                ps=cn.prepareStatement("select * from save where ffrom=?");
                ps.setString(1, (String)session.getAttribute("name"));
               
                rs=ps.executeQuery();
             %>  
                <html>
                     <body>
                         <form>
                             <input type=hidden name=sentorinordft value=Draft>
                          <h2>
                           Draft
                         </h2> 
<%
               int i=0;
                while(rs.next())
                {
                    vd=1;
                
                    
                   %>
                                                 
                         
                   <input type="checkbox" name="cbox" value=<%=rs.getString(1)%>># <%=rs.getString(4)%>&nbsp;&nbsp;<%="("+rs.getString(6)+")"%>  
      <P><a href="operation.jsp?user=<%=rs.getString(1)%>&opration=Draft"> <%=rs.getString(3)%>&nbsp;&nbsp;<%=rs.getDate(7)%>&nbsp;&nbsp;<%=rs.getTime(7)%> </a></p>
                     <%  
                          }
                  
                     
                    
                     if(vd==0)
                     {
                     
                      %>
      <script>
         alert("nothing in Draft");
         window.location("operation.jsp");
      </script>
      <%
                     }
               else
               {
                     
                   %>
                   <p align="center"><input type="submit" name="but" value="Delete"></p> 
                   
                   <%
                       }
%>
                     </form>
                     
                     </body>
                     </html>
  
                    
                <%
                    }
                catch(Exception e)
                {
                  out.print(e);
                }
                
             
           


%>
                         