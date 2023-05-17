<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DonkeyFoodDB?user=root&password=n0m3l0");
        
        int idProducto = Integer.parseInt(request.getParameter("id"));
        pstmt = con.prepareStatement("SELECT * FROM Productos WHERE IdProducto = ?");
        pstmt.setInt(1, idProducto);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            String nombreProducto = rs.getString("NombreProducto");
            int cantidadProducto = rs.getInt("CantidadProducto");
            String precioProducto = rs.getString("PrecioProducto");
            String descripcionProducto = rs.getString("DescripcionProducto");
            String imagenProducto = rs.getString("ImagenProducto");
            String detallesProducto = rs.getString("DetallesProducto");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Producto</title>
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
    <h1>Modificar Producto</h1>
    
    <form action="ActInv.jsp" method="post">
        <input type="hidden" name="id" value="<%= idProducto %>">
        <label for="nombre">Nombre del Producto:</label>
        <input type="text" name="nombre" value="<%= nombreProducto %>"><br>
        <label for="cantidad">Cantidad:</label>
        <input type="number" name="cantidad" value="<%= cantidadProducto %>"><br>
        <label for="precio">Precio:</label>
        <input type="text" name="precio" value="<%= precioProducto %>"><br>
        <label for="descripcion">Descripción:</label>
        <input type="text" name="descripcion" value="<%= descripcionProducto %>"><br>
        <label for="imagen">Imagen:</label>
        <input type="text" name="imagen" value="<%= imagenProducto %>"><br>
        <label for="detalles">Detalles:</label>
        <input type="text" name="detalles" value="<%= detallesProducto %>"><br>
        <input type="submit" value="Guardar Cambios">
    </form>
</body>
</html>
<%
        } else {
            out.println("Producto no encontrado.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>




