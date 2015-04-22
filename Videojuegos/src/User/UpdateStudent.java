/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import ConnectionDB.connectiondb;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
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
        
        String selectSQL = "SELECT * FROM student * WHERE studentemail = 'g.antonio@ciencias.unam.mx'";
        
        connectiondb cn = new connectiondb();
        Connection connection;
        

        Statement stat;
        String emaildb = null;
        String namedb = null;
        String lastName1db = null;
        String lastName2db = null;
        String carrerdb = null;
        String numAccdb = null;
        String passdb = null;
        String statusdb = null;
        String creditdb = null;
        String histdb = null;
        try{
            connection = cn.connectionDB();
            stat = connection.createStatement();
            ResultSet executeQuery = stat.executeQuery(selectSQL);
            while(executeQuery.next()){
                emaildb = executeQuery.getString("studentemail");
                namedb = executeQuery.getString("name");
                lastName1db = executeQuery.getString("lastname1");
                lastName2db = executeQuery.getString("lastname2");
                numAccdb = executeQuery.getString("accountnumber");
                carrerdb = executeQuery.getString("career");
                passdb = executeQuery.getString("password");
                statusdb = executeQuery.getString("status");
                creditdb = executeQuery.getString("credits");
                histdb = executeQuery.getString("history");
            }
                    
            }catch(Exception e){    
                System.out.println(e.toString());
            }
        
        userStudent student = new userStudent(emaildb, namedb,lastName1db,
             lastName2db,numAccdb,carrerdb,passdb, statusdb, creditdb,histdb);
                request.setAttribute("student", student);
                

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
                String lastName2 = request.getParameter("last_name2");
                String carrer = request.getParameter("carrer");
                String numberAcc = request.getParameter("numberacc");
                String pass = request.getParameter("pass1");
                String hist = request.getParameter("fileUpload");
                
                student.setName(name);
                student.setLastname1(lastName1);
                student.setLastname2(lastName2);
                student.setCareer(carrer);
                
                student.setAccountnumber(numberAcc);
                student.setPassword(pass);
                student.setHistory(hist);
                
                //String SQL = "INSERT INTO student VALUES('gantonio@ciencias'"+",'"+name+"','"+lastName1+"','"+lastName2+"','"+"','"+carrer+"','"+numberAcc+"','"+pass+hist+"');";
                
                //String insertSQL ="INSERT INTO student (studentemail, name, lastname1, lastname2, accountnumber,"
                  //  + "career, password, status, credits, history) VALUES "
                  //  + "('" + student.getStudentemail() + "',"
                  //  + "'" + student.getName() + "',"
                  //  + "'" + student.getLastname1() + "',"
                  //  + "'" + student.getLastname2() + "',"
                  //  + "'" + student.getAccountnumber() + "',"
                  //  + "'" + student.getCareer() + "',"
                  //  + "'" + student.getPassword() + "',"
                  //  + "'" + student.getStatus() + "',"
                  //  + "'" + student.getCredits() + "',"
                  //  + "'" + student.getHistory() + "');"; 
                
                String updateSQL = "UPDATE student set name="+"'"+student.getName()+"',"
                        +"lastname1 = '"+student.getLastname1()+"',"
                        +"lastname2 = '"+student.getLastname2()+"',"
                        +"accountnumber = '"+student.getAccountnumber()+"',"
                        +"career = '"+student.getCareer()+"',"
                        +"status = '"+student.getStatus()+"',"
                        +"credits ="+student.getCredits()+","
                        +"history ='"+student.getHistory()+"'"
                        + "where studentemail = '"+student.getStudentemail()+"';";
                        
                
                try{
                    connection = cn.connectionDB();
                    stat = connection.createStatement();
                    //stat.executeQuery("DELETE FROM student WHERE studentemail = 'jen@ciencias.unam.mx'");
                    stat.executeQuery(updateSQL);
                }catch(Exception e){    
                    System.out.println(e.toString());
                }






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