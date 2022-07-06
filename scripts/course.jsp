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
        int curso = Integer.parseInt(request.getParameter("course")); //esta variable recoge el valor de course dentro de los 3 html's con formularios

        // DB Connect
        Class.forName("com.mysql.jdbc.Driver");
        Connection dbconnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/solocienciaDB","root","");
        Statement dbstatement = dbconnect.createStatement();
		
        String table = "";//se crea un string table para almacenar el nombre de la tabla correspondiente
        
        //esta condicion recoge el valor regresado por los formularios 
        //y dependiendo del valor encontrado este asignara el nombre al string table para luego colocarlo en la insercion para la bd-->
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
        
        response.sendRedirect("..\\sites\\home.html");//usamos 2 back slash para hacer uso de la tenica escape sequence, este nos permite colocar la dirección del archivo para la redirección
    %>
</body>
</html>