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
public class UserAdmin extends User {
    
    String adminemail;
    String phone;
    String email_contact;

    public String getAdminemail() {
        return adminemail;
    }

    public void setAdminemail(String
            adminemail) {
        this.adminemail = adminemail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail_contact() {
        return email_contact;
    }

    public void setEmail_contact(String email_contact) {
        this.email_contact = email_contact;
    }

}
