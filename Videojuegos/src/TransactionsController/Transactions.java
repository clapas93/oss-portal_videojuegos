/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TransactionsController;

import ConnectionDB.ConnectionDB;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *This class will provide at the transactions a 
 * controller in agreement with the model, view, controller 
 * @author antoniogalvan
 */
public class Transactions {
    
    /**
     * With this method we can update the number of downloads 
     * for a videogame. Return -1 if don't exist this videogame
     * @param videogame_id
     * @return int
     */
    
    
    public int numberOfDownloads(int videogame_id){
        ConnectionDB data = new ConnectionDB();
        String query = "SELECT COUNT(*) FROM download WHERE idgame ="+ String.valueOf(videogame_id)+";";
        ResultSet res = data.select(query);
        int resultado = -1;
        try {
            if(res.next()){
                resultado = Integer.parseInt(res.getObject(1).toString());
            }
        } catch (SQLException ex) {
            Logger.getLogger(Transactions.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }
    
    /**
     * This method will return a linkedlist of all the rows with
     * the information of a bill of a user. Tho get the information
     * of the row it's taken by module 5.
     * @param Id_Student
     * @return LinkedList
     */
    public LinkedList<String> getHistory(String Id_Student){
        LinkedList<String> hist = null;
        ConnectionDB data = new ConnectionDB();
        String query = "SELECT state, date, title, genre, storageroute "
	    + " FROM videogame AS V JOIN download AS D ON (V.idgame = D.idgame) "
	    + "WHERE D.studentemail='"+Id_Student+"' ORDER BY date;";
        ResultSet res = data.select(query);
        try {
            hist = new LinkedList<String>();
            while(res.next()){
                for(int i = 1; i < 6; i++){
		    hist.add(res.getObject(i).toString());
                }
            }
	    data.ConnectionClose();
        } catch (SQLException ex) {
            Logger.getLogger(Transactions.class.getName()).log(Level.SEVERE, null, ex);
        }        
        return hist;
    } 
    
    /**
     * Make the log of a transaction done by one user. Automatically this will
     * make the discount of the user wallet.
     * @param Id_Student
     * @param Id_Game
     * @return 
     */
    
    
    public boolean registerDownload(String Id_Student, String Id_Game){
        DateFormat dateForm =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String dateS = dateForm.format(date);

        ConnectionDB data = new ConnectionDB();
        String query = "SELECT title FROM videogame AS V JOIN download AS D ON"
	    + " (V.idgame = D.idgame) WHERE V.idgame="+String.valueOf(Id_Game)+
	    " AND D.studentemail='"+Id_Student+"';";
        ResultSet res = data.select(query);
        try {
            if(res.next()){
                //In this case, the user has paid this game
                query = "INSERT INTO download"
		    + " (idgame, studentemail, date) "
		    + "VALUES ("+String.valueOf(Id_Game)+",'"+Id_Student+"','"+dateS+"')";
                data.insert(query);
                
		query = "UPDATE videogame SET downloads = downloads + 1 "
		    + "WHERE idgame = "+String.valueOf(Id_Game)+";";
                data.update(query);
                data.ConnectionClose();
                return true;

            }else{
                //Make the download of this item for firts time
                query = "INSERT INTO download"
		    + " (idgame, studentemail, date) "
		    + "VALUES ("+String.valueOf(Id_Game)+",'"+Id_Student+"','"+dateS+"')";
                data.insert(query);
                
                String query_price = "SELECT price FROM videogame "
		    + "WHERE idgame ="+String.valueOf(Id_Game)+";";
                System.out.println(query_price);
                ConnectionDB data_p = new ConnectionDB();
                 
                System.out.println(Id_Game);
                ResultSet resp = data_p.select(query_price);
                boolean tmp = resp.next();

                if(tmp){
                    String price = resp.getObject(1).toString();
                    query = "UPDATE student SET credits = "
                        + "credits - "+price
                        +" WHERE studentemail = '"+Id_Student+"';";
                    data.update(query);
                    System.out.println(query);
                }
                
                query = "UPDATE videogame SET downloads = downloads + 1 "
		    + "WHERE idgame ="+String.valueOf(Id_Game)+";";
                data.update(query);
                data.ConnectionClose();
                data_p.ConnectionClose();
                return true;

            }
        } catch (SQLException ex) {
            Logger.getLogger(Transactions.class.getName()).log(Level.SEVERE, null, ex);
        }
 
        return false;
    }
    
    public String getGameName(String Id_Game){
        ConnectionDB data = new ConnectionDB();
        String query = "SELECT storageroute FROM videogame  WHERE idgame="+String.valueOf(Id_Game)+";";
        ResultSet res = data.select(query);
        String name ="";
        try {
            if(res.next()){
                name = res.getString("storageroute");
                data.ConnectionClose();
                return name;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Transactions.class.getName()).log(Level.SEVERE, null, ex);
        }
 
        return name;
    }
    
    public double getCredits(String id_student){
        ConnectionDB data = new ConnectionDB();
        String query = "SELECT credits FROM student  WHERE studentemail='"+String.valueOf(id_student)+"';";
        System.out.println(query);
        ResultSet res = data.select(query);
        double credits = 0;
        try {
            if(res.next()){
                credits = Double.parseDouble(res.getString("credits"));
                data.ConnectionClose();
                return credits;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Transactions.class.getName()).log(Level.SEVERE, null, ex);
        }
 
        return credits;
    }
}
