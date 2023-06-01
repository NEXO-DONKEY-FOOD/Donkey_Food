<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Detalles del producto</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F6F6F6;
            margin: 0;
            padding: 0;
        }
        a{
            font-family: Arial, sans-serif;
        }
        header {
            background-color: wheat;
            padding: 20px;
            color: black;
        }
        
        h1 {
            margin: 0;
            font-size: 24px;
            font-weight: normal;
        }
        
        .product-container {
            display: flex;
            margin: 20px;
            background-color: white;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }
        
        .product-image {
            flex: 1;
            padding: 20px;
            text-align: center;
        }
        
        .product-image img {
            max-width: 100%;
            height: auto;
        }
        
        .product-details {
            flex: 2;
            padding: 20px;
        }
        
        .product-details h2 {
            font-size: 20px;
            margin-top: 0;
        }
        
        .product-details p {
            margin: 10px 0;
        }
        
        .product-details .price {
            font-size: 18px;
            font-weight: bold;
            color: #B12704;
        }
    </style>
     <style>
        /* Cambios CSS para posicionar la imagen a la izquierda */
        @media (min-width: 768px) {
            .product-container {
                flex-direction: row-reverse;
            }
            
            .product-image {
                text-align: left;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>Detalles del producto</h1>
        <a href="MenuDF.jsp">Volver</a>
    </header>

    <div class="product-container">
        <div class="product-image">
            <% 
           
                int idProducto = Integer.parseInt(request.getParameter("id_p"));
                
                // Definir la cadena de conexión a la base de datos
                String url = "jdbc:mysql://localhost:3306/DonkeyFoodDB?user=root&password=1234";

                // Establecer la conexión
                Connection conn = DriverManager.getConnection(url);

                // Crear la consulta SQL
                String sql = "SELECT * FROM Productos WHERE IdProducto = ?";

                // Preparar la consulta
                PreparedStatement stmt = conn.prepareStatement(sql);

                // Asignar el ID del producto como parámetro
                stmt.setInt(1, idProducto);

                // Ejecutar la consulta
                ResultSet rs = stmt.executeQuery();

                // Mostrar los datos del producto
                if (rs.next()) {
                    int id = rs.getInt("IdProducto");
                    String nombre = rs.getString("NombreProducto");
                    String descripcion = rs.getString("DescripcionProducto");
                    double precio = rs.getDouble("PrecioProducto");
                    String imagen = rs.getString("ImagenProducto");
                    
                    // Mostrar los datos en pantalla
                    out.println("<h2>" + (nombre != null ? nombre : "") + "</h2>");
                    out.println("<p>" + (descripcion != null ? descripcion : "") + "</p>");
                    out.println("<p class='price'>$" + precio + "</p>");
                    out.println("</div>");
                out.println("<img src=\"" + imagen + "\" width=\"790\" height=\"500\" style=\"float: left;\">");

            
                }

                // Cerrar la conexión
                conn.close();
            %>
      
         <div class='product-image'> 
                                                                   
    </div>
</body>
</html>
