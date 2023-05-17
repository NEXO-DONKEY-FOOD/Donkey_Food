<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.nexo.dao.Cliente"%> 
<%@page import="org.nexo.helper.ClienteHelper"%> 
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
    <%
    Cliente cliente = new Cliente();
    ClienteHelper client = new ClienteHelper();
    
    client.getClienteData(cliente.getAliClient());
    %>  
    <div class="MiInfo">
        <b>
            <font color="#1d134b">
            MI INFORMACIÓN
            </font>
        </b>
    </div>
    <div class="MiName">
        <b>
            NOMBRE DE USUARIO: <%= session.getAttribute("correo") %>
        </b>
            <p><%%></p>
    </div>
    <div class="MiEmail">
        <b>
            CORREO ELECTRONICO:
        </b>
            <%= session.getAttribute("correo") %>
    </div>
                
    </div>
     <Button class="AddButton3">
       <font color="#FFFFFF">MODIFICAR INFORMACIÓN</font>
    </Button>
    <div class="UserPhoto">
        <img src="assets/images/user.png" width="300" height="300">
    </div>
</body>
</html>