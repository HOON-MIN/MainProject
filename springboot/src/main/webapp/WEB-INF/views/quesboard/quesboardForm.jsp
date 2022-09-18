<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="container" class="container mt-5">
<!-- <div class="row" style="text-align:center"> -->
<h2 class="text-center">의학지식 질문하기</h2><br><br>
  <form method="post" action="qbInsert">
  <input type="hidden" name="id" id="id" value="${sessionID }" ><br>
    <fieldset>
<!-- 		<p> -->
<!-- 			아이디(나중에 세션으로 받는것으로 수정) -->
<!-- 			<input type="text" name="id" id="id" > -->
<!-- 		</p> -->
		<p>
			제목 <input type="text" name="qtitle" id="qtitle" >
		</p>
        <p>
            <textarea name="qcont" id="summernote" cols="80" rows="20"></textarea>
        </p>
        <p style="text-align:right">
        	<button class="btn btn-primary btn-dark text-white btn-block"
			 type="submit">작성</button>
<!--             <input type="submit" value="작성"> -->
        </p>
    </fieldset>
  </form>

<!-- </div> -->
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
    
<script>
$(function(){
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
		  height: 1000,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
		  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			callbacks: {	//여기 부분이 이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0],this);
				},
				onPaste: function (e) {
					var clipboardData = e.originalEvent.clipboardData;
					if (clipboardData && clipboardData.items && clipboardData.items.length) {
						var item = clipboardData.items[0];
						if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
							e.preventDefault();
						}
					}
				}
			}
		});
	});
	/**
	* 이미지 파일 업로드
	*/
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
	// 서머노트에 text 쓰기
	$('#summernote').summernote('insertText', 'test');
	// 서머노트 쓰기 비활성화
	$('#summernote').summernote('disable');
	// 서머노트 쓰기 활성화
	$('#summernote').summernote('enable');
	// 서머노트 리셋
	$('#summernote').summernote('reset');
	// 마지막으로 한 행동 취소 ( 뒤로가기 )
	$('#summernote').summernote('undo');
	// 앞으로가기
	$('#summernote').summernote('redo');
});
</script>