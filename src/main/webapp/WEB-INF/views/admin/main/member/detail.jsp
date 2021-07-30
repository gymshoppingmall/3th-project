<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Member member = (Member)request.getAttribute("member");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../../inc/bootstrap.jsp" %>
<%@ include file="../../inc/designscript.jsp" %>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
  <!-- Navbar -->
<%@ include file="../../inc/top_navi.jsp" %>
  <!-- /.navbar -->


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
		<!--등록폼 시작-->
			<div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">회원 상세 정보</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form name="form1">
              <input type="hidden" name="member_id" value="<%=member.getMember_id()%>">
              <input type="hidden" name="member_img" value="<%=member.getProfile_img()%>">
                <div class="card-body">
                  <div class="form-group">
                    
                    <label for="exampleInputEmail1">회원 등급</label>
						
	                        <select class="form-control" name="user_grade">
	                        	<option value="0">등급 선택</option>
	                        	<option value="1">일반 회원</option>
	                        	<option value="2">우수 회원</option>
	                        	<option value="3">판매자</option>
	                        	<option value="4">내가바로 리뷰왕</option>
	                        	<option value="5">내가바로 판매왕</option>
	                        	<option value="6">블랙리스트</option>	                          
	                        </select>
                      
                    </div>                    
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">ID</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" value="<%=member.getUser_id() %>" name="user_id" readonly="readonly">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">이름</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" value="<%=member.getName() %>" name = "name" readonly="readonly">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">닉네임</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" value="<%=member.getStorename() %>" name = "storename" >
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">이메일</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" value="<%=member.getEmail() %>" name = "email" readonly="readonly">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">전화번호</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" value="<%=member.getPhone() %>" name = "phone" readonly="readonly">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">가입일</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" value="<%=member.getRegdate() %>" name = "regdate" value="" readonly="readonly">
                  </div>                  
                  <div class="form-group">
                    <label for="exampleInputFile">프로필 변경</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="exampleInputFile" name="photo">
                        <label class="custom-file-label" for="exampleInputFile">파일을 선택하세요</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">업로드</span>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="button" class="btn btn-primary" onClick="update()">수정</button>
                  <button type="button" class="btn btn-primary" onClick="del()">삭제</button>
                  <button type="button" class="btn btn-primary" onClick="location.href='/admin/main/member'">목록</button>
                </div>
              </form>
            </div>		
		<!--등록폼 종료-->
      </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
</html>