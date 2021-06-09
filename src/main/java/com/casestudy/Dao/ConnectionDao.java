package com.casestudy.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/manager_coffee";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    public Connection getConnect(){
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
