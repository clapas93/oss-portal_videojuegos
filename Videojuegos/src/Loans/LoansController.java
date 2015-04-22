/**
* Optimal Software Solutions
* Project : Pulse Games
* This class create the controller to comunicate with Loan model
* @author Miranda Sáncehz Luis Eduardo
* @version 0.1
* @since 19/04/2015
*/

package Loans;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig
public class LoansController extends HttpServlet {

  private final Loan model;

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
    }
  }
  public String getPath() throws UnsupportedEncodingException {
		String path = this.getClass().getClassLoader().getResource("").getPath();
		String fullPath = URLDecoder.decode(path, "UTF-8");
		String pathArr[] = fullPath.split("/build/web/WEB-INF/classes/");
		fullPath = pathArr[0];
		return fullPath;
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
    String path2 = request.getRequestURI().substring(request.getContextPath().length());
    PrintWriter out = response.getWriter();
    response.setContentType("application/json");
    String res = "";
    boolean success;
    String email ="";
    double credito;
    switch(path2){
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
      case "/getalgo":
        String description = request.getParameter("description"); // Retrieves <input type="text" name="description">
        Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
        String fileName = getFileName(filePart);
        String hist_path = getPath()+"/web/public/historiales";
        
        File folder = new File(hist_path);
        File files = new File(folder, "oss_"+fileName); 
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, files.toPath()); 
        }        
        out.print("Uploaded file successfully saved in ");
        out.flush();
      break;
    }
  }
  
    private static String getFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
        }
    }
    return null;
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
