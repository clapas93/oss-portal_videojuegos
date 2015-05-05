/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import ConnectionDB.connectiondb;
import java.sql.SQLException;
/**
 *
 * @author magdiel
 */
public class login {
    
    /**
     * Crea un objeto en el que mediante una conexión a la base de datos podemos realizar consultas.
     * @param SQL cadena de sql para hacer consultas en la base de datos.
     * @return true si pudo realizar la consulta.
     * @return false si no hay infirmación en la base de datos. 
     */
    private boolean exe_sql(String SQL){
        
        connectiondb cn = new connectiondb();
        /* PARA INSERTAR,MODIFICAR,ELIMINAR */
        Connection connection;
        Statement stat;
        ResultSet result = null;
        boolean flag;
        try{
            connection = cn.connectionDB();
            stat = connection.createStatement();
            result = stat.executeQuery(SQL);
            
            if(result.next()){
                flag = true;
            }else{
                System.out.println("NO EXISTE INFORMACION");
                flag = false;
            }      
                        
            return flag;
        }catch(Exception e){
            System.out.println("Error...."+ e.toString());
            return false;
        }
    }
    
    /**
     * Modelo para solicitar una consulta a la base de datos.
     * Método para iniciar sesión como admin.
     * @param user es el objeto del que podemos obtener el correo y el password
     * @return     0 si inicia sesión como estudiante
     * else return 1 si inicia sesión como admin.
     * else return 2 si no puede iniciar sesión ni como estudiante ni como admin.
     */
    protected int loginAdmin(UserAdmin user){
        
        /**
         * Tratamos de realizar una consulta a la tabla "admin" mediante una conexión a la BD y cachamos 
         * cualquier tipo de excepción.
         */
        try{
            String sql=
            "SELECT * FROM admin WHERE adminemail = '"+
                    user.getAdminemail()+
                    "' AND password = '"+user.getPassword()+"';";            
            if(exe_sql(sql)){
                System.out.println();
                System.out.println("OK ... bien3");
                return 1;
            }else{
                if(loginStudent(user.getAdminemail(), user.getPassword()))
                    return 0;
                else
                    return 2;
                
            }
        }catch(Exception e){
            System.out.println("Error:"+ e);
            return 2;
        }
        
    }
    
    /**
     * Método llamado desde loginAdmin, que se ejecuta si no pudo realizarse una consulta en la tabla "admin
     * de la BD"
     * @param user es el parámetro del correo electrónico con el que inicia sesión.
     * @param psw es el parámetro de la contraseña con la que inicia sesión.
     * @return true si pudo realizar la consulta en la tabla "student"
     *    else false si la consulta es vacía.
     */
    protected boolean loginStudent(String user, String psw){
        /**
         * Tratammos de realizar una consulta a la tabla "student" mediante una conexión a la BD y cachamos 
         * cualquier tipo de excepción.
         */
        try{
            String sql=
            "SELECT * FROM student WHERE studentemail = '"+
                    user +
                    "' AND password = '"+ psw +"';";
            System.out.println(user + " && " + psw);
            
            if(exe_sql(sql)){
                System.out.println();
                System.out.println("OK ... bien3");
                return true;
            }else{
                return false;
            }
                
        }catch(Exception e){
            System.out.println("Error:"+ e);
            return false;
        }
    }
}
