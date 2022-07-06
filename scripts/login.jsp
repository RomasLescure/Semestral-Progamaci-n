<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log In</title>
<link rel="stylesheet" href="..\styles\styles.css">
</head>
<body class="portal">
    <header>
        <img id="logo" src="..\media\logo1.png">
        <div>
            <h2>
                solociencia.com
            </h2>
        </div>
    </header>
    <section class="filler">
        <div class="full">
            <br><br><h3>Inicio de sesion</h3><br><br>
            <div class="inside">
                <form method="post" action="login.jsp">
                    <label for="usuario">Usuario<br></label>
                    <input type="text" id="usuario" name="user" required><br>
                    <br>
                    <label for="clave">Contrase&ntildea<br></label>
                    <input type="password" id="clave" name="pass" required><br>
                    <br><br>
                    <button  class="button" value="Submit">
                        Login
                    </button>
                </form>
                <%@page import="java.sql.*" %>
                <%  
                    // Form data
                    String usuario = request.getParameter("user");
                    String contrasena = request.getParameter("pass");

                    // DB Connect
                    Class.forName("com.mysql.jdbc.Driver"); //
                    Connection dbconnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/solocienciaDB","root","");
                    
                    try //el trycatch aqui se encarga de intentar este bloque que valida la existencia del usuario, si esta no existe tiene dos posibles respuestas predeterminadas
                                //mediante el catch 
                    {
                    PreparedStatement vQuery = dbconnect.prepareStatement("SELECT * FROM accounts WHERE username=? AND password=?");
                    vQuery.setString(1, usuario);
                    vQuery.setString(2, contrasena);
                    
                    ResultSet result = vQuery.executeQuery();
                    
                    if(result.next()){
                    	response.sendRedirect("..\\sites\\home.html");
                    }
                    else
                        out.print("<p class='error'>Error: Usuario o contrase&ntildea invalidos<br>");
                    } catch (Exception err)
                    {
                        out.print("<p class='error'>[       ERROR       ]<br>[ Consulta invalida ]<br>");
                    }
                    
                %>
                <hr>Si no tiene una cuenta, se puede registrar <a href="..\sites\signup.html">aqui</a>.<hr>
                </div>
            </div>
        </section>
    </body>
    </html>