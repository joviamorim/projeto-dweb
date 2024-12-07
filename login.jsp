<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<nav class="blue darken-3">
    <div class="nav-wrapper">
        <a href="index.jsp" class="brand-logo">Natureza Viva</a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li><a href="index.jsp">Início</a></li>
            <li><a href="saloesDisponiveis.jsp">Salões Disponíveis</a></li>
            <li><a href="login.jsp">Login</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <h3>Login</h3>
    
    <form action="inserirLogin.jsp" method="post" class="col s12"> 
        
        <div class="input-field col s12">
            <input id="email" name="email" type="email" class="validate" required>
            <label for="email">E-mail</label>
        </div>
        
        <div class="input-field col s12">
            <input id="senha" name="senha" type="password" class="validate" required>
            <label for="senha">Senha</label>
        </div>
        
        <div class="input-field col s12">
            <button type="submit" class="btn waves-effect waves-light blue darken-3">Entrar</button>
        </div>
        
        <div class="col s12">
            <p>Não possui cadastro? <a href="cadastroUsuario.jsp">Cadastre-se aqui</a></p>
        </div>
    </form>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
