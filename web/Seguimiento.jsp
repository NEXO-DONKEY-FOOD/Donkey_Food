<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.nexo.dao.BolsaProducto"%>
<%@page import="org.nexo.helper.BolsaProductoHelper"%>
<%@page import="java.util.List"%>
<%@page import="org.nexo.service.BolsaProductoService"%>
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
    
    <script>
    </script>
  </head>
<body>
            <jsp:include page="Seguimiento.html"/>
            <Button class="AddButton" onclick="CancelarPedido()">
        <a href="MenuDF.jsp">
        <font color="#FFFFFF">CANCELAR</font></a>
        </Button>
            <div class="row" style="position: absolute; top: 200px; left: 100px;">
            <table class="table table-striped table-hover" >
                <thead class="table-primary thead-yellow">
                    <tr>
                        <th>Producto</th>
                        <th>Precio</th>
                        <th>Unidades</th>
                        <th>Precio Final</th>
                    </tr>
                </thead>
<%
    List<BolsaProducto>bolsaproductoList = null;
    bolsaproductoList = new BolsaProductoHelper( ).getList( );
    if( bolsaproductoList == null || bolsaproductoList.size() == 0 )
    {
        return;
    }
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
                    </tr>
                </tbody>
<%
    }
%>
            </table>
        </div>
</body>
</html>