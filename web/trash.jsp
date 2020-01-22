<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%!
 String data;
 int vd;
 String to="",sub="",date="",status="",time="",id="",which="";
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
             
                ps=cn.prepareStatement("select * from data where ffrom=? and fdel=?");
                ps.setString(1, (String)session.getAttribute("name"));
                ps.setString(2,"y");
                rs=ps.executeQuery();
               
             
                while(rs.next())
                {
                    vd=1;
                
                    data=rs.getString(1)+"^^"+rs.getString(5)+"^^"+rs.getString(3)+"^^"+rs.getDate(6)+"^^"+rs.getTime(6)+"^^"+"Sent"+"^^"+data;
                }
                
                ps.close();
                
                ps=cn.prepareStatement("select * from data where too=? and tdel=?");
                ps.setString(1, (String)session.getAttribute("name"));
                ps.setString(2,"y");
                rs=ps.executeQuery();
               
             
                while(rs.next())
                {
                    vd=1;
                
                    data=rs.getString(1)+"^^"+rs.getString(2)+"^^"+rs.getString(3)+"^^"+rs.getDate(6)+"^^"+rs.getTime(6)+"^^"+"Inbox"+"^^"+data;
                }
                
                ps.close();
                    StringTokenizer st=new StringTokenizer(data,"^^");   
                   %>
                     <html>
                     <body>
                         <form action="operation.jsp">
                             
                          <h2>
                           Trash
                         </h2> 
                             <%
                     if(vd==1)
                     {
                     while(st.hasMoreTokens())
                     {
                         id=st.nextToken();
                         to=st.nextToken();
                         sub=st.nextToken();
                         date=st.nextToken();
                         time=st.nextToken();
                         which=st.nextToken();
                         
                         %>
                         
                         
                         <input type="checkbox" name="cbox" value=<%=id+"!"+which%> ># <%=to%>&nbsp;&nbsp;<%="("+which+")"%>  
      <P><a href="operation.jsp?user=<%=id%>&table=<%=which%>&opration=Trash"> <%=sub%>&nbsp;&nbsp;<%=date%>&nbsp;&nbsp;<%=time%> </a></p>
                      <%
                          
                     }
                  %>
                     <p align="center"><input type="submit" name="but" value="Restore"></p>
                    <%
                    }
                     else
                     {
                     
                         out.print("nothing in "+"Trash");
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
                
             
           


%>
