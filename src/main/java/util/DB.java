package util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Central SQLite helper for the Online Job Portal.
 *
 * - The database location comes from the SQLITE_DB_PATH environment variable
 *   (default: /data/online_job_portal.db, as mounted on Render).
 * - On first run (empty database) it creates the schema and loads the original
 *   backup data, so the site starts with the content from backup.sql.
 * - Every page and the JasperReports PDF engine connect through this class.
 */
public final class DB {

    private static final String SQLITE_DB_PATH =
            System.getenv("SQLITE_DB_PATH") != null
                    ? System.getenv("SQLITE_DB_PATH")
                    : "/data/online_job_portal.db";

    private static final Object INIT_LOCK = new Object();
    private static volatile boolean initialized = false;

    private DB() {
    }

    /** Location of the SQLite database file (useful in logs / admin pages). */
    public static String getPath() {
        return SQLITE_DB_PATH;
    }

    /** Opens a connection; creates schema + seeds backup data on first use. */
    public static Connection get() throws SQLException {
        ensureReady();
        Connection cn = DriverManager.getConnection("jdbc:sqlite:" + SQLITE_DB_PATH);
        try (Statement st = cn.createStatement()) {
            st.execute("PRAGMA busy_timeout=5000");
            st.execute("PRAGMA foreign_keys=ON");
        } catch (SQLException ignore) {
            // pragma failures must never block a page render
        }
        return cn;
    }

    private static void ensureReady() throws SQLException {
        if (initialized) {
            return;
        }
        synchronized (INIT_LOCK) {
            if (initialized) {
                return;
            }
            try {
                Class.forName("org.sqlite.JDBC");
            } catch (ClassNotFoundException e) {
                throw new SQLException("SQLite JDBC driver not found on classpath", e);
            }
            try {
                Path dbFile = Paths.get(SQLITE_DB_PATH);
                if (dbFile.getParent() != null) {
                    Files.createDirectories(dbFile.getParent());
                }
                boolean fresh = !Files.exists(dbFile) || Files.size(dbFile) == 0 || !hasData();
                if (fresh) {
                    System.out.println("[DB] Initializing SQLite database at " + SQLITE_DB_PATH);
                }
                try (Connection cn = DriverManager.getConnection("jdbc:sqlite:" + SQLITE_DB_PATH)) {
                    try (Statement st = cn.createStatement()) {
                        st.execute("PRAGMA journal_mode=WAL");
                        st.execute("PRAGMA busy_timeout=5000");
                    }
                    if (fresh) {
                        runScript(cn, "/seed/schema.sql");
                        runScript(cn, "/seed/data.sql");
                        System.out.println("[DB] Schema + backup data loaded successfully.");
                    }
                }
                initialized = true;
            } catch (SQLException e) {
                throw e;
            } catch (Exception e) {
                throw new SQLException("Failed to initialise SQLite database", e);
            }
        }
    }

    /** True when none of the application tables exist yet. */
    private static boolean hasData() throws SQLException {
        try (Connection cn = DriverManager.getConnection("jdbc:sqlite:" + SQLITE_DB_PATH);
             Statement st = cn.createStatement();
             ResultSet rs = st.executeQuery(
                     "SELECT name FROM sqlite_master WHERE type='table' AND name IN ('e_signup','r_signup','r_add_job','add_catagory')")) {
            return rs.next();
        }
    }

    /** Executes a classpath SQL script (statements split safely on ';' outside quotes). */
    static void runScript(Connection cn, String resource) throws SQLException {
        String script = readResource(resource);
        if (script == null) {
            throw new SQLException("Classpath resource not found: " + resource);
        }
        for (String raw : splitStatements(script)) {
            String stmt = raw.trim();
            if (stmt.isEmpty()) {
                continue;
            }
            try (Statement st = cn.createStatement()) {
                st.execute(stmt);
            }
        }
    }

    static List<String> splitStatements(String script) {
        List<String> out = new ArrayList<String>();
        StringBuilder cur = new StringBuilder();
        boolean inQuote = false;
        for (int i = 0; i < script.length(); i++) {
            char c = script.charAt(i);
            if (c == '\'') {
                inQuote = !inQuote;
            }
            if (c == ';' && !inQuote) {
                out.add(cur.toString());
                cur.setLength(0);
            } else {
                cur.append(c);
            }
        }
        out.add(cur.toString());
        return out;
    }

    static String readResource(String resource) {
        try (InputStream in = DB.class.getResourceAsStream(resource)) {
            if (in == null) {
                return null;
            }
            StringBuilder sb = new StringBuilder();
            try (BufferedReader r = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))) {
                String line;
                while ((line = r.readLine()) != null) {
                    sb.append(line).append('\n');
                }
            }
            return sb.toString();
        } catch (Exception e) {
            return null;
        }
    }
}
