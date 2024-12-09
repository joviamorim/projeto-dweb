<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Perfil do Administrador</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
</head>
<body>
    <nav>
        <div class="nav-wrapper blue">
            <a href="#" class="brand-logo center">Painel do Administrador</a>
            <ul id="nav-mobile" class="left hide-on-med-and-down">
                <li><a href="admin-saloes.jsp">Gerenciar Salões</a></li>
                <li><a href="admin-agendamentos.jsp">Gerenciar Agendamentos</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h4>Bem-vindo, Administrador!</h4>
        <div class="card">
            <div class="card-content">
                <span class="card-title">Informações Pessoais</span>
                <p><strong>Nome:</strong> Administrador</p>
                <p><strong>Email:</strong> admin@exemplo.com</p>
            </div>
        </div>
        <h5>Gerenciamento:</h5>
        <ul class="collection">
            <li class="collection-item"><a href="admin-saloes.jsp">Gerenciar Salões</a></li>
            <li class="collection-item"><a href="admin-agendamentos.jsp">Gerenciar Agendamentos</a></li>
        </ul>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
