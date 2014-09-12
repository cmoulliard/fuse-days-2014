package my.cool.demo.camel;

import org.apache.camel.builder.RouteBuilder;

public class DummyRoute extends RouteBuilder {
    @Override
    public void configure() throws Exception {
        from("timer://demo?period=10000")
          .setBody().constant(" >> Dear participants")
          .setHeader("type").constant("jboss-fuse-partners-days")
          .log("Hello to our ${body} part of the ${header.type}");
    }
}
