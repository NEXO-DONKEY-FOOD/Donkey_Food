<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Eliminar Producto</title>
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
    <h1>Eliminar Producto</h1>

    <%
        String idProductoString = request.getParameter("idProducto");

        if (idProductoString == null) {
            // Mostrar formulario para ingresar ID del producto
    %>
            <form method="get">
                <label for="idProducto">ID del Producto:</label>
                <input type="number" id="idProducto" name="idProducto" required>
                <button type="submit">Eliminar Producto</button>
            </form>
    <%  } else {
            int idProducto = Integer.parseInt(idProductoString);

            Connection connection = null;
            PreparedStatement preparedStatement = null;

            try {
                // Establecer conexión a la base de datos
                String url = "jdbc:mysql://localhost:3306/DonkeyFoodDB?user=root&password=n0m3l0";
                connection = DriverManager.getConnection(url);

                // Eliminar producto de la base de datos
                String query = "DELETE FROM Productos WHERE IdProducto = ?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, idProducto);
                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<p>Producto eliminado correctamente</p>");
                    out.println("<a href=VerInv.jsp>volver</a>");
                } else {
                    out.println("<p>No se pudo eliminar el producto</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    preparedStatement.close();
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
