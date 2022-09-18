<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<article>
	<header>
		<h1>후기 상세 페이지</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<div class="form-group">
			<label for="title">제목</label> <input type="text" class="form-control"
				id="title" value="${vo.title }" readonly="readonly"> <input
				type="hidden" name="rnum" id="rnum" value="${vo.rnum }">
		</div>
		<div class="form-group">
			<label for="id">아이디</label> <input type="text" class="form-control"
				id="id" name="id" value="${vo.id}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="cont">후기 내용</label>
			<textarea class="form-control" rows="5" id="cont" name="cont"
				readonly="readonly">${vo.cont }</textarea>
		</div>
		<p></p>
		<div class="form-group">
			<label for="writer">작성날짜 : </label> 
				
			<fmt:parseDate value="${vo.udate}" var="udate" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate value="${udate }" pattern="yyyy-MM-dd"/>
		</div>
		<p></p>
		<div><label>후기 평점(1~10점)  :   </label> ${vo.likes } 점</div>
		<p></p>
		<div class="form-group" style="text-align:">
			<input type="button" value="돌아가기" class="btn btn-info"
				id="returnBtn" onclick="location='reviewboardlist'" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		</div>
		<p></p>
	<c:if test="${sessionID != null}">
		<div class="form-group" style="text-align:">
			<input type="button" value="후기수정" class="btn btn-info"
				id="updateBtn" /> <input type="button" value="글 삭제"
				class="btn btn-danger" id="delBtn" />
		</div>
	</c:if>
<!-- 댓글 -->
	<c:if test="${sessionID != null}">
		<div class="container">
			<label for="content">comment</label>
			<form name="commentInsertForm">
				<div class="input-group">
					<input type="hidden" id="rnum" name="rnum" value="${vo.rnum}"/>
					<input type="text" class="form-control" id="cont" name="cont" placeholder="내용을 입력하세요."/>
					<span class="input-group-btn">
						<button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
					</span>
				</div>
			</form>
		</div>
	</c:if>		
		<div class="container">
		<div class="commentList">
		</div>
		</div>
	</div>
<p></p>

 <script type="text/javascript">
 
$(function(){
		
		$('#updateBtn').click(function(){
			location ="reviewUpdate?rnum=${vo.rnum}";
		});
		$('#delBtn').click(function(){
			location ="delReview?rnum=${vo.rnum}";
		});
	});

var rnum = '${vo.rnum}'; // 후기 글 번호 
var id = '${sessionID}'; // 로그인 아이디

$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	 //console.log("성공0!")
  var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
  commentInsert(insertData); //Insert 함수호출(아래)
});



//댓글 목록 
function commentList(){
  $.ajax({
      url : '/reviewboard/replylist',
      type : 'get',
      data : {'rnum':rnum},
      success : function(data){
          var a =''; 
          $.each(data, function(key,value){ 
              a += '<div class="commentArea" style="margin-bottom: 15px;">';
              a += '<div class="commentInfo'+value.cnum+'" >'+'댓글번호 : '+value.cnum+' / 작성자 ID : '+value.id;
              
              a += '<c:choose><c:when test="${sessionScope.sessionID != null }"><a onclick="commentUpdate('+value.cnum+',\''+value.cont+'\');"> 수정 </a>';
              a += '<a onclick="commentDelete('+value.cnum+');"> 삭제 </a> </div></c:when></c:choose>';
              
              a += '<div class="commentContent'+value.cnum+'" style="border-bottom:1px solid darkgray;"> <p> 내용 : '+value.cont +'</p>';
              a += '</div></div>';
          });
          $(".commentList").html(a);
      }
  });
}

//댓글 등록
function commentInsert(insertData){
	 console.log("성공1!")
  $.ajax({
      url : '/reviewboard/reply',
      type : 'post',
      data : insertData,
      success : function(data){
          if(data == 1) {
         	 //alert('성공!');
              commentList(); //댓글 작성 후 댓글 목록 reload
              $('[name=content]').val('');
              
          }
      }
  });
	 console.log("성공3!")
}

//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(cnum, content){
  var a ='';
  
  a += '<div class="input-group">';
  a += '<input type="text" class="form-control" name="content_'+cnum+'" value="'+content+'"/>';
  a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cnum+');">수정</button> </span>';
  a += '</div>';
  
  $('.commentContent'+cnum).html(a);
  
}

//댓글 수정
function commentUpdateProc(cnum){
  var updateContent = $('[name=content_'+cnum+']').val();
  
  $.ajax({
      url : '/reviewboard/upReply',
      type : 'post',
      data : {'cont' : updateContent, 'cnum' : cnum},
      success : function(data){
     	 //alert('수정 성공!');
          if(data == 1) commentList(rnum); //댓글 수정후 목록 출력 
          alert('수정 성공2!');
      }
  });
}

//댓글 삭제 
function commentDelete(cnum){
  $.ajax({
      url : '/reviewboard/delReply/'+cnum,
      type : 'post',
      data : {'rnum' : rnum, 'cnum' : cnum},
      success : function(data){
     	 //alert('삭제 성공!');
          if(data == 1) commentList(rnum); //댓글 삭제후 목록 출력 
      }
  });
}

$(document).ready(function(){
  commentList(); //페이지 로딩시 댓글 목록 출력 
});

 
 </script>
 
 </article>