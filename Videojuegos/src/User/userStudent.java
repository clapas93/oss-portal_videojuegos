/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

/**
 *
 * @author magdiel
 */
public class userStudent extends user {
    
    protected String studentemail;
    protected String name;
    protected String lastname1;
    protected String lastname2;
    protected String accountnumber;
    protected String career;
    protected String password;
    protected String status;
    protected String credits;
    protected String history;
    
    public userStudent(){
        
    }
    
    public userStudent(String studentemail, String name, String lastname1,
            String lastname2, String accountnumber, String career, String password,
            String status, String credits, String history){
        
        this.studentemail = studentemail;
        this.name = name;
        this.lastname1 = lastname1;
        this.lastname2 = lastname2;
        this.accountnumber = accountnumber;
        this.career = career;
        this.password = password;
        this.status = status;
        this.credits = credits;
        this.history = history;
    }
     
    public String getName() {
        return this.name;
    }
    
    public String getLastname1() {
        return this.lastname1;
    }
    
    public String getLastname2() {
        return this.lastname2;
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

    public void setCareer(String carrer) {
        this.career = carrer;
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
}
