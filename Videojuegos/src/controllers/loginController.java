/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import ConnectionDB.connectiondb;
import User.user;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author magdiel
 */
public class loginController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session;
        String user;
        
        String action=request.getParameter("accion");
        if(action.equals("LOGIN")){
            if(logueo(request, response)){
                session = request.getSession();
                user = request.getParameter("usuario");
                session.setAttribute("nomUsuario", user);
                String view = "videojuegos.jsp";
                request.setAttribute("view", view); 
                String footer = "footer.jsp";
                request.setAttribute("footer", footer);
                String header = "headerLogin.jsp";
                request.setAttribute("header", header);
                request.getRequestDispatcher("layout.jsp").forward(request, response);
            }else {
                System.out.println("<script>alert('Datos inválidos'); location.href='index.jsp'</script>");
            }
        }
    }
    
    public boolean logueo(HttpServletRequest request, HttpServletResponse response){
        
            System.out.println("OK ... bien4");
            user data_user=new user();
            data_user.setAdminemail(request.getParameter("usuario"));
            data_user.setPassword(request.getParameter("password"));
            System.out.println(request.getParameter("usuario"));
            System.out.println(request.getParameter("password"));
            
            connectiondb cn = new connectiondb();
            
            if(cn.login(data_user)){
                System.out.println("OK ... bien5");
                return true;
            }else{
                System.out.println("OK ... error5");
                return false;
            }
        
        }
    
       // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
    }
}
    
    

