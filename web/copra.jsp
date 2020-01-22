<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%!
  
String from="",to="",sub="",data="",button="",op="",id="",date="";
int status=0;

PreparedStatement ps;
Connection cn;
ResultSet rs;


%>


<%
    cn=(Connection)application.getAttribute("con");
    to=request.getParameter("to");
    
    from=(String)session.getAttribute("name");
    op=request.getParameter("sentorinordft");
    
  try{
      
      
      if(op==null)
      {
         sub=request.getParameter("sub");
    data=request.getParameter("data");
    button=request.getParameter("but"); 
          
        ps=cn.prepareStatement("select name from ment where name=?");
        ps.setString(1,to);
        rs=ps.executeQuery();
       
        if(rs.next())
        {
         status=1;   
        }
        if
                (button.equals("Send"))
        {
        if(status==1)
        {
         ps=cn.prepareStatement("insert into data(ffrom,subject,data,too) values(?,?,?,?)");
         ps.setString(1, from);
         ps.setString(2, sub);
         ps.setString(3, data);   
         ps.setString(4, to);
         ps.executeUpdate();
        
         ps.close();
         out.print("send......");
            
            
        }
        else
        {
            ps=cn.prepareStatement("insert into save(ffrom,subject,data,too,statuss) values(?,?,?,?,?)");
            ps.setString(1, from);
            ps.setString(2, sub);
            ps.setString(3, data);   
            ps.setString(4, to);
            ps.setString(5,"invalid");
            ps.executeUpdate();
        
            ps.close();
           out.print("user Id is invalid......");
        
         
        }
        
        
        }
      
        else
            if(button.equals("Save"))
            {
               
            ps=cn.prepareStatement("insert into save(ffrom,subject,data,too,statuss) values(?,?,?,?,?)");
            ps.setString(1, from);
            ps.setString(2, sub);
            ps.setString(3, data);   
            ps.setString(4, to);
            ps.setString(5,"valid");
            ps.executeUpdate();
        
            ps.close();
        
                out.print("message save......");
            
        
            }
        }
      else
      {
          out.print("1");
      id=request.getParameter("user");
      ps=cn.prepareStatement("select name from ment where name=?");
        ps.setString(1,to);
        rs=ps.executeQuery();
       
        if(rs.next())
        {
         status=1;   
        }
        
        {
        if(status==1)
        {
            
          out.print("2");  
            
            ps=cn.prepareStatement("select subject,data from save where id=? and ffrom=?");
        ps.setString(1,id);
        ps.setString(2,from);
        rs=ps.executeQuery();
       
        if(rs.next())
        {
         
         sub=rs.getString(1);
         data=rs.getString(2);      
        }
      ps.close();
            
            out.print("3");
         ps=cn.prepareStatement("insert into data(ffrom,subject,data,too) values(?,?,?,?)");
         ps.setString(1, from);
         ps.setString(2, sub);
         ps.setString(3, data);   
         ps.setString(4, to);
         ps.executeUpdate();
        
         ps.close();
         out.print("send......");
            
            
        }
        else
        {
            ps=cn.prepareStatement("insert into save(ffrom,subject,data,too,statuss) values(?,?,?,?,?)");
            ps.setString(1, from);
            ps.setString(2, sub);
            ps.setString(3, data);   
            ps.setString(4, to);
            ps.setString(5,"invalid");
            ps.executeUpdate();
        
            ps.close();
           out.print("user Id is invalid......");
        
         
        }
        
        
        }
        
      }
         
  }
                catch(SQLException e)
        {
            out.print(e);
        }
        
      

%>