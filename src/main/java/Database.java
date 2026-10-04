import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;

import util.DB;

/**
 * Database helper used by the servlets. All queries run on the SQLite
 * database (SQLITE_DB_PATH environment variable, auto-created with the
 * original backup data on first run). Method signatures are unchanged so
 * every servlet keeps working exactly as before.
 */
public class Database {
    Connection cn = null;
    Statement st = null;
    boolean connected = false;

    String Connectdb() {
        try {
            cn = DB.get();
            st = cn.createStatement();
            connected = true;
            return ("Database Connected");
        } catch (Exception ex) {
            return (ex.toString());
        }
    }

    String Insert(String sql) {
        try {
            if (!connected) Connectdb();
            st = cn.createStatement();
            st.executeUpdate(sql);
            return ("Records Inserted Successfully");
        } catch (Exception ex) {
            return (ex.toString());
        }
    }

    String update(String sql) {
        try {
            if (!connected) Connectdb();
            st = cn.createStatement();
            st.executeUpdate(sql);
            return ("Records updated Successfully");
        } catch (Exception e) {
            return (e.toString());
        }
    }

    String delete(String sql) {
        try {
            if (!connected) Connectdb();
            st = cn.createStatement();
            st.executeUpdate(sql);
            return ("Records deleted Successfully");
        } catch (Exception e) {
            return (e.toString());
        }
    }

    /**
     * Returns max(id)+1 for auto-increment style ids (kept for compatibility
     * with the original MySQL implementation).
     */
    String search(String sql, String column) {
        int id = 1;
        try {
            if (!connected) Connectdb();
            st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                try {
                    id = Integer.parseInt(rs.getString(column)) + 1;
                } catch (Exception ignore) {
                    // non-numeric value in the column - skip it
                }
            }
            return (String.valueOf(id));
        } catch (Exception e) {
            return (e.toString());
        }
    }

    /** Closes the underlying connection (call from servlet destroy / filters if needed). */
    void close() {
        try {
            if (st != null) st.close();
        } catch (Exception ignore) {
        }
        try {
            if (cn != null) cn.close();
        } catch (Exception ignore) {
        }
    }
}
