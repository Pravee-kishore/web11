<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Entry Detalis</title>
<style>
body {
            margin: 0;
            padding: 0;
            background-image: url('https://images.unsplash.com/photo-1517323197145-72f28d311d51?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NTN8NDcwMjk1MXx8ZW58MHx8fHx8');
            background-size: cover;
            background-position: center;
            height: 100vh;
        }
nav {
            background-color: #333;
            padding: 10px;
            text-align: right;
        }
nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 15px;
            font-size: 18px;
        }
fieldset {
    width: 60%; 
    margin: 0 auto;
    padding: auto;
    text-align:center;
    font-weight:bold;
  }        
</style>
</head>
<%@page import="java.util.Vector" %>
<%@page import="gym.EntryDetails" %>
<%@page errorPage="Handler.jsp" %>
<body>
<nav>
<a href="AdminOptions.jsp">Back</a>
<a href="Range.jsp">Range</a>
<a href="FirstPage.jsp">Logout</a>
</nav>
<jsp:useBean class="gym.Entry" id="obj1"/>
<%	
Vector<EntryDetails> r=obj1.view();
%>
<fieldset><legend>User Entry Details</legend>
<table align="center" cellspacing="10" cellpadding="5" border="5" rules="all">
<tr style="color:blue;font-weight:bolder;">
<td>ID</td><td>FIRST NAME</td><td>LAST NAME</td><td>GENDER</td><td>AGE</td><td>CONTACT NO</td><td>Date</td><td>In</td><td>Out</td>
</tr>
<%
  for(EntryDetails i : r){
%>
<tr>
<td><%=i.getId() %></td><td><%=i.getFname() %></td><td><%=i.getLname() %></td><td><%=i.getGender() %></td>
<td><%=i.getAge() %></td><td><%=i.getContactNo() %></td></td><td><%=i.getDate()%></td><td><%=i.getIn()%></td><td><%=i.getOut()%></td>
</tr>
 <%
  }
%>
</table>
</fieldset>
</body>
</html>