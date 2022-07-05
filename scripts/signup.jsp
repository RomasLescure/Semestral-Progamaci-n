<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sing Up</title>
</head>
<body>
	<%@page import="java.sql.*" %>
	<%  
        // Form data
        String usuario = request.getParameter("user");
    	String apellido = request.getParameter("surn");
    	String edad = request.getParameter("age");
        String contrasena = request.getParameter("pass");

        // DB Connect
        Class.forName("com.mysql.jdbc.Driver");
        Connection dbconnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/solocienciaDB","root","");
        Statement dbstatement = dbconnect.createStatement();
        String insertsql = "INSERT INTO accounts (username,surname,age,password) values('"+usuario+"','"+apellido+"','"+edad+"','"+contrasena+"')";
        dbstatement.executeUpdate(insertsql);
        response.sendRedirect("..\\sites\\login.html");
    %>
</body>
</html>