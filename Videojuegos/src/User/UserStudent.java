/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import ConnectionDB.ConnectionDB;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *With this class we can make a model of an student, this class
 * extends at User, and with this we endow at this class with 
 * her methods 
 * @author Antonio 
 */
public class UserStudent extends User {
    
    private String studentemail;
    private String accountnumber;
    private String career;
    private String status;
    private String credits;
    private String history;
    private final ConnectionDB connection;
    
    public UserStudent(){
        this.connection = null;
    }
    
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
        this.connection = new ConnectionDB();
        
    }

    public String getStudentemail() {
        return studentemail;
    }

    public void setStudentemail(String studentemail) {
        this.studentemail = studentemail;
    }

    public String getAccountnumber() {
        return accountnumber;
    }

    public void setAccountnumber(String accountnumber) {
        this.accountnumber = accountnumber;
    }

    public String getCareer() {
        return career;
    }

    public void setCareer(String career) {
        this.career = career;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCredits() {
        return credits;
    }

    public void setCredits(String credits) {
        this.credits = credits;
    }

    public String getHistory() {
        return history;
    }

    public void setHistory(String history) {
        this.history = history;
    }
    
    public boolean updateDB(){
        String query = "UPDATE student set name ="+"'"+super.getName()+"'," 
                +"lastname1="+"'"+super.getLastname1()+"',"
                +"lastname2="+"'"+super.getLastname2()+"',"
                +"accountnumber"+"'"+this.accountnumber+"',"
                +"career"+"'"+this.career+"',"
                +"password"+"'"+super.getPassword()+","
                +"status"+"'"+this.status+"',"
                +"credits"+"'"+this.credits+"',"
                +"history"+"'"+this.history+"'"
                +"WHERE studentemail ='"+this.studentemail+"';";
        return connection.update(query);
    }
    
    public ResultSet selectStudent(String email){
        try {
            String query = "SELECT * FROM student WHERE studentemail ='"
                    +this.studentemail+"';";
            ResultSet tmp = connection.select(query);
            
            System.out.println(tmp.getString(0));
            
            return tmp;
        } catch (SQLException ex) {
            Logger.getLogger(UserStudent.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
