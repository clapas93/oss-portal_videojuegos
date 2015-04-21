/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConnectionDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author magdiel
 */
public class connectiondb {
    
    private Connection connection = null;
    private ResultSet rs = null;
    private Statement s = null;
    
    public Connection connectionDB(){
        
        String host;
        String port;
        String database;
        String user;
        String password;
        String stringConection;
        
        try {
            
            host = "localhost";
            port = "5432";
            database = "videoGames";
            user = "Optimal";
            password = "OptimalSOfSo!";
            stringConection = "jdbc:postgresql://" + host + ":" + port + "/" + database;
            Class.forName("org.postgresql.Driver");
            System.out.println("OK ... CONECTO CON DRIVER");
            
            return DriverManager.getConnection(stringConection, user, password);
            
          
        } catch (Exception e) {
            System.out.println("Problemas de Conexión: " + e.toString());
            return null;
        }
    }
}
