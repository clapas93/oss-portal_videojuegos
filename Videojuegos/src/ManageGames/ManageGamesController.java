/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ManageGames;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author lalo
 */
public class ManageGamesController extends HttpServlet {

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
        Videogame game=null;
        List videogameList = null;
        switch(path){
            case "/managegames":
                view = "ManageGamesHI.jsp";
                request.setAttribute("view", view); 
                request.setAttribute("title", "Manage Games");
                game = new Videogame();
                videogameList = game.getDB();
                request.setAttribute("videogameList", videogameList);
                request.getRequestDispatcher("backend_layout.jsp").forward(request, response);
            break;
            case "/updategame":
                String id=request.getParameter("ID");
                System.out.println(id);
                view = "UpdateGameHI.jsp";
                request.setAttribute("view", view); 
                request.setAttribute("title", "Manage Games");
                game = new Videogame();
                Videogame videogameId = game.getGameDB(id);
                request.setAttribute("videogameId", videogameId);
                request.getRequestDispatcher("backend_layout.jsp").forward(request, response);
            break;
            case "/uploadgame":
                view = "UploadGameHI.jsp";
                request.setAttribute("view", view); 
                request.setAttribute("title", "Manage Games");
                request.getRequestDispatcher("backend_layout.jsp").forward(request, response);
            break;
            case "/saveGame":
                if(uploadGame(request,response)){
                    view = "ManageGamesHI.jsp";
                    request.setAttribute("view", view); 
                    request.setAttribute("title", "Manage Games");
                    game = new Videogame();
                    videogameList = game.getDB();
                    request.setAttribute("videogameList", videogameList);
                    request.getRequestDispatcher("backend_layout.jsp").forward(request, response);
                    System.out.println("saveDB");
                }else{
                    System.out.println("<script>alert('Datos inválidos'); location.href='index.jsp'</script>");
                }
            break;
            case "/editGame":
                if(updateGame(request,response)){
                    view = "ManageGamesHI.jsp";
                    request.setAttribute("view", view); 
                    request.setAttribute("title", "Manage Games");
                    game = new Videogame();
                    videogameList = game.getDB();
                    request.setAttribute("videogameList", videogameList);
                    request.getRequestDispatcher("backend_layout.jsp").forward(request, response);
                    System.out.println("editDB");
                }else{
                    System.out.println("<script>alert('Datos inválidos'); location.href='index.jsp'</script>");
                }
            break;
        }
    }
    
    protected boolean uploadGame(HttpServletRequest request, HttpServletResponse response){
        String storageRoute = request.getParameter("GAME");
        String front = request.getParameter("FRONT");
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
        String title=request.getParameter("TITLE");
        String description=request.getParameter("DESCRIPTION");
        String videoUrl=request.getParameter("VIDEO");
        
        Videogame game = new Videogame(front,classification,price,storageRoute,genre,title,description,videoUrl);
        System.out.println("uploadGame");
        return game.saveDB();
    }
    
    
    protected boolean updateGame(HttpServletRequest request, HttpServletResponse response){
        String id=request.getParameter("ID");
        System.out.println("ID game:"+id);
        String storageRoute = request.getParameter("GAME");
        String front = request.getParameter("FRONT");
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
        String title=request.getParameter("TITLE");
        String description=request.getParameter("DESCRIPTION");
        String videoUrl=request.getParameter("VIDEO");
        
        Videogame game = new Videogame(front,classification,price,storageRoute,genre,title,description,videoUrl);
        game.setId(Integer.parseInt(id));
        System.out.println("uploadGame");
        return game.updateDB();
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
        processRequest(request, response);
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
