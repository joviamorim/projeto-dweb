<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, javax.servlet.*, javax.servlet.http.*"%>
<%@include file="conectar.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>Gerenciamento de Agendamentos</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <nav>
        <div class="nav-wrapper blue">
            <a href="#" class="brand-logo center">Gerenciar Agendamentos</a>
            <ul id="nav-mobile" class="left hide-on-med-and-down">
                <li><a href="loginAdmin.jsp">Perfil</a></li>
                <li><a href="admin-saloes.jsp">Gerenciar Salões</a></li>
                <li><a href="index.html">Logout</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h4>Agendamentos</h4>
        <table class="striped responsive-table">
            <thead>
                <tr>
                    <th>Espaço</th>
                    <th>Data Início</th>
                    <th>Data Fim</th>
                    <th>Status</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <%
                    PreparedStatement ps = conexao.prepareStatement(
                        "SELECT ag.id, ag.data_inicio, ag.data_fim, ag.status, esp.nome AS espaco_nome, esp.capacidade " +
                        "FROM agendamento ag " +
                        "JOIN espaco esp ON ag.espaco_id = esp.id"
                    );
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                        String espacoNome = rs.getString("espaco_nome");
                        Timestamp dataInicio = rs.getTimestamp("data_inicio");
                        Timestamp dataFim = rs.getTimestamp("data_fim");
                        String status = rs.getString("status");
                        long agendamentoId = rs.getLong("id");

                        boolean disabled = status.equals("FINALIZADO");
                %>
                <tr>
                    <td><%= espacoNome %></td>
                    <td><%= new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm").format(dataInicio) %></td>
                    <td><%= new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm").format(dataFim) %></td>
                    <td><%= status %></td>
                    <td>
                        <form action="confirmarAgendamento.jsp" method="POST" style="display:inline;">
                            <input type="hidden" name="agendamento_id" value="<%= agendamentoId %>">
                            <button type="submit" class="btn green" <%= disabled || status.equals("CONFIRMADO") || status.equals("CANCELADO") ? "disabled" : "" %>>Confirmar</button>
                        </form>
                        <form action="cancelarAgendamento.jsp" method="POST" style="display:inline;">
                            <input type="hidden" name="agendamento_id" value="<%= agendamentoId %>">
                            <button type="submit" class="btn red" <%= disabled || status.equals("CONFIRMADO") || status.equals("CANCELADO") ? "disabled" : "" %>>Cancelar</button>
                        </form>
                        <a href="#modalCheckout<%= agendamentoId %>" class="btn purple modal-trigger" <%= disabled || !status.equals("CONFIRMADO") ? "disabled" : "" %>>Checkout</a>
                    </td>
                </tr>

                <div id="modalCheckout<%= agendamentoId %>" class="modal">
                    <div class="modal-content">
                        <h4>Avaliação do Agendamento</h4>
                        <form action="processarCheckout.jsp" method="POST">
                            <input type="hidden" name="agendamento_id" value="<%= agendamentoId %>">
                            <div class="input-field">
                                <textarea id="observacao" name="observacao" class="materialize-textarea" required></textarea>
                                <label for="observacao">Observação</label>
                            </div>
                            <p>Status da Avaliação</p>
                            <label>
                                <input type="radio" name="status" value="OK" required>
                                <span>OK</span>
                            </label>
                            <label>
                                <input type="radio" name="status" value="PENDENTE" required>
                                <span>PENDENTE</span>
                            </label>                
                            <div class="modal-footer">
                                <button type="submit" class="btn green">Enviar Avaliação</button>
                                <a href="#!" class="modal-close btn red">Cancelar</a>
                            </div>
                        </form>
                    </div>
                </div>
                <%
                    }
                    rs.close();
                    ps.close();
                %>
            </tbody>
        </table>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
    const modals = document.querySelectorAll('.modal');
    M.Modal.init(modals);
});

    </script>
</body>
</html>
