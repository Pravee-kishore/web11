<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN PAGE</title>
<%@page errorPage="Handler.jsp" %>
<style>
body {
            margin: 0;
            padding: 0;
            background-image: url('https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
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
legend,label{
            background-color: black;
            color:white;
}
fieldset {
    width: 30%; 
    margin: 0 auto;
    padding: 15px;
    background-color: black;
  }
</style>
</head>
<body>
<jsp:useBean id="obj" class="gym.DBCode"></jsp:useBean>
<% int c=obj.ShowRecords();
        if(c==0){%>
<form method="post" action="#" >
<nav>
        <a href="FirstPage.jsp">Home</a>
        <a href="Admin.jsp">Admin</a>
        <a href="Register.jsp">Register</a>
        <a href="Login.jsp">Sign in</a>
</nav>
<fieldset><legend>Admin Register</legend>
<table align="center">
<tr>
<td><label for="ad">Admin </label></td>
<td><input type="text" name="ad" value="" id="ad" /></td>
</tr>
<tr>
<td><label for="p">Password</label></td>
<td><input type="text" name="p" value="" id="p" /></td>
</tr>
<tr align="center">
<td><input type="submit" value="Submit" name="btn" /></td>
<td><input type="reset" value="Clear" /></td>
</tr>

<% 	String b=request.getParameter("btn");
	if(b!=null && b.equals("Submit")){
		String uname=request.getParameter("ad");
		String pass=request.getParameter("p");
%>
<h3 align="center" style="color:blue;font-weight:bolder;">	    
<%        int r=obj.AdminValues(uname,pass);
        out.print(r>0? "Registered":"Not Registered");
	}
%>
</h3>
</table>
</fieldset>
</form>
<% }else{ %>
  <form method="post" action="#" >
<nav>
        <a href="FirstPage.jsp">Home</a>
        <a href="Register.jsp">User Registration</a>
</nav>

<fieldset><legend>Admin Login</legend>
<table align="center">
<tr>
<td><label for="ad">Admin </label></td>
<td><input type="text" name="ad" value="" id="ad" autocomplete="off"/ required></td>
</tr>
<tr>
<td><label for="p">Password</label></td>
<td><input type="text" name="p" value="" id="p" autocomplete="off" required/></td>
</tr>
<tr>
<td><label for="chk">Show Password</label></td>
<td><input type="checkbox" id="chk"></td>
</tr>
<script>
const p = document.getElementById("p");
const c = document.getElementById("chk");
function showpassword() {
    if (c.checked) {
        p.type = "text";
    } else {
        p.type = "password";
    }
}
p.addEventListener("input", showpassword);
c.addEventListener("change", showpassword);
</script>
<tr align="center">
<td><input type="submit" value="Submit" name="btn" /></td>
<td><input type="reset" value="Clear" /></td>
</tr>

<% 	String b=request.getParameter("btn");
	if(b!=null && b.equals("Submit")){
		String uname=request.getParameter("ad");
		String pass=request.getParameter("p");
%>
<h3 align="center" style="color:blue;font-weight:bolder;">	    
<%        int r=obj.login(uname,pass);
          if(r>0) {
        	  response.sendRedirect("AdminOptions.jsp");
          }else{out.print("INCORECT USERNAME/PASSWORD");}
          }
}
%>
</h3>
</table>
</fieldset>
</form> 
</body>
</html>