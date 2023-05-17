<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.nexo.service.BolsaProductoService"%>
<%@page import="org.nexo.dao.Product"%>
<%@page import="org.nexo.helper.ProductHelper"%>
<%@page import="org.nexo.service.ProductService"%>
<!-- Variables para la conexión de la base de datos -->
<%@ page import="java.sql.*" %>
<%! Connection con; %>
<%! Statement stmt; %>
<%! ResultSet rs = null; %>

<%
   // Obtener el IdProducto de los parámetros de la URL
   String productId = request.getParameter("productId");

   // Realizar la consulta en la base de datos para obtener los detalles del producto
  
      Class.forName("com.mysql.jdbc.Driver").newInstance();
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DonkeyFoodDB?user=root&password=n0m3l0");
      stmt = con.createStatement();
      String query = "SELECT * FROM Productos WHERE IdProducto = " + productId;
      rs = stmt.executeQuery(query);

      if (rs.next()) {
         // Obtener los datos del producto
         String nombreProducto = rs.getString("NombreProducto");
         String precioProducto = rs.getString("PrecioProducto");
         String descripcionProducto = rs.getString("DescripcionProducto");
         // ... y otros campos

         // Mostrar los detalles del producto
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="icon" href="assets/images/DonkeyFood.png">
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:100,200,300,400,500,600,700,800,900"
      rel="stylesheet"
    />

    <title>DonkeyFood</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/MenuStyle.css" />
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/owl.css" />
    <link rel="stylesheet" href="assets/css/lightbox.css" />
    <!---->

  </head>
<body>
    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <nav class="main-nav">
                <a href="javascript:history.back()">
                <button class="learn-more" style="position: relative; top: 18px;">
                    <span class="circle" aria-hidden="true">
                    <span class="icon arrow"></span>
                    </span>
                    <span class="button-text">Volver</span> 
                </button>
                </a>
                <ul class="nav">
                    <div class="group1">
                        <svg class="iconn" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
                        <input placeholder="Search" type="search" class="input">
                    </div>
                  <li>
                    <a href="FormaPago.jsp"><b>PAGO</b></a>
                  </li>
                  <li >
                    <a href="Bolsa.jsp"><b>BOLSA</b></a>
                  </li>
                  <li>
                    <a href="Seguimiento.jsp"><b>SEGUIMIENTO</b></a>
                  </li>
                  <li>
                    <a href="MenuDF.jsp"><b>MENU</b></a>
                  </li>
                  <li>
                    <a href="Perfil.jsp"><b>PERFIL</b></a>
                  </li>
                </ul>
                <a class="menu-trigger">
                  <span>Menu</span>
                </a>
                <!-- ***** Menu End ***** -->
              </nav>
            </div>
          </div>
        </div>
      </header>
    <div class="TituloProducto">
        <b>
            Tortas
        </b>
    </div>
    <div class="PrecioProducto">
        <b>
             <p><strong>Precio:</strong> <%= precioProducto %></p>
        </b>
    </div>
    <div class="TextProducto">
        <b>
            Ricas y deliciosas tortas listas para llevar y disfrutar
        </b>
    </div>
    <div class="SelectProducto">
        <b>
            <label>Cantidad de producto</label>
            <select id="cant" name="cant">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            </select>
        </b>
    </div>
    <div class="SelectComp">
        <b>
            <label>Complementos</label>
            <select id="Comp" name="Comp">
            <option>Sin complementos</option>                          
            <option value="1">Opcion1</option>
            <option value="2">Opcion2</option>
            <option value="3">Opcion3</option>
            </select>
        </b>
    </div>
    <Button class="AddButton">
        <a href="MenuDF.jsp">
        <%
        BolsaProductoService BPS = new BolsaProductoService();
        BPS.addTortas();
        ProductService PS = new ProductService();
        int Unidades = 50;
        PS.restaProduct(Unidades, 4);
        %>
            <font color="#FFFFFF">AGREGAR E IR AL MENU</font></a>
    </Button>
    <Button class="AddButton2">
        <a href="Bolsa.jsp">
        <%
        BPS.addTortas();
        PS.restaProduct(Unidades, 4);
        %>
            <font color="#FFFFFF">AGREGAR E IR A LA BOLSA</font></a>
    </Button>
    <div class="ImageProducto">
        <img src="assets/images/Tortas.jpg" style="position: absolute; top: 40px; left: 40px; width: 350px; height: 300px;" />
    </div>
</body>
</html>