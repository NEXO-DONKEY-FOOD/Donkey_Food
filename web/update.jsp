<%@ page import="java.sql.*" %>
<%
	//obtenemos los valores enviados desde el formulario
	String correo = request.getParameter("correo");
	String estado = request.getParameter("estado");

	//realizamos la actualización en la base de datos
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DonkeyFoodDB?user=root&password=1234");
	PreparedStatement stmt = conn.prepareStatement("UPDATE ped SET estado = ? WHERE correo = ?");
	stmt.setString(1, estado);
	stmt.setString(2, correo);
	stmt.executeUpdate();
	stmt.close();
	conn.close();

	//redireccionamos de vuelta a la página principal de pedidos
	response.sendRedirect("Pedidos.jsp");
%>
