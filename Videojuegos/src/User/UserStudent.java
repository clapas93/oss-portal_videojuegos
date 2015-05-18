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
        this.connection = new ConnectionDB();
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
        System.out.println(query);
        return connection.update(query);
    }

    public boolean insert(String query){
       return connection.insert(query);
    }
    
    public UserStudent selectStudent(String query){
      UserStudent aux = new UserStudent();  
      try {
            System.out.println(query);
            ResultSet rs = connection.select(query);
            while(rs.next()){
              aux.setName(rs.getString("name"));
              aux.setLastname1(rs.getString("lastname1"));
              aux.setLastname2(rs.getString("lastname2"));
              aux.setAccountnumber(rs.getString("accountnumber"));
              aux.setCareer(rs.getString("career"));
              aux.setPassword(rs.getString("password"));
              aux.setStatus(rs.getString("status"));
              aux.setHistory(rs.getString("history"));
            }
            return aux;
        } catch (SQLException ex) {
            Logger.getLogger(UserStudent.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public float selectCredits(String query){
      UserStudent aux = new UserStudent();  
      try {
            System.out.println(query);
            ResultSet rs = connection.select(query);
            while(rs.next()){
              aux.setCredits(rs.getString("credits"));
            }
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
