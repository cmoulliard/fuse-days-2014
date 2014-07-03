package my.cool.demo.hawtio;

import io.fabric8.insight.log.log4j.Log4jLogQuery;
import io.fabric8.insight.log.log4j.Log4jLogQueryMBean;
import io.hawt.embedded.Main;

import java.net.URL;
import java.util.Properties;

/**
 * = Asciidoclet
 *
 * Sample comments that include +source code+.
 *
 * [source,java]
 * --
 * public class Asciidoclet extends Doclet {
 *     private final Asciidoctor asciidoctor = Asciidoctor.Factory.create();
 *
 *     @SuppressWarnings("UnusedDeclaration")
 *     public static boolean start(RootDoc rootDoc) {
 *         new Asciidoclet().render(rootDoc);
 *         return Standard.start(rootDoc);
 *     }
 * }
 * --
 *
 * @author https://github.com/cmoullard[Charles Moulliard]
 */
public class MainApp {

    private static final String resource = "hawtio-default-1.4.4.war";

    public static void main(String[] args) throws Exception {

        MainApp myApp = new MainApp();

        // Get location of the WAR
        String hawtioWar = myApp.findResource(resource).getPath();

        // Configure settings
        myApp.settings();

        // Start Log4j QueryBean
        Log4jLogQuery log4jQuery = new Log4jLogQuery();
        log4jQuery.start();

        Main main = new Main();
        main.setWarLocation(String.valueOf(hawtioWar));
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
