<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, javax.servlet.*, javax.servlet.http.*"%>
<%@include file="conectar.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>Salões Disponíveis</title>
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
            <a href="index.html" class="brand-logo" aria-label="Catálogo de Espaços">Catálogo de Espaços</a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li><a href="index.html" aria-label="Início">Início</a></li>
                <li><a href="catalogo.jsp" aria-label="Catálogo">Catálogo</a></li>
                <li><a href="cadastroUsuario.jsp" aria-label="Cadastro de Usuário">Cadastre-se</a></li>
                <li><a href="login.jsp" aria-label="Login">Login</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h4 style="margin-bottom: 2rem; margin-top: 2rem;">Veja nossos espaços disponíveis</h4>
        <div class="row">
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
                            <div class="col s12 m6 l4">
                                <div class="card">
                                    <div class="card-image">
                                        <img src="https://via.placeholder.com/500x300?text=<%= nome %>" alt="<%= nome %>">
                                    </div>
                                    <div class="card-content">
                                        <span class="card-title"><%= nome %></span>
                                        <p><strong>Capacidade:</strong> <%= capacidade %> pessoas</p>
                                        <p><strong>Descrição:</strong> <%= descricao %></p>
                                    </div>
                                </div>
                            </div>
                <% 
                        }
                    }
                } catch (SQLException e) {
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
