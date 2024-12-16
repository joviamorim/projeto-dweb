<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Perfil do Administrador</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <nav>
        <div class="nav-wrapper blue" role="navigation" aria-label="Menu principal">
            <a href="#" class="brand-logo">Painel do Administrador</a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li><a href="loginAdmin.jsp">Perfil</a></li>
                <li><a href="admin-saloes.jsp">Gerenciar Salões</a></li>
                <li><a href="admin-agendamentos.jsp">Gerenciar Agendamentos</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h4 style="margin-bottom: 1.5rem; margin-top: 2rem;">Bem-vindo, Administrador!</h4>
        <div class="card">
            <div class="card-content">
                <span class="card-title">Informações Pessoais</span>
                <p><strong>Nome:</strong> Administrador</p>
                <p><strong>Email:</strong> admin@exemplo.com</p>
            </div>
        </div>
        <h5 style="margin-bottom: 1.5rem; margin-top: 2rem;">Gerenciamento</h5>
        <ul class="collection">
            <li class="collection-item"><a href="admin-saloes.jsp">Gerenciar Salões</a></li>
            <li class="collection-item"><a href="admin-agendamentos.jsp">Gerenciar Agendamentos</a></li>
        </ul>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
