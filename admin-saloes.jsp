<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, javax.servlet.*, javax.servlet.http.*"%>
<%@include file="conectar.jsp"%>  

<!DOCTYPE html>
<html>
<head>
    <title>Gerenciamento de Salões</title>
    <meta charset="UTF-8">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
</head>
<body>
    <nav>
        <div class="nav-wrapper blue">
            <a href="#" class="brand-logo center">Gerenciar Salões</a>
            <ul id="nav-mobile" class="left hide-on-med-and-down">
                <li><a href="loginAdmin.jsp">Perfil</a></li>
                <li><a href="admin-agendamentos.jsp">Gerenciar Agendamentos</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h4>Salões</h4>
        <a class="btn blue modal-trigger" href="#modalAdd">Adicionar Salão</a>
        <table class="striped responsive-table">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Capacidade</th>
                    <th>Descrição</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    Connection conn = (Connection) pageContext.getAttribute("conexao");
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        if (conn == null) {
                            out.println("<h3>Erro na conexão com o banco de dados</h3>");
                        } else {
                            String sql = "SELECT * FROM espaco";
                            stmt = conn.prepareStatement(sql);
                            rs = stmt.executeQuery();
                            while (rs.next()) {
                                String nome = rs.getString("nome");
                                int capacidade = rs.getInt("capacidade");
                                String descricao = rs.getString("descricao");
                %>
                                <tr>
                                    <td><%= nome %></td>
                                    <td><%= capacidade %> pessoas</td>
                                    <td><%= descricao %></td>
                                    <td>
                                        <a href="deletarSalao.jsp?id=<%= rs.getInt("id") %>" class="btn red">Excluir</a>
                                    </td>
                                </tr>
                <% 
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<h3>Erro ao carregar salões: " + e.getMessage() + "</h3>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <div id="modalAdd" class="modal">
        <div class="modal-content">
            <h4>Adicionar Salão</h4>
            <form action="adicionarSalao.jsp" method="POST">
                <div class="input-field">
                    <input type="text" id="nome" name="nome">
                    <label for="nome">Nome do Salão</label>
                </div>
                <div class="input-field">
                    <input type="number" id="capacidade" name="capacidade">
                    <label for="capacidade">Capacidade</label>
                </div>
                <div class="input-field">
                    <textarea id="descricao" name="descricao" class="materialize-textarea"></textarea>
                    <label for="descricao">Descrição</label>
                </div>
                <button type="submit" class="btn blue">Salvar</button>
            </form>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const elems = document.querySelectorAll('.modal');
            M.Modal.init(elems);
        });
    </script>
</body>
</html>
