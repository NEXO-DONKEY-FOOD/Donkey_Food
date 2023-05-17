<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Formulario de pedido</title>
        <style>
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
	<h1>Formulario de pedido</h1>
	<h1>Bienvenido(a) <%= session.getAttribute("correo") %></h1>
        <h3>Rellena el formulario con la lista de compras de productos que deseas obtener
            y los complementos o cosas que deseas en la seccion de notas tambien <h2>ATENCION: añade la fecha y hora al inicio en la nota 
         si no no sera tomado en cuenta</h2> </h3>
	<%
		if (request.getMethod().equals("POST")) {
			// Obtener los datos del formulario
			String correo = request.getParameter("correo");
			String productos = request.getParameter("productos");
			String nota = request.getParameter("nota");
			String estado = "Pedido";

			// Conectar a la base de datos
			String url = "jdbc:mysql://localhost:3306/DonkeyFoodDB?user=root&password=n0m3l0";
			Connection conexion = DriverManager.getConnection(url);

			// Insertar los datos en la tabla "ped"
			PreparedStatement statement = conexion.prepareStatement("INSERT INTO ped (correo, productos, nota, estado) VALUES (?, ?, ?, ?)");
			statement.setString(1, correo);
			statement.setString(2, productos);
			statement.setString(3, nota);
			statement.setString(4, estado);
			int filasAfectadas = statement.executeUpdate();

			// Cerrar la conexión a la base de datos
			conexion.close();
			
			// Mostrar un mensaje de éxito
			%>
				<p>El pedido ha sido guardado exitosamente puedes cerrar esta ventana.</p>
			<%
		} else {
			// Mostrar el formulario
			%>
				<form action="" method="post">
					<label for="correo">Correo (Modificar aqui en caso de error):</label>
					<input type="email" id="correo" name="correo" value="<%= session.getAttribute("correo") %>" required><br><br>
					<label for="productos">Productos:</label>
					<input type="text" id="productos" name="productos" required><br><br>
					<label for="nota">Nota:</label>
					<input type="text" id="nota" name="nota"><br><br>
					<input type="submit" value="Enviar">
				</form>
			<%
		}
	%>
</body>
</html>
