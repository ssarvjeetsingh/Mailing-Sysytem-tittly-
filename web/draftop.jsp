<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%!
  String id="";
Connection cn;
PreparedStatement ps;
ResultSet rs;


%>

<%
   
cn=(Connection)application.getAttribute("con");

         id=request.getParameter("user");

        
   try
   {
ps=cn.prepareStatement("select too,subject,data,date,statuss from save where ffrom=? and id=?");
            
            ps.setString(1,(String)session.getAttribute("name"));
            ps.setString(2,id);
           
     
            rs=ps.executeQuery();
            if(rs.next())
            {    
           
%>
<form action="operation.jsp">
    
    <input type=hidden name=user value=<%=id%>>
    
     <input type=hidden name=sentorinordft value=Draft>

<table width="446" height="325" border="0" align="center">
  <tr>
      <th height="23" colspan="2" >Draft</th>
    </tr>
  <tr>
    <td width="54" height="23">To:</td>
    <td width="234"><input type="text"  name="to" value=<%=rs.getString(1)%>> &nbsp;&nbsp;<%="("+rs.getString(5)+")"%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getDate(4)+"("+rs.getTime(4)+")"%> 
        
  </tr>
  <tr>
      <td height="23">Subject:</td>
    <td ><%=rs.getString(2)%></td>
  </tr>
  <tr>
      <td height="244" colspan="2" ><textarea rows="14" cols="60"><%=rs.getString(3)%></textarea></td>
    </tr>
   <tr>
    <td height="34" colspan="2" >
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="but" value="Send">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" name="but" value="Delete"></td>
    </tr>
</table>


</form>   
               
               
               
               
    <%
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
