<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina Inicial</title>
</head>
<body>
    


<h1>HOME</h1>
<%
String usuario = (String) session.getAttribute("usuario");
if(usuario == null){
    response.sendRedirect("login.jsp");
}else{
out.print("Bem vindo, "+usuario+ "<br/>");
}
%>

<br/> <a href="deslogar.jsp">deslogar</a>




</body>
</html>

