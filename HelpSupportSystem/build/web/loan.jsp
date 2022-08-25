<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="DbConnection.DbConnection" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="User.Admission"%>
<%@ page isELIgnored="false"%>
<%
Connection con = DbConnection.getConn();
Statement statement = null;
ResultSet resultSet = null;
String idRollNo=(String)session.getAttribute("idRollNo");

%>

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
           <li><img src="admission.png"><a href="admission.jsp">ADMISSION</a></li>
           <li><img src="transaction.png"><a href="loan.jsp">LOAN</a></li>
           <li><img src="account.png"><a href="about.jsp">ABOUT ME</a></li>
           <li><img src="logout.png"><a href="logout.jsp">LOGOUT</a></li>
        </ul>
    </nav>
    <div class="admission" style="height:auto; background: transparent; margin-top:100px">
                    <table>
            <thead  >
                 <tr class="#topLine" >
                     <td style="background-color:#1C3e58; color:#fff">No</td><td style="background-color:#1C3e58; color:#fff">ID NUMBER</td><td style="background-color:#1C3e58; color:#fff">NAME</td><td style="background-color:#1C3e58; color:#fff">COURSE</td><td style="background-color:#1C3e58; color:#fff">TIME</td><td style="background-color:#1C3e58; color:#fff">MANAGE</td>
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

<td style="background:#fff;">
    <% if(idRollNo.equals((String)resultSet.getString("idRollNo"))){ %>
    <a href="loanDelete.jsp?idRollNo=<%=resultSet.getString("idRollNo") %>">
        <button type="button"  class="delete">Delete</button> 
    </a>
    <% } %> 
</td>

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
    <div class="admission">
<%
try{ 
statement=con.createStatement();
String sql ="SELECT * FROM user where idRollNo='"+idRollNo+"';";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
        <h2 style="color:#1C3e58; padding-top:5px;">Request to Loan Office</h2>
        <a href="LoanRequest?fullname=<%=resultSet.getString("fullname")%>&idRollNo=<%=resultSet.getString("idRollNo")%>&course=<%=resultSet.getString("course")%>">
        <button type="button"  class="delete">Add</button>   
   </a>
<% 
}
} catch (Exception e) {
e.printStackTrace();
}
%>
    </div>
</body>
</html>