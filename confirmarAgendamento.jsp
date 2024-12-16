<%@ page import="java.sql.*" %>
<%@ include file="conectar.jsp" %>
<%
    long agendamentoId = Long.parseLong(request.getParameter("agendamento_id"));

    String sql = "UPDATE agendamento SET status = 'CONFIRMADO' WHERE id = ?";
    PreparedStatement ps = conexao.prepareStatement(sql);
    ps.setLong(1, agendamentoId);

    int rowsUpdated = ps.executeUpdate();

    if (rowsUpdated > 0) {
        response.sendRedirect("admin-agendamentos.jsp");
    } else {
        out.println("Erro ao confirmar o agendamento.");
    }

    ps.close();
    conexao.close();
%>
