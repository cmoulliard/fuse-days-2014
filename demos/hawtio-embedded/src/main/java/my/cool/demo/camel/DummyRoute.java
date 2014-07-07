package my.cool.demo.camel;

import org.apache.camel.builder.RouteBuilder;

public class DummyRoute extends RouteBuilder {
    @Override
    public void configure() throws Exception {
        from("timer://demo")
          .setBody().constant("dear participants")
          .setHeader("type").constant("jboss-fuse-partners-days")
          .log("Hello to our ${body}");
    }
}
