
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>

<%

String id = request.getParameter("u");
int no = Integer.parseInt(id);
    Class.forName("org.postgresql.Driver");
  Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Employee_db");
  Statement st = conn.createStatement();
  st.executeUpdate("DELETE FROM public.Employee WHERE id='"+no+"'");
  response.sendRedirect("index.jsp");

%>
