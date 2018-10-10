package listener;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

public class Init implements ServletContextListener {

    private Connection conn;
    
    @Override
    public void contextInitialized(ServletContextEvent arg0) {
        try {
            conn = getData().getConnection();
            arg0.getServletContext().setAttribute("connection", conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private DataSource getData() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/data");
    }
}
