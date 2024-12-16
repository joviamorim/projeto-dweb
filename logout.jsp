<%
    // Remover um atributo específico
    session.removeAttribute("id");
    session.removeAttribute("email");
    session.removeAttribute("tipo");

    // Invalidar a sessão completamente
    //session.invalidate();

    // Redirecionar para uma página (opcional)
    response.sendRedirect("login.jsp");
%>
