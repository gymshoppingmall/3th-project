<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<Member> memberList = (List)request.getAttribute("memberList");
	int cnt = (int)(request.getAttribute("cnt"));
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
  <h1>회원관리 페이지입니다.</h1>
  <!-- regdate 대상으로 groupby 해서 값 찾기? -->
  <p>최근 한 달 간 가입한 고객의 수는 <%=cnt %>명입니다. </p>
</div>
<div class="container">
  <h2>전체 회원 목록</h2>
  <p>총 회원 수는 <%=memberList.size() %>명입니다.</p>
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th>ID</th>
        <th>이름</th>
        <th>닉네임</th>
        <th>전화번호</th>
        <th>주소</th>
        <th>이메일</th>
        <th>가입일자</th>
      </tr>
    </thead>
    <tbody>
    <%for(Member member : memberList){ %>
      <tr>
        <td><%=member.getUser_id() %></td>
        <td><%=member.getName() %></td>
        <td><%=member.getStorename() %></td>
        <td><%=member.getPhone() %></td>
        <td><%=member.getAddr() %></td>
        <td><%=member.getEmail() %></td>
        <td><%=member.getRegdate() %></td>
      </tr>
      <%} %>
    </tbody>
  </table>
 </div>
 

</body>
</html>