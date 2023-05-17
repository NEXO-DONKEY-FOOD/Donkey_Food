<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.nexo.dao.Product"%>
<%@page import="org.nexo.helper.ProductHelper"%>
<%@page import="org.nexo.service.ProductService"%>
<%@page import="java.util.List"%>

<html>
    <head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <link rel="stylesheet" href="assets/css/DFoodStyle.css" />
    <link rel="stylesheet" href="assets/css/MenuStyle.css" />
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/owl.css" />
    <link rel="stylesheet" href="assets/css/lightbox.css" />
        <title>Añadir nuevo producto</title>
        
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
    <body>
            <div class="row">
                <div class="col-lg-1">
        <a href="InicioVen.jsp">
        <button class="learn-more" style="margin-top: 40px; margin-left: 100px">
          <span class="circle" aria-hidden="true">
          <span class="icon arrow"></span>
          </span>
            <span class="button-text">Volver</span> 
        </button>
        </a>
                </div>
                <div class="col-lg-6">
                <div class="Namebox">
                    <font color="#1d134b"><b><center>CENTRO DE ESTUDIOS CIENTIFICOS Y TECNOLOGICOS N°9</center></b></font>
                </div>
                </div>
            </div>
        <div class="row">
            <div class="col-sm" style="margin-top: 100px; margin-left: 100px;">
                <a href="?action=nuevo">
                    <button type="button" class="btn btn-outline-primary" 
                            style="border-color: #1d134b; color: #ffffff; background-color: #1d134b; width: 100%; max-width:388px; margin-top: 10px; ">
                            AÑADIR</button>
                </a>
                <a href="?action=cambiar">
                    <button type="button" class="btn btn-outline-primary" 
                            style="border-color: #1d134b; color: #ffffff; background-color: #1d134b; width: 100%; margin-top: 10px; max-width:388px">
                            CAMBIAR</button>
                </a>
                <a href="?action=eliminar">
                    <button type="button" class="btn btn-outline-primary" 
                            style="border-color: #1d134b; color: #ffffff; background-color: #1d134b; width: 100%; margin-top: 10px; max-width:388px">
                            ELIMINAR</button>
                </a>
            </div> 
<%
    List<Product>productList = null;
    productList = new ProductHelper( ).getList( );
    if( productList == null || productList.size() == 0 )
    {
%>
<%            
        return;
    }
%>

            <table class="table table-striped table-hover"
                   style="
                    max-height: 1000px; 
                    max-width: 700px; 
                    float: right; 
                    margin-right: 150px;
                    margin-top: 100px;">
                <thead class="table-primary thead-yellow">
                    <tr>
                        <th>ID</th>
                        <th>PRODUCTO</th>
                        <th>UNIDADES</th>
                        <th>PRECIO</th>
                    </tr>
                </thead>
<%
    for( Product product : productList)
    {
%>
                <tbody>
                    <tr>
                        <td>
                            <%=product.getIdProd()%>
                        </td>
                        <td>
                            <%=product.getNomProd()%>
                        </td>
                        <td>
                            <%=product.getUniProd()%>
                        </td>
                        <td>
                            $<%=product.getPreProd()%>
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
