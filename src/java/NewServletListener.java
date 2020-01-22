
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
public class NewServletListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        
           ServletContext sc=sce.getServletContext();
    
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
             Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/assi","root",null); 
   
             sc.setAttribute("con", cn);
             
    }catch(Exception e)
   {
       
   }
 
        
        
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
