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
/**
 *
 * @author magdiel
 */
public class login {
    
    private boolean exe_sql(String SQL){
        
        connectiondb cn = new connectiondb();
        //PARA INSERTAR,MODIFICAR,ELIMINAR
        Connection connection;
        Statement stat;
        ResultSet result = null;
        boolean flag;
        try{
            connection = cn.connectionDB();
            System.out.println("OK ... bien1");
            stat = connection.createStatement();
            result = stat.executeQuery(SQL);
            
            if(result.next()){
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
    
    /*Se intenta realizar la verificación de los datos introducidos en el formulario*/
    protected boolean loginAdmin(UserAdmin user){
        
        try{
            String sql=
            "SELECT * FROM admin WHERE adminemail = '"+
                    user.getAdminemail()+
                    "' AND password = '"+user.getPassword()+"';";
            System.out.println(user.getAdminemail() + " && " + user.getPassword());
            System.out.println("SELECT * FROM admin WHERE adminemail = '"+
                    user.getAdminemail()+
                    "' AND password = '"+user.getPassword()+"';");
            
            if(exe_sql(sql)){
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
    
    protected boolean loginStudent(){
        return true;
    }
}
