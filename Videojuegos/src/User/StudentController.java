/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import Resources.Hash;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.http.Part;

/**
 *
 * @author antoniogalvan
 */
@MultipartConfig
public class StudentController extends HttpServlet {
    
    private UserStudent model ;
  
    public StudentController(){
      model = new UserStudent();
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
      String view = "";
      String footer = "footer.jsp";
      String header = "headerLogin.jsp";
      /* Recuperamos la sesión que está activa */
      HttpSession session = request.getSession();
      String user = (String) session.getAttribute("userStudent");
      System.out.println("user   "+user);
      
      if(user==null){
        response.sendRedirect(response.encodeRedirectURL("videogames"));
        return;
      }
      
      String selectSQL = "SELECT * FROM student WHERE studentemail = '"+ user +"'";
      System.out.println(selectSQL);
      UserStudent student = model.selectStudent(selectSQL);
      
      switch (path) {
        case "/updatestudent":
          view = "profileUpdate.jsp";
          request.setAttribute("student", student);
          request.setAttribute("header", header);
          request.setAttribute("view", view);
          request.setAttribute("title", "Manage Games");
          request.setAttribute("footer", footer);
          request.getRequestDispatcher("layout.jsp").forward(request, response);
        break;
        case "/myaccount":
          view = "AccountHI.jsp";
          request.setAttribute("student", student);
          request.setAttribute("header", header);
          request.setAttribute("view", view);
          request.setAttribute("title", "Manage Games");
          request.setAttribute("footer", footer);
          request.getRequestDispatcher("layout.jsp").forward(request, response);
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
      String view = "";
      String footer = "footer.jsp";
      switch(path){
      case "/studentsave":
        view = "profileUpdate.jsp";
        UserStudent student = new UserStudent();

        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("userStudent");
        
        String name = request.getParameter("nombre_s");
        String lastName1 = request.getParameter("last_name1");
        String lastName2 = request.getParameter("last_name2");
        String carrer = request.getParameter("carrer");
        String numberAcc = request.getParameter("numberacc");
        String pass = request.getParameter("pass1");

        Part filePart = request.getPart("fileUpload");
        String hist = "";
        System.out.println(filePart.getSize()==0);
        if(filePart.getSize()!=0){
          Hash hash = new Hash();
          hist =hash.generateCode(user);
        }

        student.setStudentemail(user);
        student.setName(name);
        student.setLastname1(lastName1);
        student.setLastname2(lastName2);
        student.setCareer(carrer);
        student.setCredits("0");
        student.setAccountnumber(numberAcc);
        student.setPassword(pass);
        student.setHistory(hist);
        student.setStatus("a");
        
        DateFormat dateForm =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
                        
        String dateS = dateForm.format(date);
        String state = "n";
        int credit = 0;
                        
        String insertLoan = "INSERT INTO loan (studentemail, adminemail,"
                  + "date, status, creditapproved) VALUES ("+
                  "'"+student.getStudentemail()+"','admin@oss.com','"+
                  dateS+"','"+state+"',"+credit+");";

        System.out.println(insertLoan);
        
        //Si el historial no es subido cambiar no actualizar
        try{
         
          student.update();
          model.insert(insertLoan);
        }catch(Exception e){    
          System.out.println(e.toString());
        }
         if(filePart.getSize()!=0){
          try{
            
            model.insert(insertLoan);
          }catch(Exception e){    
            System.out.println(e.toString());
          }
        }
        String hist_path = getPath()+"/web/public/historiales";
        
        File folder = new File(hist_path);
        File files = new File(folder, hist); 
        if(filePart.getSize()!=0){
          try (InputStream input = filePart.getInputStream()) {
              Files.copy(input, files.toPath()); 
          }
        }

        response.sendRedirect(response.encodeRedirectURL("updatestudent"));
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

    public String getPath() throws UnsupportedEncodingException {
      String path = this.getClass().getClassLoader().getResource("").getPath();
      String fullPath = URLDecoder.decode(path, "UTF-8");
      String pathArr[] = fullPath.split("/build/web/WEB-INF/classes/");
      fullPath = pathArr[0];
      return fullPath;
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