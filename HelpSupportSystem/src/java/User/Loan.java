package User;

import DbConnection.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Loan extends User{
    public Loan(String idRollNo, String fullname, String course) {
        super(idRollNo, fullname, course);
    }
    
    @Override
     public String add(String idRollNo, String fullname, String course) {
    Connection con = DbConnection.getConn();
     String sql = "insert into loan(idRollNo, fullname,course,time) values (?,?,?,now());";
    int i = 0;
   try {
      PreparedStatement preparedStatement = con.prepareStatement(sql);
      preparedStatement.setString(1,idRollNo);
      preparedStatement.setString(2, fullname);
      preparedStatement.setString(3, course);
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
