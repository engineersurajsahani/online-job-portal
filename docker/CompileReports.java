import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

import net.sf.jasperreports.engine.JasperCompileManager;

/**
 * Build-time helper: recompiles every .jrxml in a directory with the exact
 * JasperReports version bundled in WEB-INF/lib, so the serialized .jasper
 * files always match the runtime engine (fixes ClassCastException on load).
 *
 * Jaspersoft Studio adds uuid="..." attributes that the JasperReports 5.6
 * XSD does not accept, so they are stripped before compiling.
 *
 * Usage: java CompileReports <directory-with-jrxml-files>
 */
public class CompileReports {
    public static void main(String[] args) throws Exception {
        File dir = new File(args[0]);
        File[] files = dir.listFiles((d, n) -> n.toLowerCase().endsWith(".jrxml"));
        if (files == null || files.length == 0) {
            System.out.println("No .jrxml files found in " + args[0]);
            return;
        }
        int ok = 0;
        for (File src : files) {
            File cleaned = File.createTempFile("jr-", ".jrxml");
            cleaned.deleteOnExit();
            String xml = new String(Files.readAllBytes(src.toPath()), StandardCharsets.UTF_8);
            xml = xml.replaceAll(" uuid=\"[^\"]*\"", "");
            Files.write(cleaned.toPath(), xml.getBytes(StandardCharsets.UTF_8));

            String out = src.getAbsolutePath().replaceAll("\\.jrxml$", ".jasper");
            System.out.println("Compiling " + src.getName() + " -> " + new File(out).getName());
            try {
                JasperCompileManager.compileReportToFile(cleaned.getAbsolutePath(), out);
                ok++;
            } catch (Exception e) {
                System.out.println("FAILED: " + src.getName() + " : " + e.getMessage());
            }
        }
        System.out.println("Compiled " + ok + "/" + files.length + " reports");
        if (ok != files.length) {
            System.exit(1);
        }
    }
}
