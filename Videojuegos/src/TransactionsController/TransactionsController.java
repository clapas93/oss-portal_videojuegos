package TransactionsController;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import TransactionsController.Transactions;

/**
 * Optimal Software Solutions
 * Project : Pulse Games
 * This is the Controller to do the transaction for the system.
 * @author Miranda Sáncehz Luis Eduardo
 */
public class TransactionsController extends HttpServlet {

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
	HttpSession session = request.getSession();
	String email = (String) session.getAttribute("userStudent");
	String idGame;
	Transactions transaction = null;
	boolean success;
	switch(path){
	case "/transaction":
	    transaction= new Transactions();
	    JSONObject obj = new JSONObject();
	    idGame = (String)request.getParameter("idGame");
	    System.out.println("idGame   "+idGame);
	    success = transaction.registerDownload(email, idGame);
	    if(success){
		obj.put("success",true);
	    }else{
		obj.put("error",false);
	    }
	    out.print(obj);
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
