<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>


<div class="container-fluid">

	
	<!-- table -->
	<div class="container">
		
		<!-- <div class="collapse" id="collapseMap"></div> -->

		<select id="dataPerPage">
        <option value="5">5개씩보기</option>
        <option value="10">10개씩보기</option>
        <option value="20">20개씩보기</option>
</select>
		<table class="table1 table table-hover" id="datatable">
			<thead>
				<tr>
					<th scope="col">병원이름</th>
					<th scope="col">병원주소</th>
					<th scope="col">진료구분</th>
					<th scope="col">전화번호</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
		<div style="text-align: center;">
		<ul class="tj" id="pagingul"></ul>
		<form name="search-form" id="search-form" autocomplete="off" style="float: right;">
		<input type="text" name="keyword"id="keyword"></input>
		<input type="button" id="searchBtn" class="btn btn-outline-primary mr-2" value="검색">
		</form></div>
		<div id="displayCount" style="text-align: center;"></div>
	</div>
	<!-- <div class="jb"> -->
	</div>

<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>

<script>
let totalData; //총 데이터 수
let dataPerPage; //한 페이지에 나타낼 글 수
let pageCount = 5; //페이징에 나타낼 페이지 수
let globalCurrentPage=1; //현재 페이지
let d=[];
let totalList=[];
let searchList=[];
var keyword;
	$(function() {
		$('#searchBtn').click(function(){
			keyword = $('#keyword').val();
				//$(this).text()
			console.log("keyword = > " + keyword)
			getSearchList(keyword)
		})
		$('#dataPerPage').change(function() {
			dataPerPage = $("#dataPerPage").val();
		
			paging(totalData, dataPerPage, pageCount, 1,d);
			 displayData(1, dataPerPage,d);
		})
		console.log("dataPerPage => "+ dataPerPage)
		dataPerPage = $("#dataPerPage").val();
		 
		//병원 예약 목록
		$.ajax({
            url: 'http://192.168.0.120:9000/hospital/hospitalListTotal',
            //url: 'http://14.36.188.14:9000/map/hospiter_list',
            type: 'GET',
            dataType: 'jsonp',
            jasonp: 'callback',
            
            success: function(data){ // 데이터를 불러와 tbody에 요소 집어넣기
                console.log(data.data.length)
                console.log(data)
                totalData = data.data.length
            	for(var e of data.data){
            		d.push(e)
            	}
                
                /*               for (var i of data.data[0]) {
                	tbodyData.push('<tr style="cursor:pointer;" ><td  id="listBtn" >'+i.hos_name+'</td><td>'+i.hos_address+'</td><td>'+i.hos_loc+'</td><td>'+i.hos_tel+'</td></tr>')
                 	tbodyData.push('<tr style="cursor:pointer;" data-bs-toggle="modal" data-bs-target="#exampleModal"><td  id="listBtn" >'+i.hos_name+'</td><td>'+i.hos_address+'</td><td>'+i.hos_loc+'</td><td>'+i.hos_tel+'</td></tr>') */
                	
                	/* imgData.push('<div class="jb-wrap">'+
                	'<div class="jb-image">'+
                	'<img src="/taejin/hospital_img/hospital.jpg" style="cursor:pointer;"data-bs-toggle="modal" '+
                	'data-bs-target="#exampleModal" id="listBtn" >'+i.hos_name+'</div></div>')
                	nameData.push(i.hos_name)
                } */
                paging(totalData, dataPerPage, pageCount, 1,d);
       			 displayData(1, dataPerPage,d);
                // data-bs-toggle="modal" data-bs-target="#exampleModal"
               // document.querySelector('.jb').innerHTML = imgData.join('');
            },
            error: function(err){
               console.log('Error => '+err);
            	
            }
        });
			
			//-----------------------------------------------
			
			// 병원 목록 클릭 ajax
			
			let hos_name;
			$(".table1").on("click","tr", function(){
			//$(".jb").on("click",".jb-image",function(){
				var hos_value=$(this).text();
				//var hos_value=$(this).text();
				console.log("td값 => "+$(this).text());
				$.ajax({
				url:'${pageContext.request.contextPath}/member/reserve',					
				type:'GET',
				success:function(){
				
					}
				
				})
			});
			// ---------------- 페이징 처리 -----------------------
			function paging(totalData, dataPerPage, pageCount, currentPage,d) {
				  console.log("currentPage : " + currentPage);

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
				}
			
			function displayData(currentPage, dataPerPage,d) {

				  let chartHtml = "";

				  //Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합됨 
				  currentPage = Number(currentPage);
				  dataPerPage = Number(dataPerPage);
				
				  for (
				    var i = (currentPage - 1) * dataPerPage;
				    i < (currentPage - 1) * dataPerPage + dataPerPage;
				    i++
				  ) {
					  
				  console.log('i => ' + i)
				 
				 if(totalData >i){
				    chartHtml +=
				    	'<tr style="cursor:pointer;" ><td  id="listBtn" >'+d[i][0]+'</td><td>'+d[i][1]+'</td><td>'+d[i][3]+'</td><td>'+d[i][2]+'</td></tr>';
				  }
				  } 
				               document.querySelector('.table1 > tbody').innerHTML = chartHtml;

				}
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
						 $('.table1 > tbody').empty();
						for (var i of data.data) {
				           	searchList.push(i)
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
				}
		/* setTimeout(function() { 
			$.ajax({
            url: 'http://192.168.0.120:9000/map/detail?name='+hos_value+'&',
            type: 'GET',
            dataType: 'jsonp',
            jasonp: 'callback',
            contentType : "application/jsonp; charset: UTF-8",
            success: function(data){
                var hos_marker = {}
                
                for(var i =0; i < data.data[0].length; i++){
                	hos_marker[data.columns[i]]=data.data[0][i];
                }
                console.log('결과1= '+hos_marker['hos_x']);
                console.log('결과2= '+hos_marker['hos_y']);
                console.log('병원이름= '+hos_marker['hos_name']);
                var x =hos_marker['hos_x']
                var y =hos_marker['hos_y']
                var name =hos_marker['hos_name']
                
                
                <!-- 지도 생성! -->
        		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        		mapOption = {
        			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        			level : 5 // 지도의 확대 레벨 
        		
        		};
        		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        		<!-- 지도 크기 조절 이벤트 -->
        		var zoomControl = new kakao.maps.ZoomControl();
        		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
        		
        		<!-- 현재위치 좌표얻어오기! -->
    			navigator.geolocation.getCurrentPosition(function(position) {

   				var lat = position.coords.latitude, // 위도
   				lon = position.coords.longitude; // 경도

   				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
   				message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        		var positions = [
        			{
        		        title: '현재위치', 
        		        latlng: locPosition
        		    },
        			{
        		        title: hos_marker['hos_name'], 
        		        latlng: new kakao.maps.LatLng(hos_marker['hos_y'], hos_marker['hos_x'])
        		    }];
        		
        		console.log('=============== ')
        		console.log('현위치 - lat = '+lat)
        		console.log('현위치 - lon = '+lon)
        		console.log('목적지 - marker_y = '+hos_marker['hos_y'])
        		console.log('목적지 - marker_x = '+hos_marker['hos_x'])
        		console.log('---------------')
        		console.log('중간위치 - y = '+(lat+hos_marker['hos_y'])/2)
        		console.log('중간위치 - x = '+(lon+hos_marker['hos_x'])/2)
        		
        		var center_x = (lon+hos_marker['hos_x'])/2
        		var center_y = (lat+hos_marker['hos_y'])/2
        		var center_xy= new kakao.maps.LatLng(center_y,center_x)
        		for (var i = 0; i < positions.length; i ++) {
        		// 마커를 생성합니다 
        		
    			var marker = new kakao.maps.Marker({ // 마커를 생성합니다 
    				map : map,
    				position : positions[i].latlng,
    				title : positions[i].title
    			});
        		
    			var iwContent = positions[i].title, // 인포윈도우에 표시할 내용
    			iwRemoveable = true;
    			
    			var infowindow = new kakao.maps.InfoWindow({ // 인포윈도우를 생성합니다
    				content : iwContent,
    				removable : iwRemoveable
    			});
    			// 인포윈도우를 마커위에 표시합니다 
    			infowindow.open(map, marker);
    			// 마커를 지도에 표시합니다
    			marker.setMap(map);
        		}
    			var level = map.getLevel();
    			
    			infowindow.open(map, marker); // 인포윈도우를 마커위에 표시합니다 
    			map.setLevel(level + 2);
    			map.setCenter(center_xy); // 지도 중심좌표를 접속위치로 변경합니다
        		});
    			$('#loadBtn').click(function(){
    				location.href="https://map.kakao.com/link/to/"+name+","+y+","+x;
    			})
            } // - success 함수 
          }, 500);
		}); // - ajax 
		}); // table1 클릭 ajax 끝
		*/
	});
</script>