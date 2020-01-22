<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%!
    
    String to="",sub="",date="",time="",id="";
String op=""; 
PreparedStatement ps;
ResultSet rs;
Connection cn;



%>
<%

    cn=(Connection)application.getAttribute("con");
op=request.getParameter("id");

if(op.equals("Sent")||op.equals("Inbox"))
            {   
              
               int vd=0;
               
                String data="";
                try
                {
                
                if(op.equals("Sent"))
                        {
                            ps=cn.prepareStatement("select * from data where ffrom=? and fdel=?");
                            ps.setString(1, (String)session.getAttribute("name"));
                            ps.setString(2,"n");
                           rs=ps.executeQuery();
               
                            while(rs.next())
                {
                    vd=1;
                   
                   data=rs.getInt(1)+"^^"+rs.getString(5)+"^^"+rs.getString(3)+"^^"+rs.getDate(6)+"^^"+rs.getTime(6)+"^^"+data;
                }
                
                        }
                
                else
                {
                    ps=cn.prepareStatement("select * from data where too=? and tdel=?");
                    ps.setString(1, (String)session.getAttribute("name"));
                    ps.setString(2,"n");
                    rs=ps.executeQuery();
               
                    while(rs.next())
                {
                    vd=1;
                   
                   data=rs.getInt(1)+"^^"+rs.getString(2)+"^^"+rs.getString(3)+"^^"+rs.getDate(6)+"^^"+rs.getTime(6)+"^^"+data;
                }
                
                }
                rs.close();
     
                     StringTokenizer st=new StringTokenizer(data,"^^");
                     %>

                     <html>
                     <body>
                         <form action="operation.jsp">
                             
                          <h2>
                           <%=op%>
                         </h2> 
                         <input type="hidden" name="sentorinordft" value=<%=op%>>
 <% 
                     if(vd==1)
                     {
                        
                     while(st.hasMoreTokens())
                     {   id=st.nextToken(); 
                         to=st.nextToken();
                         sub=st.nextToken();
                         date=st.nextToken();
                         time=st.nextToken();
                         
                       %>
                       <input type="checkbox" name="cbox" value=<%=id%>>   
                       # <%=to%>
                       <P><a href="operation.jsp?&user=<%=id%>&opration=<%=op%>"> <%=sub%>&nbsp;&nbsp;<%=date%>&nbsp;&nbsp;<%=time%> </a></p>
     <hr> 
                     <%  
                     }
                 %>
                 <p align="center"><input type="submit" name="but" value="Delete"></p>
                 <%
                    }
                     else
                     {
                    %>
                    <script>
                     
                alert("nothing in <%=op%>");
               window.location("operation.jsp");
                     </script>
                                        
                   <%      
                     }
                    
                   %>
                   
                     </form>
                     
                     </body>
                     </html>
  
                    
                <%
                }catch(Exception e)
                {
                  out.print(e);
                }
                
             
            }
           
%>