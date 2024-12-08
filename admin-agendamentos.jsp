<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Gerenciamento de Agendamentos</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
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
        <div class="row">
            <form class="col s12">
                <div class="input-field col s6">
                    <input type="text" id="searchEspaco">
                    <label for="searchEspaco">Filtrar por Espaço</label>
                </div>
                <div class="input-field col s6">
                    <input type="text" class="datepicker" id="searchData">
                    <label for="searchData">Filtrar por Data</label>
                </div>
                <div class="col s12">
                    <button class="btn blue" type="submit">Filtrar</button>
                </div>
            </form>
        </div>
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
                <tr>
                    <td>Salão Principal</td>
                    <td>01/12/2024 14:00</td>
                    <td>01/12/2024 18:00</td>
                    <td>Confirmado</td>
                    <td>
                        <button class="btn green">Confirmar</button>
                        <button class="btn red">Cancelar</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const elems = document.querySelectorAll('.datepicker');
            M.Datepicker.init(elems, { format: 'dd/mm/yyyy' });
        });
    </script>
</body>
</html>
