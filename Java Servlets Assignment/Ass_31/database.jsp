<%@page import="java.sql.*"%>
<%@page import="java.util.Properties"%>
<%! 
public static class Database{
    static String DB_CLASSNAME = "com.mysql.jdbc.Driver";
    static String CONNECTION = "jdbc:mysql://127.0.0.1/";

    static Connection getConnection(String dbName, Properties credentials) 
    throws ClassNotFoundException, SQLException{
        Class.forName(DB_CLASSNAME);
        Connection con = DriverManager.getConnection(CONNECTION+dbName, credentials);
        return con;
    }

    static ResultSet query(Connection con, String query) throws SQLException{
        Statement stmt = con.createStatement();
        return stmt.executeQuery(query);
    }

    static int insert(Connection con, String query) throws SQLException{
        Statement stmt = con.createStatement();
        return stmt.executeUpdate(query);
    }

    static ResultSet query(Connection con, String preparedQuery, String[] preparedValue)throws SQLException{
        PreparedStatement pStmt = con.prepareStatement(preparedQuery);
        for(int i=0;i<preparedValue.length;i++){
            pStmt.setString(i+1, preparedValue[i]);
        }
        return pStmt.executeQuery();
    }

    static void closeConnection(Connection con) throws SQLException{
        con.close();
    }
}
%>