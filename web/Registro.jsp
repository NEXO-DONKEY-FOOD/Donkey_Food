<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!-- Variables para la coneccion de la base de datos-->

<%! Connection con;%>
<%! Statement stmt;%>
<%!ResultSet rs=null; //agregar y cambiar nombre%>

<!-- Variables de entorno para el buscador -->

<%! String Nombre = null;%> 
<%! String Email = null;%>  
<%! String Contrasena = null;%>  

<html lang="en">
  <head>
    <link rel="icon" href="assets/images/DonkeyFood.png">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="assets/css/LogInStyle.css" />
<%         
            String NombreProducto = request.getParameter("Nombre");
          
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DonkeyFoodDB?user=root&password=n0m3l0");
            stmt = con.createStatement();
            
            rs = stmt.executeQuery("select * from Productos where NombreProducto like '%" + NombreProducto + "%'"); //Pon select * from "nombre de la tabla y quitar lo otro"
          String Precio = request.getParameter("PrecioProducto");
          String Imagen = request.getParameter("ImagenProducto");
          String Producto = request.getParameter("NombreProducto");
%> 
    
    <title>Iniciar Sesion</title>
  </head>
  <body>
    <div class="parent">
      <div class="div3">
        <a href="NexoPage.jsp">
        <button class="learn-more" >
          <span class="circle" aria-hidden="true">
          <span class="icon arrow"></span>
          </span>
            <span class="button-text">Volver</span> 
        </button>
        </a>
      </div>
      <div class="div1">
        <div class="flex-wrap">
          <fieldset>
            <form action="Registro.jsp">
              <a href="InicioSesionPost.jsp">
              <input type="text" name="rg" id="sign-in"/>
              </a>
              <input type="radio" name="rg" id="sign-up" value="1" checked/>
              <label for="sign-in">Iniciar sesión</label>
              <label for="sign-up">Registrarse</label>
              <input
                required="true"
                class="sign-up"
                type="nickname"
                placeholder="Nombre"
                name="nombre"
                name="aliclient"
                
                    
              />
              <input
                 required="true"
                class="sign-up"
                type="email"
                placeholder="Email"
                name="correo"
                name="correo"
              />
              <input
                required="true"
                class="sign-up"
                type="password"
                placeholder="Contraseña"
                id="contrasena"
                name="contrasena"
              />
              <input class="sign-in" type="hidden" id="action" name="action" value="send" />
              <button></button>
                <a href="InicioSesionEmpPost.jsp">
            <p style="font-size: 20px; color:#1d134b;">
                INGRESAR COMO VENDEDOR
            </p>
            </a>
                 <form action="" method="post">
        <p>
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" id="nombre">
        </p>
        <p>
            <label for="correo">Correo:</label>
            <input type="text" name="correo" id="correo">
        </p>
        <p>
            <label for="contrasena">Contraseña:</label>
            <input type="password" name="contrasena" id="contrasena">
        </p>
        <p>
            <input type="submit" value="Agregar vendedor">
        </p>
    </form>
            </form>
          </fieldset>
         
        </div>
      </div>
      <div class="div2"> 
        <!--Waves Container-->
        <div style="position: relative; top: 200px">
          <svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
          viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
          <defs>
          <path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
          </defs>
          <g class="parallax">
          <use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(255,255,255,0.7)" />
          <use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.5)" />
          <use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.3)" />
          <use xlink:href="#gentle-wave" x="48" y="7" fill="#fff" />
          </g>
          </svg>
          </div>
          <!--Waves end-->
        </div>
      </div>
  </body>
</html>
