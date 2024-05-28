<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR PAGE</title>
</head>
<%@page isErrorPage="true" %>
<body>
<h3 style="text-align:center;color:red;">
OOPs!!! Error !! <%=exception %>
</h3>

</body>
</html>