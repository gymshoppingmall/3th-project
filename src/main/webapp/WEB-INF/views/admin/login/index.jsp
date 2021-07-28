<%@page import="ga.dgmarket.gymshopping.domain.Admin"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%Admin admin = (Admin)session.getAttribute("admin"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지입니다..</title>
<%@ include file="../inc/bootstrap.jsp" %>
</head>
<body>
<%@ include file="../inc/top_navi.jsp" %>
<div class="container p-3 my-3 bg-dark text-white">
  <h1>득근마켓 관리자 페이지입니다.</h1>
<%if(admin!=null){ %>  
  <p>안녕하세요! 
  <%=admin.getName()%>
   님, 오늘도 좋은 하루 보내세요.</p>
  <%}else{ %>  
  <h1>잘못된 접근방식입니다.</h1>
  <%} %>
  
</div>
	</div>
</body>
</html>