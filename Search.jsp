<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registered Data</title>
<style>
body {
            margin: 0;
            padding: 0;
            background-image: url('https://t4.ftcdn.net/jpg/03/80/95/27/240_F_380952715_ckDRgm6BCdd8G10aRg4uOVUnwIPZgTC9.jpg');
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
div{
background-color:#000000;
color: white;
padding:10px;
text-align:left;
}
legend,label{
  color: black; 
  background-color:white;
  text-align:center;
  font-size:25px;
}
fieldset {
    width: 100%; 
    margin: 0 auto;
    padding: auto;
    text-align:center;
    font-weight:bold;
  } 
</style>
</head>
<%@page import="java.util.Vector" %>
<%@page import="gym.Registration" %>
<%@page errorPage="Handler.jsp" %>
<body>
<nav>
<a href="AdminOptions.jsp">Back</a>
<a href="FirstPage.jsp">Logout</a>
</nav>
<form method="post" action="#" >
<div>
<label for="cn">ContactNo</label>
<input type="text" name="cn" value="" id="cn" required />
<input type="submit" value="Search" name="btn" />
<input type="reset" value="Clear" />
</div>
<% 	String b=request.getParameter("btn");
	if(b!=null && b.equals("Search")){
		String cn=request.getParameter("cn");
%>
<jsp:useBean id="obj1" class="gym.DBCode"></jsp:useBean>
<h3 align="center" style="color:black;">	    
<%       Vector<Registration> r=obj1.Specificview(cn);
%>
<fieldset><legend>User Details</legend>
<table align="center" cellspacing="10" cellpadding="1" border="5" rules="all">
<tr style="color:blue;font-weight: bold;">
<td>ID</td><td>FIRST NAME</td><td>LAST NAME</td><td>GENDER</td><td>AGE</td>
<td>ADDRESS</td><td>CONTACT NO</td><td>EMAIL ID</td><td>PASSWORD</td><td>DATE</td><td>TIME</td><td colspan="2">OPERATIONS</td>
</tr>
<%
  for(Registration i : r){
%>
<tr>
<td><%=i.getId() %></td><td><%=i.getFname() %></td><td><%=i.getLname() %></td><td><%=i.getGender() %></td>
<td><%=i.getAge() %></td><td><%=i.getAddress() %></td><td><%=i.getContactNo() %></td>
<td><%=i.getEmail() %></td><td><%=i.getPassword()%></td><td><%=i.getDate()%></td><td><%=i.getTime()%></td>
<td>
<a href="Edit.jsp?res=edit&id=<%=i.getId()%>">Edit</a>
</td>
<td>
<a href="View.jsp?res=del&id=<%=i.getId()%>">Remove</a>
</td>
</tr>
<%
}
}
%>	<jsp:useBean class="gym.DBCode" id="obj"/>
<%	
	String n1=request.getParameter("res");
	if(n1!=null && n1.equals("del")){
		int Id=Integer.parseInt(request.getParameter("id"));
		obj.delete(Id);
	}
%>
</table>
</fieldset>
</h3>
</form>
<%
	String n=request.getParameter("res");
	if(n!=null && n.equals("del")){
		int Id=Integer.parseInt(request.getParameter("id"));
		obj.delete(Id);
	}
%>
</body>
</html>