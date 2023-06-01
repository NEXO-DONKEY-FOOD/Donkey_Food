<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Tabla de pedidos</title>
        
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/owl.css" />
    <link rel="stylesheet" href="assets/css/lightbox.css" />
        <style>
 body {
       background: linear-gradient(whitesmoke);
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
	<h2>Tabla de pedidos</h2>
        <h1>Bienvenido(a) <%= session.getAttribute("correo") %></h1>
	<%
		//obtenemos la conexión a la base de datos
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DonkeyFoodDB?user=root&password=1234");

		//obtenemos los registros de la tabla "ped"
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM ped ORDER BY CASE estado " +
                                     "WHEN 'Pedido' THEN 1 " +
                                     "WHEN 'En Proceso' THEN 2 " +
                                     "WHEN 'Listo para Entregar' THEN 3 " +
                                     "WHEN 'Entregado' THEN 4 " +
                                     "ELSE 5 " +
                                     "END");

		//mostramos los registros en una tabla
		out.println("<table border='1'>");
		out.println("<tr><th>Correo</th><th>Productos</th><th>Nota</th><th>Estado</th><th>Acción</th></tr>");
		while (rs.next()) {
			String correo = rs.getString("correo");
			String productos = rs.getString("productos");
			String nota = rs.getString("nota");
			String estado = rs.getString("estado");
			out.println("<tr>");
			out.println("<td>" + correo + "</td>");
			out.println("<td>" + productos + "</td>");
			out.println("<td>" + nota + "</td>");
			out.println("<td>" + estado + "</td>");
			out.println("<td>");
			out.println("<form method='post' action='update.jsp'>");
			out.println("<input type='hidden' name='correo' value='" + correo + "'>");
			out.println("<select name='estado'>");
			out.println("<option value='Pedido' "+ (estado.equals("Pedido") ? "selected" : "") +">Pedido</option>");
			out.println("<option value='En Proceso' "+ (estado.equals("En Proceso") ? "selected" : "") +">En Proceso</option>");
			out.println("<option value='Listo para Entregar' "+ (estado.equals("Listo para Entregar") ? "selected" : "") +">Listo para Entregar</option>");
			out.println("<option value='Entregado' "+ (estado.equals("Entregado") ? "selected" : "") +">Entregado</option>");
			out.println("</select>");
			out.println("<input type='submit' value='Actualizar'>");
			out.println("</form>");
			out.println("</td>");
			out.println("</tr>");
		}
		out.println("</table>");

		//cerramos la conexión a la base de datos
		rs.close();
		stmt.close();
		conn.close();
	%>
</body>
</html>


