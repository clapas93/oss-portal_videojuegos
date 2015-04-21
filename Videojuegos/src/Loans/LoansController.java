/**
* Optimal Software Solutions
* Project : Pulse Games
* This class create the controller to comunicate with Loan model
* @author Miranda Sáncehz Luis Eduardo
* @version 0.1
* @since 19/04/2015
*/

package Loans;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class LoansController extends HttpServlet {

  private Loan model;

  public LoansController(){
    model = new Loan();
  }
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
    switch(path){
        case "/loanapplications":
          view = "LoansHI.jsp";
          request.setAttribute("view", view); 
          request.setAttribute("title", "Solicitudes de prestamo nuevas");
          List loans = model.getLoans("'n'");
          request.setAttribute("loans", loans); 
          request.getRequestDispatcher("backend_layout.jsp").forward(request, response);
        break;
        case "/getalgo":
          response.setContentType("application/json");
          PrintWriter out = response.getWriter();
          String email ="ursus1010@hotmail.com";
          String res = "{\"success\":\""+email+"\"}";
          out.print(res);
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
    String path = request.getRequestURI().substring(request.getContextPath().length());
    PrintWriter out = response.getWriter();
    response.setContentType("application/json");
    String res = "";
    boolean success;
    String email ="";
    double credito;
    switch(path){
      case "/denyloan":
        email = (String)request.getParameter("email");
        success = this.model.denyLoan(email);
        if(success){
          res = "{\"success\":\""+1+"\"}";
        }else{
          res = "{\"error\":0}";
        }
        out.print(res);
        out.flush();
      break;
      case "/grantloan":
        email = (String)request.getParameter("email");
        System.out.println("VALUE: "+request.getParameter("credit"));
        credito = Double.parseDouble(request.getParameter("credit"));
        success = this.model.grantedLoan(email,credito);       
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
