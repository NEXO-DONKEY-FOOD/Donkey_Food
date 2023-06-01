
<%@ page import="java.sql.*" %> 
<%@page import="java.io.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DonkeyFoodDB?user=root&password=1234");

        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        stmt = conn.prepareStatement("INSERT INTO Usuarios (Correo, Nombre, Contrasena) VALUES (?, ?, ?)");
        stmt.setString(2, nombre);
        stmt.setString(1, correo);
        stmt.setString(3, contrasena);
        stmt.executeUpdate();

        //        out.println("<h2>El vendedor ha sido agregado correctamente.</h2>");

    } catch (SQLException ex) {
        out.println("<h2>Ocurrió un error al agregar el vendedor.</h2>");
        out.println("<p>Error: " + ex.getMessage() + "</p>");
    } catch (ClassNotFoundException ex) {
        out.println("<h2>Ocurrió un error al agregar el vendedor.</h2>");
        out.println("<p>Error: " + ex.getMessage() + "</p>");
    } finally {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException ex) {
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
            }
        }
    }
%>

<html>
<head>
    <title>Formulario para agregar un vendedor</title>
     
   <style>
 
  /* Centrar el formulario */
body {
  background: linear-gradient(60deg, #f7d759 0%, #f6c90e 100%);
}

form {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background-color: rgba(255, 255, 255, 0.5);
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
  margin: auto;
  max-width: 500px;
  padding: 20px;
}

form input, form textarea {
  background-color: #f2f2f2;
  border: none;
  border-radius: 5px;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
  font-family: 'Open Sans', sans-serif;
  font-size: 16px;
  padding: 10px;
  margin-bottom: 10px;
  width: 100%;
}

form button {
  background-color: #4CAF50;
  border: none;
  border-radius: 5px;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
  color: white;
  cursor: pointer;
  font-family: 'Open Sans', sans-serif;
  font-size: 16px;
  padding: 10px 20px;
}

form button:hover {
  background-color: #ffff;
}

  .volver-btn {
  display: inline-block;
  background-color: #1a2e46;
  color: #fff;
  padding: 10px 20px;
  border-radius: 5px;
  text-decoration: none;
  font-size: 16px;
  transition: background-color 0.3s ease;
}

.volver-btn:hover {
  background-color: #305e8e;
}

.flecha {
  margin-left: 5px;
}
header {
			background-color: #d4af37;
			color: white;
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding: 20px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
		}
		
		.logo {
			font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
			font-weight: bold;
			font-style: italic;
			font-size: 2em;
		}
		
		.menu {
			display: flex;
			align-items: center;
		}
		
		.menu a {
			font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
			color: white;
			text-decoration: none;
			margin-left: 20px;
			font-size: 1.2em;
			font-weight: bold;
			font-style: italic;
		}
</style>
</head>

<body>
    <header>
                        
        	 <center> <div class="logo">DonkeyFood</div> </center>

		<div class="menu">
			<a href="index.jsp">Inicio</a>
			
			<a href="InicioU.jsp">Iniciar Sesion</a>
</div>
          </header>
   
  <center> <h2>.</h2> </center>

    <form action="RegistroU.jsp" method="post">
    <center> <h2>Registro de Usuario</h2> </center>
        <p>
            <label for="nombre">Nombre:</label>
            <input "class="sign-in" type="nickname" name="nombre" id="nombre">
        </p>
        <p>
            <label for="correo">Correo:</label>
            <input type="text" name="correo" id="correo">
        </p>
        <p>
            <label for="contrasena">Contraseña:</label>
            <input type="password" name="contrasena" id="contrasena">
        </p>
        <p>
            <input type="submit" value="Enviar">
        </p>
    </form>
</body>
</html>


