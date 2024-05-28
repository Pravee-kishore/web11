<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
nav {
            background-color: #333;
            padding: 15px;
            text-align: right;
        }
nav a {
            color: white;
            text-decoration: none;
            padding: 10px;
            margin: 0 10px;
        }
</style>
</head>
<body>
<%@page import="java.util.Vector" %>
<%@page import="gym.Registration" %>
<%@page errorPage="Handler.jsp" %>
<jsp:useBean class="gym.DBCode" id="obj"/>
<%	Vector<Registration> r=new Vector<Registration>(); %>
<%
	String n=request.getParameter("res");
	if(n!=null && n.equals("edit")){
		int id=Integer.parseInt(request.getParameter("id"));
		r=obj.specific(id);
		
		for(Registration i : r){		
%>			
<form method="post" action="#" >
<nav>
<a href="View.jsp">Click here for customer Data!!</a>
</nav>
<fieldset><legend>Add Employee</legend>
<table align="center">
<tr>
<td><label for="id">ID</label></td>
<td><input type="text" name="id" value="<%=id%>" id="id" disabled/></td>
</tr>
<tr>
<td><label for="n">FIRST NAME</label></td>
<td><input type="text" name="n" value="<%=i.getFname()%>" id="n" /></td>
</tr>

<tr>
<td><label for="n1">LAST NAME</label></td>
<td><input type="text" name="n1" value="<%=i.getLname()%>" id="n1" /></td>
</tr>

<tr>
<td><label for="g">GENDER</label></td>
<td><input type="text" name="g" value="<%=i.getGender()%>" id="g" /></td>
</tr>

<tr>
<td><label for="a">AGE</label></td>
<td><input type="text" name="a" value="<%=i.getAge()%>" id="a" /></td>
</tr>

<tr>
<td><label for="ad">ADDRESS</label></td>
<td><input type="text" name="ad" value="<%=i.getAddress()%>" id="ad" /></td>
</tr>

<tr>
<td><label for="cn">CONTACT NO</label></td>
<td><input type="text" name="cn" value="<%=i.getContactNo()%>" id="cn" /></td>
</tr>

<tr>
<td><label for="m">Email ID</label></td>
<td><input type="text" name="m" value="<%=i.getEmail() %>" id="m"/></td>
</tr>
<tr>
<td><label for="p">Password</label></td>
<td><input type="text" name="p" value="<%=i.getPassword()%>" id="p" /></td>
</tr>
<tr align="center">
<td><input type="submit" value="Submit" name="btn" /></td>
<td><input type="reset" value="Clear" /></td>
</tr>
</table>
</fieldset>
</form>
<%
	String b=request.getParameter("btn");
	if(b!=null && b.equals("Submit")){
		String fname=request.getParameter("n");
		String lname=request.getParameter("n1");
		String gender=request.getParameter("g");
		int age=Integer.parseInt(request.getParameter("a"));
		String address=request.getParameter("ad");
		String contactNo=request.getParameter("cn");
		String email=request.getParameter("m");
		String password=request.getParameter("p");
%>
<h3 align="center" style="color:blue;font-weight:bolder;">	
<%	
	  int s=obj.edit(id,fname,lname,gender,age,address,contactNo,email,password);
	  out.print((s>0)?"Updated ":"Not Updated");	
	}
%>
<%
		}
	}
%>
</h3>
</body>
</html>