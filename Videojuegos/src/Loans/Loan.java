/**
* Optimal Software Solutions
* Project : Pulse Games
* This class create a Loan object and make querys to DB
* @author Miranda Sáncehz Luis Eduardo
* @version 0.1
* @since 19/04/2015
*/

package Loans;

import ConnectionDB.ConnectionDB;
import java.sql.ResultSet;
import java.util.List;
import java.util.LinkedList;

public class Loan {

  /**
  *User's email
  */
  private String email;
  
  /**
  *User's name
  */
  private String name;
  
  /**
  *User's lastname
  */
  private String lastname1;
  
  /**
  *Users's lastname
  */
  private String lastname2;
  
  /**
  *User's account number
  */
  private String accountnumber;
  
  /**
  *User's career  
  */
  private String career;
  
  /**
  *User's history route
  */
  private String history;
  
  /**
  *User's status that indicate its status of loan
  */
  private String status;
  
  /**
  *User's credit
  */
  private double credit;
 

  /**
  *Class construct
   * @param email
   * @param name
   * @param lastname1
   * @param lastname2
   * @param accountnumber
   * @param career
   * @param history
   * @param status
  */
  public Loan(String email, 
      String name,
      String lastname1, 
      String lastname2, 
      String accountnumber,
      String career, 
      String history, 
      String status,
      String credit
  ){
    this.email=email;
    this.name = name;
    this.lastname1 = lastname1;
    this.lastname2 = lastname2;
    this.accountnumber = accountnumber;
    this.career = career;
    this.history = history;
    this.status = status;
    this.credit = Double.parseDouble(credit);
  } 

  /**
  *Default Contrstructor
  */
  public Loan (){
  }


  /**
  *Gets the 
  *@return String 
  */
  public String getEmail(){
    return email;
  }

  /**
  *Gets the name
  *@return String name
  */
  public String getName(){
    return name;
  }

  /**
  *Gets the lastname1
  *@return String 
  */
  public String getLastName1(){
    return lastname1;
  }

  /**
  *Gets the lastname2
  *@return String 
  */
  public String getLastName2(){
    return lastname2;
  }

  /**
  *Gets the accountnumber
  *@return String accountnumber
  */
  public String getAccountNumber(){
    return accountnumber;
  }


  /**
  *Gets the career
  *@return String career
  */
  public String getCareer(){
    return career;
  }

  /**
  *Gets the history
  *@return String history
  */
  public String getHistory(){
    return history;
  }

  /**
  *Gets the status
  *@return String status
  */
  public String getStatus(){
    return status;
  }

  /**
  *Gets the status
  *@return String status
  */
  public double getCredits(){
    return this.credit;
  }

  /**
  *Generic method to make SELECT quert
  *@param  String  SELECT statement
  *@return  List return of the query
  */
  private List query(String query){
    ConnectionDB connection = new ConnectionDB();
    List list = new LinkedList();  
    ResultSet rs = connection.select(query);
    try{
    while (rs.next()) {
      String email = rs.getString("studentemail");
      String name = rs.getString("name");
      String lastname1 = rs.getString("lastname1");
      String lastname2 = rs.getString("lastname2");
      String accountnumber = rs.getString("accountnumber");
      String career = rs.getString("career");
      String history = rs.getString("history");
      String credit = rs.getString("creditapproved");
      Loan loan = new Loan(email,name,lastname1,lastname2,accountnumber,career,history,status,credit);
      list.add(loan);
    }
    connection.ConnectionClose();
    return list;
    }catch(Exception e){
      System.out.println("Error...."+ e.toString());
      return new LinkedList(); 
    }
  }
  
  /**
  *Get a list of al the loans that match with the param type
  * @param status
  *@return List list of all the loans that match
  */
  protected List getLoans(String status){
    List list;
    try{
      String sql="SELECT s.studentemail,s.name, s.lastname1,s.lastname2,s.accountnumber, s.career,s.history,p.creditapproved FROM loan as p JOIN student as s ON p.studentemail=s.studentemail WHERE p.status like "+status; 
      list = query(sql);
    return list;
    }catch(Exception e){
      System.out.println(e.toString());
      List s = new LinkedList();
      return s;
    }
  }

  /**
  *Update the row with deny status specified the email 
  * @param email
  *@return boolean true if the query was successful
  */
  public boolean denyLoan(String email){
    ConnectionDB connection = new ConnectionDB();
    String q = "UPDATE loan SET status='d',creditapproved = 0 WHERE studentemail='"+email+"'";
      System.out.println("q");
    return connection.update(q);
  }

  /**
  *Update the row with approve status specified the email 
  * @param email
  * @param val
  *@return boolean true if the query was successful
  */
  public boolean grantedLoan(String email, double val){
    ConnectionDB connection = new ConnectionDB();
    String q = "UPDATE loan SET status='a',creditapproved="+val+" WHERE studentemail='"+email+"'";
    String q2 = "UPDATE student SET  credits = "+val+" WHERE studentemail='"+email+"'";
    System.out.println(q2);
    boolean b1 = connection.update(q);
    boolean b2 = connection.update(q2);
    connection.ConnectionClose();
    return b1 && b2;
  }

  /**
  *Update the row with approve status specified the email 
  * @param email
  * @param val
  *@return boolean true if the query was successful
  */
  public boolean reapproveLoan(String email){
    ConnectionDB connection = new ConnectionDB();
    String q = "UPDATE loan SET status='n',creditapproved = 0 WHERE studentemail='"+email+"'";
    String q2 = "UPDATE student SET  credits = 0 WHERE studentemail='"+email+"'";
    boolean b1 = connection.update(q);
    boolean b2 = connection.update(q2);
    connection.ConnectionClose();
    return b1 && b2;
  }
  
  /**
   * Reset loan and delete student story in the database
   * @return boolean true if the query was successful
   */
  public boolean newSemestre(){
      ConnectionDB connection = new ConnectionDB();
      String history = "UPDATE student SET history = '';";
      String loan = "DELETE FROM loan WHERE status != '';";
      boolean u1 = connection.update(history);
      boolean u2 = connection.update(loan);
      connection.ConnectionClose();
      return u1 && u2;
  }

}
