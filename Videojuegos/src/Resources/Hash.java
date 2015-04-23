/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Resources;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;


/**
 *
 * @author antoniogalvan
 */
public class Hash {
    
    private String code;
    
    public Hash (){
        this.code = null;
    }
    
    public Hash(String usr){
        
        this.code = mapping(usr);
    }
    
    /*
    *Metodo privado encargado de hacer el mapeo de la funcion
    *@param String user
    *@return String
    */
    
    private String mapping(String user){
        DateFormat dateForm =  new SimpleDateFormat("yyyyMMdd~HHmm");
        Date date = new Date();
                
        String dateS = dateForm.format(date);
        
        String jDay = dateS.substring(0,8);
        String hDay = dateS.substring(8);
        
        return jDay+user+hDay+".pdf";
    }
    
    /**
     * Metodo que regresa el usuario 
     * @return 
     */
    
    public String getUser(){
        
        return this.code.substring(8, code.indexOf("~"));
    }
        
    /**
     * Metodo que regresa el ultimo codigo hash generado para un usuario dado.
     * @return 
     */
    
    public String getCode(){
        return this.code;
    }
    
    /**
     * Dado un usuario, genera una nueva clave
     */
    
    public String generateCode(String usr){
        this.code = mapping(usr);
        return this.code;
    }
    
    public static String getUsrFrom(String codif){
        return codif.substring(8, codif.indexOf("~"));
    }
    

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Hash tmp = new Hash("Antonio");
        System.out.println(tmp.getCode());
        System.out.println(tmp.getUser());
        
        String codigo = tmp.getCode();
        System.out.println(getUsrFrom(codigo));
        
        // TODO code application logic here
    }
    
}
