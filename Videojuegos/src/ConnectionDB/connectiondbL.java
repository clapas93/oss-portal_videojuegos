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

public class connectiondbL {
  
  private Connection connection = null;
  private ResultSet rs = null;
  private Statement stat = null;
  private String host;
  private String port;
  private String database;
  private String user;
  private String password;
  private String stringConection;
  
  public connectiondbL(){
    try {
      
      this.host = "localhost";
      this.port = "5433";
      this.database = "videoGames";
      this.user = "Optimal";
      this.password = "OptimalSOfSo!";
      this.stringConection = "jdbc:postgresql://" + host + ":" + port + "/" + database;
      Class.forName("org.postgresql.Driver");
      System.out.println("OK ... CONECTO CON DRIVER");
      
      this.connection = DriverManager.getConnection(stringConection, user, password);
      
      
    } catch (ClassNotFoundException | SQLException e) {
      System.out.println("Problemas de Conexión: " + e.toString());
    }
  }

}
