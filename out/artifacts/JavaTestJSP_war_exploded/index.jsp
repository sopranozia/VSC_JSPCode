<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2020/09/12
  Time: 10:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>
<html>
<%@ include file="header.jsp"   %>
<div class="row">
    <div class="col-md-6">
        <h1>JSP CRUD</h1>
    </div>
    <div class="col-md-6"><a href="addnew.jsp" class="btn btn-primary">add new data</a></div>
</div>
<table class="table">
    <thead>
    <tr>ID</tr>
    <tr>Name</tr>
    <tr>Surname</tr>
    <tr>BirthDay</tr>
    <tr>TelePhone-Number</tr>
    <tr>Location</tr>
    <tr>Marital Status</tr>
    <tr>Branch</tr>
    <tr class="text-center">Action</tr>

    </thead>
</table>

<body>
<% String host ="jdbc:postgresql://localhost:5432/Employee_db";
    Connection conn = null;
    Statement st = null;
    ResultSet res = null;
    Class.forName("org.postgresql.Driver");
    conn = DriverManager.getConnection(host,"postgres","victor");
    st = conn.createStatement();
    String data = "SELECT * FROM public.Employee";
    res = st.executeQuery(data);
    while(res.next()){
%>

<tr>
    <td><%=res.getString("id")%></td>
    <td><%=res.getString("name")%></td>
    <td><%=res.getString("surname")%></td>
    <td><%=res.getString("birthDay")%></td>
    <td><%=res.getString("telephoneNumber")%></td>
    <td><%=res.getString("location")%></td>
    <td><%=res.getString("maritalStatus")%></td>
    <td><%=res.getString("branch")%></td>
    <td><%=res.getString("branch")%></td>
    <td><a href='edit.jsp?u=<%=res.getString("id")%>' class="btn btn-warning">Edit</a></td>
</tr>
<%
    }




%>




</body>
</html>