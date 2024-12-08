<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, javax.servlet.*, javax.servlet.http.*"%>
<%@include file="conectar.jsp"%>

<%
    String idStr = request.getParameter("id");
    if (idStr != null && !idStr.isEmpty()) {
        int id = Integer.parseInt(idStr);  

        Connection conn = (Connection) pageContext.getAttribute("conexao");
        PreparedStatement stmt = null;

        try {
            if (conn == null) {
                out.println("<h3>Erro na conexão com o banco de dados</h3>");
            } else {
                String sql = "DELETE FROM espaco WHERE id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, id);  // Define o ID do salão a ser excluído
                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    response.sendRedirect("admin-saloes.jsp");
                } else {
                    out.println("<h3>Erro ao excluir o salão</h3>");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h3>Erro ao excluir o salão: " + e.getMessage() + "</h3>");
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    } else {
        out.println("<h3>ID não fornecido</h3>");
    }
%>
