

<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@ include file="header.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% String host ="jdbc:postgresql://localhost:5432/Employee_db";
    Connection conn = null;
    Statement st = null;
    ResultSet res = null;
    Class.forName("org.postgresql.Driver");
    conn = DriverManager.getConnection(host,"postgres","victor");
    %>
<form action="" method="post">

    <%
   st = conn.createStatement();
   String u = request.getParameter("u");
   int num =Integer.parseInt(u);
   String data = "SELECT * FROM Employee WHERE id='"+num+"'";
   res = st.executeQuery(data);
   while(res.next()){


   }
    %>
    <input type="hidden" name="id" value='<%=res.getString("id")%>'/>
    <div class="form-group">
        <label>Name:</label>
        <input type="text" name="name" class="form-control" value='<%=res.getString("name")%>' >
    </div>
    <div class="form-group">
        <label>Surname:</label>
        <input type="text" name="surname" class="form-control" value='<%=res.getString("surname")%>' >
    </div>
    <div class="form-group">
        <label>BirthDay:</label>
        <input type="text" name="birthday" class="form-control" value='<%=res.getString("birthDay")%>' >
    </div>
    <div class="form-group">
        <label>Telephone-Number:</label>
        <input type="text" name="telephone" class="form-control" value='<%=res.getString("telephoneNumber")%>' >
    </div>
    <div class="form-group">
        <label>location:</label>
        <input type="text" name="location" class="form-control" value='<%=res.getString("location")%>' >
    </div>
    <div class="form-group">
        <label>Marital-Status:</label>
        <input type="text" name="status" class="form-control" value='<%=res.getString("maritalStatus")%>' >
    </div>
    <div class="form-group">
        <label>Branch:</label>
        <input type="text" name="branch" class="form-control" value='<%=res.getString("branch")%>' >
    </div>

    <button type="submit" class="btn btn-primary">Update</button>
    <a href="index.jsp"  class="btn btn-default">Back</a>
</form>
<%@ include file="footer.jsp"  %>
</body>
</html>
<%
    String id =request.getParameter("id");
    String n =request.getParameter("name");
    String s =request.getParameter("surname");
    String b =request.getParameter("birthday");
    String t =request.getParameter("telephone");
    String l =request.getParameter("location");
    String m =request.getParameter("status");
    String br =request.getParameter("branch");


    if(n!= null && s!=null && b!=null && t!=null && l!=null && m!=null && br!=null ){

        String query = "UPDATE public.Employee set name=? ,surname=?,birthDay=?,telephoneNumber=?,location=?,maritalStatus=?,branch=? WHERE id = '"+id+"'";
        st = conn.prepareStatement(query);
        ((PreparedStatement) st).setString(1,n);
        ((PreparedStatement) st).setString(2,s);
        ((PreparedStatement) st).setString(3,b);
        ((PreparedStatement) st).setString(4,t);
        ((PreparedStatement) st).setString(5,l);
        ((PreparedStatement) st).setString(6,m);
        ((PreparedStatement) st).setString(7,br);
        ((PreparedStatement) st).executeUpdate();
        response.sendRedirect("index.jsp");
    }



%>