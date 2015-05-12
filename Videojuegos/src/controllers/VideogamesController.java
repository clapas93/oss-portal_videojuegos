/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import ConnectionDB.ConnectionDB;
import ManageGames.Videogame;
import User.UserStudent;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author lalo
 */
public class VideogamesController extends HttpServlet {

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
        /**
         * lineas a copiar
         */
        String path = request.getRequestURI().substring(request.getContextPath().length());
        String view = "";
        String footer = "footer.jsp";
        /* Recuperamos la sesión que está activa */
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("userStudent");
        System.out.println(user);
        String header = "";
        String selectSQL = "SELECT * FROM student  WHERE studentemail = '"+ user +"'";
        Connection connection;
        Statement stat;
        String emaildb = null;
        String namedb = null;
        String lastName1db = null;
        String lastName2db = null;
        String carrerdb = null;
        String numAccdb = null;
        String passdb = null;
        String statusdb = null;
        String creditdb = null;
        String histdb = null;
        try{
          ConnectionDB cn = new ConnectionDB();
          ResultSet executeQuery = cn.select(selectSQL);
          while(executeQuery.next()){
            emaildb = executeQuery.getString("studentemail");
            namedb = executeQuery.getString("name");
            lastName1db = executeQuery.getString("lastname1");
            lastName2db = executeQuery.getString("lastname2");
            numAccdb = executeQuery.getString("accountnumber");
            carrerdb = executeQuery.getString("career");
            passdb = executeQuery.getString("password");
            statusdb = executeQuery.getString("status");
            creditdb = executeQuery.getString("credits");
            histdb = executeQuery.getString("history");
          }

        }catch(Exception e){    
          System.out.println(e.toString());
        }

        UserStudent student = new UserStudent(emaildb, namedb,lastName1db,
         lastName2db,numAccdb,carrerdb,passdb, statusdb, creditdb,histdb);
        request.setAttribute("student", student);

        Videogame game = new Videogame();
        switch (path) {
          case "/videogames":
            if(user==null){
              header = null;
            }else{
              header = "headerLogin.jsp";
            }
            view = "videojuegos.jsp";
            List<Videogame> videogames = game.getListDB();
            request.setAttribute("games", videogames);
            request.setAttribute("header", header);
            request.setAttribute("view", view);
            request.setAttribute("title", "Manage Games");
            request.setAttribute("footer", footer);
            request.getRequestDispatcher("layout.jsp").forward(request, response);
          break;
          case "/getvideogames":
            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            List<Videogame> games = game.getListDB();
            JSONObject obj = new JSONObject();
            JSONArray jgames = new JSONArray();
            for(Videogame v : games){
              JSONObject aux = new JSONObject();
              aux.put("id",v.getId());
              aux.put("title",v.getTitle() );
              aux.put("description",v.getDescription());
              aux.put("price",v.getPrice());
              aux.put("state",v.getState());
              aux.put("downloads",v.getDownloads());
              aux.put("front",v.getFront());
              aux.put("video",v.getVideoUrl());
              aux.put("url",v.getRouteGame());
              jgames.add(aux);
            }
            out.print(jgames);
            out.flush();
          break;
      }
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
