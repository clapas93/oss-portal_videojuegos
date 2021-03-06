/**
 *Controller for the Register action on the system.
 * Optimal Software Solutions
 * Project : Pulse Games
 * @author Magdiel Juarez.
 */

package User;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
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
public class RegisterController extends HttpServlet {


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
    
    protected int register(HttpServletRequest request, HttpServletResponse response){
      UserStudent student = new UserStudent();
      
      student.setStudentemail(request.getParameter("email"));
      student.setName(request.getParameter("name"));
      student.setLastname1(request.getParameter("lastname1"));
      student.setLastname2(request.getParameter("lastname2"));
      student.setAccountnumber(request.getParameter("accountnumber"));
      student.setCareer(request.getParameter("career"));
      student.setPassword(request.getParameter("password"));
      student.setStatus("1");
      student.setCredits("0");
      student.setHistory("");
      
      System.out.println(request.getParameter("password"));
      
      Register reg = new Register();
      
      int aux = reg.registerStudent(student);
      
      if(aux == 0){
        return 0;
      }else if(aux == 1){
        return 1;
      }else if(aux == 2){
        return 2;
      }else if(aux == 3){
        return 3;
      }else{
        return 4;
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
      HttpSession session;
      String userStudent;
      
      String action=request.getParameter("accion");
      if(action.equals("REGISTER")){
        int flag = register(request,response); 
        if(flag == 0){
          RequestDispatcher a = request.getRequestDispatcher("registro?msg0=Correo ya registrado");
          a.forward(request, response);
        }else if(flag == 1){
          RequestDispatcher a = request.getRequestDispatcher("registro?msg1=Número de cuenta ya registrado");
          a.forward(request, response);
        }else if(flag == 2){
          session = request.getSession();
          userStudent = request.getParameter("email");
          session.setAttribute("userStudent", userStudent);
          response.sendRedirect(response.encodeRedirectURL("videogames"));
          
        }else if(flag == 3){
          RequestDispatcher a = request.getRequestDispatcher("registro?msg2=Error al realizar la consulta");
          a.forward(request, response);
        }else {
          RequestDispatcher a = request.getRequestDispatcher("registro?msg3=Error al conectarse a la base de datos");
          a.forward(request, response);
        }
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
