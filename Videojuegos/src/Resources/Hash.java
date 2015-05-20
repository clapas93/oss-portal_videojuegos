/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Resources;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;


/**
 *This class will provide a Hash function to given a file name
 * concatenate the date and time to make an instance of a key 
 * to storage the file on the server.
 * @author antoniogalvan
 */
public class Hash {
    
    private String code;
    
    
    /**
     * Builder by omission of the class
     */
    public Hash (){
        this.code = null;
    }
    
    
    /**
     * Builder of the class.
     * Given an string applies an hash function to make "unique".
     * @param usr 
     */
    public Hash(String usr){
        this.code = mapping(usr);
    }
    
    /*
    *Private method to do the map of the function.
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
     * Method to do the inverse of the function.
     * @return String
     */
    
    public String getUser(){
        
        return this.code.substring(8, code.indexOf("~"));
    }
        
    /**
     * Method that return the last hash code generated by a given user
     * @return String
     */
    
    public String getCode(){
        return this.code;
    }
    
    /**
     * Given a new user, make a new code for this.
     * @param usr
     * @return String
     */
    
    public String generateCode(String usr){
        this.code = mapping(usr);
        return this.code;
    }
    
    /**
     * 
     * @param codif
     * @return 
     */
    
    public static String getUsrFrom(String codif){
        return codif.substring(8, codif.indexOf("~"));
    }
   
}
