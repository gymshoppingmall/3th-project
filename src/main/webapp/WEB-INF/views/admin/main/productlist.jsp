<%@page import="ga.dgmarket.gymshopping.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<Product> productList = (List)request.getAttribute("productList");
%>
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
  <h1>상품목록 페이지입니다.</h1>
  <!-- regdate 대상으로 groupby 해서 값 찾기? -->
</div>
<div class="container">
  <h2>전체 상품 목록</h2>
  <p>현재 등록된 상품 수는 총 <%=productList.size() %>건입니다. </p>
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th>No.</th>
        <th>상품명</th>
        <th>가격</th>
        <!--  어떤 항목 추가할지..
        <th>전화번호</th>
        <th>주소</th>
        <th>이메일</th>
        <th>가입일자</th>
         -->
      </tr>
    </thead>
    <tbody>
    <%for(Product product : productList){ %>
      <tr>
        <td><%=product.getProduct_id() %></td>
        <td><%=product.getProduct_name() %></td>
        <td><%=product.getPrice() %></td>
      </tr>
      <%} %>
    </tbody>
  </table>
 </div>
 

</body>
</html>