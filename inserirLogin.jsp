<%@ page import="java.sql.*" %>
<%@ include file="conectar.jsp" %>
<%
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    PreparedStatement stmt = conexao.prepareStatement("SELECT email, senha FROM Usuario WHERE email = ? AND senha = ?");
    stmt.setString(1, email);
    stmt.setString(2, senha);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
        // use este treço para implementar a sessão
        //
        //
        response.sendRedirect("index.html");
    } else {
        out.println("<script>alert('Usuário ou senha incorretos!');window.location='login.jsp';</script>");
    }

    rs.close();
    stmt.close();
%>