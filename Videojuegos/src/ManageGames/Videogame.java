/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ManageGames;

import java.sql.Connection;
//import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import ConnectionDB.connectiondb;

/**
 *
 * @author claudia
 */
public class Videogame {
    int id;
    String routeGame;
    String front; 
    int downloads; 
    Character classification;
    float price;
    String storageRoute;
    String genre;
    String title;
    String description;
    Character state;
    String videoUrl;
    String adminEmail;
    
    public Videogame(String routeGame,String front,int downloads, Character classification,float price,String storageRoute,String genre,String title,String description,Character state,String videoUrl,String adminEmail){
        //this.id=id;
        this.routeGame=routeGame;
        this.front=front;
        this.downloads=downloads;
        this.classification=classification;
        this.price=price;
        this.storageRoute=storageRoute;
        this.genre=genre;
        this.title=title;
        this.description=description;
        this.state=state;
        this.videoUrl=videoUrl;
        this.adminEmail=adminEmail;
    }
    
    public int getId(){
        return id;
    }
    
    public String getRouteGame(){
        return routeGame;
    }
    
    public void setRouteGame(String routeGame){
        this.routeGame=routeGame;
    }
    
    public String getFront(){
        return front;
    }
    
    public void setFront(String front){
        this.front=front;
    }
    
    public int getDownloads(){
        return downloads;
    }
    
    public void setDownloads(int downloads){
        this.downloads=downloads;
    }
    
    public Character getClassification(){
        return classification;
    }
    
    public void setClassification(Character classification){
        this.classification=classification;
    }
    
    public float getPrice(){
        return price;
    }
    
    public void setPrice(float price){
        this.price=price;
    }
    
    public String getStorageRoute(){
        return storageRoute;
    }
    
    public void setStorageRoute(String storageRoute){
        this.storageRoute=storageRoute;
    }
    
    public String getGenre(){
        return genre;
    }
    
    public void setGenre(String genre){
        this.genre=genre;
    }
    
    public String getTitle(){
        return title;
    }
    
    public void setTitle(String title){
        this.title=title;
    }
    
    public String getDescription(){
        return description;
    }
    
    public void setDescription(String description){
        this.description=description;
    }
    
    public Character getState(){
        return state;
    }
    
    public void setState(Character state){
        this.state=state;
    }
    
    public String getVideoUrl(){
        return videoUrl;
    }
    
    public void setVideoUrl(String videoUrl){
        this.videoUrl=videoUrl;
    }
    
    public String getAdminEmail(){
        return adminEmail;
    }
    
    public void setAdminEmail(String adminEmail){
        this.adminEmail=adminEmail;
    }
    
    public boolean saveDB(){
        try{
            String sql = "INSERT INTO Videogame (idGame,routeGame,front,downloads,classification,price,"
                    + "storageRoute,genre,title,description,state,videoUrl,adminEmail) VALUES"
                    + "(" + id + ","
                    + "'" + routeGame + "',"
                    + "'" + front + "'," + downloads + "," 
                    + "'" + classification + "'," + price + ","
                    + "'" + storageRoute +"',"
                    + "'" + genre + "',"
                    + "'" + title + "',"
                    + "'" + description + "',"
                    + "'" + state + "',"
                    + "'" + videoUrl + "',"
                    + "'" + adminEmail + "');";
            if(initDB(sql)){
                return true; //success
            }else{
                return false; //error
            }
        }catch(Exception e){
            System.out.println(e.toString());
            return false;
        }
    }
    
    private boolean initDB(String script){
        connectiondb conexion = new connectiondb();
        Connection cn;
        Statement st;
        try{
            cn = conexion.connectionDB();
            st = cn.createStatement();
            st.executeUpdate(script);
            return true;
        }catch(SQLException e){
            System.out.println("Error al insertar videojuego");
            e.getMessage();
            return false;
        }catch(Exception e){
            System.out.println("sql "+e.getMessage());
            return false;
        }
    }
}
