<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> <!-- Importacion de librerias -->

<!-- Variables para la coneccion de la base de datos-->

<%! Connection con;%>
<%! Statement stmt;%>
<%!ResultSet rs=null; //agregar y cambiar nombre%>

<!-- Variables de entorno para el buscador -->

<%! String Busqueda = null;%> 
<%! String ImagenProducto = null;%>  
<%! String PrecioProducto = null;%>  
<%! String DescripcionProducto = null;%>
<%! String NombreProducto = null;%>  



<!DOCTYPE html>
<html lang="en">
  <head>
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
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/owl.css" />
    <link rel="stylesheet" href="assets/css/lightbox.css" />
    <!---->

  </head>
<body>
    
    <!-- Coneccion a la base de datos -->

    <%
        
 
          String NombreProducto = request.getParameter("Nombre");
        
          
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DonkeyFoodDB?user=root&password=n0m3l0");
            stmt = con.createStatement();
            
            rs = stmt.executeQuery("select * from Productos"); //Pon select * from "nombre de la tabla y quitar lo otro"
          String Precio = request.getParameter("PrecioProducto");
          String Imagen = request.getParameter("ImagenProducto");
          String Producto = request.getParameter("NombreProducto");
          
    %> 
    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <nav class="main-nav">
                <!-- ***** Logo Start ***** -->
              <a href="index.jsp" class="logo">
                     <img src="assets/images/DonkeyFood.png" width="130px" alt="Logo_DonkeyFood">
                  <span>DonkeyFood</span>
                 
                </a>
                <!-- ***** Menu Start ***** -->
                <ul class="nav">
                    <div class="group">
                        
                       
                    </div>
                
                  <li>
                    <a href="index.jsp">Inicio</a>
                  </li>
                       
                  
                  <li>
                    <a href="index.jsp#contact-section">Contactanos</a>
                  </li>
  <li>
                        <a href="Bolsaa.jsp">Tus pedidos</a>
                  </li>        
                   <li>
                    <a><%= session.getAttribute("correo") %></a>
                  </li>
                </ul>
                <a class="menu-trigger">
                  <span>Menu</span>
                </a>
                <!-- ***** Barra Del buscador ***** -->
                 <form action="MenuAntiguo.jsp">
                 <input  placeholder="Search" type="search" name="Nombre"class="input"> <button>🔎</button>
                
                 </form>
                <style>
  .input {
    display: inline-block;
    width: calc(100% - 90px); /* Ajusta el ancho del input según tus necesidades */
    margin-right: 5px;
  }

  .button {
    display: inline-block;
    
  }
</style>
                <!-- ***** Menu End ***** -->
              </nav>
            </div>
          </div>
        </div>
      </header>
      <!-- ***** Header Area End ***** -->
   
      <div class="parent">
          
          
          
           <hr><hr><hr><hr> <hr><hr><hr><hr><hr>
      
          <!-- ***** Resultados de la barra de busqueda ***** -->
       
             <% 
            while (rs.next()){
          
            Imagen=rs.getString("ImagenProducto");
            Producto=rs.getString("NombreProducto");
           // DescripcionProducto=rs.getString("DescripcionProducto");
            Precio =rs.getString("PrecioProducto");
             %>
            
             <div class="card">
                 <div> <a href="VerProducto.jsp?id_p=<%= rs.getInt("IdProducto") %>"><img src= <% out.println(Imagen); %> ;  class="card-img"></div>
            <div class="card-info">
              <p class="text-title">  <% out.println(Producto); %> </p>   <!-- ***** Nombre producto ***** -->
              <p id="nombre-producto" class="text-body"> <% //out.println(DescripcionProducto);  %> </p> 
              <span class="text-title"> $ <% out.println(Precio); %> </span><!-- ***** Descripcion ***** -->  </a>

            </div>
            <div class="card-footer">
                
               <!-- ***** Precio ***** -->
            <div class="card-button">
                 <a onclick="abrirVentana()"> 
              <svg class="svg-icon" viewBox="0 0 20 20">
                <path d="M17.72,5.011H8.026c-0.271,0-0.49,0.219-0.49,0.489c0,0.271,0.219,0.489,0.49,0.489h8.962l-1.979,4.773H6.763L4.935,5.343C4.926,5.316,4.897,5.309,4.884,5.286c-0.011-0.024,0-0.051-0.017-0.074C4.833,5.166,4.025,4.081,2.33,3.908C2.068,3.883,1.822,4.075,1.795,4.344C1.767,4.612,1.962,4.853,2.231,4.88c1.143,0.118,1.703,0.738,1.808,0.866l1.91,5.661c0.066,0.199,0.252,0.333,0.463,0.333h8.924c0.116,0,0.22-0.053,0.308-0.128c0.027-0.023,0.042-0.048,0.063-0.076c0.026-0.034,0.063-0.058,0.08-0.099l2.384-5.75c0.062-0.151,0.046-0.323-0.045-0.458C18.036,5.092,17.883,5.011,17.72,5.011z"></path>
                <path d="M8.251,12.386c-1.023,0-1.856,0.834-1.856,1.856s0.833,1.853,1.856,1.853c1.021,0,1.853-0.83,1.853-1.853S9.273,12.386,8.251,12.386z M8.251,15.116c-0.484,0-0.877-0.393-0.877-0.874c0-0.484,0.394-0.878,0.877-0.878c0.482,0,0.875,0.394,0.875,0.878C9.126,14.724,8.733,15.116,8.251,15.116z"></path>
                <path d="M13.972,12.386c-1.022,0-1.855,0.834-1.855,1.856s0.833,1.853,1.855,1.853s1.854b-0.83,1.854-1.853S14.994,12.386,13.972,12.386z M13.972,15.116c-0.484,0-0.878-0.393-0.878-0.874c0-0.484,0.394-0.878,0.878-0.878c0.482,0,0.875,0.394,0.875,0.878C14.847,14.724,14.454,15.116,13.972,15.116z"></path>
              </svg>
              
          Pedir</a>
           </div>
             
<script>
function abrirVentana() {
  window.open("OrdenaYa.jsp", "ventanaEjemplo", "width=600,height=400");
  
}
</script>

            
          
          </div></div> 
        
        <% 
            
            //  out.println("<form action = MenuDF> <input placeholder=Search type=search name=Nombre class=input> <form>");
             // rs = stmt.executeQuery("Insert into ");
             
             } %>
     
        </div>
</body>
</html>