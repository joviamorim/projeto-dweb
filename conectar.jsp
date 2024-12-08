<<<<<<< HEAD
<%@ page import="java.sql.*" %>
<%
  Class.forName("com.mysql.jdbc.Driver");
 Connection conexao =  DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/salao", 
        "root", 
        ""
    );
=======
<%@ page import="java.sql.*" %>
<%
  Class.forName("com.mysql.jdbc.Driver");
 Connection conexao =  DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/salao", 
        "root", 
        ""
    );
>>>>>>> 9f8a4ec7ca86597a8705a6cfb2a92045ed7e416c
%>