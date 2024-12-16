<%@ page import="java.sql.*" %>
<%@ include file="conectar.jsp" %>
<%
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    PreparedStatement stmt = conexao.prepareStatement("SELECT id, email, senha, tipo FROM Usuario WHERE email = ? AND senha = ?");
    stmt.setString(1, email);
    stmt.setString(2, senha);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
        String id = rs.getString("id");
        String tipo = rs.getString("tipo");

        session.setAttribute("id", id);
        session.setAttribute("email", email);
        session.setAttribute("tipo", tipo);

        if(tipo.equals("ADMIN")) {
            response.sendRedirect("LoginAdmin.jsp");
        } else {
            response.sendRedirect("loginUsuario.jsp");
        }

    } else {
        out.println("<script>alert('Usuário ou senha incorretos!');window.location='login.jsp';</script>");
    }

    rs.close();
    stmt.close();
%>