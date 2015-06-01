/**
 *Model for a generic user.
 * Optimal Software Solutions
 * Project : Pulse Games
 * @author Antonio Galvan.
 */
package User;


public class User {
    String name;
    String lastname1;
    String lastname2;
    String password;
    
    /*
    *Constructor by omission.
    */
    public User(){
        
    }
    
    /*
    *Constructor of the class.
    */
    
    public User(String name, String lastname1, String lastname2, String password){
        this.name = name;
        this.lastname1 = lastname1;
        this.lastname2 = lastname2;
        this.password = password;
        
    }
    
    /**
     * Return the name of an user
     * @return String
     */

    public String getName() {
        return name;
    }
    
    /**
     * Set a new name for the user.
     * @param String
     */

    public void setName(String name) {
        this.name = name;
    }

    
    /**
     * Return the last name of a user
     * @return String
     */
    
    public String getLastname1() {
        return lastname1;
    }

    /**
     * Set a new lastname for the user
     * @param String
     */
    
    
    public void setLastname1(String lastname1) {
        this.lastname1 = lastname1;
    }

    
    /**
     * Return the second last name for a user.
     * @return String
     */
    public String getLastname2() {
        return lastname2;
    }
    
    /**
     * Set a new second last name
     * @param String
     */

    public void setLastname2(String lastname2) {
        this.lastname2 = lastname2;
    }
    
    /**
     * Get the password for a user
     * @return String
     */

    public String getPassword() {
        return password;
    }

    /**
     * Set a new password by an user
     * @param String
     */
    
    public void setPassword(String password) {
        this.password = password;
    }
}
