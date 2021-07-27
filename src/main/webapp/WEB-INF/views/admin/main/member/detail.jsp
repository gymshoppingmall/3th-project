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
<<<<<<< HEAD
                <h3 class="card-title">상세 정보</h3>
=======
                <h3 class="card-title">회원 상세 정보</h3>
>>>>>>> seokmin
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form name="form1">
              <input type="hidden" name="member_id" value="<%=member.getMember_id()%>">
              <input type="hidden" name="member_img" value="<%=member.getProfile_img()%>">
                <div class="card-body">
                  <div class="form-group">
<<<<<<< HEAD
                    <label for="exampleInputEmail1">상위 카테고리</label>
						<div class="form-group">
	                        <select class="form-control" name="topcategory_id">
	                        	<option value="0">카테고리 선택</option>
	                          
	                        </select>
                      </div>
                    </div>                    
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">상품명</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" name="product_name">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">브랜드</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="brand" name = "brand">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">가격</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="price" name = "price" value="">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">상세정보</label>
                    <textarea class="form-control" placeholder="상품 상세정보" name="info"></textarea>
                  </div>
                  
                  <div class="form-group">
                    <label for="exampleInputFile">File input</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="exampleInputFile" name="photo">
                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">Upload</span>
=======
                    <label for="exampleInputEmail1">회원 등급</label>
						
	                        <select class="form-control" name="topcategory_id">
	                        	<option value="0">등급 선택</option>
	                        	<option value="1">일반 회원</option>
	                        	<option value="2">우수 회원</option>
	                        	<option value="3">내가바로 리뷰왕</option>
	                        	<option value="4">내가바로 판매왕</option>
	                        	<option value="5">블랙리스트</option>	                          
	                        </select>
                      
                    </div>                    
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">ID</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" value="<%=member.getUser_id() %>" name="product_name" readonly="readonly">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">이름</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" value="<%=member.getName() %>" name = "brand">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">닉네임</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" value="<%=member.getStorename() %>" name = "price" >
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">가입일</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" value="<%=member.getRegdate() %>" name = "price" value="" readonly="readonly">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">인삿말</label>
                    <textarea class="form-control" name="info">안녕하세욘</textarea>
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
>>>>>>> seokmin
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
<<<<<<< HEAD
                  <button type="button" class="btn btn-primary" onClick="regist()">Submit</button>
                  <button type="button" class="btn btn-primary" onClick="update()">Submit</button>
                  <button type="button" class="btn btn-primary" onClick="del()">Submit</button>
=======
                  <button type="button" class="btn btn-primary" onClick="update()">수정</button>
                  <button type="button" class="btn btn-primary" onClick="del()">삭제</button>
                  <button type="button" class="btn btn-primary" onClick="regist()">목록</button>
>>>>>>> seokmin
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