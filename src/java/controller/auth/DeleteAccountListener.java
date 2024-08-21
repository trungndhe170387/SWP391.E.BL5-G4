
package controller.auth;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.util.Timer;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;


@WebListener
public class DeleteAccountListener implements ServletContextListener {

    private Timer timer;
    private ScheduledExecutorService scheduler;

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        scheduler = Executors.newScheduledThreadPool(1);

        scheduler.scheduleAtFixedRate(new DeleteAccountTask(), 0,5, TimeUnit.MINUTES);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        if (scheduler != null) {
            scheduler.shutdown();
        }
    }
}
