<%!
    String name="";
    String value=null,op=null,send=null;
    String scp=null;
    %>
<%
 name=(String)session.getAttribute("name");
%>
<html>
    <link rel="stylesheet" type="text/css" href="out.css">
    <body style="background-color: cadetblue">
<form>
<table width="778" height="426" border="0" align="center">
  <tr>
      <td height="80" colspan="3"><h1>Welcome</h1><h2><%=name%></h2>
          
          <ul> <li>settings/logout  
                  <ul>
                      <li><a href="operation.jsp?value=chgpass">change password </a></li>
                      <li> <a href="log.html"> logout </a></li>
                  </ul>
              
              </li> 
          </ul>
          
      </td>
  </tr>
  <tr>
    <td width="187" height="313" > 
	<p align="center"><a href=operation.jsp?value=Com> Compose </a> </p> 
        <p align="center"><a href=operation.jsp?value=Sent&id=Sent>Sent</a> </p>
        <p align="center"><a href=operation.jsp?value=Inbox&id=Inbox>Inbox</a> </p>
	<p align="center"><a href=operation.jsp?value=Draft>Draft</a> </p>
	<p align="center"><a href="operation.jsp?value=Trash" >Trash</a> </p>
	
	</td>
        <td width="400">
            <%
              value=request.getParameter("value");
              send=request.getParameter("but");
              
              op=request.getParameter("opration");
              scp=request.getParameter("sunny");
              
              if(value!=null)
              {
                  if(value.equals("Com"))
                  {
                %>
                <jsp:include page="compose.jsp" />
                <%
                    
                }
                else
                if(value.equals("Sent")||value.equals("Inbox"))
                {
                  %>
                    <jsp:include page="sentorinbox.jsp" />
                    <%
                        
                   
                        }
                   else
                      if(value.equals("Draft"))
                  {

                  %>
                  <jsp:include page="draft.jsp" />
                  <%

                       }
                        else
                      if(value.equals("Trash"))
                  {

                  %>
                  <jsp:include page="trash.jsp" />
                  <%

                       }
                      else
                      if(value.equals("chgpass"))
                  {
                    
                  %>
                  <jsp:include page="passchange.jsp" />
                  <%

                       }
                     else
                      if(value.equals("Save"))
                  {
                  %>
                  <jsp:include page="opchg.jsp" />
                  
                    <%

                       }
                 }                   
                  if(op!=null)
                        {
                        if(op.equals("Sent")||op.equals("Inbox")||op.equals("Trash"))
                        {
                        %>
                        <jsp:include page="sentinop.jsp" />
                        <%
                       }
                       else
                        if(op.equals("Draft"))
                        {
                         %>
                         <jsp:include page="draftop.jsp" />
                         <%
                         }
                      }
                     if(send!=null)
                {
                   if(send.equals("Save")||send.equals("Send"))
                    {
                      %>
                      <jsp:include page="copra.jsp" />
                      <%
                      }
                   else
                           if(send.equals("Delete"))
                          {
                       %>
                       <jsp:include page="delete.jsp" />
                       <%
                           }
                      else
                          if(send.equals("Restore"))
                       {
                       %>
                       <jsp:include page="restore.jsp" />
                       <%

                      }
                      
                }
             if(scp!=null)
                {
                   if(scp.equals("wapus"))
                    {
                      out.print(scp);
                      %>
                      
                      <%
                      }
                   
                   }
                     
                    %>
            
        </td>
    <td width="192">&nbsp;</td>
  </tr>
  
</table>
</form>
    </body>
</html>







