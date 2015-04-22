/**
* Optimal Software Solutions
* Project : Pulse Games
* This class create a Videogame object and make querys to DB
* @author Claudia Paola Medina Santamaria 
* @version 1.0
* @since 18/04/2015
*/
package ManageGames;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import ConnectionDB.connectiondb;
import java.util.List;
import java.util.LinkedList;

public class Videogame {
    private int id; //Videogame id
    private String routeGame; //Videogame url site
    private String front; //Videogame Front
    private int downloads; //Number of downloads 
    private String classification; //Videogame ESRB classification 
    private float price; //Number of credits required to download
    private String storageRoute; //Videogame storage route on the system
    private String genre; //Videogame genre
    private String title; //Videogame title
    private String description; //Videogame description
    private String state; //1 available , 0 deleted
    private String videoUrl; //Videogame trailer
    private String adminEmail; //admin's email who uploaded the videogame
    
    /**
    * Initializes a newly created Videogame object with all its attributes with default values.
    */
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
    

    /**
    * Constructs a new Videogame with attributes that the system doesn't generate.
    * @param front          Videogame front.
    * @param classification ESRB classification.
    * @param price          Number of credits required to download.
    * @param storageRoute   Videogame storage route on the system.
    * @param genre          Videogame genre.
    * @param title          Videogame title.
    * @param description    Videogame description.
    * @param videoUrl       video trailer.
    * @param adminemail     Admin's email who uploaded the videogame
    */
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
    
    /**
    * Returns videogame id on the system.
    * @return int   id associated with this videogame.
    */
    public int getId(){
        return id;
    }
    
    /**
    * Set the id on the system of this videogame.
    * @param id     the new videogame id.
    */
    public void setId(int id){
        this.id=id;
    }
    
    /**
    * Returns videogame url site on the system.
    * @return String    url site associated with this videogame.
    */
    public String getRouteGame(){
        return routeGame;
    }
    
    /**
    * Set the url site on the system of this videogame.
    * @param routeGame  the new videogame routeGame.
    */
    public void setRouteGame(String routeGame){
        this.routeGame=routeGame;
    }
    
    /**
    * Returns videogame front.
    * @return String   front associated with this videogame.
    */
    public String getFront(){
        return front;
    }
    
    /**
    * Set the front of this videogame.
    * @param front  the new videogame front.
    */
    public void setFront(String front){
        this.front=front;
    }
    
    /**
    * Returns the number of downloads of the videogame.
    * @return int   number of downloads.
    */
    public int getDownloads(){
        return downloads;
    }
    
    /**
    * Set the number of downoloads of this videogame.
    * @param downloads  the new number of downloads.
    */
    public void setDownloads(int downloads){
        this.downloads=downloads;
    }
    
    /**
    * Returns the ESRB classification of the videogame.
    * @return String    ESRB classification associated with this videogame.
    */
    public String getClassification(){
        return classification;
    }
    
    /**
    * Set the videogame ESRB classification to this videogame.
    * @param classification     the new ESRB classification.
    */
    public void setClassification(String classification){
        this.classification=classification;
    }
    
    /**
    * Returns the number of credits required to download the videogame.
    * @return float   number of credits associated with this videogame.
    */
    public float getPrice(){
        return price;
    }
    
    /**
    * Set the number of credits required to download this videogame.
    * @param price  the new number of credits.
    */
    public void setPrice(float price){
        this.price=price;
    }
    
    /**
    * Returns the Videogame storage route on the system.
    * @return String   storage route associated with this videogame.
    */
    public String getStorageRoute(){
        return storageRoute;
    }

    /**
    * Set the storage route on  the system of this videogame.
    * @param storageRoute   the new storage route.
    */
    public void setStorageRoute(String storageRoute){
        this.storageRoute=storageRoute;
    }
    
    /**
    * Returns the videogame genre.
    * @return String   genre associated with this videogame.
    */
    public String getGenre(){
        return genre;
    }
    
    /**
    * Set the genre of this videogame.
    * @param genre  the new genre.
    */
    public void setGenre(String genre){
        this.genre=genre;
    }
    
    /**
    * Returns the videogame title.
    * @return String   title associated with this videogame.
    */
    public String getTitle(){
        return title;
    }
    
    /**
    * Set the title of this videogame.
    * @param title  the new title.
    */
    public void setTitle(String title){
        this.title=title;
    }
    
    /**
    * Returns the videogame description.
    * @return String   description associated with this videogame.
    */
    public String getDescription(){
        return description;
    }
    
    /**
    * Set the description of this videogame.
    * @param description    the new description.
    */
    public void setDescription(String description){
        this.description=description;
    }
    
    /**
    * Returns the videogame state on the system.
    * @return String   state on the system, 1 if the game is available and 0 if it doesn't.
    */
    public String getState(){
        return state;
    }
    
    /**
    * Set the state of this videogame on the system.
    * @param id     videogame id.
    */
    public void setState(String state){
        this.state=state;
    }
    
    /**
    * Returns the url of the trailer video.
    * @return String   url of the trailer video associated with this videogame.
    */
    public String getVideoUrl(){
        return videoUrl;
    }
    
    /**
    * Set the url of the trailer video of this videogame.
    * @param videoUrl   the new url of the trailer video.
    */
    public void setVideoUrl(String videoUrl){
        this.videoUrl=videoUrl;
    }
    
    /**
    * Returns the admin's email who uploaded the videogame 
    * @return String   admin's email who uploaded this videogame
    */
    public String getAdminEmail(){
        return adminEmail;
    }
    
    /**
    * Set the admin's email who uploaded this videogame.
    * @param adminEmail     the new admin's email.
    */
    public void setAdminEmail(String adminEmail){
        this.adminEmail=adminEmail;
    }
    
    /**
    * Save this videogame on the database.
    * @return boolean   true if the videogame insert was succesful, false in other case.
    */
    public boolean saveDB(){
        try{
            String sql = "INSERT INTO videogame (routeGame,front,downloads,classification,price,"
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
    
    /**
    * Save the modifications to this videogame on the database.
    * @return boolean   true if the videogame update was succesful, false in other case.
    */
    public boolean updateDB(){
        try{
            String sql = "UPDATE videogame SET "
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
    
    /**
    * Returns the record in the database of the videogame with an specific id as a videogame object.
    * @param  idGame        the id of the game that return. 
    * @return Videogame     this videogame object.
    */
    public Videogame getGameDB(String idGame){
        Videogame game= null;
        try{
            String sql = "SELECT * FROM videogame WHERE idGame='"+idGame+"';";
            game = initQueryGameDB(sql);
            return game;
        }catch(Exception e){
            System.out.println(e.toString());
            return game;
        }
    }
    
    /**
    * Returns all the videogames availables on the system.
    * @return List<Videogame>   List of all the videogames avilables.
    */
    public List<Videogame> getDB(){
        List <Videogame> gameList = new LinkedList <Videogame>();
        try{
            String sql = "SELECT * FROM videogame WHERE state='1';";
            gameList = initQueryDB(sql);
            return gameList;
        }catch(Exception e){
            System.out.println(e.toString());
            return gameList;
        }
    }
    
    /**
    * Initializes and prepares the database to insert, update o delete a videogame specified in the script.
    * @param  script    the sql script to execute.
    * @return boolean   true if the conecction was established, false in other case.
    */
    private boolean initUpdateDB(String script){
        connectiondb conection = new connectiondb();
        Connection cn;
        Statement st;
        try{
            cn = conection.connectionDB();
            st = cn.createStatement();
            st.executeUpdate(script);
            return true;
        }catch(SQLException e){
            System.out.println("SQL exception: " + e.getMessage());
            return false;
        }catch(Exception e){
            System.out.println("Execption: "+e.getMessage());
            return false;
        }
    }
    
    /**
    * Initializes and prepares the database to generate a list of all the videogames obteined by the script.
    * @param  script            the sql script to execute.
    * @return List<Videogame>   the list of all the videogames obteined. 
    */
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
                game.setId(result.getInt("idGame"));
                game.setRouteGame(result.getString("routeGame"));
                game.setFront(result.getString("front"));
                game.setDownloads(result.getInt("downloads"));
                game.setClassification(result.getString("classification"));
                game.setPrice(result.getFloat("price"));
                game.setStorageRoute(result.getString("storageRoute"));
                game.setGenre(result.getString("genre"));
                game.setTitle(result.getString("title"));
                game.setDescription(result.getString("description"));
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
    
    /**
    * Initializes and prepares the database to generate a videogame object obteined by the script.
    * @param  script        the sql script to execute.
    * @return Videogame     the videogame obteined. 
    */
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
                game.setId(result.getInt("idGame"));
                game.setRouteGame(result.getString("routeGame"));
                game.setFront(result.getString("front"));
                game.setDownloads(result.getInt("downloads"));
                game.setClassification(result.getString("classification"));
                game.setPrice(result.getFloat("price"));
                game.setStorageRoute(result.getString("storageRoute"));
                game.setGenre(result.getString("genre"));
                game.setTitle(result.getString("title"));
                game.setDescription(result.getString("description"));
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
