package my.cool.demo.hawtio;


import my.cool.demo.camel.DummyRoute;
import org.apache.camel.main.Main;

public class CamelApp {

    private Main main;

    public CamelApp() {
        init();
    }

    private void init() {
        main = new Main();
        main.addRouteBuilder(new DummyRoute());
        main.enableTrace();
    }

    public void start() throws Exception {
        main.enableHangupSupport();
        main.start();
    }

}
