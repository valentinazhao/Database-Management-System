<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %> 
<%@ page import="entity.Items"%> 
<%@ page import="dao.ItemsDAO"%> 
<% 
String path = request.getContextPath(); 
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Commodity Details</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/lhgcore.js"></script>
</head>
<body>
    <h1>Commodity Display</h1>
    <a href="index.jsp">Home</a> >> <a href="Books.jsp">Books</a>
    <hr>
    <center>
      <table width="750" height="60" cellpadding="0" cellspacing="0" border="0"> 
		<tr> 
			<td> 
			
			<!-- 商品循环开始 --> 
			<% ItemsDAO itemsDao = new ItemsDAO(); 
			ArrayList<Items> list = itemsDao.getAllItems(1);//逻辑处理后获取所有的商品 
			if(list!=null&&list.size()>0) { 
				for(int i=0;i<list.size();i++) { 
					Items item = list.get(i); 
			%> <div> 
				<dl> 
					<dd class="dd_name"><%=item.getName() %></dd> 
					<dd class="dd_price">  Price:$ <%=item.getPrice()%>  &nbsp;&nbsp;  Amount: <%=item.getNumber()%></dd>
					<dt> 
						<a href="details.jsp?id=<%=item.getId()%>" >>>Detail</a>						
					</dt> 
				 </dl> 
				</div> 
				<!-- 商品循环结束 --> 
				<% 
						} 
					} 
				%> 
				</td> 
			</tr> 
		</table> 
    </center>
</body>
</html>