/**
 *Model for the Register action on the system.
 * @author Magdiel Juarez.
 */
package User;

import ConnectionDB.ConnectionDB;

public class Register {

    public final ConnectionDB connection;
    
    
    /*
    *Constructor of the class.
    */
    
    public Register(){
	connection = new ConnectionDB();
    }

    /**
     * With this method we will make the register of an student in the system.
     * @param userStudent
     * @return int
     */
    
    protected int registerStudent(UserStudent userStudent){
        
        System.out.println(userStudent.getPassword());
    
        try{
            if(verifyEmail(userStudent)){
                if(verifyAccountnumber(userStudent)){
                    
                    String sql="INSERT INTO student (studentemail, name, lastname1, lastname2, accountnumber,"
			+ "career, password, status, credits, history) VALUES "
			+ "('" + userStudent.getStudentemail() + "',"
			+ "'" + userStudent.getName() + "',"
			+ "'" + userStudent.getLastname1() + "',"
			+ "'" + userStudent.getLastname2() + "',"
			+ "'" + userStudent.getAccountnumber() + "',"
			+ "'" + userStudent.getCareer() + "',"
			+ "'" + userStudent.getPassword() + "',"
			+ "'" + 1 + "',"
			+ "'" + 0 + "',"
			+ "'" + userStudent.getHistory() + "');"; 

                    if(connection.insert(sql)){
                        System.out.println("Consulta correcta, se agregó estudiante");
                        return 2;    
                    }else{
                        System.out.println("Error Consulta registro");
                        return 3;
                    }
                }else{
                    return 1;
                }
                
                
                
            }else{
                /* Ya existe el email*/
                return 0;
            }
            
            
            
        }catch(Exception e){
            System.out.println(e.toString());
            return 4;
        }
         
    }
    
    /**
     * Method to make the validation of someone exist or not in the database.
     * @param userStudent
     * @return true si no existe el correo en la base de datos
     */
    protected boolean verifyEmail(UserStudent userStudent){
        
        
        try{
            String sql=
		"SELECT * FROM student WHERE studentemail = '"+
		userStudent.getStudentemail()+"';";
            /**
             * Realizamos una coonsulta para verificar que no existe en la base de datos.
             */
            if(connection.select(sql)!=null){
                System.out.println("No existe este correo en la base de datos");
                return true;                
            }else{
                System.out.println("Ya existe este correo ");
                return false; 
            }
            
        }catch(Exception e){
            System.out.println(e.toString());
            return false;
        }
        
        
    }
    
    /**
     * Check if the account number its al ready in the database. 
     * @param userStudent
     * @return boolean.
     */
    
    protected boolean verifyAccountnumber(UserStudent userStudent){
        
        try{
            String sql=
		"SELECT * FROM student WHERE accountnumber = '"+
		userStudent.getAccountnumber() + "';";
            /**
             * Realizamos una consulta para verificar que no existe en la base de datos el número de cuenta.
             */
            if(connection.select(sql)!=null){
                System.out.println("No existe esta cuenta en la base de datos");
                return true;                
            }else{
                System.out.println("Ya existe esta cuenta ");
                return false; 
            }
            
        }catch(Exception e){
            System.out.println(e.toString());
            return false;
        }
        
        
    }
    
}
