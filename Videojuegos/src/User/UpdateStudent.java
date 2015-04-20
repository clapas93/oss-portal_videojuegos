/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author antoniogalvan
 */
public class UpdateStudent extends HttpServlet {

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
        String path = request.getRequestURI().substring(request.getContextPath().length());
        String view = "";
        String footer = "footer.jsp";
        
        userStudent student = new userStudent("g.antonio@ciencias", "Jenny","Galván",
             "Gámez","308082379","Matemáticas","pass", "online", "100","chanel.pdf");
                request.setAttribute("student", student);
                System.out.println(student.getName() + "Mi nombre es:");

        switch (path) {
            case "/updatestudent":

                view = "profileUpdate.jsp";
                request.setAttribute("view", view);
                request.setAttribute("title", "Manage Games");
                request.setAttribute("footer", footer);
                request.getRequestDispatcher("layout.jsp").forward(request, response);
                
                break;
            case "/studentsave":
                view = "profileUpdate.jsp";

                request.setAttribute("view", view);
                request.setAttribute("title", "Manage Games");
                request.setAttribute("footer", footer);
                request.getRequestDispatcher("layout.jsp").forward(request, response);
                
                String name = request.getParameter("nombre_s");
                String lastName1 = request.getParameter("last_name1");
                String carrer = request.getParameter("carrer");
                String numberAcc = request.getParameter("numberacc");
                String pass = request.getParameter("pass1");
                
                System.out.println(request.getParameter("fileUpload"));
                
                String query = "INSERT INTO student VALUES('g.antonio', 'antonio' )";
  






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
