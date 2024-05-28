<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<style>
  body {
    margin: 0;
    padding: 0;
    align-items: center;
    height: 100vh;
    background-image: url('https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
    background-size: cover;
    background-position: center;
    }
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
.container {
    text-align: center;
}
 p {
        text-align: center;    
        font-size: 30px;
        color: Yellow;
        padding: 10px 20px 15px 25px;
        transition: background-color 0.5s ease; /* Apply transition to background-color property */
    }

    /* Define hover styles for the paragraph */
    p:hover {
        background-color: gray; /* Change background color on hover */
    }
</style>
</head>
<body>
<nav>
        <a href="Admin.jsp">Admin</a>
        <a href="Register.jsp">Register</a>
        <a href="Entries.jsp">Entries</a>
        <a href="Contact.jsp">Contact us</a>
</nav>
<div class="container">
<p>"I ain't nothing but a hardworking bodybuilder. I ain't got no special skill.
 All I do is train hard and have the mindset that whatever I set out to do, 
 I will achieve it." - Ronnie Coleman</p>
</div>
</body>
</html>