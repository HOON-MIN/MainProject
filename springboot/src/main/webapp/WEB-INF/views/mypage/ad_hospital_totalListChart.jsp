<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>
<!-- include 제거  -->
<div class="row">
    <div style="width: 500px;">
    <div><input type="button" value="click" id="jsonLoad"></div>
    <div id="target"></div>
    <div id="chart1"></div>
    </div>
</div>
<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
<!-- 이전 jquery 임포트 코드 ...!!! -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
// $(function(){
// 	$('.linktd').click(function(){
// 		var href = $(this).parent("tr").children("td").children("a").attr("href")
// // 		alert(href);
// 		window.location = href;
// 	});
//});
$('#jsonLoad').click(function(){
   $.ajax({
    url:'http://192.168.0.63:9000/hospital/hospitalListJsonP?callback',
    type:'GET',
    dataType:'jsonp',
    jsonp:'callback',
    success:function(data){
        console.log(data);
        makeBarChar(data.data[0]);
       },
       error: function(err){
          console.log('Error => '+err);
       }
   });
});

//c3js의 API 를 보고 맞는 형태를 제작
function makeBarChar(jsonData){
  // bar chart에 들어갈 데이터
  var datas = [];
  for(var key in jsonData){
      datas.push(key[count(*)]);  // push()  기억하자**
   }
  // [n개의 컬럼]  =>  str.slice(beginIndex[, endIndex])
  var dcolumns = dcol.slice(1, dcol.length);

  console.log("-------1");
  console.log(datas);

  // chart
  var chart = c3.generate({
    bindto:'#chart1',
    data: {
        columns: datas,
        type: 'bar'
    },
    bar: {
        width: {
            ratio: 0.5
        }
    },
    axis:{
        x:{
            type:'category',
            categories:dcolumns
        }
    }
  }); // chart end!
}

</script>









