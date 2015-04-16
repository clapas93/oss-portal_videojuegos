/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

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
public class registerController extends HttpServlet {

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
        String userStudent;
        
        String action=request.getParameter("accion");
        if(action.equals("REGISTER")){
            if(register(request, response)){
                session = request.getSession();
                userStudent = request.getParameter("email");
                session.setAttribute("nomUsuario", userStudent);
                String view = "videojuegos.jsp";
                request.setAttribute("view", view); 
                String footer = "footer.jsp";
                request.setAttribute("footer", footer);
                String header = "headerLogin.jsp";
                request.setAttribute("header", header);
                request.getRequestDispatcher("layout.jsp").forward(request, response);
                
            }else{
                System.out.println("<script>alert('Datos inválidos'); location.href='index.jsp'</script>");
            }
        }
    }
    
    protected boolean register(HttpServletRequest request, HttpServletResponse response){
        userStudent student = new userStudent();
        
        student.setStudentemail(request.getParameter("email"));
        student.setName(request.getParameter("name"));
        student.setLastname1(request.getParameter("lastname1"));
        student.setLastname2(request.getParameter("lastname2"));
        student.setAccountnumber(request.getParameter("accountnumber"));
        student.setCareer(request.getParameter("career"));
        student.setPassword(request.getParameter("password"));
        student.setStatus(request.getParameter("status"));
        student.setCredits("0");
        student.setHistory(request.getParameter("history"));
        
        register reg = new register();
        
        if(reg.registerStudent(student)){
            return true;
        }else{
            return false;
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
