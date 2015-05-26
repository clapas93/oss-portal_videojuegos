/**
 * Optimal Software Solutions
 * Project : Pulse Games
 *With this class we can make a model of an student, this class
 * extends at User, and with this we endow at this class with 
 * her methods 
 * @author Antonio Galvan
 */

package User;

import ConnectionDB.ConnectionDB;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class UserStudent extends User {
    
    private String studentemail;
    private String accountnumber;
    private String career;
    private String status;
    private String credits;
    private String history;
    
    
    /**
     * Constructor
     */
    public UserStudent(){
    }
    
    /**
     * Constructor
     * @param studentemail
     * @param name
     * @param lastname1
     * @param lastname2
     * @param accountnumber
     * @param career
     * @param password
     * @param status
     * @param credits
     * @param history 
     */
    
    public UserStudent(String studentemail, String name, String lastname1,
		       String lastname2, String accountnumber, String career, String password,
		       String status, String credits, String history){
        
        this.studentemail = studentemail;
        super.name = name;
        super.lastname1 = lastname1;
        super.lastname2 = lastname2;
        this.accountnumber = accountnumber;
        this.career = career;
        super.password = password;
        this.status = status;
        this.credits = credits;
        this.history = history;        
    }
    /**
     * Return the email frot an student.
     * @return String
     */

    public String getStudentemail() {
        return studentemail;
    }
    
    /**
     * Set a new email to a student.
     * @param studentemail 
     */

    public void setStudentemail(String studentemail) {
        this.studentemail = studentemail;
    }
    
    /**
     * Get the number account of an student.
     * @return String
     */

    public String getAccountnumber() {
        return accountnumber;
    }
    
    /**
     * Set new number account to an student.
     * @param accountnumber 
     */

    public void setAccountnumber(String accountnumber) {
        this.accountnumber = accountnumber;
    }

    /**
     * Return the carrer of an student.
     * @return 
     */
    public String getCareer() {
        return career;
    }
    
    /**
     * Update the carrer of one student
     * @param career 
     */

    public void setCareer(String career) {
        this.career = career;
    }

    
    /**
     * Get the status of one student in the system:
     * if true he/she continue in the system, in other case, false.
     * @return 
     */
    public String getStatus() {
        return status;
    }
    
    /**
     * Change the status of the student on the system.
     * if true he/she continue in the system, in other case, false.
     * @param status 
     */

    public void setStatus(String status) {
        this.status = status;
    }

    
    /**
     * Ger the total of credits of one student
     * @return String
     */
    public String getCredits() {
        return credits;
    }

    /**
     * Update the total of credits of one student
     * @param credits 
     */
    public void setCredits(String credits) {
        this.credits = credits;
    }
    
    /**
     * Return the path of store of the history of an student
     * @return Strinf
     */

    public String getHistory() {
        return history;
    }
    
    /**
     * Set thepath of store of the history academic of one student
     * @param history 
     */

    public void setHistory(String history) {
        this.history = history;
    }
    
    /**
     * Make an update of the student on the data base
     * @return boolen
     */
    
    public boolean update(){
        String query = "UPDATE student set name ="+"'"+super.getName()+"'," 
	    +"lastname1="+"'"+this.getLastname1()+"',"
	    +"lastname2="+"'"+this.getLastname2()+"',"
	    +"accountnumber="+"'"+this.accountnumber+"',"
	    +"career="+"'"+this.career+"',"
	    +"password="+"'"+this.getPassword()+"',"
	    +"status="+"'"+this.status+"',"
	    +"credits="+"'"+this.credits+"',"
	    +"history="+"'"+this.history+"'"
	    +"WHERE studentemail ='"+this.studentemail+"';";
        System.out.println("QUery: " +query);
        ConnectionDB connection = new ConnectionDB();
        boolean res = connection.update(query);
        connection.ConnectionClose();
        return res;
    }

    
    /**
     * Make an insert of the stundent in the database.
     * @param query
     * @return boolean
     */
    
    public boolean insert(String query){
	ConnectionDB connection = new ConnectionDB();
	boolean res = connection.insert(query);
	connection.ConnectionClose();
	return res;
    }
    
    
    /**
     * Return an student object fot the data base.
     * @param query
     * @return UserStudent
     */
    
    public UserStudent selectStudent(String query){
	UserStudent aux = new UserStudent();  
	try {
            System.out.println(query);
            ConnectionDB connection = new ConnectionDB();
            ResultSet rs = connection.select(query);
            while(rs.next()){
              aux.setStudentemail(rs.getString("studentemail"));
              aux.setName(rs.getString("name"));
              aux.setLastname1(rs.getString("lastname1"));
              aux.setLastname2(rs.getString("lastname2"));
              aux.setAccountnumber(rs.getString("accountnumber"));
              aux.setCareer(rs.getString("career"));
              aux.setPassword(rs.getString("password"));
              aux.setStatus(rs.getString("status"));
              aux.setHistory(rs.getString("history"));
              aux.setCredits(rs.getString("credits"));
            }
            connection.ConnectionClose();
            return aux;
        } catch (SQLException ex) {
            Logger.getLogger(UserStudent.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
    /**
     * Return the amount of credits of the student stored in the database.
     * @param query
     * @return 
     */
    
    public float selectCredits(String query){
	UserStudent aux = new UserStudent();  
	try {
            System.out.println(query);
            ConnectionDB connection = new ConnectionDB();
            ResultSet rs = connection.select(query);
            while(rs.next()){
		aux.setCredits(rs.getString("credits"));
            }
            connection.ConnectionClose();
            String credits = aux.getCredits();
            if(credits!=null){
		return Float.parseFloat(aux.getCredits());
            }else{
		return 0;
            } 
        } catch (SQLException ex) {
            Logger.getLogger(UserStudent.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
