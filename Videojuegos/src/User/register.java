/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import ConnectionDB.connectiondb;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author magdiel
 */
public class register {
    
    private boolean exe_sql(String SQL){
        
        connectiondb cn = new connectiondb();
        //PARA INSERTAR,MODIFICAR,ELIMINAR
        Connection connection;
        Statement stat;
        int result;
        boolean flag;
        try{
            connection = cn.connectionDB();
            System.out.println("OK ... bien1");
            stat = connection.createStatement();
            result = stat.executeUpdate(SQL);
            System.out.println(result);
            
            if(result != 0){
                System.out.println("OK ... bien1.1");
                flag = true;
            }else{
                System.out.println("NO EXISTE INFORMACION");
                flag = false;
            }      
            System.out.println("OK ... bien2");
                        
            return flag;
        }catch(Exception e){
            System.out.println("Error...."+ e.toString());
            return false;
        }
    }
        
    protected boolean registerStudent(userStudent userStudent){
    
        
        try{
            String sql="INSERT INTO student (studentemail, name, lastname1, lastname2, accountnumber,"
                    + "career, password, status, credits, history) VALUES "
                    + "('" + userStudent.getStudentemail() + "',"
                    + "'" + userStudent.getName() + "',"
                    + "'" + userStudent.getLastname1() + "',"
                    + "'" + userStudent.getLastname2() + "',"
                    + "'" + userStudent.getAccountnumber() + "',"
                    + "'" + userStudent.getCareer() + "',"
                    + "'" + userStudent.getPassword() + "',"
                    + "'" + 1 + "',"
                    + "'" + 0 + "',"
                    + "'" + userStudent.getHistory() + "');"; 
            
            if(exe_sql(sql)){
                System.out.println("Consulta correcta");
                return true;    
            }else{
                System.out.println("Error Consulta");
                return false;
            }
        }catch(Exception e){
            System.out.println(e.toString());
            return false;
        }
         
     
    }
    
}
