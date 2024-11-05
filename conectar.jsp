<%@ page import="java.sql.*" %>
<%
  Class.forName("com.mysql.jdbc.Driver");
  DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/salao", 
        "root", 
        ""
    );
%>