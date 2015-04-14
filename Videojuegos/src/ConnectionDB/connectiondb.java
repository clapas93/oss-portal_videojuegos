/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConnectionDB;

import User.user;
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
    
    protected Connection connectionDB(){
        
        String host;
        String port;
        String database;
        String user;
        String password;
        String stringConection;
        
        try {
            
            host = "localhost";
            port = "5432";
            database = "videogamespl";
            user = "postgres";
            password = "root";
            stringConection = "jdbc:postgresql://" + host + ":" + port + "/" + database;
            Class.forName("org.postgresql.Driver");
            System.out.println("OK ... CONECTO CON DRIVER");
            
            return DriverManager.getConnection(stringConection,user,password);
            
          
        } catch (Exception e) {
            System.out.println("Problemas de Conexión: " + e.toString());
            return null;
        }
        
    }
    
    
    protected boolean ejecuta_sql(String COMANDO_SQL){
        //PARA INSERTAR,MODIFICAR,ELIMINAR
        Connection connection;
        Statement stat;
        ResultSet result = null;
        boolean bandera;
        try{
            connection = connectionDB();
            System.out.println("OK ... bien1");
            stat = connection.createStatement();
            result = stat.executeQuery(COMANDO_SQL);
            
            if(result.next()){
                System.out.println("OK ... bien1.1");
                bandera = true;
            }else{
                System.out.println("OK ... error1.1");
                bandera = false;
            }      
            System.out.println("OK ... bien2");
                        
            return bandera;
        }catch(Exception e){
            System.out.println("Error...."+ e.toString());
            return false;
        }
    }
    
    /*Se intenta realizar la verificación de los datos introducidos en el formulario*/
    public boolean login(user user){
        
        
        try{
            String sql=
            "SELECT * FROM admin WHERE adminemail = '"+
                    user.getAdminemail()+
                    "' AND password = '"+user.getPassword()+"';";
            System.out.println(user.getAdminemail() + " && " + user.getPassword());
            System.out.println("SELECT * FROM admin WHERE adminemail = '"+
                    user.getAdminemail()+
                    "' AND password = '"+user.getPassword()+"';");
            
            if(ejecuta_sql(sql)){
                System.out.println();
                System.out.println("OK ... bien3");
                return true;
            }else{
                System.out.println("OK ... error3");
                return false;
            }
                
        }catch(Exception e){
            System.out.println("Error:"+ e);
            return false;
        }
        
    
    }
    
}
