package ConnectionDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionDB {
  
  private Connection connection = null;
  private ResultSet rs= null;
  private Statement stat = null;
  private String host;
  private String port;
  private String database;
  private String user;
  private String password;
  private String stringConection;
  
  public ConnectionDB(){
    try {
      this.host = "localhost";
      //this.port = "5433";
      this.port = "5432";
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

  /**
   * This method makes a select query to the database
   * @param select
   * @return ResultSet result of the query
   */
  public ResultSet select(String select){    
    try{
      this.stat = this.connection.createStatement();
      ResultSet resultset = this.stat.executeQuery(select);
      System.out.println(select);
      if(resultset != null){
        System.out.println("OK ... bien1.1");
      }else{
        System.out.println("NO EXISTE INFORMACION");
      }
      return resultset;
    }catch(Exception e){
      System.out.println("Error...."+ e.toString());
      return null;
    }
  } 


  /**
  * Check the connection with db and make an insert consult
  * @param SQL
  * @return Boolean returns true if the query was succesfull
  */
  public boolean insert(String SQL){    
    try{
      stat = this.connection.createStatement();
      stat.executeUpdate(SQL);
      System.out.println(SQL);
      return  true;
    }catch(Exception e){
        System.out.println(SQL);
      System.out.println("Error...."+ e.toString());
      return false;
    }
  } 

  /**
  * Check the connection with db and make an update action
  * @param SQL
  * @return Boolean returns true if the query was succesfull
  */
  public boolean update(String SQL){    
    try{
      this.stat = this.connection.createStatement();
      stat.executeUpdate(SQL);
      System.out.println(SQL);
      return true;
    }catch(Exception e){
      System.out.println("Error...."+ e.toString());
      return false;
    }
  } 


  /**
  * Check the connection with db and make an delete action
  * @param SQL
  * @return Boolean returns true if the query was succesfull
  */
  public boolean delete(String SQL){    
    try{
      this.stat = this.connection.createStatement();
      stat.executeUpdate(SQL);
      System.out.println(SQL);
      return true;
    }catch(Exception e){
      System.out.println("Error...."+ e.toString());
      return false;
    }
  } 
  
  public void ConnectionClose(){
    try{
      this.connection.close();
    }catch(Exception e){
      System.out.println("Error...."+ e.toString());
    }
  }


}
