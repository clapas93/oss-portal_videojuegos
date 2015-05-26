/**
 * Optimal Software Solutions
 * Project : Pulse Games
 *With this class we can make a model of an Student, this class
 * extends at User, and with this we endow at this class with 
 * her methods 
 * @author Magdiel Juarez.
 */

package User;


public class UserAdmin extends User {
    
    String adminEmail;
    String phone;
    String emailContact;
    
    /*
    *Constructor by omission.
    */
    
    public UserAdmin(){
        
    }
    
    
    /**
     * Constructor of the class
     * @param adminEmail
     * @param phone
     * @param emailContact 
     */
    
    public UserAdmin(String adminEmail, String phone, String emailContact ){
        this.adminEmail = adminEmail;
        this.phone = phone;
        this.emailContact = emailContact;
    }
    
    /**
     * Return the admin email
     * @return String
     */

    public String getAdminEmail() {
        return adminEmail;
    }
    
    /**
     * Set a new eamil for the admin.
     * @param adminEmail
     */

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    /**
     * Return the phone number to do contact with the admin.
     * @return String
     */
    
    public String getPhone() {
        return phone;
    }
    
    /**
     * Set a new phone number foy the admin
     * @param phone 
     */

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    /**
     * Get the email contact for the admin.
     * @return String
     */

    public String getEmailContact() {
        return emailContact;
    }
    
    /**
     * Updata the email contact by the admin.
     * @param emailContact 
     */

    public void setEmailContact(String emailContact) {
        this.emailContact = emailContact;
    }

}
