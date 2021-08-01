<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna modify jsp</title>
<style type="text/css">
@charset "UTF-8";
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

body {
	margin: 0 auto;
	text-align: center;
	font-size: 16px;
	font-family: 'Noto Sans KR', sans-serif;
}

a:link, a:visited {
	text-decoration: none;
	color: #000;
}

#content {
	padding: 20px 0;
	min-width: 1024px;	/* 창의 최소 크기 지정 */
}

img {
	vertical-align: middle;	/* 세로축 가운데 정렬 */
}

table {
	width: 80%;
	margin: 0 auto;
	border: 1px solid;
	border-collapse: collapse;	/* 테두리 겹침 설정 collapse: 겹치지 않게 처리 */
}

table th, table td {
	border: 1px solid;
	padding: 5px 10px;
}

table td a:hover { font-weight: bold; }

.btnSet { margin-top: 20px;	}

a.btn-fill, a.btn-empty {
	text-align: center;
	padding: 3px 10px;
	border:1px solid #3367d6;
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	/* 오른쪽, 아래쪽, 번진 정도 */
}

a.btn-fill { 
	background-color: #3367d6;
	color: #fff;
}

a.btn-empty { 
	background-color: #fff;
	color: #3367d6
}

a.btn-fill-s, a.btn-empty-s {
	text-align: center;
	padding: 1px 10px;
	border:1px solid #c4dafc
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	font-size: 13px;
}

a.btn-fill-s { 
	background-color: #bacdfa;
}

a.btn-empty-s { 
	background-color: #fff;
}

.btnSet a:not(:first-child) {
	margin-left: 3px;
}

a:hover { cursor:pointer; }

input {
	height: 22px;
	padding: 3px 5px;
	font-size: 15px;
}

input[type=radio] {
	width: 18px;
	margin: 0 5px 3px;
	vertical-align: middle;
}

table tr td label:not(:last-child) {
	margin-right: 20px;	
}

.w-pct60 { width: 60% }
.w-pct70 { width: 70% }
.w-pct80 { width: 80% }
.w-px40 { width: 40px }
.w-px60 { width: 60px }
.w-px80 { width: 80px }
.w-px100 { width: 100px }
.w-px120 { width: 120px }
.w-px140 { width: 140px }
.w-px160 { width: 160px }
.w-px180 { width: 180px }
.w-px200 { width: 200px }

.left { text-align: left }
.right { text-align: right }

.font-img { cursor: pointer; }

</style>
</head>
<body>
<h3>QNA 수정</h3>
<!-- 
파일 첨부 시 form 태그의 필수 속성
1. method="post"
2. enctype="multipart/form-data"
 -->
<form action="update.qna" method="post" enctype="multipart/form-data">
	<input type="hidden" name="qna_id" value="${vo.qna_id }"/>
	<input type="hidden" name="attach" />
	<table>
		<tr>
			<th class="w-px160">제목</th>
			<td><input type="text" class="need" name="title" value="${vo.title }"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="need" name="content">${vo.content }</textarea></td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn-fill" onclick="if( necessary() ) {$('form').submit(); }">저장</a>
	<a class="btn-empty" href="detail.qna?id=${vo.qna_id }">취소</a>
</div>

<script type="text/javascript" src="js/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
</body>
</html>