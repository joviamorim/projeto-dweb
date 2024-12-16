<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, javax.servlet.*, javax.servlet.http.*"%>
<%@include file="conectar.jsp"%>

<%
    long agendamentoId = Long.parseLong(request.getParameter("agendamento_id"));
    String observacao = request.getParameter("observacao");
    String statusAvaliacao = request.getParameter("status");

    try {
        conexao.setAutoCommit(false);

        PreparedStatement ps = conexao.prepareStatement(
            "INSERT INTO avaliacao (agendamento_id, observacao, status) VALUES (?, ?, ?)",
            Statement.RETURN_GENERATED_KEYS
        );
        ps.setLong(1, agendamentoId);
        ps.setString(2, observacao);
        ps.setString(3, statusAvaliacao);
        ps.executeUpdate();

        ResultSet rs = ps.getGeneratedKeys();
        rs.next();
        long avaliacaoId = rs.getLong(1);
        rs.close();

        String novoStatusAgendamento = "FINALIZADO"; 

        if ("PENDENTE".equals(statusAvaliacao)) {
            novoStatusAgendamento = "BLOQUEADO";
        }

        PreparedStatement psUpdateAgendamento = conexao.prepareStatement(
            "UPDATE agendamento SET avaliacao_id = ?, status = ? WHERE id = ?"
        );
        psUpdateAgendamento.setLong(1, avaliacaoId);
        psUpdateAgendamento.setString(2, novoStatusAgendamento);
        psUpdateAgendamento.setLong(3, agendamentoId);
        psUpdateAgendamento.executeUpdate();

        conexao.commit();
        response.sendRedirect("admin-agendamentos.jsp");
    } catch (Exception e) {
        conexao.rollback();
        out.println("Erro ao processar o checkout: " + e.getMessage());
    } finally {
        conexao.setAutoCommit(true);
    }
%>
