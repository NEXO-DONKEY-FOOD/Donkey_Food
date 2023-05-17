<%@page import="org.nexo.helper.EmpleadoHelper"%>
<%@page import="org.nexo.dao.Empleado"%> 
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
                        if( new EmpleadoHelper( ).getEmpleadoByNum(request) != null)
                        {
                            response.sendRedirect("InicioVen.jsp");
                        }else{
                        %>
                        <script>window.alert("Usuario no encontrado!!");</script>
                        <%
                            }
                        break;
                    default:
            %>
                        <jsp:include page="InicioSesionEmp.jsp" />
            <%
                }
            %>
        
        </body>
</html>