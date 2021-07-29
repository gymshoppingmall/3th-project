<%@page import="ga.dgmarket.gymshopping.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<Product> productList = (List)request.getAttribute("productList");
	int totalRecord = productList.size();
	int blockSize = 10; //한번에 보여질 최대 페이지 수
	int pageSize = 10; //한번에 보여질 최대 요소 수 (게시글..회원 등등)
	int totalPage = (int)Math.ceil((float)totalRecord/pageSize);
	int currentPage = 1;//현재 페이지(디폴트)
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int firstPage = currentPage-((currentPage-1)%blockSize);
	int lastPage = firstPage+(blockSize-1);
	int num = totalRecord - (currentPage-1)*(pageSize);
	int for_i = (currentPage-1)*10;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지입니다..</title>
<%@ include file="../inc/bootstrap.jsp" %>
<style>
/* Change background color of buttons on hover */
.product-bar:hover {
  background-color: #ddd;
}
</style>
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
      <tr class= "product-bar">
        <td><%=product.getProduct_id() %></td>
        <td><%=product.getProduct_name() %></td>
        <td><%=product.getPrice() %></td>
      </tr>
      <%} %>
    </tbody>
  </table>
 </div>
   <tr>
		<td colspan="6" style = "text-align:center">
		<a href="/admin/main/member?currentPage=<%=firstPage-1%>">◀</a>
			<%for(int i = firstPage; i <= lastPage ; i++){ %>
			<%if(i>totalPage)break; %>
			<a href="/admin/main/member?currentPage=<%=i%>" <%if(currentPage==i){ %>class="pageNum"<%} %>>[<%=i %>]</a>
			<%} %>
		<a href="/admin/main/member?currentPage=<%=lastPage+1%>">▶</a>
		</td>
	</tr>

</body>
</html>