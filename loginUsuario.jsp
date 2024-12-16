<%
    String tipo = (String) session.getAttribute("tipo");
    if(tipo == null || !tipo.equals("USER")) {
        response.sendRedirect("redirecionamento.jsp");
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Natureza Viva - Início</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<nav class="blue darken-3" role="navigation" aria-label="Menu principal">
    <div class="nav-wrapper">
        <a href="index.jsp" class="brand-logo" aria-label="Natureza Viva - Página Inicial">Natureza Viva</a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li><a href="loginUsuario.html" aria-label="Início">Início</a></li>
            <li><a href="saloesDisponiveis.jsp" aria-label="Salões Disponíveis">Salões Disponíveis</a></li>
            <li><a href="agendamentosUsuario.jsp" aria-label="agendamentosUsuario">Meus Agendamentos</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container" style="margin-top: 2rem;">
    <section class="section">
        <h2 class="center-align blue-text text-darken-3">Sobre a ONG Natureza Viva</h2>
        <p class="flow-text">
            A ONG Natureza Viva é dedicada à preservação do meio ambiente e ao fortalecimento de comunidades locais.
            Nosso objetivo é criar um impacto positivo, promovendo eventos e atividades que educam e engajam as pessoas
            sobre práticas sustentáveis. </p>
        <p class="flow-text">Os salões disponíveis para aluguel ajudam a sustentar nossas atividades
        e projetos comunitários.</p>
        
    </section>

    <div class="carousel carousel-custom">
        <a class="carousel-item" href="#salon1">
            <img src="images/salon1.png" alt="Salão Espaçoso com Decoração Rústica">
        </a>
        <a class="carousel-item" href="#salon2">
            <img src="images/salon2.png" alt="Salão Moderno com Iluminação Natural">
        </a>
        <a class="carousel-item" href="#salon3">
            <img src="images/salon3.png" alt="Salão Aconchegante em Área Rural">
        </a>
        <a class="carousel-item" href="#salon4">
            <img src="images/salon4.png" alt="Salão com Decoração Contemporânea">
        </a>
    </div>
    <div class="center-align section btn-section">
        <a href="saloesDisponiveis.jsp" class="btn-large blue darken-3 waves-effect waves-light" role="button" aria-label="Visualizar todos os salões disponíveis">
            Ver todos os salões disponíveis
        </a>
    </div>
</div>

<footer class="page-footer blue darken-3" style="margin-top: 4rem; padding-bottom: 1rem;">
    <div class="container center-align">
        <h5 class="white-text">Natureza Viva</h5>
        <p class="grey-text text-lighten-4">Preservando a natureza e fortalecendo a comunidade.</p>
        <p class="grey-text text-lighten-4">Contato: contato@naturezaviva.org | (11) 98765-4321</p>
        <p class="grey-text text-lighten-4">Endereço: Rua Sustentável, 123, São Paulo - SP</p>
    </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const carousels = document.querySelectorAll('.carousel');
        M.Carousel.init(carousels, {
            duration: 200,
            dist: -50,
            shift: 5,
            padding: 10,
            indicators: true
        });
    });
</script>
</body>
</html>
