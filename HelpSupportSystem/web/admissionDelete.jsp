<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="javax.servlet.*, javax.servlet.RequestDispatcher"%>
<%
String idRollNo=request.getParameter("idRollNo");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/helpSupport", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM admission WHERE idRollNo='"+idRollNo+"';");
  RequestDispatcher dispatcher = request.getRequestDispatcher("admission.jsp");
      dispatcher.include(request, response);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
