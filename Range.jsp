<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find details in between time intervals</title>
<style>
body {
            margin: 0;
            padding: 0;
            background-image: url('https://images.unsplash.com/photo-1612538498456-e861df91d4d0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTV8fHxlbnwwfHx8fHw%3D');
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
text-align:center;
}
</style>
</head>
<%@page import="java.util.Vector" %>
<%@page import="gym.EntryDetails" %>
<%@page errorPage="Handler.jsp" %>
<body>
<nav>
<a href="AdminOptions.jsp">Back</a>
<a href="FirstPage.jsp">Logout</a>
</nav>
<form method="post" action="#" >
<div>
<label for="dt">Date</label>
<input type="text" name="dt" value="" id="dt" autocomplete="off" required/>
<label for="it">InTime</label>
<input type="text" name="it" value="" id="it" autocomplete="off" required/>
<label for="ot">OutTime</label>
<input type="text" name="ot" value="" id="ot" autocomplete="off" required/>
<input type="submit" value="submit" name="btn" />
<input type="reset" value="Clear" />
</div>
<% 	String b=request.getParameter("btn");
	if(b!=null && b.equals("submit")){
		String dt=request.getParameter("dt");
		String it=request.getParameter("it");
		String ot=request.getParameter("ot");
%>
<jsp:useBean id="obj" class="gym.Entry"></jsp:useBean>
<h3 align="center" style="color:black;font-weight:bolder;">	    
<%       Vector<EntryDetails> r=obj.Filterview(dt,it,ot);
         int r1=obj.Findentries(dt,it,ot);
%>
<fieldset><legend>User Entry Details</legend>
<table align="center" cellspacing="10" cellpadding="5" border="5" rules="all">
<tr style="color:blue;font-weight:bolder;">
<td>ID</td><td>FIRST NAME</td><td>LAST NAME</td><td>GENDER</td><td>AGE</td>
<td>ADDRESS</td><td>CONTACT NO</td><td>EMAIL ID</td><td>Date</td><td>In</td><td>Out</td>
</tr>
<%
  for(EntryDetails i : r){
%>
<tr>
<td><%=i.getId() %></td><td><%=i.getFname() %></td><td><%=i.getLname() %></td><td><%=i.getGender() %></td>
<td><%=i.getAge() %></td><td><%=i.getAddress() %></td><td><%=i.getContactNo() %></td>
<td><%=i.getEmail() %></td><td><%=i.getDate()%></td><td><%=i.getIn()%></td><td><%=i.getOut()%></td>
</tr>
<%
}
%>
<tr><td style="background-color:Green;" colspan="7">Number of Entries</td><td style="background-color:Red;" colspan="4"><%out.print(r1);%></td></tr>
</table>
</fieldset>
<%
}
%>
</h3>
</form>
</body>
</html>