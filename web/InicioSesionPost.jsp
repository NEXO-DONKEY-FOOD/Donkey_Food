<%@page import="org.nexo.helper.ClienteHelper"%>
    <%@page import="org.nexo.dao.Cliente"%>
        <%@page import="java.util.List"%>
            <%@page contentType="text/html" pageEncoding="UTF-8"%>
                <!DOCTYPE html>
                <html>

                <head>
                    <link rel="icon" href="assets/images/DonkeyFood.png">
                    <title>Entrar a DonkeyFood</title>
                </head>

                <body>
                    <%
                Cliente client = new Cliente();
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
                    case "send":
                        if( new ClienteHelper( ).getClienteByUsr(request) != null)
                        {
                            String aliclient = request.getParameter( "aliclient" );
                            client.setAliClient(aliclient);
                            response.sendRedirect("Donkeyfood.jsp");
                        }else{
                        %>
                        <script>window.alert("Usuario no encontrado!!");</script>
                        <%
                            }
                        break;
                    default:
            %>
                            <jsp:include page="InicioSesion.jsp" />
                            <%
                }
            %>

                </body>

                </html>