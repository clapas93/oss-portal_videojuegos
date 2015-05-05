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

/**
 *
 * @author magdiel
 */
public class connectiondb {
    
  public Connection connectionDB(){

        /**
         * host: servidor en el cuaĺ está montado PostgreSQL
         * port: puerto de escucha de PostgreSQL
         * database: nombre de la base de datos a la cuál realizaremos conexión
         * user: Usuario con el cuál podemos acceder a la base de datos
         * password: Contraseñá del user para acceder a la base de datos.
         * stringConection: Cadena en la que se concatenan todos los parámetros para una correcta conexión
         * a la base de datos.
         */
      
        String host;
        String port;
        String database;
        String user;
        String password;
        String stringConection;
        
        /**
         * Se intenta hacer una conexión a la base de datos y se cacha cualquier tipo de error
         */
        
        try {
            
            host = "localhost";

            //port = "5433";
            port = "5432";
            database = "videoGames";
            user = "Optimal";
            password = "OptimalSOfSo!";
            stringConection = "jdbc:postgresql://" + host + ":" + port + "/" + database;
            Class.forName("org.postgresql.Driver");
            System.out.println("OK ... CONECTO CON DRIVER");
            
            return DriverManager.getConnection(stringConection, user, password);
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Problemas de Conexión: " + e.toString());
            return null;
        }
    }
  }

