<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<style>
body {
            margin: 0;
            padding: 0;
            background-image: url('https://images.unsplash.com/photo-1519859660545-3dea8ddf683c?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            background-size: cover;
            background-position: center;
            height: 100vh;
            align-items: top;
            justify-content: center;
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
 color: white; 
  background-color:black;
}
fieldset {
    width: 30%; 
    margin: 0 auto;
    padding: 15px;
  }
</style>
</head>
<%@page errorPage="Handler.jsp" %>
<body>
<nav>
        <a href="FirstPage.jsp">Home</a>
        <a href="Entries.jsp">Entries</a>
</nav>
<fieldset ><legend>User Registration</legend>
<form method="post" action="#" >
<table align="center">
<tr>
<td><label for="n">First Name</label></td>
<td><input type="text" name="n" value="" id="n" autocomplete="off" required/></td>
</tr>
<tr>
<td><label for="n1">Last Name</label></td>
<td><input type="text" name="n1" value="" id="n1" autocomplete="off"/ required></td>
</tr>
<tr>
<td><label for="g">Gender</label></td>
<td style="background-color:White;"><input type="radio" name="g" value="male" id="g"> Male</td>
<td style="background-color:White;"><input type="radio" name="g" value="female" id="g"> Female</td>
<td style="background-color:White;"><input type="radio" name="g" value="other" id="g"> Other</td>
</tr>
<tr>
<td><label for="a">Age</label></td>
<td><input type="number" name="a" value="" id="a" autocomplete="off"/ required></td>
</tr>
<tr>
<td><label for="ad">Address</label></td>
<td><input type="text" name="ad" value="" id="ad" autocomplete="off"/ required></td>
</tr>
<tr>
<td><label for="cn">Contact No</label></td>
<td><input type="text" name="cn" value="" id="cn" autocomplete="off"/ required></td>
</tr>
<tr>
<td><label for="m">Email ID</label></td>
<td><input type="text" name="m" value="" id="m" autocomplete="off"/ required></td>
</tr>
<tr>
<td><label for="p">Password</label></td>
<td><input type="text" name="p" value="" id="p" autocomplete="off"/required></td>
</tr>
<tr align="center">
<td><input type="submit" value="Submit" name="btn" /></td>
<td><input type="reset" value="Clear" /></td>
</tr>
</table>
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
	<jsp:useBean id="obj" class="gym.DBCode"></jsp:useBean>
<h3 align="center" style="background-color:blue;color:white;font-weight:bolder;">	
<%	    
        int r=obj.Validation(address,contactNo,email);
        if(r==0){
        LocalDate currentDate = LocalDate.now();
        String Date = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        LocalTime currentTime = LocalTime.now();
        String Time = currentTime.format(DateTimeFormatter.ofPattern("HH:mm:ss")); 
        int r1=obj.add(fname,lname,gender,age,address,contactNo,email,password,Date,Time);
		out.print((r1>0)?"Registered ":"Not Registered");
        }else if(r==1){
        	out.print("Address is already registered, try with another Address");
        }else if(r==2){
        	out.print("Contact No is already registered, try with another Contact No");
        }else if(r==3){
        	out.print("Email Id is already registered, try with another Email Id");
        }
	}
%>
</h3>

</table>
</fieldset>

</body>
</html>