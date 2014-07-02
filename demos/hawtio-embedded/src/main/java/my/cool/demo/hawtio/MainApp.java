package my.cool.demo.hawtio;

import io.fabric8.insight.log.log4j.Log4jLogQuery;
import io.fabric8.insight.log.log4j.Log4jLogQueryMBean;
import io.hawt.embedded.Main;

import java.net.URL;
import java.util.Properties;

public class MainApp {

    private static final String resource = "hawtio-default-1.4.4.war";

    public static void main(String[] args) throws Exception {

        MainApp myApp = new MainApp();
        // Get location of the WAR
        String location = myApp.findResource(resource).getPath();
        // Configure settings
        myApp.settings();

        // Start Log4j QueryBean
        Log4jLogQuery log4jQuery = new Log4jLogQuery();
        log4jQuery.start();

        Main main = new Main();
        main.setWarLocation(location);
        // Run a Jetty Web Server with hawtio war
        main.run();
    }

    private URL findResource(String resource) {
        URL url = getClass().getResource(resource);
        return url;
    }

    private void settings() {
        Properties props = System.getProperties();
        props.setProperty("hawtio.authenticationEnabled","false");
        props.setProperty("hawtio.config.repo","git@github.com:cmoulliard/hawtio-config.git");
        props.setProperty("hawtio.offline","false"); // REQUIRED OTHERWISE LOGs DON't APPEAR INTO THE CONSOLE !
        props.setProperty("hawtio.dirname","/Users/chmoulli/Temp/hawtio/");
    }

}
