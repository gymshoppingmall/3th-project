<%@page import="ga.dgmarket.gymshopping.domain.Admin"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	HttpSession loginSession = request.getSession();
	Admin admin = (Admin)loginSession.getAttribute("admin");
%>
<%if(admin!=null){ %>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
  <a class="navbar-brand" href="#">
  	<img src="/resources/admin/imgs/reallogo.png" width="50px" height="50px">
  </a>
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="/admin/main/index">관리자메인</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/admin/main/qna">Q&A관리</a>
    </li>
    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        상품관리
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="/admin/main/product">전체관리</a>
        <a class="dropdown-item" href="/admin/main/productlist">상품목록</a>
        <a class="dropdown-item" href="#">등록/수정</a>
        <a class="dropdown-item" href="#">배송현황</a>
      </div>
    </li>
    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        회원관리
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="/admin/main/member">전체관리</a>
        <a class="dropdown-item" href="#">우수회원</a>
        <a class="dropdown-item" href="#">블랙리스트</a>
      </div>
    </li>
    <li>
  </ul>
  <ul class="navbar-nav float-right">
      <span class="navbar-text ml-auto">
  	</span>  
  </ul>
</nav>
<%}else{%>
잘못된 접근방법입니다.
<%}%>