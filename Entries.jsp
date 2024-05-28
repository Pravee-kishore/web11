<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@page import="java.util.Vector" %>
<%@page import="gym.Registration" %>
<%@page import="gym.DBCode" %>
<%@page errorPage="Handler.jsp" %>
<style>
body {
            margin: 0;
            padding: 0;
            background-image: url('https://images.unsplash.com/photo-1612090295965-e506249ccecc?q=80&w=1824&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            background-size: cover;
            background-position: center;
            height: 100vh;
        }
nav {
            background-color: #333;
            padding: 15px;
            text-align: right;
        }
nav a {
            color: white;
            text-decoration: none;
            padding: 15px;
            margin: 0 10px;
        }
form{
            background-color:none;
            padding: 50px;
            color: #333;
}
legend,label{
 color: white; 
  background-color:black;
}
fieldset {
    width: 30%; 
    margin: 0 auto;
    padding: auto;
  }
h3{
text-align:center;
background-color:blue;
color:white;
font-weight:bolder;
}
</style>
</head>
<body>
<nav>
        <a href="FirstPage.jsp">Home</a>
        <a href="Register.jsp">Register</a>
</nav>
<fieldset><legend>Entries</legend>
<form method="post" action="#" >
<table  align="center">
<tr>
<td><label for="cn">ContactNo</label></td>
<td><input type="text" name="cn" value="" id="cn" autocomplete="off" required /></td>
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
<td><input type="submit" value="Submit" name="btn" id="s" /></td>
<td><input type="reset" value="Clear" id="cl" /></td>
</tr>
<% 	String b=request.getParameter("btn");
	if(b!=null && b.equals("Submit")){
		String uname=request.getParameter("cn");
		String pass=request.getParameter("p");
%>
<jsp:useBean id="obj" class="gym.DBCode"></jsp:useBean>
<jsp:useBean id="obj1" class="gym.Entry"></jsp:useBean>
<h3>	    
<%        int n=obj.Userlogin(uname,pass);
          if(n>0) {
%>        	  
<div id="m" style="color:yellow;font-weight:Bol">REGISTERED,THANK YOU</div>
<script>
        	    function displayMessage() {
        	        var m = document.getElementById("m");
        	        m.style.display = "block";  
        	        setTimeout(function(){
        	            m.style.display = "none"; 
        	        }, 1000);
        	    }

        	    // Call the function to display the message
        	    displayMessage();
        	</script>
  <%      	  //out.print("Registered");
        	  LocalDate currentDate = LocalDate.now();
        	  String Date = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        	  LocalTime currentTime = LocalTime.now();
        	  String Time = currentTime.format(DateTimeFormatter.ofPattern("HH:mm:ss")); 
        	  obj1.UlogValues(uname,pass,Date,Time);
          }
          else{out.print("INCORECT USERNAME/PASSWORD ");}
	}
%>
</h3>
</table>
</fieldset>
</form>
</body>
</html>