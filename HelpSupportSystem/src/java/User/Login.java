package User;

import DbConnection.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Login extends User {

    public Login(String idRollNo, String password) {
        super(idRollNo, password);
    }

    public Login(String idRollNo, String password, String fullname, String course) {
        super(idRollNo, password, fullname, course);
    }
     
    
    @Override
    public String login(String idRollNo, String password) {
    Connection con = DbConnection.getConn();
    int i = 0;
   try {
     Statement stmt=con.createStatement(); 
     ResultSet rs=stmt.executeQuery("select idRollNo, password from user where idRollNo='"+idRollNo+"' and password='"+password+"';");  
     while(rs.next())
      i++;
    } catch (SQLException e) {
    }
    if (i != 0) {
      return "User is registered";
    } else {
      return "Error!!!!";
    }   
  }
       @Override
    public String admin(String idRollNo, String password) {
    Connection con = DbConnection.getConn();
    int i = 0;
   try {
     Statement stmt=con.createStatement(); 
     ResultSet rs=stmt.executeQuery("select idRollNo, password from admin where idRollNo='"+idRollNo+"' and password='"+password+"';");  
     while(rs.next())
      i++;
    } catch (SQLException e) {
    }
    if (i != 0) {
      return "User is registered";
    } else {
      return "Error!!!!";
    }   
  }


    @Override
    public String register(String idRollNo, String password, String fullname, String course) {
   Connection con = DbConnection.getConn();
    String sql = "insert into user(idRollNo, password,fullname, course) values (?,?,?,?) ";
    int i = 0;
    try {
      PreparedStatement preparedStatement = con.prepareStatement(sql);
      preparedStatement.setString(1, idRollNo);
      preparedStatement.setString(2, password);
      preparedStatement.setString(3, fullname);  
      preparedStatement.setString(4, course);
      i = preparedStatement.executeUpdate();
    } catch (SQLException e) {
    }
    if (i != 0) {
      return "User is registered";
    } else {
      return "Error!!!!";
    }   
  }
}
    
