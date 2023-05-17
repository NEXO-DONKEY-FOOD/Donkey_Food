<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Iniciar sesión</title>
</head>
<style>
 body {
  background: linear-gradient(60deg, #f7d759 0%, #f6c90e 100%);
}

form {
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
  background-color: #3e8e41;
}

      
      </style>
<body>

    <h1>Iniciar sesión</h1>
    <form action="iniciar_sesion.jsp" method="post">
        <label for="correo">Correo:</label>
        <input type="text" id="correo" name="correo"><br><br>
        <label for="contrasena">Contraseña:</label>
        <input type="password" id="contrasena" name="contrasena"><br><br>
        <input type="submit" value="Iniciar sesión">
    </form>
<%
    
    // Obtener los datos del formulario
    String correo = request.getParameter("correo");
    String contrasena = request.getParameter("contrasena");
    String nombre = request.getParameter("nombre");
    // Verificar si los datos de inicio de sesión son válidos
    if (correo != null && contrasena != null) {
        // Conectar a la base de datos
        String url = "jdbc:mysql://localhost:3306/DonkeyFoodDB?user=root&password=n0m3l0";
        Connection conn = DriverManager.getConnection(url);

        // Consultar la base de datos
        String sql = "SELECT * FROM Usuarios WHERE Correo = ? AND Contrasena = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, correo);
        stmt.setString(2, contrasena);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            // Crear una sesión para el usuario
            session = request.getSession(true);
            session.setAttribute("correo", correo);
            session.setAttribute("nombre", nombre);

            // Redirigir al usuario a la página de bienvenida
            response.sendRedirect("MenuDF.jsp");
        } else {
            out.println("Correo o contraseña incorrectos.");
        }

        // Cerrar la conexión y liberar los recursos
        rs.close();
        stmt.close();
        conn.close();
    }
%>
</body>
</html>

