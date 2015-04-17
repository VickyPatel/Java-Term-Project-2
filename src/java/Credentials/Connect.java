/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Credentials;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;

/**
 *
 * @author c0633648
 */
public class Connect {

    public static Connection getConnection() throws SQLException {
        Connection conn = null;
    
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String jdbc = "jdbc:mysql://localhost/java";
            String user = "root";
            String pass = "";
             conn = DriverManager.getConnection(jdbc, user, pass);
            
        }catch(ClassNotFoundException | SQLException ex){
            System.err.println(ex.getMessage());
        }
        
        return conn;
    }
}
