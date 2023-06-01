<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Lista de Productos</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/owl.css" />
    <link rel="stylesheet" href="assets/css/lightbox.css" />
        <style>
 body {
       background: linear-gradient(white,smoke);
    }

    table {
        border-collapse: collapse;
        width: 100%;
        max-width: 800px;
        margin: 0 auto;
        font-family: Arial, sans-serif;
        background: linear-gradient(45deg, #f7d754, wheat);
        border: 1px solid #ddd;
        height: 200px;
    }

    th {
        background: linear-gradient(45deg, #f5c637, #f7d754);
        color: white;
        font-weight: bold;
        text-align: left;
        padding: 8px;
    }

    td {
        border: 1px solid #ddd;
        padding: 8px;
    }

    tr:nth-child(even) {
        background: linear-gradient(45deg, #f9f9f9, #f2f2f2);
    }
    h1{
         font-family: Arial, sans-serif;
    }
    
    hr {
        border: none;
        background-color: transparent;
    }</style>
</head>
<body>
    <h1>Lista de Productos</h1>
<header class="header-area header-sticky">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <nav class="main-nav">
                <!-- ***** Logo Start ***** -->
                <a href="index.jsp" class="logo">
                     <img src="assets/images/DonkeyFood.png" width="120px" alt="Logo_DonkeyFood">
                  <span>DonkeyFood</span>
                 
                </a>
                <!-- ***** Menu Start ***** -->
                <ul class="nav">
                    <div class="group">
                        <svg class="iconn" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
                       
                    </div>
                  <li>
                    <a href="InicioVen.jsp">Inicio</a>
                  </li>
                    <li>
                    <a href="VerInv.jsp">Inventario</a>
                  </li>
                     <li>
                    <a href="Pedidos.jsp">Pedidos</a>
                     </li>
                        <li>
                    <a href="Historial.jsp">Historial</a>
                  </li><!-- comment -->
                     <li>
                    <a href="MenuDF.jsp">Menu</a>
                  </li><!-- comment -->
                  
                  
              </nav>
    
    
    
                <hr>
    
    <table>
        
         <form action="InvEditar.jsp" method="post">
        <label for="id">ID del Producto:</label>
        <input type="number" name="id"><br>
        <input type="submit" value="Modificar">
    </form>
        <br>
        <a href="InvBaja.jsp">Eliminar</a>
          <br>
        <a href="InvAlta.jsp">Agregar</a>
          <br>
          
          
          
          
          
        <thead>
            <tr>
                <th>ID</th>
                <th>Cantidad</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Descripción</th>
                <th>Detalles</th>
            </tr>
        </thead>
        
        <tbody>
            <% 
                String url = "jdbc:mysql://localhost:3306/DonkeyFoodDB?user=root&password=1234";
                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection = DriverManager.getConnection(url);

                    statement = connection.createStatement();
                    resultSet = statement.executeQuery("SELECT * FROM Productos");

                    while(resultSet.next()) {
                        out.println("<tr>");
                        out.println("<td>" + resultSet.getInt("IdProducto") + "</td>");
                        out.println("<td>" + resultSet.getInt("CantidadProducto") + "</td>");
                        out.println("<td>" + resultSet.getString("NombreProducto") + "</td>");
                        out.println("<td>" + resultSet.getString("PrecioProducto") + "</td>");
                        out.println("<td>" + resultSet.getString("DescripcionProducto") + "</td>");
                       // out.println("<td>" + resultSet.getString("ImagenProducto") + "</td>");
                        out.println("<td>" + resultSet.getString("DetallesProducto") + "</td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        resultSet.close();
                        statement.close();
                        connection.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>

