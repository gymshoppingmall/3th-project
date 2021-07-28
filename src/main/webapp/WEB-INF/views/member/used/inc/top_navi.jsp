<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Member mem = (Member)session.getAttribute("member");
%>
<body>      
	<div class="row text-center" style="width :80%; margin:auto; margin-top: 50px; 
	margin-bottom: 35px; padding-left: 250px; padding-right: 250px;">
		<div class="col-sm-1">
			<select style="height: 30px">
				<option>상품명</option>
				<option>상점명</option>
				<option>상점ID</option>
				<option>상한가</option>
				<option>하한가</option>
			</select>
		</div>
		<div class="col-sm-2" style="width: 100%">
			<input type="text" placeholder="검색어">				
		</div>
		<div class="col-sm-1">
			<button style="background-color: #5cb85c; color: white">검색</button>
		</div>
		<div class="col-sm-1">
		</div>
        <div class="col-sm-1">
            <span onclick="location.href='/member/used/main'"><h4><strong>메인</strong></h4></span>
        </div>
        <div class="col-sm-1">
            <span onclick="location.href='/member/used/product/registForm'"><h4><strong>등록</strong></h4></span>
        </div>
        <div class="col-sm-1">
            <span onclick="location.href='/member/used/store?member_id=<%=mem.getMember_id()%>'"><h4><strong>상점</strong></h4></span>
        </div>
        <div class="col-sm-1">
            <span onclick="location.href='#'"><h4><strong>대화</strong></h4></span>
        </div>
    </div>
</body>
</html>