
<form action="operation.jsp">

<table width="516" height="365" border="0" align="center">
  <tr>
    <td width="60" height="32">From:</td>
    <td width="440"><%=(String)session.getAttribute("name")%></td>
  
  </tr>
  
  <tr>
    <td height="31">To:</td>
    <td><input type="text" name="to" width="600" required></td>
  </tr>
  <tr>
    <td height="29">Subject:</td>
    <td><input type="text" name="sub" width="600" required></td>
  </tr>
 
  <tr>
      <td height="225" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="14" cols="32" name="data">      </textarea></td>
  </tr>
  <tr>
    <td height="34" colspan="2" >
	
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="but" value="Send">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" name="but" value="Save"></td>
    </tr>
</table>

</form>