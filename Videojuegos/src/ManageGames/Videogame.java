/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ManageGames;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import ConnectionDB.connectiondb;
import java.util.List;
import java.util.LinkedList;

/**
 *
 * @author claudia
 */
public class Videogame {
    private int id; 
    private String routeGame;
    private String front; 
    private int downloads; 
    private String classification;
    private float price;
    private String storageRoute;
    private String genre;
    private String title;
    private String description;
    private String state; //1 available , 0 deleted
    private String videoUrl;
    private String adminEmail;
    
    public Videogame(){
        this.id=0;
        this.routeGame="";
        this.front="";
        this.downloads=0;
        this.classification="";
        this.price=0;
        this.storageRoute="";
        this.genre="";
        this.title="";
        this.description="";
        this.state="";
        this.videoUrl="";
        this.adminEmail="admin@oss.com";
    }
    
    public Videogame(String front,String classification,float price,String storageRoute,String genre,String title,String description,String videoUrl,String adminemail){
        this.id=0;
        this.routeGame="http://pulsegames.com/videogames/"+id;
        this.front=front;
        this.downloads=0;
        this.classification=classification;
        this.price=price;
        this.storageRoute=storageRoute;
        this.genre=genre;
        this.title=title;
        this.description=description;
        this.state="1";
        this.videoUrl=videoUrl;
        this.adminEmail="admin@oss.com";
    }
    
    public int getId(){
        return id;
    }
    
    public void setId(int id){
        this.id=id;
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
    
    public String getClassification(){
        return classification;
    }
    
    public void setClassification(String classification){
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
    
    public String getState(){
        return state;
    }
    
    public void setState(String state){
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
            String sql = "INSERT INTO Videogame (routeGame,front,downloads,classification,price,"
                    + "storageRoute,genre,title,description,state,videoUrl,adminEmail) VALUES"
                    + "('" +  routeGame + "',"
                    + "'" + front + "'," + downloads + "," 
                    + "'" + classification + "'," + price + ","
                    + "'" + storageRoute +"',"
                    + "'" + genre + "',"
                    + "'" + title + "',"
                    + "'" + description + "',"
                    + "'" + state + "',"
                    + "'" + videoUrl + "',"
                    + "'" + adminEmail + "');";
            return initUpdateDB(sql);
        }catch(Exception e){
            System.out.println(e.toString());
            return false;
        }
    }
    
    public boolean updateDB(){
        try{
            String sql = "UPDATE Videogame SET "
                    + "routeGame='" +  routeGame + "',"
                    + "front='" + front + "',"
                    + "downloads=" + downloads + "," 
                    + "classification='" + classification + "',"
                    + "price=" + price + ","
                    + "storageRoute='" + storageRoute +"',"
                    + "genre='" + genre + "',"
                    + "title='" + title + "',"
                    + "description='" + description + "',"
                    + "state='" + state + "',"
                    + "videourl='" + videoUrl + "',"
                    + "adminemail='" + adminEmail + "'"
                    + " WHERE idGame='" + id + "';";
            return initUpdateDB(sql);
        }catch(Exception e){
            System.out.println(e.toString());
            return false;
        }
    }
    
    public Videogame getGameDB(String idGame){
        Videogame game= null;
        try{
            String sql = "SELECT * FROM Videogame WHERE idGame='"+idGame+"';";
            game = initQueryGameDB(sql);
            return game;
        }catch(Exception e){
            System.out.println(e.toString());
            return game;
        }
    }
    
    public List<Videogame> getDB(){
        List <Videogame> gameList = new LinkedList <Videogame>();
        try{
            //String sql = "SELECT idGame,routeGame,front,downloads,classification,price,storageRoute,"
            //        + "genre,title,description,state,videoUrl,adminEmail FROM Videogame WHERE state=" + 1;
            String sql = "SELECT * FROM Videogame WHERE state='1';";
            gameList = initQueryDB(sql);
            return gameList;
        }catch(Exception e){
            System.out.println(e.toString());
            return gameList;
        }
    }
    
    private boolean initUpdateDB(String script){
        connectiondb conection = new connectiondb();
        Connection cn;
        Statement st;
        try{
            cn = conection.connectionDB();
            st = cn.createStatement();
            st.executeUpdate(script);
            //st.executeQuery("SELECT * FROM Videogame");
            return true;
        }catch(SQLException e){
            System.out.println("SQL exception: " + e.getMessage());
            return false;
        }catch(Exception e){
            System.out.println("Execption: "+e.getMessage());
            return false;
        }
    }
    
    public List<Videogame> initQueryDB(String script){
        List<Videogame> list = new LinkedList<Videogame>();
        connectiondb conection = new connectiondb();
        Connection cn;
        Statement st = null;
        ResultSet result;
        try{
            cn = conection.connectionDB();
            st = cn.createStatement();
            result = st.executeQuery(script);
            while(result.next()){
                Videogame game = new Videogame();
                //game.setId(Integer.parseInt(result.getString("idGame")));
                game.setId(result.getInt("idGame"));
                game.setRouteGame(result.getString("routeGame"));
                game.setFront(result.getString("front"));
                //game.setDownloads(Integer.parseInt(result.getString("downloads")));
                game.setDownloads(result.getInt("downloads"));
                game.setClassification(result.getString("classification"));
                //game.setPrice(Float.parseFloat(result.getString("price")));
                game.setPrice(result.getFloat("price"));
                game.setStorageRoute(result.getString("storageRoute"));
                game.setGenre(result.getString("genre"));
                game.setTitle(result.getString("title"));
                game.setDescription(result.getString("description"));
                //game.setState(Integer.toString(result.getInt(result.getString("state"))));
                game.setVideoUrl(result.getString("videoUrl"));
                game.setAdminEmail(result.getString("adminEmail"));
                list.add(game);
            }
            return list;
        }catch(SQLException e){
            System.out.println("SQL exception: " + e.getMessage());
        }catch(Exception e){
            System.out.println("Execption: "+e.getMessage());
        }
        return null;
    }
    
    public Videogame initQueryGameDB(String script){
        Videogame game = new Videogame();
        connectiondb conection = new connectiondb();
        Connection cn;
        Statement st = null;
        ResultSet result;
        try{
            cn = conection.connectionDB();
            st = cn.createStatement();
            result = st.executeQuery(script);
            while(result.next()){
                //game.setId(Integer.parseInt(result.getString("idGame")));
                game.setId(result.getInt("idGame"));
                game.setRouteGame(result.getString("routeGame"));
                game.setFront(result.getString("front"));
                //game.setDownloads(Integer.parseInt(result.getString("downloads")));
                game.setDownloads(result.getInt("downloads"));
                game.setClassification(result.getString("classification"));
                //game.setPrice(Float.parseFloat(result.getString("price")));
                game.setPrice(result.getFloat("price"));
                game.setStorageRoute(result.getString("storageRoute"));
                game.setGenre(result.getString("genre"));
                game.setTitle(result.getString("title"));
                game.setDescription(result.getString("description"));
                //game.setState(Integer.toString(result.getInt(result.getString("state"))));
                game.setVideoUrl(result.getString("videoUrl"));
                game.setAdminEmail(result.getString("adminEmail"));
            }
            return game;
        }catch(SQLException e){
            System.out.println("SQL exception queryGame: " + e.getMessage());
        }catch(Exception e){
            System.out.println("Execption: "+e.getMessage());
        }
        return null;
    }
}
