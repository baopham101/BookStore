/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * @author baoph
 */
public class DBUtils {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:65384;databaseName=BookSale";
        conn = DriverManager.getConnection(url, "baopham", "123");
        return conn;
    }

//    public static Connection getConnection() throws ClassNotFoundException, SQLException, NamingException {
//        InitialContext context = new InitialContext();
//        DataSource src = (DataSource) context.lookup("java:comp/env/jdbc/BookStore");
//        Connection conn = (Connection) src.getConnection();
//        return conn;
//    }
}
