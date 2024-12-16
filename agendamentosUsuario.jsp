<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*"%>
<%@include file="conectar.jsp"%>
<%
    String tipo = (String) session.getAttribute("tipo");
    if(tipo == null || !tipo.equals("USER")) {
        response.sendRedirect("redirecionamento.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Meus Agendamentos</title>
    <meta charset="UTF-8">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style>
        .card {
            height: 400px; 
            display: flex;
            flex-direction: column;
        }
        .card-content {
            flex-grow: 1; 
        }
        .card-image {
            height: 200px; 
            object-fit: cover; 
        }
        .card-action {
            margin-top: auto; 
        }
    </style>
</head>
<body>
    <nav class="blue darken-3" role="navigation" aria-label="Menu principal">
        <div class="nav-wrapper">
            <a href="loginUsuario.html" class="brand-logo" aria-label="Catálogo de Espaços">Natureza Viva</a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li><a href="loginUsuario.jsp" aria-label="Início">Início</a></li>
                <li><a href="saloesDisponiveis.jsp" aria-label="Salões Disponíveis">Salões Disponíveis</a></li>
                <li><a href="agendamentosUsuario.jsp" aria-label="Meus Agendamentos">Meus Agendamentos</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h4 style="margin-bottom: 2rem; margin-top: 2rem;">Veja os agendamentos realizados</h4>

        <div class="row">
            <%
                String usuarioId = (String) session.getAttribute("id");

                Connection conn = (Connection) pageContext.getAttribute("conexao");
                PreparedStatement stmt = null;
                ResultSet rsAgendamentos = null;
                ResultSet rsEspacos = null;

                try {
                    if (conn == null) {
                        out.println("<h3>Erro na conexão com o banco de dados</h3>");
                    } else {
                        String sqlAgendamentos = "SELECT a.id, a.espaco_id, a.data_inicio, a.data_fim, a.status, e.nome, e.capacidade "
                                                + "FROM agendamento a "
                                                + "INNER JOIN espaco e ON a.espaco_id = e.id "
                                                + "WHERE a.usuario_id = ?";
                        stmt = conn.prepareStatement(sqlAgendamentos);
                        stmt.setString(1, usuarioId); 
                        rsAgendamentos = stmt.executeQuery();

                        while (rsAgendamentos.next()) {
                            long agendamentoId = rsAgendamentos.getLong("id");
                            String nomeEspaco = rsAgendamentos.getString("nome");
                            int capacidadeEspaco = rsAgendamentos.getInt("capacidade");
                            String dataInicio = rsAgendamentos.getString("data_inicio");
                            String dataFim = rsAgendamentos.getString("data_fim");
                            String status = rsAgendamentos.getString("status");
            %>

            <div class="col s12 m6 l4">
                <div class="card">
                    <div class="card-image">
                        <img src="https://via.placeholder.com/300x200.png?text=Imagem+Espaço" alt="Imagem do Espaço">
                    </div>
                    <div class="card-content">
                        <span class="card-title"><%= nomeEspaco %></span>
                        <p><strong>Capacidade:</strong> <%= capacidadeEspaco %> pessoas</p>
                        <p><strong>Início:</strong> <%= dataInicio %></p>
                        <p><strong>Fim:</strong> <%= dataFim %></p>
                        <p><strong>Status:</strong> <%= status %></p>
                    </div>
                    <div class="card-action">
                    </div>
                </div>
            </div>

            <%
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<h3>Erro ao buscar agendamentos: " + e.getMessage() + "</h3>");
                } finally {
                    try {
                        if (rsAgendamentos != null) rsAgendamentos.close();
                        if (stmt != null) stmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
