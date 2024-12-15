<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*"%>
<%@include file="conectar.jsp"%>

<%
    String espacoId = request.getParameter("espacoId");
    String dataInicio = request.getParameter("data_inicio");
    String dataFim = request.getParameter("data_fim");
    
    int usuarioId = 1; 
    
    if (espacoId == null || espacoId.isEmpty()) {
        out.println("<h3>Erro: ID do espaço não fornecido!</h3>");
    } else {
        Connection conn = (Connection) pageContext.getAttribute("conexao");
        PreparedStatement stmt = null;

        try {
            if (conn == null) {
                out.println("<h3>Erro na conexão com o banco de dados</h3>");
            } else {
                String sql = "INSERT INTO agendamento (usuario_id, espaco_id, data_inicio, data_fim, status) VALUES (?, ?, ?, ?, 'PENDENTE')";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, usuarioId);  
                stmt.setInt(2, Integer.parseInt(espacoId));  
                stmt.setString(3, dataInicio);
                stmt.setString(4, dataFim);

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<h3>Agendamento realizado com sucesso!</h3>");
                } else {
                    out.println("<h3>Erro ao realizar o agendamento.</h3>");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h3>Erro ao processar agendamento: " + e.getMessage() + "</h3>");
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
