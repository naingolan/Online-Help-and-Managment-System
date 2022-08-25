<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="DbConnection.DbConnection" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
Connection con = DbConnection.getConn();
Statement statement = null;
ResultSet resultSet = null;
%>
<%session.getAttribute("username");%>
<%session.getAttribute("idRollNo");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="helpSupport.css">
    <title>Homepage</title>
</head>
<body>
    <div class="header">
        <div>
            <img src="IFM_Logo.png">
        </div>
    </div>
     <nav>
        <h2>The Institute Of Finance Managment</h2>
        <ul>
           <li><img src="admission.png"><a href="adminAdmission.jsp">ADMISSION</a></li>
           <li><img src="transaction.png"><a href="adminLoan.jsp">LOAN</a></li>
           <li><img src="account.png"><a href="adminAbout.jsp">ABOUT ME</a></li>
           <li><img src="logout.png"><a href="logout.jsp">LOGOUT</a></li>
        </ul>
    </nav>
   <div class="admission" style="height:auto; background: transparent; margin-top:100px">
                        <table style="background-color:#1C3e58;">
            <thead>
                 <tr>
                     <td>No</td><td>ID NUMBER</td><td>NAME</td><td>COURSE</td><td>TIME</td><td>MANAGE</td>
                </tr>
            </thead>
               <tbody>
                   <%
 int incre=1;
 try{ 
statement=con.createStatement();
String sql ="SELECT * FROM loan ORDER BY time ASC;";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr >
<td><%=(incre++) %></td>
<td><%=resultSet.getString("idRollNo") %></td>
<td><%=resultSet.getString("fullname") %></td>
<td><%=resultSet.getString("course") %></td>
<td><%=resultSet.getString("time") %></td>
<td><a href="adminDeleteLoan.jsp?idRollNo=<%=resultSet.getString("idRollNo") %>"><button type="button"  class="delete">Delete</button></a></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

                </tbody>
                </table>
    </div>
    
    
</body>
</html>