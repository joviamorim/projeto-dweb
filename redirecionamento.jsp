<%
    String tipo = (String) session.getAttribute("tipo");
    if(tipo == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    if(tipo.equals("ADMIN")) {
        response.sendRedirect("loginAdmin.jsp");
    }
    if(tipo.equals("USER")) {
        response.sendRedirect("loginUsuario.jsp");
    }

%>