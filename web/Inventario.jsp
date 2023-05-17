<%@page import="org.nexo.helper.ProductHelper"%>
<%@page import="org.nexo.dao.Product"%> 
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/DFoodStyle.css" />
        <link rel="stylesheet" href="assets/css/MenuStyle.css" />
        <link rel="stylesheet" href="assets/css/fontawesome.css" />
        <link rel="stylesheet" href="assets/css/style.css" />
        <link rel="stylesheet" href="assets/css/owl.css" />
        <link rel="stylesheet" href="assets/css/lightbox.css" />
        <link rel="icon" href="assets/images/DonkeyFood.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inventario</title>
    </head>
            <%
                if( request == null )
                {
                    return;
                }
                String action = request.getParameter( "action" );
                if( action == null )
                {
                    action = "";
                }
                switch( action )
                {
                    case "nuevo":
            %>
                        <jsp:include page="InventAdd.jsp" />
            <%
                    break;
                    case "eliminar":
            %>
                        <jsp:include page="InventDel.jsp" />
            <%
                        break;
                    case "cambiar":
            %>
                        <jsp:include page="InventCam.jsp" />
            <%
                        break;
                    case "send":
                        if( new ProductHelper( ).addProduct(request) )
                        {
                            response.sendRedirect("Inventario.jsp");
                        }
                    case "delete":
                        if( new ProductHelper( ).deleteProduct(request) )
                        {
                            response.sendRedirect("Inventario.jsp");
                        }
                        break;  
                    case "change":
                        if( new ProductHelper( ).updateProduct(request) )
                        {
                            response.sendRedirect("Inventario.jsp");
                        }
                        break;  
                    default:
            %>
                        <jsp:include page="InventTable.jsp" />
            <%
                }
            %>
</html>
