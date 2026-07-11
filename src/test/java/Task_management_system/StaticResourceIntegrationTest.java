package Task_management_system;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.junit.jupiter.api.Test;

class StaticResourceIntegrationTest {

    @Test
    void shouldExposeFrontendFilesForNetlify() {
        Path indexPath = Paths.get("frontend/index.html");
        Path netlifyConfigPath = Paths.get("frontend/netlify.toml");
        assertTrue(Files.exists(indexPath), "Expected an index.html file in the frontend folder");
        assertTrue(Files.exists(netlifyConfigPath), "Expected a netlify.toml file in the frontend folder");
    }
}
