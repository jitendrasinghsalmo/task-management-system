package Task_management_system;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.junit.jupiter.api.Test;

class StaticResourceIntegrationTest {

    @Test
    void shouldExposeIndexHtmlFromStaticResources() {
        Path indexPath = Paths.get("src/main/resources/static/index.html");
        assertTrue(Files.exists(indexPath), "Expected an index.html file in src/main/resources/static/");
    }
}
