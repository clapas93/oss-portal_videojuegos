    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import java.io.IOException;
import javax.servlet.AsyncContext;
import javax.servlet.RequestDispatcher;
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
        response.setContentType("text/html;charset=UTF-8");
        
        String action=request.getParameter("accion");
        
        if("LOGIN".equals(action)){
            // Logueo del usuario
            System.out.println("123456789");
            logueo(request, response);
	}
        
        /*
        HttpSession session;
        String userAdmin;
        String action=request.getParameter("accion");
        
        if(action.equals("LOGIN")){
            int value = logueo(request, response);
            System.out.println(value + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
            
            if(value == 0 ){
                session = request.getSession();
                userAdmin = request.getParameter("usuario");
                session.setAttribute("nomUsuario", userAdmin);
                String view = "videojuegos.jsp";
                request.setAttribute("view", view); 
                String footer = "footer.jsp";
                request.setAttribute("footer", footer);
                String header = "headerLogin.jsp";
                request.setAttribute("header", header);
                request.getRequestDispatcher("layout.jsp").forward(request, response);
            }else if(logueo(request, response) == 1){
                session = request.getSession();
                userAdmin = request.getParameter("usuario");
                session.setAttribute("nomUsuario", userAdmin);
                String view = "ManageGamesHI.jsp";
                request.setAttribute("view", view); 
                request.getRequestDispatcher("backend_layout.jsp").forward(request, response);
            }else {
                
            }
        }*/
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
    
    protected void logueo(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        
        
        System.out.println("OK ... bien4");
        UserAdmin data_user = new UserAdmin();
        data_user.setAdminemail(request.getParameter("usuario"));
        data_user.setPassword(request.getParameter("password"));
        System.out.println(request.getParameter("usuario"));
        System.out.println(request.getParameter("password"));
           
        login cn = new login();
        
        System.out.println("OK ... bien4.1");
        int value_page = cn.loginAdmin(data_user);
        System.out.println("Devolvió:" + value_page );
            
        if(value_page == 0){
            HttpSession session;
            String userStudent;
            session = request.getSession();
            userStudent = request.getParameter("usuario");
            session.setAttribute("userStudent", userStudent);
            String view = "videojuegos.jsp";
            request.setAttribute("view", view); 
            String footer = "footer.jsp";
            request.setAttribute("footer", footer);
            String header = "headerLogin.jsp";
            request.setAttribute("header", header);
            request.getRequestDispatcher("layout.jsp").forward(request, response);
            System.out.println("OK ... bienUser");
        }else if(value_page == 1){
            HttpSession session;
            String userAdmin;
            session = request.getSession();
            userAdmin = request.getParameter("usuario");
            session.setAttribute("userAdmin", userAdmin);
            String view = "ManageGamesHI.jsp";
            request.setAttribute("view", view); 
            request.getRequestDispatcher("backend_layout.jsp").forward(request, response);
            System.out.println("OK ... bienAdmin");
        }else {
            RequestDispatcher a = request.getRequestDispatcher("index.jsp?msg=Usuario y/o " +
				"contraseña incorrectos");
			a.forward(request, response);
        }
       
    }
}
    
    

