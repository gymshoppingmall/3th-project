<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃중..</title>
<%@ include file="../inc/bootstrap.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

</script>
</head>
<body>
	  <%
	  	session.invalidate();
	  	response.sendRedirect("/admin/loginform");
	  %>
</body>
</html>