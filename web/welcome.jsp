<%-- 
    Document   : welcom
    Created on : 14-Apr-2015, 7:06:50 PM
    Author     : c0633648
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome <%=session.getAttribute("person") %></h1>
        <a href="addProduct.jsp" name="add">Add Product</a>
        
    </body>
</html>
