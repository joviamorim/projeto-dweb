<%@ page import="java.sql.*" %>
<%@ include file="conectar.jsp" %>
<%
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
<<<<<<< HEAD
   
    
=======

>>>>>>> 9f8a4ec7ca86597a8705a6cfb2a92045ed7e416c
    PreparedStatement stmt = conexao.prepareStatement("SELECT email, senha FROM Usuario WHERE email = ? AND senha = ?");
    stmt.setString(1, email);
    stmt.setString(2, senha);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
<<<<<<< HEAD
        if(email!=null && senha!=null && !email.isEmpty() && !senha.isEmpty()){
            session.setAttribute("usuario", email);
            response.sendRedirect("home.jsp");
        }
    
       
=======
        // use este treço para implementar a sessão
        //
        //
        response.sendRedirect("home.html");
>>>>>>> 9f8a4ec7ca86597a8705a6cfb2a92045ed7e416c
    } else {
        out.println("<script>alert('Usuário ou senha incorretos!');window.location='login.jsp';</script>");
    }

    rs.close();
    stmt.close();
<<<<<<< HEAD

    

   
%>
=======
>>>>>>> 9f8a4ec7ca86597a8705a6cfb2a92045ed7e416c
%>