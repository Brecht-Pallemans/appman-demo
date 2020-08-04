package demo.appman.demo.controllers.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/demo")
public class DemoApiController {

    @Autowired
    public DemoApiController() {
    }

    @GetMapping("/")
    public ResponseEntity<String> getDemo() {
        return ResponseEntity.ok("Hello world");
    }
}
