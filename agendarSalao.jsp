<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, javax.servlet.*, javax.servlet.http.*"%>
<%@include file="conectar.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>Agendar Salão</title>
    <meta charset="UTF-8">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
    <style>
        .datepicker-controls .select-month input {
            width: 85px !important;
        }
    </style>
</head>
<body>
    <nav>
        <div class="nav-wrapper blue">
            <a href="#" class="brand-logo center">Agendar Salão</a>
            <ul id="nav-mobile" class="left hide-on-med-and-down">
                <li><a href="saloesDisponiveis.jsp">Voltar</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <%
            // Obtém o ID do espaço enviado como parâmetro
            String espacoId = request.getParameter("id");
            if (espacoId == null || espacoId.isEmpty()) {
                out.println("<h4>Erro: ID do salão não fornecido.</h4>");
            } else {
                Connection conn = (Connection) pageContext.getAttribute("conexao");
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    if (conn != null) {
                        String sql = "SELECT * FROM espaco WHERE id = ?";
                        stmt = conn.prepareStatement(sql);
                        stmt.setInt(1, Integer.parseInt(espacoId));
                        rs = stmt.executeQuery();

                        if (rs.next()) {
                            String nome = rs.getString("nome");
                            String descricao = rs.getString("descricao");
                            int capacidade = rs.getInt("capacidade");
        %>
                            <h4>Detalhes do Salão</h4>
                            <div class="card">
                                <div class="card-content">
                                    <span class="card-title"><%= nome %></span>
                                    <p><strong>Descrição:</strong> <%= descricao %></p>
                                    <p><strong>Capacidade:</strong> <%= capacidade %> pessoas</p>
                                </div>
                            </div>

                            <h5>Escolha uma data para agendamento</h5>
                            <form action="salvarAgendamento.jsp" method="POST">
                                <!-- Campo oculto para o ID do espaço -->
                                <input type="hidden" name="id" value="<%= espacoId %>">
                                
                                <div class="input-field">
                                    <input type="text" id="dataAgendamento" class="datepicker" name="dataAgendamento" required>
                                    <label for="dataAgendamento">Data</label>
                                </div>

                                <button type="submit" class="btn blue">Confirmar Agendamento</button>
                            </form>
        <%
                        } else {
                            out.println("<h4>Erro: Salão não encontrado.</h4>");
                        }
                    } else {
                        out.println("<h4>Erro na conexão com o banco de dados.</h4>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<h4>Erro ao carregar os dados do salão: " + e.getMessage() + "</h4>");
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Inicializa o datepicker
            const elems = document.querySelectorAll('.datepicker');
            M.Datepicker.init(elems, {
                format: 'yyyy-mm-dd', // Formato da data enviado ao servidor
                autoClose: true,
                i18n: {
                    cancel: 'Cancelar',
                    clear: 'Limpar',
                    done: 'Ok',
                    months: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
                    monthsShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
                    weekdays: ['Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado'],
                    weekdaysShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'],
                    weekdaysAbbrev: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S']
                }
            });
        });
    </script>
</body>
</html>
