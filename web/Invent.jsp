<%@ page import="java.sql.*" %>
<%
    // Conectarse a la base de datos
    String url = "jdbc:mysql://localhost:3306/DonkeyFoodDB?user=root&password=n0m3l0";
    Connection conn = DriverManager.getConnection(url);
    
    // Si se ha enviado el formulario de creación de un nuevo producto
    if (request.getParameter("crear") != null) {
        String nombre = request.getParameter("nombre");
        String precio = request.getParameter("precio");
        String descripcion = request.getParameter("descripcion");
        String imagen = request.getParameter("imagen");
        String detalles = request.getParameter("detalles");
        
        // Crear la consulta SQL para insertar el nuevo producto
        String sql = "INSERT INTO Productos (CantidadProducto, NombreProducto, PrecioProducto, DescripcionProducto, ImagenProducto, DetallesProducto) VALUES (0, ?, ?, ?, ?, ?)";
        
        // Preparar la consulta
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, nombre);
        pstmt.setString(2, precio);
        pstmt.setString(3, descripcion);
        pstmt.setString(4, imagen);
        pstmt.setString(5, detalles);
        
        // Ejecutar la consulta
        pstmt.executeUpdate();
        
        // Redirigir a la página de listado de productos
        response.sendRedirect(request.getRequestURI());
        return;
    }
    
    // Si se ha enviado el formulario de edición de un producto existente
    if (request.getParameter("editar") != null) {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String precio = request.getParameter("precio");
        String descripcion = request.getParameter("descripcion");
        String imagen = request.getParameter("imagen");
        String detalles = request.getParameter("detalles");
        
        // Crear la consulta SQL para actualizar el producto existente
        String sql = "UPDATE Productos SET NombreProducto=?, PrecioProducto=?, DescripcionProducto=?, ImagenProducto=?, DetallesProducto=? WHERE IdProducto=?";
        
        // Preparar la consulta
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, nombre);
        pstmt.setString(2, precio);
        pstmt.setString(3, descripcion);
        pstmt.setString(4, imagen);
        pstmt.setString(5, detalles);
        pstmt.setInt(6, id);
        
        // Ejecutar la consulta
        pstmt.executeUpdate();
        
        // Redirigir a la página de listado de productos
        response.sendRedirect(request.getRequestURI());
        return;
    }
    
    // Si se ha enviado la solicitud de eliminación de un producto existente
    if (request.getParameter("eliminar") != null) {
        int id = Integer.parseInt(request.getParameter("eliminar"));
        
        // Crear la consulta SQL para eliminar el producto existente
        String sql = "DELETE FROM Productos WHERE IdProducto=?";
        
        // Preparar la consulta
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        
        // Ejecutar la consulta
        pstmt.executeUpdate();
        
        // Redirigir a la página de listado de productos
        response.sendRedirect(request.getRequestURI());
        return;
    }
    
    // Obtener la lista de productos
    String sql = "SELECT * FROM Productos";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
%>
<html>
<head>
    <title>CRUD de productos</title>
</head>
<body>
    <h1>CRUD de productos</h1
