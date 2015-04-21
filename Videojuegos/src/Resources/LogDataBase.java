
package Resources;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *The porpuse of this class it's the next. Given a query in the
 * controller of the database, we expect that one change make it 
 * by one member of the proyect was the same in all the databases
 * of the members of the team. For this, this class will make a log
 * of that patches and make the .sql to run in uor database.
 * @author Antonio Galvan
 * @since April 15 2015.
 */
public class LogDataBase {
    
    private String query;
    private String path;
    
    public LogDataBase(String path, String query) throws IOException{
        //Prepare the environment to create the .sql file, thus I got
        //to call File, BufferedWrite, This constructor throws an 
        //IOException
        File sqlScript = new File(path);
        
        if(sqlScript.exists()){
            try ( //If the file exist, then, I only put the query into the file.
                    BufferedWriter buffer = new BufferedWriter(new FileWriter(sqlScript, true))) {
                buffer.write("\n" + query + "\n");
            }
        }else{
            try ( //The, if don't exist I create this one and add the header of the
            //file.
                    BufferedWriter buffer = new BufferedWriter(new FileWriter(sqlScript))) {
                buffer.write("--This file contains the updates from the \n");
                Date date = new Date();
                buffer.write("--date "+ date.toString()+"\n");
                buffer.write("\n" + query + '\n');
            }
            
        }
        this.path=path;
        this.query=query;
    }
    
    /**
     * This method update the file with the last query make it in the
     * database.
     * @param query
     * @return boolean
     */
    
    public boolean setQuery(String query){
        try{
            File sqlScript = new File(path);
            BufferedWriter buffer = new BufferedWriter(new FileWriter(sqlScript, true));
            buffer.write("\n" + query + "\n");
        }catch (IOException exp){
            exp.getMessage();
            return false;
        }
        this.query = query;
        return true;
    }
    
    /**
     * If the file (In his absolute path) is equals at the path of the actual
     * file then, return the last query, in other case, we don't put any
     * request in this session of this file, then, the null string is the
     * last query.
     * @param file
     * @return String
     */
    
    public String lastQuery(String file){
        if(file.equals(path)){
            return this.query;
        }
        return "";
    }
    
    /**
     * Change the path of the file.
     * @param path 
     */
    
    public void setNewPath(String path){
        this.path = path;
    }
    
    
    /**
     * Return the actual path of the file.
     * @return String
     */
    
    public String getPath(){
        return path;
    }

}
