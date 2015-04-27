/**
* Optimal Software Solutions
* Project : Pulse Games
* This class create a Loan object and make querys to DB
* @author Miranda Sáncehz Luis Eduardo
* @version 0.1
* @since 19/04/2015
*/

package Loans;

import ConnectionDB.connectiondbL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.sql.SQLException;
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
  */
  public Loan(String email, 
      String name,
      String lastname1, 
      String lastname2, 
      String accountnumber,
      String career, 
      String history, 
      String status
  ){
    this.email=email;
    this.name = name;
    this.lastname1 = lastname1;
    this.lastname2 = lastname2;
    this.accountnumber = accountnumber;
    this.career = career;
    this.history = history;
    this.status = status;
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
  *Check the connection with db and make an update consult
  *@param String IStatement
  *@return Boolean returns true if the query was succesfull
  */
  private boolean exe_sql(String SQL){

    connectiondbL cn = new connectiondbL();
    Connection connection;
    Statement stat;
    int result;
    boolean flag;
    try{
      connection = cn.connectionDB();
      stat = connection.createStatement();
      result = stat.executeUpdate(SQL);
      System.out.println(result);

      if(result != 0){
        System.out.println("OK ... bien1.1");
        flag = true;
      }else{
        System.out.println("NO EXISTE INFORMACION");
        flag = false;
      }      

      return flag;
    }catch(Exception e){
      System.out.println("Error...."+ e.toString());
      return false;
    }
  } 

  /**
  *Generic method to make SELECT quert
  *@param  String  SELECT statement
  *@return  List return of the query
  */
  private List query(String query)
    throws SQLException {
    List list = new LinkedList();
    Statement stmt = null;
    connectiondbL cn = new connectiondbL();
    Connection con;
    try {
      con = cn.connectionDB();
      stmt = con.createStatement();
      ResultSet rs = stmt.executeQuery(query);
      while (rs.next()) {
        String email = rs.getString("studentemail");
        String name = rs.getString("name");
        String lastname1 = rs.getString("lastname1");
        String lastname2 = rs.getString("lastname2");
        String accountnumber = rs.getString("accountnumber");
        String career = rs.getString("career");
        String history = rs.getString("history");
        Loan loan = new Loan(email,name,lastname1,lastname2,accountnumber,career,history,status);
        list.add(loan);
      }
      return list;
    } catch (SQLException e ) {
        System.out.println(e);
    } finally {
        if (stmt != null) { stmt.close(); }
    }
    return null;
  }
  
  /**
  *Get a list of al the loans that match with the param type
  *@param String status of the loan
  *@return List list of all the loans that match
  */
  protected List getLoans(String status){
    List list;
    try{
      String sql="SELECT s.studentemail,s.name, s.lastname1,s.lastname2,s.accountnumber, s.career,s.history FROM loan as p JOIN student as s ON p.studentemail=s.studentemail WHERE p.status like "+status; 
      System.out.println(sql);
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
  *@param String email to search
  *@return boolean true if the query was successful
  */
  public boolean denyLoan(String email){
    String q = "UPDATE loan SET status='d' WHERE studentemail='"+email+"'";
      System.out.println("q");
    return exe_sql(q);
  }

  /**
  *Update the row with approve status specified the email 
  *@param String email to search
  *@return boolean true if the query was successful
  */
  public boolean grantedLoan(String email, double val){
    String q = "UPDATE loan SET status='a',creditapproved="+val+" WHERE studentemail='"+email+"'";
    String q2 = "UPDATE student SET  credits = "+val+" WHERE studentemail='"+email+"'";
    System.out.println(q2);
    boolean b1 = exe_sql(q);
    boolean b2 = exe_sql(q2);
    return b1 && b2;
  }

}
