<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
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
           <li><img src="admission.png"><a href="admission.jsp">ADMISSION</a></li>
           <li><img src="transaction.png"><a href="loan.jsp">LOAN</a></li>
           <li><img src="account.png"><a href="about.jsp">ABOUT ME</a></li>
           <li><img src="logout.png"><a href="logout.jsp">LOGOUT</a></li>
        </ul>
    </nav>
    <div class="admission" style="height:auto;  margin-top:140px;margin-bottom:50px;padding-bottom:20px;">
           <h2 style="color:#1C3e58; padding-top:5px;">Request to Admission Office</h2>
        <a href="admission.jsp">
        <button type="button"  class="delete">Add</button>   
   </a>
    </div>
    <div class="admission">
         <h2 style="color:#1C3e58; padding-top:5px;">Request to Loan Office</h2>
        <a href="loan.jsp">
        <button type="button"  class="delete">Add</button>   
   </a>
    </div>
</body>
</html>