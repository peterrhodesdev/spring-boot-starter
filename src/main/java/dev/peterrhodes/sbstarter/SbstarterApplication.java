package dev.peterrhodes.sbstarter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class SbstarterApplication {

    @RequestMapping("/")
    String index(HttpServletResponse httpResponse) throws Exception {
        httpResponse.sendRedirect("/home");
        return null;
    }

    @RequestMapping("/home")
    String home() {
        return "<h1>Spring Boot starter</h1>";
    }

    public static void main(String[] args) {
        SpringApplication.run(SbstarterApplication.class, args);
    }
}
