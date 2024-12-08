<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*"%>
<%@ include file="conectar.jsp" %>  
<%
    String nome = request.getParameter("nome");
    String capacidadeStr = request.getParameter("capacidade");
    String descricao = request.getParameter("descricao");

    if (nome != null && capacidadeStr != null && descricao != null && !nome.isEmpty() && !capacidadeStr.isEmpty() && !descricao.isEmpty()) {
        int capacidade = Integer.parseInt(capacidadeStr);

        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = (Connection) pageContext.getAttribute("conexao");

            String sql = "INSERT INTO espaco (nome, descricao, capacidade) VALUES (?, ?, ?)";

            stmt = conn.prepareStatement(sql);
            stmt.setString(1, nome);
            stmt.setString(2, descricao);
            stmt.setInt(3, capacidade);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("admin-saloes.jsp");
            } else {
                out.println("<h3 style='color:red;'>Erro ao adicionar salão.</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red;'>Erro ao conectar com o banco de dados.</h3>");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    } else {
        out.println("<h3 style='color:red;'>Todos os campos devem ser preenchidos!</h3>");
    }
%>
