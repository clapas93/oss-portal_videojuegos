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
    
    private boolean exeRegister(String SQL){
        
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
    private boolean exeSelect(String SQL){
        
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
        
    protected int registerStudent(userStudent userStudent){
    
        try{
            if(verifyEmail(userStudent)){
                if(verifyAccountnumber(userStudent)){
                    
                    /* Registramos al nuevo estudiante */
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
                    
                    if(exeRegister(sql)){
                        System.out.println("Consulta correcta, se agregó estudiante");
                        return 2;    
                    }else{
                        System.out.println("Error Consulta registro");
                        return 3;
                    }
                    
                    
                }else{
                    /* Ya existe el número de cuenta*/
                    return 1;
                }
                
                
                
            }else{
                /* Ya existe el email*/
                return 0;
            }
            
            
            
        }catch(Exception e){
            System.out.println(e.toString());
            return 4;
        }
         
    }
    
    /**
     * Método para verificar si existe o no el usuario en la base de datos.
     * @param userStudent
     * @return true si no existe el correo en la base de datos
     */
    protected boolean verifyEmail(userStudent userStudent){
        
        
        try{
            String sql=
            "SELECT * FROM student WHERE studentemail = '"+
                    userStudent.getStudentemail()+"';";
            /**
             * Realizamos una coonsulta para verificar que no existe en la base de datos.
             */
            if(!exeSelect(sql)){
                System.out.println("No existe este correo en la base de datos");
                return true;                
            }else{
                System.out.println("Ya existe este correo ");
                return false; 
            }
            
        }catch(Exception e){
            System.out.println(e.toString());
            return false;
        }
        
        
    }
    
    protected boolean verifyAccountnumber(userStudent userStudent){
        
        try{
            String sql=
            "SELECT * FROM student WHERE accountnumber = '"+
                    userStudent.getAccountnumber() + "';";
            /**
             * Realizamos una consulta para verificar que no existe en la base de datos el número de cuenta.
             */
            if(!exeSelect(sql)){
                System.out.println("No existe esta cuenta en la base de datos");
                return true;                
            }else{
                System.out.println("Ya existe esta cuenta ");
                return false; 
            }
            
        }catch(Exception e){
            System.out.println(e.toString());
            return false;
        }
        
        
    }
    
}
