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
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import javax.servlet.http.Part;
import org.json.simple.JSONObject;

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
      //System.out.println(selectSQL);
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
      
      UserStudent student = new UserStudent();
      HttpSession session = request.getSession();
      String user = (String) session.getAttribute("userStudent");
      PrintWriter out = response.getWriter();
      String query = "SELECT * FROM student WHERE studentemail = '"+ user +"'";
      student = student.selectStudent(query);
      
        System.out.println(student.getAccountnumber());
      switch(path){
          case "/historysave":
            Part hPart = request.getPart("historypdf");
            String history = "";
            System.out.println(hPart.getSize()==0);
            if(hPart.getSize()!=0){
              Hash hash = new Hash();
              history =hash.generateCode(user);
            }
            student.setHistory(history);
            
            String loan = "INSERT INTO loan (studentemail, adminemail, date, status, creditapproved) VALUES ("
                    + "'" + student.getStudentemail() +"','admin@oss.com', current_timestamp , 'n' "
                    + " , " + student.getCredits() +");";
            
            if(student.update() && student.insert(loan)){
                String histPath = getPath()+"/web/public/historiales";

                File hfolder = new File(histPath);
                File hfiles = new File(hfolder, history); 
                if(hPart.getSize()!=0){
                  try (InputStream input = hPart.getInputStream()) {
                      Files.copy(input, hfiles.toPath()); 
                  }
                }
            }else{
                System.out.println("do Post - historial");
            }

            response.sendRedirect(response.encodeRedirectURL("myaccount"));
            break;
              
      case "/studentsave":
          String name = request.getParameter("nombre_s");
          if(!name.equals("")){student.setName(name);}
          System.out.println(name);
          String lastName1 = request.getParameter("last_name1");
          System.out.println(lastName1);
          if(!lastName1.equals("")){ student.setLastname1(lastName1);}
          String lastName2 = request.getParameter("last_name2");
          System.out.println(lastName2);
          if(!lastName2.equals("")){ student.setLastname2(lastName2);}
          String carrer = request.getParameter("career");
          if(!carrer.equals("")){ student.setCareer(carrer);}
          String pass = request.getParameter("pass1");
          if(!pass.equals("")){student.setPassword(pass);}
          
          boolean update = student.update();
          
          Part filePart = request.getPart("fileUpload");
            String hist = "";
            long hsize = filePart.getSize();
            System.out.println(update + "file: " + hsize);
            if((hsize>0) && update){
                Hash hash = new Hash();
                hist =hash.generateCode(user);
                student.setHistory(hist);
                
                String insertloan = "INSERT INTO loan (studentemail, adminemail, date, status, creditapproved) VALUES ("
                    + "'" + student.getStudentemail() +"','admin@oss.com', current_timestamp , 'n' "
                    + " , " + student.getCredits() +");";
                if(student.update() && student.insert(insertloan)){
                    String histPath = getPath()+"/web/public/historiales";

                    File hfolder = new File(histPath);
                    File hfiles = new File(hfolder, hist); 
                    if(filePart.getSize()!=0){
                      try (InputStream input = filePart.getInputStream()) {
                          Files.copy(input, hfiles.toPath()); 
                      }
                    }
                }else{
                    System.out.println("do Post - historial");
                }
            }
            
          response.sendRedirect(response.encodeRedirectURL("myaccount"));
          break;
          case "/deleteStudent":
            JSONObject obj = new JSONObject();
            student.setStatus("b");
            boolean b  = student.update();
            System.out.println("delete: "+ b);
            if(b){
              session.setAttribute("userStudent", null);
              obj.put("success",true);
              session.invalidate();
            }else{
              obj.put("error",false);
              System.out.println("no se pudo de baja");
            }
            out.print(obj);
            out.flush();
            //response.sendRedirect(response.encodeRedirectURL("index.jsp"));
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
