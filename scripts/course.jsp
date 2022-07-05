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
        String nombre = request.getParameter("name");
    	String cedula = request.getParameter("cid");
    	String fecha = request.getParameter("start");
        int curso = Integer.parseInt(request.getParameter("course"));

        // DB Connect
        Class.forName("com.mysql.jdbc.Driver");
        Connection dbconnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/solocienciaDB","root","");
        Statement dbstatement = dbconnect.createStatement();
		
        String table = "";
        
        if (curso == 1) {
        	table = "curso_cienciasnaturales";
        }
        else if (curso == 2) {
        	table = "curso_quimicabiologia";
        }
        else if (curso == 3) {
            table = "curso_programacion";
        }
        
        String insertsql = "INSERT INTO "+table+" (name,cid,startdate) values('"+nombre+"','"+cedula+"','"+fecha+"')";
        dbstatement.executeUpdate(insertsql);
        
        response.sendRedirect("..\\sites\\home.html");
    %>
</body>
</html>