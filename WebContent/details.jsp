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
<script type="text/javascript" src="js/lhgdialog.js"></script>
<script type="text/javascript">  

function toFun(goodsid){

  var num=$("#num"+goodsid).val();//这步来获取当前商品对应的数量，然后在用js方法跳转到目标servlet

  window.location.href="shoppingcarServlet?id="+goodsid+"&num="+num;

  //你也可以用表单提交 都可以

}

  function selflog_show(id){
	  System.out.println("seflog_show");
       var num =  document.getElementById("number").value; 
       J.dialog.get({id: 'haoyue_creat',title: 'Success Purchase !',width: 600,height:400, link: '<%=path%>/CartServlet?id='+id+'&num='+num+'&action=add', cover:true});
  }
     
    //商品数量增加
	function add() {
		var num = parseInt(document.getElementById("number").value);
		if (num < 100) {
			document.getElementById("number").value = ++num;
		}
	}
	
    //商品数量减少
	function sub() {
		var num = parseInt(document.getElementById("number").value);
		if (num > 1) {
			document.getElementById("number").value = --num;
		}
    }
</script>
<style type="text/css">
hr {
	border-color: FF7F00;
}


div {
	float: left;
	margin-left: 30px;
	margin-right: 30px;
	margin-top: 5px;
	margin-bottom: 5px;
}


div dd {
	margin: 0px;
	font-size: 10pt;
}


div dd.dd_name {
	color: blue;
}


div dd.dd_city {
	color: #000;
}


div #cart {
	margin: 0px auto;
	text-align: right;
}


span {
	padding: 0 2px;
	border: 1px #c0c0c0 solid;
	cursor: pointer;
}


a {
	text-decoration: none;
}
</style>
</head>
<body>
    <h1>Commodity Details</h1>
    <a href="index.jsp">Home</a> >> <a href="books.jsp">Books</a>
    <hr>
    <center>
      <table width="750" height="60" cellpadding="0" cellspacing="0" border="0">
        <tr>
          <!-- 商品详情 -->
          
          <% 
                 ItemsDAO itemDao = new ItemsDAO();
                 Items item = itemDao.getItemsById(""+request.getParameter("id"));
                 if(item != null){
          %>
          
          <td width="70%" valign="top">
             <table>
               
               <tr>
                 <td><B><%=item.getName() %></B></td> 
               </tr>
               <tr>
                 <td>Amount：<%=item.getNumber()%></td>
               </tr>
               <tr>
                 <td>Price：<%=item.getPrice() %>$</td>
               </tr> 
               <tr>
                 <td>BuyNumber：
                       <span id="sub" onclick="sub();">-</span><input type="text" id="number" name="number" value="1" size="2" /><span id="add" onclick="add();">+</span>
                 </td>
               </tr> 
             </table>
             <div id="cart">
             	<a>id：<%=item.getId() %></a>
               <a href="javascript:selflog_show(<%=Long.parseLong(item.getId())%>)">Add to Cart&nbsp;&nbsp; </a>
               <a href="CartServlet?action=show">View Cart</a>
             </div>
          </td>
          
          
          
          <td><input type="button" value="-" onclick="decrease(this);">

    <input size="1" maxlength="4" type="text" id="num${goodslist.id}" name="num${goodslist.id}" value="1"/>

    <input type="button" value="+" onclick="increase(this);"/></td>

<td><a href="javascript:;" onclick="toFun('${goodslist.id}');">加入购物车</a></td>


          
          <% 
                  }
          %>
          
          <% 
	               String list ="";
	               //从客户端获得Cookies集合
	               Cookie[] cookies = request.getCookies();
	               //遍历这个Cookies集合
	               if(cookies != null&&cookies.length > 0){
		               for(Cookie c:cookies){
		                   if(c.getName().equals("ListViewCookie")){
		                      list = c.getValue();
		                   }
		               }
		          }
              
	              //追加商品编号
	              list += request.getParameter("id")+",";
	              //如果浏览记录超过1000条，清零.
	              String[] arr = list.split(",");
	              if(arr!= null&&arr.length != 0){
	                  if(arr.length>=1000){
	                      list = "";
	                  }
	              }
          %>
          
          <!-- 浏览过的商品 -->
          <td width="30%" bgcolor="#EEE" align="center">
             <br>
             <b>Review History</b><br>
             <!-- 循环开始 -->
             <% 
	                ArrayList<Items> itemlist = itemDao.getViewList(list);
	                if(itemlist!=null&&itemlist.size()>0 ){
	                    System.out.println("itemlist.size="+itemlist.size());
	                    for(Items i:itemlist){
                         
             %>
             <div>
             <dl>
               <dt>
                 <a href="details.jsp?id=<%=i.getId()%>"></a>
               </dt>
               <dd class="dd_name"><%=i.getName() %></dd> 
               <dd class="dd_city">Amount:<%=i.getNumber() %>&nbsp;&nbsp;Price:$ <%=i.getPrice() %> </dd> 
             </dl>
             </div>
             <% 
                        }
                   }
             %>
             <!-- 循环结束 -->
          </td>
        </tr>
      </table>
    </center>
</body>
</html>