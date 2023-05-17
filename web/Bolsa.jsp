<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.nexo.dao.BolsaProducto"%>
<%@page import="org.nexo.helper.BolsaProductoHelper"%>
<%@page import="org.nexo.service.BolsaProductoService"%>
<%@page import="java.util.List"%>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/MenuStyle.css" />
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/owl.css" />
    <link rel="stylesheet" href="assets/css/lightbox.css" />
    <!---->

    <style>
    .table-striped tbody tr:nth-of-type(odd) {
      background-color: #fff4e7;
    }

    .table-hover tbody tr:hover {
      background-color: #fbe083;
    }

    .thead-yellow {
      background-color: #ffc000;
      color: white;
    }

  </style>
  </head>
  
  <script src="assets/js/Timer.js"></script>
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
    <div class="Total">
    <b>Lista de elementos en la bolsa</b>
    </div>
    <Button class="AddButton1">
        <a href="FormaPago.jsp"><font color="#FFFFFF">PAGAR</font></a>
    </Button>
<%
    List<BolsaProducto>bolsaproductoList = null;
    bolsaproductoList = new BolsaProductoHelper( ).getList( );
    if( bolsaproductoList == null || bolsaproductoList.size() == 0 )
    {
        return;
    }
%>
        <div class="row" style="position: absolute; top: 100px; left: 100px;">
            <table class="table table-striped table-hover" >
                <thead class="table-primary thead-yellow">
                    <tr>
                        <th>Producto</th>
                        <th>Precio</th>
                        <th>Unidades</th>
                        <th>Precio Final</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
<%
    for( BolsaProducto bolsaproducto : bolsaproductoList)
    {
%>
                <tbody>
                    <tr>
                        <td>
                            <b><center><%=bolsaproducto.getProducto()%></center></b>
                        </td>
                        <td>
                            <b><center>$<%=bolsaproducto.getPrecio()%></center></b>
                        </td>
                        <td>
                            <b><center><%=bolsaproducto.getUnidades()%></center></b>
                        </td>
                        <td>
                            <b><center>$<%=bolsaproducto.getPrecioFinal()%></center></b>
                        </td>
                        <td>
                            <img src="assets/images/Basura.png">
                        </td>
                    </tr>
                </tbody>
<%
    }
%>
            </table>
        </div>
</body>
</html>