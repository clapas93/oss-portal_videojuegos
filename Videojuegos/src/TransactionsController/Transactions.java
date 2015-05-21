/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TransactionsController;

import ConnectionDB.ConnectionDB;
import java.sql.ResultSet;
import java.sql.SQLException;
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
}
