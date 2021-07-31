<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<Map> historyList = (List) session.getAttribute("historyList");
%>
<script>
var controllDiv;
$(function(){
    controllDiv = document.getElementById("controllDiv");
    console.log(window.innerWidth+"gd");
    controllDiv.style.left = window.innerWidth-(controllDiv.offsetWidth+100)+"px";
    controllDiv.style.top = ((window.innerHeight/2)-150+window.scrollY)+"px";

    $(window).resize(function(){
        controllDiv.style.left = window.innerWidth-(controllDiv.offsetWidth+100)+"px";
        controllDiv.style.top = ((window.innerHeight/2)-150+window.scrollY)+"px";
    });

    $(window).scroll(function(){
        controllDiv.style.top = (window.innerHeight/2)-150+"px";
        console.log("div 탑 위치"+controllDiv.offsetTop);
        console.log("스크롤 위치"+window.scrollY);
        console.log("더한 값"+(controllDiv.offsetTop+window.scrollY));
        var divTop = controllDiv.offsetTop+window.scrollY;
        controllDiv.style.top = divTop+"px";
    });
});
</script>
<div id="controllDiv" style="width: 150px; position: absolute; border: 2px solid black; text-align: center;">
	<div><strong>최근 본 상품 </strong><span onclick="">x<span></div>

	<% //if (historyList != null){%>
		<% //for(int i = 0; i < historyList.size()-1; i ++){ %>
		<% //Map map = (Map)historyList.get(i) %>
		<!-- 
			이미지 태그와 onclick이용해서 product_detail로 이동 시킬 예정
		 -->
		<% //} %>
	<% //} %>
</div>