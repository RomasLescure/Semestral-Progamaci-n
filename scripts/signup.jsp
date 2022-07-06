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
        response.sendRedirect("..\\sites\\login.html");//usamos 2 back slash para hacer uso de la tenica escape sequence, este nos permite colocar la dirección del archivo para la redirección
    %>
</body>
</html>