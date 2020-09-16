<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2020/09/13
  Time: 07:12 AM
  To change this template use File | Settings | File Templates.
--%>


<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@ include file="header.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="" method="post">

<div class="form-group">
    <label>Name:</label>
    <input type="text" name="name" class="form-control" placeholder="enter name" >
</div>
    <div class="form-group">
        <label>Surname:</label>
        <input type="text" name="surname" class="form-control" placeholder="enter surname" >
    </div>
    <div class="form-group">
        <label>BirthDay:</label>
        <input type="text" name="birthday" class="form-control" placeholder="enter birthday" >
    </div>
    <div class="form-group">
        <label>Telephone-Number:</label>
        <input type="text" name="telephone" class="form-control" placeholder="enter telephone number" >
    </div>
    <div class="form-group">
        <label>location:</label>
        <input type="text" name="location" class="form-control" placeholder="enter location" >
    </div>
    <div class="form-group">
        <label>Marital-Status:</label>
        <input type="text" name="status" class="form-control" placeholder="enter marital status" >
    </div>
    <div class="form-group">
        <label>Branch:</label>
        <input type="text" name="branch" class="form-control" placeholder="enter branch" >
    </div>

    <button type="submit" class="btn btn-primary">Submit</button>
    <a href="index.jsp"  class="btn btn-default">Back</a>
</form>
<%@ include file="footer.jsp"  %>
</body>
</html>
<%

    String n =request.getParameter("name");
    String s =request.getParameter("surname");
    String b =request.getParameter("birthday");
    String t =request.getParameter("telephone");
    String l =request.getParameter("location");
    String m =request.getParameter("status");
    String br =request.getParameter("branch");
String host ="jdbc:postgresql://localhost:5432/Employee_db";
    Connection conn = null;
    PreparedStatement st = null;
    Class.forName("org.postgresql.Driver").newInstance();

    if(n!= null && s!=null && b!=null && t!=null && l!=null && m!=null && br!=null ){
    conn=DriverManager.getConnection(host,"root","victor");
     String data = "INSERT into Employee(name,surname,birthDay,telephoneNumber,location,maritalStatus,branch) values(?,?,?,?,?,?,?)";
     st = conn.prepareStatement(data);
     st.setString(1,n);
     st.setString(2,s);
     st.setString(3,b);
     st.setString(4,t);
     st.setString(5,l);
     st.setString(6,m);
     st.setString(7,br);
     st.executeUpdate();
     response.sendRedirect("index.jsp");
    }



        %>
