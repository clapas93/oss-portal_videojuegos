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
    
    public String studentemail;
    public String name;
    public String lastname1;
    public String lastname2;
    public String accountnumber;
    public String career;
    public String password;
    public String status;
    public String credits;
    public String history;
    
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
    
    public void setName(String name){   
        this.name=name;
    }

    public void setLastname1(String last){   
        this.lastname1=last;
    }

    public void setLastname2(String last){   
        this.lastname2=last;
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

    public void setPassword(String pass) {
        this.password = pass;
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
    public String getName(){
        return name;
    }
    public void setName(String name){
        this.name = name;
    }
    public String getLastname1(){
        return lastname1;
    }
    public void setLastname1(String lastname1){
        this.lastname1 = lastname1;
    }
    public String getLastname2(){
        return lastname2;
    }
    public void setLastname2(String lastname2){
        this.lastname2 = lastname2;
    }
    public String getPassword(){
        return password;
    }
    public void setPassword(String password){
        this.password = password;
    }
}
