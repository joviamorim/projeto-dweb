<%@ page import="java.sql.*" %>
<%@ include file="conectar.jsp" %>
<%  
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    String confirmarSenha = request.getParameter("confirmarSenha");

    if (nome != null && email != null && senha != null && confirmarSenha != null) {
        if (!senha.equals(confirmarSenha)) {
            out.println("<script>alert('As senhas não coincidem!');window.location='cadastroUsuario.jsp';</script>");
        } else {
            try {
                // alterar cadastro.jsp pelo nome do arquivo do formulario de cadastro
                // Verifica se o email já está cadastrado
                PreparedStatement verificarStmt = conexao.prepareStatement("SELECT email FROM Usuario WHERE email = ?");
                verificarStmt.setString(1, email);
                ResultSet rs = verificarStmt.executeQuery();

                if (rs.next()) {
                    out.println("<script>alert('Este e-mail já está cadastrado!');window.location='cadastroUsuario.jsp';</script>");
                } else {
                    // Insere na tabela Usuario
                    PreparedStatement inserirLogin = conexao.prepareStatement(
                        "INSERT INTO Usuario (nome, email, senha) VALUES (?, ?, ?)"
                    );
                    
                    inserirLogin.setString(1, nome);
                    inserirLogin.setString(2, email);
                    inserirLogin.setString(3, senha);
                    int loginResult = inserirLogin.executeUpdate();

                    // Verifica se ambos os registros foram inseridos
                    if (loginResult > 0) {
                        out.println("<script>alert('Cadastro realizado com sucesso!');window.location='login.jsp';</script>");
                    } else {
                        out.println("<script>alert('Erro ao gravar o cadastro.');window.location='cadastroUsuario.jsp';</script>");
                    }

                    // Fecha o PreparedStatement
                    inserirLogin.close();
                }

                rs.close();
                verificarStmt.close();

            } catch (SQLException e) {
                // Tratamento de erro SQL
                out.println("Erro na conexão ao banco de dados. Erro: " + e.getMessage());
            }
        }
    } else {
        out.println("<script>alert('Todos os campos são obrigatórios.');window.location='cadastroUsuario.jsp';</script>");
    }
%>