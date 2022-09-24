<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mycontext" value="${pageContext.request.contextPath}"/>     
<%-- 본문 시작  --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<article >
<div class="page-header">
      <center>
         <h1>
            <a onclick="return false; location.reload()"
               style="cursor: pointer;"><b>병원회원가입</b></a>
         </h1>
      </center>
      <div class="col-md-6 col-md-offset-3"></div>
   </div>

<!-- 병원명* hname /사업자번호* crn /영업시간* otime ctime /병원등급* hgrade /진료과목* hcate/ 홈페이지* hurl/ email* hemail /위치* hloc -->   
<form method="post" id="hospitalJoin" >
      <input type="hidden" id="ccate" name="ccate" value="${ccate}"> 
      <div class="row g-3 needs-validation ">
       <div class="col-md-4">
            <div class="form-outline">
                  <label class="form-label">사업자 등록번호(ID사용)</label>
               <input type="text" id="crn" name="crn" class="form-control" value="${crn}" readonly="readonly">
            </div>
      </div>
      <div class="col-md-4" >
            <label for="id" class="form-label">병원명</label> 
      <div class="input-group" >
            <input type="text" class="form-control" id="hna me" name="hname" placeholder="INPUT YOUR HOSPITAL NAME"
             required="required" pattern=".{2,30}" >
      </div>
      </div>      
      <div class="col-md-6">
         <label for="pnum" class="form-label">비밀번호</label> 
         <input type="password"
            class="form-control" id="cpwd" name="cpwd" placeholder="YOUR PASSWORD"
             required="required" pattern=".{2,20}">
      </div>
      <div class="col-md-6">
         <label for="pnum2" class="form-label">비밀번호확인</label> 
         <input type="password"
            class="form-control" id="cpwd2" name="cpwd2" placeholder="PASSWORD CHECK"
            required="required" pattern=".{2,20}"><i class="agreeInfo" id="confpwd"></i>
      </div>         
      <div class="col-md-4">
         <label for="snum" class="form-label">openTime</label> 
         <input type="time"
            class="form-control" id="otime" name="otime" placeholder=""
             required="required" style="text-align: center;" >
      </div>
      <div class="col-md-4">
         <label for="snum" class="form-label">closeTime</label> 
         <input type="time"
            class="form-control" id="ctime" name="ctime" placeholder=""
            required="required" style="text-align: center;">
      </div>
      <div class="col-md-4">
         <div class="form-outline">
            <label class="form-label">병원등급</label>
            <select class="form-select" id="hgrade" name="hgrade" aria-label="Default select example" required="required">
              <option selected>병원등급 선택</option>
              <option value="프리미엄">프리미엄</option>
              <option value="베이직">베이직</option>
            </select>
         </div>
      </div>   
       <div class="col-md-4">
          <label for="mname" class="form-label">진료과목</label>
          <input type="text" class="form-control" id="hcate" name="hcate" placeholder="" required>
          <div class="valid-feedback">
          </div>
          <div class="invalid-feedback">
                진료과목을 입력하세요
          </div>
        </div>
        
      
               
         <div class="form-outline">
               <label class="form-label">전화번호</label>
            <input type="text" id="htel" name="htel" class="form-control" /> 
         </div>
      <div class="col-md-5">
         <label class="form-label">URL</label> 
            <input type="text" class="form-control" id="hurl" name="hurl" placeholder="name@example.com"
            required="required">
      </div>

       <label class="form-label" style="text-align: justify;" >병원주소</label>
      <div class="col-md-4">
         <input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호" required="required">
      </div>
      <div class="col-md-3">
         <input type="button" class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
      </div>
      <div class="col-md-8">
         <input type="text" class="form-control" id="hloc" name="hloc" placeholder="주소" required="required"><br>
      </div>
      <div class="form-group text-center">
         <button type="submit" id="hjBtn" class="btn btn-primary btn-space">
            등록<i class="fa fa-check spaceLeft"></i>
         </button>

         <button type="button" class="btn btn-danger"
            onClick="location.href='/ateamfinal/main'">
            취소<i class="fa fa-check spaceLeft"></i>
         </button>

      </div>
      </div>
   </form>
 <!-- comment end -->
    </article>
<script>
// 주민번호, 전화번호, 주소
// 병원명* hname /사업자번호* crn /영업시간* otime ctime /병원등급* hgrade /진료과목* hcate/ 홈페이지* hurl/ email* hemail /위치* hloc       
      $(function(){
         $('#hjBtn').click(function() {
            if($('#hname').val().length==0 || $('#otime').val().length==0 || $('#ctime').val().length==0 || 
                     $('#hgrade').val().length==0 || $('#hcate').val().length==0 || $('#hurl').val().length==0 ||
                      $('#hloc').val().length==0 ){
                     alert("입력되지 않은 정보가 존재합니다.");
                     return false;
                  }
            
            $('#hospitalJoin').attr("action", 
                           "${mycontext}/hospital/addHospital");
            $('#hospitalJoin').submit(function() {
               alert('등록에 성공하셨습니다.');
               return true;
            });
         });   
      });

      $(function()    {
      // 비밀번호 일치여부
      var pwdchk = false;
        $('#cpwd2').blur(function(){
             if($('#cpwd').val() === $('#cpwd2').val()){
               $('#confpwd').css('color','green').html('√ 비밀번호 일치합니다 ');
               pwdchk = true;
             }else{
               $('#confpwd').css('color','red').html('X 비밀번호 일치하지 않습니다 ');
               pwdchk = false;
             }
           });
        $('#cpwd').blur(function(){
             if($('#cpwd').val() === $('#cpwd2').val()){
               $('#confpwd').css('color','green').html('√ 비밀번호 일치합니다 ');
               pwdchk = true;
             }else{
               $('#confpwd').css('color','red').html('X 비밀번호 일치하지 않습니다 ');
               pwdchk = false;
             }
           });
   });
      
      
      
      /* $('#hospitalForm').submit(function(event){
         event.preventDefault();
         
         if($('#hname').val().length==0 || $('#otime').val().length==0 || $('#ctime').val().length==0 || 
            $('#hgrade').val().length==0 || $('#hcate').val().length==0 || $('#hurl').val().length==0 ||
            $('#hemail').val().length==0 || $('#hloc1').val().length==0 || $('#hloc2').val().length==0){
            alert("입력되지 않은 정보가 존재합니다.");
            return false;
         }
            const hloc = $('#hloc1').val()+$('#hloc2').val();
            $('#hloc').val(hloc); 
            console.log("hloc : "+hloc);
            alert('등록에 성공하셨습니다.');
            this.submit();
            return true;   
      });     */
     

   
   
   // 주소 찾기 api
   function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("hloc").value = addr;
                // 커서를 상세주소 필드로 이동한다.
            }
        }).open();
    }   
</script>
<%-- 본문 끝 --%>