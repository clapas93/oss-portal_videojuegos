/**
 * Model by login a user in the system.
 * Optimal Software Solutions
 * Project : Pulse Games
 * @author Magdiel Juarez.
 */
package User;

import ConnectionDB.ConnectionDB;


public class Login {
    
    private final ConnectionDB connection;
    
    public Login(){
	connection = new ConnectionDB();
    }
    /**
      * Model to apply a query to the database.
      * Method to login as admin.
      *param User is the object from which we get the email and password
      *return 0 if you log on as a student
      * Else return 1 if logged in as admin.
      * Else return 2 if you can not log or as a student or as admin.
     * @param user
     * @return Int
      */
    protected int loginAdmin(UserAdmin user){
        
        /*
         * We try to make an inquiry to the table "admin" by a connection to the database and cachamos
         * Any type of emergency.
         */
        try{
            String sql=
		"SELECT * FROM admin WHERE adminemail = '"+
		user.getAdminEmail()+
		"' AND password = '"+user.getPassword()+"';";    
            if(connection.select(sql).next()){
                System.out.println(sql);
                System.out.println("OK ... bien3");
                return 1;
            }else{
                if(loginStudent(user.getAdminEmail(), user.getPassword()))
                    return 0;
                else
                    return 2;
                
            }
        }catch(Exception e){
            System.out.println("Error:"+ e);
            return 2;
        }
        
    }
    
    /**
     * Method called from loginAdmin, which runs if a query could not be performed in the table "admin
      * BD "
      *param User is the email parameter to log on.
      *param Psw is the parameter password to login.
      *return True if he could perform the query in the table "student"
      * Else false if the query is empty.
     * @param user
     * @param psw
     * @return boolean
     */
    
    protected boolean loginStudent(String user, String psw){
        /*
         * Try to make an inquiry to the table "student" means a connection to the database and cachamos * any type of emergency. 
         */
        try{
            String sql=
		"SELECT * FROM student WHERE studentemail = '"+
		user +
		"' AND password = '"+ psw +"';";
            System.out.println(user + " && " + psw);
            
            if(connection.select(sql).next()){
                System.out.println();
                System.out.println("OK ... bien3");
                return true;
            }else{
                return false;
            }
                
        }catch(Exception e){
            System.out.println("Error:"+ e);
            return false;
        }
    }
}
