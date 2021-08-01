<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	HttpSession top_navi_session = request.getSession();
	Member top_navi_member = (Member) session.getAttribute("member"); //변수 이름 중복이 날 수 있으므로 변수명 구분 짓기
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<style>
.top_navi_header {
  background-color: #50586C;
  padding: 30px;
  text-align: center;
  color: white;
  font-weight: bold;
}

#top_navi_navbar {
  overflow: hidden;
  background-color: #333;;
  border-bottom: 2px black solid;
}

#top_navi_navbar a {
  float: left;
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 23px;
}

#top_navi_navbar a:hover {
  color: black;
}

#top_navi_navbar a.active {
  background-color: #04AA6D;
  color: black;
}

.top_navi_topnav-right {
  float: right;
}

</style>
</head>
<body>
<div class="top_navi_header">
  득근을 위한 <h1 onclick="location.href='#'" >득근마켓</h1> 모두의 마켓
</div>

<div id="top_navi_navbar">
  <a href="javascript:void(0)" style="margin-left: 2%">운동기구</a>
  <a href="javascript:void(0)">스포츠의류</a>
  <a href="javascript:void(0)">액세사리</a>
  <a href="javascript:void(0)">보조식품</a>
  <a href="javascript:void(0)">QnA</a>
  <div class="top_navi_topnav-right">
  	<% if (top_navi_member == null){ %> <!-- 로그인 중이 아니라면 -->
	    <a href="#search">로그인</a>
	    <a href="#about">회원가입</a>
    <% } else { %>
    	<a href="#search">중고마켓</a>
    	<a href="#search">로그아웃</a>    	
    <% } %>
  </div>
</div>
</body>

