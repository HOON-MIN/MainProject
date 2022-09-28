<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- include 제거  -->
<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>


<%-- 리팩토링 해야 함 --%>
<div style="height: 80%;">
					<h3 class="hanna p-4" style="text-align: center;">전국 병원</h3>
					</div>
<table class="htable table table-hover table-borderless">
	<thead class="hanna">
		<tr>
			<th>번호</th>
			<th>병원명</th>
			<th>위치</th>
			<th>전화번호</th>
			<th>진료과목</th>
		</tr>
	</thead>
	<tbody>
		<%-- 		<%-- for start --%>
		<%-- 		<c:forEach var="e" items="${list }"> --%>
		<!-- 			<tr> -->
		<%-- 				<td class="linktd">${e.hnum }</td> --%>
		<%-- 				<td class="linktd"><a href="hospitalDetail?num=${e.hnum }"> ${e.hname }</a></td> --%>
		<%-- 				<td class="linktd">${e.hloc }</td> --%>
		<%-- 				<td class="linktd">${e.otime }~${e.ctime }</td> --%>
		<%-- 				<td class="linktd">${e.hcate }</td> --%>
		<!-- 			</tr> -->
		<%-- 		</c:forEach> --%>
		<%-- 		<%-- for end --%>
	</tbody>
</table>
<div>
	<div style="text-align: center;">
		<ul class="tj" id="pagingul"></ul>
		<form name="search-form" id="search-form" autocomplete="off"
			style="float: right;">
			<input type="text" name="keyword" id="keyword"></input> <input
				type="button" id="searchBtn" class="btn btn-outline-primary mr-2"
				value="검색">
		</form>

	</div>
	<select id="dataPerPage">
		<option value="5">5개씩보기</option>
		<option value="10">10개씩보기</option>
		<option value="20">20개씩보기</option>
	</select>
	<div id="displayCount" style="text-align: center;"></div>
</div>
<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
<!-- 이전 jquery 임포트 코드 ...!!! -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
// $(function(){
// 	$('.linktd').click(function(){
// 		var href = $(this).parent("tr").children("td").children("a").attr("href")
// // 		alert(href);
// 		window.location = href;
// 	});
//});


	let totalData; //총 데이터 수
	let dataPerPage; //한 페이지에 나타낼 글 수
	let pageCount = 5; //페이징에 나타낼 페이지 수
	let globalCurrentPage=1; //현재 페이지
	let totalList=[];
	let searchList=[];
	var keyword;
			
			
		$(function() {
			const input = document.querySelector('#search-form');
			input.addEventListener('keypress', function(e) {
				if (e.code == 'Enter') {
					search();
				}
			});
			$('#searchBtn').click(function(){
				search();
			});
			function search(){
			keyword = $('#keyword').val();	
			console.log('s'+keyword);
			console.log("keyword = > " + keyword);
			getSearchList(keyword);
			};
			
			$('#dataPerPage').change(function() {
				dataPerPage = $("#dataPerPage").val();
			
				paging(totalData, dataPerPage, pageCount, 1,totalList);
				 displayData(1, dataPerPage,totalList);
			});
			console.log("dataPerPage => "+ dataPerPage)
			dataPerPage = $("#dataPerPage").val();
			$.ajax({
				   //url:'http://192.168.0.113:9000/myjson/loadJson',
//				    url:'http://192.168.0.63:9000/hospital/hospitalListJsonP',
//				    url:'http://192.168.0.120:9000/hospital/hospitalListJsonP',
				    url:'http://192.168.0.63:9000/hospital/hospitalListJsonP',
				    type:'GET',
				    dataType:'jsonp',
				    jsonp:'callback',
				    success:function(data){
				    	totalData = data.data[0].length
				    	console.log(data)
				            for (var i of data.data[0]) {
				           	totalList.push(i)
				       }  
				           	console.log('total ' ,totalList)
				       paging(totalData, dataPerPage, pageCount, 1,totalList);
		       		   displayData(1, dataPerPage,totalList);
				    },
				       error: function(err){
				          console.log('Error => '+err);
				       }
			
				   });
			/* $.ajax({
				   //url:'http://192.168.0.113:9000/myjson/loadJson',
//				    url:'http://192.168.0.63:9000/hospital/hospitalListJsonP',
//				  
				    type:'GET',
				    dataType:'jsonp',
				    jsonp:'callback',
				    success:function(data){
				        console.log(data);
				        console.log(data.columns);
				        console.log(data.data);
				           for (var i of data.data[0]) {
				           	d.push(i)
				       }
				       paging(totalData, dataPerPage, pageCount, 1,d);
		       		   displayData(1, dataPerPage,d);
				    },
				       error: function(err){
				          console.log('Error => '+err);
				       }
			
				   }); */

			//병원 목록
			/* $.ajax({
	            url: 'http://192.168.0.120:9000/hospital/hospitalListTotal',
	            //url: 'http://14.36.188.14:9000/map/hospiter_list',
	            type: 'GET',
	            dataType: 'jsonp',
	            jasonp: 'callback',
	            
	            success: function(data){ // 데이터를 불러와 tbody에 요소 집어넣기
	                totalData = data.data.length
	            	for(var e of data.data){
	            		d.push(e)
	            	}
	           
	                paging(totalData, dataPerPage, pageCount, 1,d);
	       			displayData(1, dataPerPage,d);
	            },
	            error: function(err){
	               console.log('Error => '+err);
	            }
	        }); */
				
				// ---------------- 페이징 처리 -----------------------
				function paging(totalData, dataPerPage, pageCount, currentPage,d) {
					  console.log("currentPage : " + currentPage);
					  console.log("totalData : " + totalData);

					  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
					  
					  if(totalPage<pageCount){
					    pageCount=totalPage;
					  }
					  
					  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
					  let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
					  
					  if (last > totalPage) {
					    last = totalPage;
					  }

					  let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
					  let next = last + 1;
					  let prev = first - 1;

					  let pageHtml = "";

					  if (prev > 0) {
					    pageHtml += "<li><a href='#' id='prev'> 이전 </a></li>";
					  }

					 //페이징 번호 표시 
					  for (var i = first; i <= last; i++) {
					    if (currentPage == i) {
					      pageHtml +=
					        "<li class='on'><a href='#' id='" + i + "'>" + i + "</a></li>";
					    } else {
					      pageHtml += "<li><a href='#' id='" + i + "'>" + i + "</a></li>";
					    }
					  }

					  if (last < totalPage) {
					    pageHtml += "<li><a href='#' id='next'> 다음 </a></li>";
					  }

					  document.querySelector('#pagingul').innerHTML =(pageHtml);
					  let displayCount = "";
					  displayCount = "현재 "+globalCurrentPage+" - " + totalPage + " 페이지 / " + totalData + "건";
					  $("#displayCount").text(displayCount);

					  //페이징 번호 클릭 이벤트 
					  $("#pagingul li a").click(function () {
						    let $id = $(this).attr("id");
						    selectedPage = $(this).text();
						    console.log('selectedPage => '+selectedPage)
							console.log('paging d => ' + d[selectedPage])
						    if ($id == "next") selectedPage = next;
						    if ($id == "prev") selectedPage = prev;
						    
						    //전역변수에 선택한 페이지 번호를 담는다
						    globalCurrentPage = selectedPage;
						    //페이징 표시 재호출
						    paging(totalData, dataPerPage, pageCount, selectedPage,d);
						    //글 목록 표시 재호출
						    displayData(selectedPage, dataPerPage,d);
						  });
					} // paging 끝
				
				function displayData(currentPage, dataPerPage,d) {

					  let chartHtml = "";

					  //Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합됨 
					  currentPage = Number(currentPage);
					  dataPerPage = Number(dataPerPage);
					  let j = 0;
					  for (
					    var i = (currentPage - 1) * dataPerPage;
					    i < (currentPage - 1) * dataPerPage + dataPerPage;
					    i++
					  ) {
						  
					  console.log('i => ' + i)
					 
					 
					 if(totalData >i){
						 console.log('d '+d[i])
					    chartHtml +=
					    	'<tr style="cursor:pointer;">'+
				           	'<td  >'+(i+1)+'</td>'+
				           	'<td  id="listBtn" >'+d[i].hos_name+'</td>'+
				           	'<td  >'+d[i].hos_address+'</td>'+
				           	'<td  >'+d[i].hos_tel+'</td>'+
				           	'<td  >'+d[i].hos_loc+'</td><tr>'
					  	}
					} 
					     document.querySelector('.htable > tbody').innerHTML = chartHtml;
					} // displayData 끝
				
				function getSearchList(keyword){
							if(keyword != ""){
					$.ajax({
						url:'http://192.168.0.120:9000/hospital/hospitalListTotalSearch?keyword='+keyword,
					    type:'GET',
					    dataType:'jsonp',
					    jsonp:'callback',
						success : function(data){
							totalData = data.data.length
							//테이블 초기화
							 $('.htable > tbody').empty();
							for (var i of data.data) {
					           	searchList.push(i)
							console.log('d = >' + i)
					       }
					paging(totalData, dataPerPage, pageCount, 1,searchList);
		       		displayData(1, dataPerPage,searchList); 
							
						}
					})
					}else{
						$.ajax({
							    url:'http://192.168.0.120:9000/hospital/hospitalListTotal',
							    type:'GET',
							    dataType:'jsonp',
							    jsonp:'callback',
							    success:function(data){
							    	totalData = data.data.length
							           for (var i of data.data) {
							           	totalList.push(i)
							       }
							       paging(totalData, dataPerPage, pageCount, 1,totalList);
					       		   displayData(1, dataPerPage,totalList);
							    },
							       error: function(err){
							          console.log('Error => '+err);
							       }
						
							   });
					}
					}// getSearchList 끝
		});

</script>









