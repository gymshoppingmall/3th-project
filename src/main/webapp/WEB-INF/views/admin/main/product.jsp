<%@ page contentType="text/html;charset=UTF-8"%>
<% %>
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
  <h1>상품관리 페이지입니다.</h1>
  <p>오늘 등록된 상품은 %n건입니다.</p>
  <p>오늘 판매된 상품은 %n건입니다.</p>
  <p>현재 배송중인 상품은 %n건입니다.</p>

	<div id="piechart"></div>
</div>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Task', 'Hours per Day'],
  ['운동기구', 4],
  ['보조식품', 12],
  ['운동복', 9],
  ['신발', 11],
  ['기타', 8]
]);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'상품', 'width':550, 'height':400};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
</script>
</body>
</html>