<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%!
  String id="",op=null,table="",label="",which="";
Connection cn;
PreparedStatement ps;
ResultSet rs;

%>


<%
    cn=(Connection)application.getAttribute("con");

           id=request.getParameter("user");
           
           op=request.getParameter("opration");
           
           which=request.getParameter("table");
          
                   
 try{
            
            if(op.equals("Sent"))
            {
                ps=cn.prepareStatement("select subject,too,data,date from data where ffrom=? and id=?");
                ps.setString(1,(String)session.getAttribute("name"));
                ps.setString(2,id);
                label="To :";
             %>
             
             <input type="hidden" name="table" value=Sent>>
             <%
                
            }
            else
                if(op.equals("Inbox"))
            {
                ps=cn.prepareStatement("select subject,too,data,date from data where too=? and id=?");
                
            ps.setString(1,(String)session.getAttribute("name"));
            ps.setString(2,id);
            label="From :";

%>
             
             <input type="hidden" name="table" value=Inbox>>
             <%
             
            }
            else
                    if(op.equals("Trash"))
                {
                    if(which.equals("Sent"))
                    {
                 ps=cn.prepareStatement("select subject,too,data,date from data where ffrom=? and id=? and fdel=?");
                   }
                   else
                    {
                     ps=cn.prepareStatement("select subject,ffrom,data,date from data where too=? and id=? and tdel=?");
                    }
            ps.setString(1,(String)session.getAttribute("name"));
            ps.setString(2,id);
            ps.setString(3,"y");
            label="To :";
             %>
             
            <input type="hidden" name="table" value=<%=which%>>
             <%
   
                }
            
            
            
            rs=ps.executeQuery();
            if(rs.next())
            {
                
        %> 
               
               
            
        <form action="operation.jsp">
         
       <input type="hidden" name="sentorinordft" value=<%=op%>>
       <input type="hidden" name="user" value=<%=id%>>
<table width="446" height="325" border="0" align="center">
  <tr>
      <th height="23" colspan="2" > <%=op%>
          <hr style="border-color: black">
      </th>
  
    </tr>
  <tr>
    <td width="54" height="23"><%=label%>
    </td>
    <td width="234"><%=rs.getString(2)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getDate(4)+"         "+rs.getTime(4)%> 
        <hr>   
  </tr>
  <tr>
      <td height="23">Subject:
      </td>
    <td><%=rs.getString(1)%>
    <hr>
    </td>
  
  </tr>
  <tr>
      <td height="244" colspan="2" ><textarea rows="14" cols="60" style="background-color: cadetblue"><%=rs.getString(3)%></textarea></td>
    </tr>
</table>
      <%
          if(op.equals("Sent")||op.equals("Inbox"))
          {
              %>
          
      <p align="center"><input type="submit" name="but" value="Delete"></p>

      <%
          }
             else
             if(op.equals("Trash"))
      {
          %>
       <p align="center"><input type="submit" name="but" value="Restore"></p>
</form>   
               
                         
    <%
        }
}
             
            else
            {
                out.print("sorry");
            }
            
          
                }
            catch(SQLException e)
            {
                
            }

        
           



%>
