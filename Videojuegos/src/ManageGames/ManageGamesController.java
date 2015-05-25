/**
 * Optimal Software Solutions
 * Project : Pulse Games
 * This class is the controller of the manage game use case
 * @author Claudia Paola Medina Santamaria 
 * @version 1.0
 * @since 18/04/2015
 */
package ManageGames;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

@MultipartConfig
public class ManageGamesController extends HttpServlet {
    
    private Videogame game;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        String path = request.getRequestURI().substring(request.getContextPath().length());
        String view ="";
        game=null;
        List videogameList = null;
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("userAdmin");
        System.out.println("user   "+user);

        if(user==null){
	    response.sendRedirect(response.encodeRedirectURL("videogames"));
	    return;
        }
        switch(path){
	case "/managegames":
	    view = "ManageGamesHI.jsp";
	    request.setAttribute("view", view); 
	    request.setAttribute("title", "Manage Games");
	    game = new Videogame();
	    videogameList = game.getListDB();
	    request.setAttribute("videogameList", videogameList);
	    request.getRequestDispatcher("backend_layout.jsp").forward(request, response);
            break;
	case "/uploadgame":
	    view = "UploadGameHI.jsp";
	    request.setAttribute("view", view); 
	    request.setAttribute("title", "Manage Games");
	    request.getRequestDispatcher("backend_layout.jsp").forward(request, response);
            break;
	case "/updategame":
	    String id=request.getParameter("ID");
	    System.out.println(id);
	    view = "UpdateGameHI.jsp";
	    request.setAttribute("view", view); 
	    request.setAttribute("title", "Manage Games");
	    game = new Videogame();
	    Videogame videogameId = game.getDB(id);
	    //System.out.println(videogameId.toString());
	    System.out.println(videogameId.getTitle());
	    request.setAttribute("videogameId", videogameId);
	    request.getRequestDispatcher("backend_layout.jsp").forward(request, response);
            break;
        }
    }
    
    /**
     * Upload the videogame on the system.
     * @param request   servlet request.
     * @param response  servlet response.
     * @return boolean  true if the videogame was uploaded, false in other case.
     * @throws ServletException if a servlet-specific error occurs.
     * @throws IOException  if an I/O error occurs.
     */
    protected boolean uploadGame(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        Videogame max= new Videogame();
        int maxId = max.maxId() + 1;
        
        String title=request.getParameter("TITLE");
        System.out.println(title);
        String classification = (request.getParameter("CLASS")).substring(0,1);
        String option = request.getParameter("creditOptions");
        float price=0;
        if ("FREE".equals(option)){
            price = 0;
        }else {
            if ("CREDIT".equals(option)){
                price = Float.parseFloat(request.getParameter("PRICE"));
            }
        }
        String genre=request.getParameter("GENRE");
        String description=request.getParameter("DESCRIPTION");
        String videoUrl=request.getParameter("VIDEO");
        HttpSession session = request.getSession(true);
        String username = (String)session.getAttribute("nomUsuario");
        System.out.println(username);
        String adminemail = "admin@oss.com";

        //set videogame filename
        String storageRoute = "";
        Part gamePart = request.getPart("GAME");
        String gameName = getFileName(gamePart);
        System.out.println("game:" + gameName);
        String gameExt = gameName.substring(gameName.length()-3,gameName.length());
        storageRoute = "game_" + maxId + "." + gameExt;
        
        //set videogame filename
        String front = "";
        Part frontPart = request.getPart("FRONT");
        String frontName = getFileName(frontPart);
        String frontExt = frontName.substring(frontName.length()-3,frontName.length());
        front = "front_" + maxId + "." + frontExt;
        
        game = new Videogame(maxId,front,classification,price,storageRoute,genre,title,description,videoUrl,adminemail);
        System.out.println("uploadGame");
        
        if(game.updloadDB()){
            String game_path = getPath()+"/web/public/videogames/games";
            File gameFolder = new File(game_path);
            File gameFiles = new File(gameFolder,storageRoute); 
            try (InputStream input = gamePart.getInputStream()) {
                Files.copy(input, gameFiles.toPath()); 
            }catch(Exception e){
                game.deleteDB();
                System.out.println("No se pudo subir el juego. " + e.getMessage());
                return false;
            }
            
            String front_path = getPath()+"/web/public/videogames/fronts";
            File frontFolder = new File(front_path);
            File frontFiles = new File(frontFolder,front); 
            try (InputStream input = frontPart.getInputStream()) {
                Files.copy(input, frontFiles.toPath()); 
            }catch(Exception e){
                game.deleteDB();
                System.out.println("No se pudo subir la portada. " + e.getMessage());
                return false;
            }
            
            return true;
        }
        
        return false;
    }
    
    /**
     * Update the videogame on the system.
     * @param request   servlet request.
     * @param response  servlet response.
     * @return boolean  true if the videogame was update , false in other case.
     * @throws UnsupportedEncodingException exception.
     */
    protected boolean updateGame(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException, ServletException{
        String id=request.getParameter("ID");
        System.out.println("ID game:"+id);
        
        Videogame game = new Videogame();
        Videogame vgame = game.getDB(id);
        
        String classification = (request.getParameter("CLASS")).substring(0,1);
        vgame.setClassification(classification);
        String option = request.getParameter("creditOptions");
        float price=0;
        if ("FREE".equals(option)){
            vgame.setPrice(0);
        }else {
            if ("CREDIT".equals(option)){
                price = Float.parseFloat(request.getParameter("PRICE"));
                vgame.setPrice(price);
            }
        }
        String genre=request.getParameter("GENRE");
        vgame.setGenre(genre);
        String title=request.getParameter("TITLE");
        vgame.setTitle(title);
        String description=request.getParameter("DESCRIPTION");
        vgame.setDescription(description);
        String videoUrl=request.getParameter("VIDEO");
        vgame.setVideoUrl(videoUrl);
        
        //set videogame filename
        Part gamePart = request.getPart("GAME");
        long gameSize = gamePart.getSize();
        String storageRoute = "";
        System.out.println("Game: "+ gameSize);
        if (gameSize>0){
            String gameName = getFileName(gamePart);
            System.out.println("game:" + gameName);
            String gameExt = gameName.substring(gameName.length()-3,gameName.length());
            storageRoute = "game_" + id + "." + gameExt;
            vgame.setStorageRoute(storageRoute);
        }
        
        Part frontPart = request.getPart("FRONT");
        long frontSize = frontPart.getSize();
        String front = "";
        if (frontSize>0){
            String frontName = getFileName(frontPart);
            String frontExt = frontName.substring(frontName.length()-3,frontName.length());
            front = "front_" + id + "." + frontExt;
            vgame.setFront(front);
        }
        
        boolean na = vgame.updateDB();
        // System.out.println (na);
        if(na){
            System.out.println("updateGame");
            if (gameSize>0){
                String game_path = getPath()+"/web/public/videogames/games";
                File gameFolder = new File(game_path);
                File gameFiles = new File(gameFolder,storageRoute); 
                try (InputStream input = gamePart.getInputStream()) {
                    Files.copy(input, gameFiles.toPath(),StandardCopyOption.REPLACE_EXISTING);
                }catch(Exception e){
                    System.out.println("No se pudo subir el juego. " + e.getMessage());
                    e.printStackTrace();
                    return false;
                }
            }
            if (frontSize>0){
                String front_path = getPath()+"/web/public/videogames/fronts";
                File frontFolder = new File(front_path);
                File frontFiles = new File(frontFolder,front); 
                try (InputStream input = frontPart.getInputStream()) {
                    Files.copy(input, frontFiles.toPath(),StandardCopyOption.REPLACE_EXISTING);
                }catch(Exception e){
                    System.out.println("No se pudo subir la portada. " + e.getMessage());
                    e.printStackTrace();
                    return false;
                }
            }
            return true;
        }
        return false;
    }
    
    /**
     * Return the path of the file.
     * @return String   origin path.
     * @throws UnsupportedEncodingException exception.
     */
    private String getPath() throws UnsupportedEncodingException {
        String path = this.getClass().getClassLoader().getResource("").getPath();
        String fullPath = URLDecoder.decode(path, "UTF-8");
        String pathArr[] = fullPath.split("/build/web/WEB-INF/classes/");
        fullPath = pathArr[0];
        return fullPath;
    }
    
    /**
     * Return the file name of the Part. 
     * @param part  part to get the name.
     * @return String   file name.
     */
    private static String getFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
        //processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String path = request.getRequestURI().substring(request.getContextPath().length());
        switch(path){
	case "/saveGame":
	    if(uploadGame(request,response)){
		response.sendRedirect(response.encodeRedirectURL("managegames"));
	    }else{
		System.out.println("doPost - saveGame");
	    }
            break;
	case "/editGame":
	    if(updateGame(request,response)){
		response.sendRedirect(response.encodeRedirectURL("managegames"));
	    }else{
		System.out.println("doPost - editGame");
	    }
            break;
	case "/deleteGame":
	    PrintWriter out = response.getWriter();
	    response.setContentType("application/json");
	    String res = ""; 
	    game = new Videogame();
	    String id = (String)request.getParameter("idGame");
	    game.setId(Integer.parseInt(id));
	    boolean success = game.deleteDB();
	    if(success){
		res = "{\"success\":\""+1+"\"}";
	    }else{
		res = "{\"error\":0}";
	    }
	    out.print(res);
	    out.flush();
	    break;
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
    
