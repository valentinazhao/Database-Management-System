<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%> 
<%@ page import="entity.Items"%> 
<%@ page import="dao.ItemsDAO"%> 
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html> 
	<head> 
	<base href="<%=basePath%>"> 

	<title>My JSP 'index.jsp' starting page</title> 
	<meta http-equiv="pragma" content="no-cache"> 
	<meta http-equiv="cache-control" content="no-cache"> 
	<meta http-equiv="expires" content="0"> 
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"> 
	<meta http-equiv="description" content="This is my page"> 
	<!-- 
	<link rel="stylesheet" type="text/css" href="styles.css"> 
	--> 
	<style type="text/css"> 
		div{ 
			float:left; 
			margin: 10px; 
		} 
		div dd{ 
			margin:0px; 
			font-size:10pt; 
		} 
		div dd.dd_name { 
			color:blue; 
		} 
		div dd.dd_city { 
			color:#000; 
		} 
	</style> 
</head> 

<body> 
	<h1>Commodity Display</h1>
	<a href="index.jsp">Home</a> 
	<hr> 
	
	<center> 
	<table width="750" height="60" cellpadding="0" cellspacing="0" border="0">
		<tr> 
			<td> 
			 <a href="books.jsp">Books</a>
			 <a href="mobile.jsp">Mobile</a>
			</td> 
			</tr> 
		</table> 
	</center> 
</body> 
</html>
