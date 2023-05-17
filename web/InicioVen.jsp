<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.nexo.dao.Empleado"%> 
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
    <link rel="stylesheet" href="assets/css/DFoodStyle.css" />
    <link rel="stylesheet" href="assets/css/MenuStyle.css" />
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/owl.css" />
    <link rel="stylesheet" href="assets/css/lightbox.css" />
    <!---->

  </head>
  <header></header>
  <body>
    <!-- ***** Header Area Start ***** -->
    <div>    
            <div class="row" style="background-color: #fbe17d">
                <div class="col-lg-1">
                    <div class="Logo">
                    <img src="assets/images/DonkeyFood.png" width="150px" alt="Logo_DonkeyFood" />
                    </div>
                </div>
                <div class="col-lg-6">
                <div class="Namebox">
                    <font color="#1d134b"><b><center>CENTRO DE ESTUDIOS CIENTIFICOS Y TECNOLOGICOS N°9</center></b></font>
                </div>
                </div>
            </div>
      </div>
    <div style="float:left; margin-left: 50px; margin-top: 30px;">
        <div class="container-sm" style="background: #fff4cc; border-radius: 40px; border-color: #ffcd4b; height: 450px; width: 300px;">
            <center style="font-size: 30px; color: #f28e1a;"><b>Hola<br>Bienvenido</b></center>
            <p style="font-size: 15px; color: #1d134b;">
           <center style="font-size: 30px; color: #f28e1a;"><%= session.getAttribute("correo") %> </center>  <!-- ***** Imprimir datos de la sesion***** -->
            
            </p>
        </div>
    </div>
    <div class="row">
    <div class="col-2">
        <div class="container-sm" style=" margin-left: 200px; margin-top: 50px;">
            <img src="assets/images/Pedidos.png" width="150px" alt="Pedidos">
        </div>
    </div>
        <div class="col-2">    
            <div class="container-sm" style=" margin-left: 500px; margin-top: 50px;">
                <img src="assets/images/Menu.png" width="150px" alt="Pedidos">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-2" style="margin-top: 20px; margin-left: 175px;">
            <a href="Pedidos.jsp" class="btn btn-block"
            style="border-color: #ffcd4b; color: #f28e1a; background-color: #fff2cc; width: 150%;">
            <b>PEDIDOS</b>
            </a>
        </div>
        <div class="col-2" style="margin-top: 20px; margin-left: 295px;">
            <a href="MenuDF.jsp" class="btn btn-block"
            style="border-color: #ffcd4b; color: #f28e1a; background-color: #fff2cc; width: 150%;">
            <b>MENU</b>
            </a>
        </div>
    <div class="row">
    <div class="col-2">
        <div class="container-sm" style=" margin-left: 200px; margin-top: 40px;">
            <img src="assets/images/Inventario.png" width="150px" alt="Pedidos">
        </div>
    </div>
        <div class="col-2">    
            <div class="container-sm" style=" margin-left: 500px; margin-top: 40px;">
                <img src="assets/images/Historial.png" width="150px" alt="Pedidos">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-2" style="margin-top: 20px; margin-left: 175px;">
            <a href="VerInv.jsp" class="btn btn-block"
            style="border-color: #ffcd4b; color: #f28e1a; background-color: #fff2cc; width: 150%;">
            <b>INVENTARIO</b>
            </a>
        </div>
        <div class="col-2" style="margin-top: 20px; margin-left: 295px;">
            <a href="Historial.jsp" class="btn btn-block"
            style="border-color: #ffcd4b; color: #f28e1a; background-color: #fff2cc; width: 150%;">
            <b>HISTORIAL</b>
            </a>
        </div>
    </body>
</html>
