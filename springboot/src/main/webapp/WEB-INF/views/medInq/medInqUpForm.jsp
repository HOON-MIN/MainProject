<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
 td{
 	text-align: center;	
 }
 p {
 	font-weight: bold;
 }
 input {
	
}
</style>

<div class="container">
<br><br>

<h2 style="font-weight: bold; text-align: center;">건강 문진표</h2>
<br>

<!-- <h4>01 질환력(과거력, 가족력) 관련 문항</h4><br> -->
<p>1. 다음과 같은 질병으로 진단을 받았거나, 현재 약물 치료 중이십니까?</p>
<table class="table">
  <thead style="text-align: center;">
    <tr>
      <th scope="col"></th>
      <th scope="col">뇌졸중<br>(중풍)</th>
      <th scope="col">심장병<br>(심근경색/협심증)</th>
      <th scope="col">고혈압</th>
      <th scope="col">당뇨병</th>
      <th scope="col">이상지질혈증</th>
      <th scope="col">폐결핵</th>
      <th scope="col">기타<br>(암 포함)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">진단 여부</th>
      <td><input class="form-check-input" id="chkbox0_0" name="chkbox0_0" value="진단없음" type="checkbox" aria-label="..."></td>
      <td><input class="form-check-input" id="chkbox0_1" name="chkbox0_1" value="뇌졸중진단" type="checkbox" aria-label="..."></td>
      <td><input class="form-check-input" id="chkbox0_2" name="chkbox0_2" value="심장병진단" type="checkbox" aria-label="..."></td>
      <td><input class="form-check-input" id="chkbox0_3" name="chkbox0_3" value="고혈압진단" type="checkbox" aria-label="..."></td>
      <td><input class="form-check-input" id="chkbox0_4" name="chkbox0_4" value="당뇨병진단" type="checkbox" aria-label="..."></td>
      <td><input class="form-check-input" id="chkbox0_5" name="chkbox0_5" value="이상지질혈증진단" type="checkbox" aria-label="..."></td>
      <td><input class="form-check-input" id="chkbox0_6" name="chkbox0_6" value="폐결핵진단" type="checkbox" aria-label="..."></td>
      <td><input class="form-check-input" id="chkbox0_7" name="chkbox0_7" value="기타진단" type="checkbox" aria-label="..."></td>
    </tr>
    <tr>
      <th scope="row">약물치료 여부</th>
      <td><input class="form-check-input" id="chkbox1_0" name="chkbox1_0" value="약물치료없음" type="checkbox" aria-label="..."></td>
      <td><input class="form-check-input" id="chkbox1_1" name="chkbox1_1" value="뇌졸중약물치료" type="checkbox" aria-label="..."></td>
      <td><input class="form-check-input" id="chkbox1_2" name="chkbox1_2" value="심장병약물치료" type="checkbox" aria-label="..."></td>
      <td><input class="form-check-input" id="chkbox1_3" name="chkbox1_3" value="고혈압약물치료" type="checkbox" aria-label="..."></td>
      <td><input class="form-check-input" id="chkbox1_4" name="chkbox1_4" value="당뇨병약물치료" type="checkbox" aria-label="..."></td>
      <td><input class="form-check-input" id="chkbox1_5" name="chkbox1_5" value="이상지질혈증약물치료" type="checkbox" aria-label="..."></td>
      <td><input class="form-check-input" id="chkbox1_6" name="chkbox1_6" value="폐결핵약물치료" type="checkbox" aria-label="..."></td>
      <td><input class="form-check-input" id="chkbox1_7" name="chkbox1_7" value="기타약물치료" type="checkbox" aria-label="..."></td>
    </tr>
  </tbody>
</table><br><br>


<p>2. 부모, 형제, 자매 중에 다음 질환을 앓았거나 해당 질환으로 사망한 경우가 있으십니까?</p>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" checked="checked" id="chkbox2_1" name="chkbox2_1" value="뇌졸중(중풍)">
  <label class="form-check-label" for="inlineCheckbox0">없음</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox2_1" name="chkbox2_1" value="뇌졸중(중풍)">
  <label class="form-check-label" for="inlineCheckbox1">뇌졸중(중풍)</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox2_2" name="chkbox2_2" value="심장병(심근경색/협심증)">
  <label class="form-check-label" for="inlineCheckbox2">심장병(심근경색/협심증)</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox2_3" name="chkbox2_3" value="고혈압">
  <label class="form-check-label" for="inlineCheckbox3">고혈압</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox2_4" name="chkbox2_4" value="당뇨병">
  <label class="form-check-label" for="inlineCheckbox1">당뇨병</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox2_5" name="chkbox2_5" value="기타(암 포함)">
  <label class="form-check-label" for="inlineCheckbox2">기타(암 포함)</label>
</div><br><br>

<p> - 기타 질환 - 1, 2문항에서 기타(암 포함) 표기하신 분만 작성</p>
<textarea name="etc" id="etc" rows="5" cols="120"></textarea><br><br>

<!-- <h4>02 흡연 관련 문항</h4><br> -->
<!-- <p>흡연 관련 문항</p> -->
<p>3. 과거 혹은 현재 흡연 상태를 표시해 주십시오.</p>
<div class="form-check ">
  <input class="form-check-input" type="checkbox" id="chkbox3_1" name="chkbox3_1" value="전혀 피운 적 없음">
  <label class="form-check-label" for="inlineCheckbox1">전혀 피운 적 없음</label>
</div>
<div class="form-check ">
  <input class="form-check-input" type="checkbox" id="chkbox3_2" name="chkbox3_2" value="지금은 끊었음">
  <label class="form-check-label" for="inlineCheckbox2">지금은 끊었음</label>
</div>
<div class="form-check ">
  <input class="form-check-input" type="checkbox" id="chkbox3_3" name="chkbox3_3" value="현재도 흡연 중">
  <label class="form-check-label" for="inlineCheckbox3">현재도 흡연 중</label>
</div><br><br>

<!-- h 태그들 배경색 부트스트랩 알아보기 -->
<!-- <h4>03 음주 관련 문항</h4><br>  -->
<p>4. 1주일에 평균 며칠 술을 마십니까?</p>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox4_0" name="chkbox4_0" value="안마심">
  <label class="form-check-label" for="inlineCheckbox1">안 마심</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox4_1" name="chkbox4_1" value="1일">
  <label class="form-check-label" for="inlineCheckbox2">1일</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox4_2" name="chkbox4_2" value="2일">
  <label class="form-check-label" for="inlineCheckbox3">2일</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox4_3" name="chkbox4_3" value="3일">
  <label class="form-check-label" for="inlineCheckbox1">3일</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox4_4" name="chkbox4_4" value="4일">
  <label class="form-check-label" for="inlineCheckbox2">4일</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox4_5" name="chkbox4_5" value="5일">
  <label class="form-check-label" for="inlineCheckbox2">5일</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox4_6" name="chkbox4_6" value="6일">
  <label class="form-check-label" for="inlineCheckbox2">6일</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox4_7" name="chkbox4_7" value="7일">
  <label class="form-check-label" for="inlineCheckbox2">7일</label>
</div><br><br>


<p>5. 약이나 음식물(계란 포함) 혹은 백신접종으로 두드러기 또는 발진 등의 알레르기 증상을 보인 적이 있습니까?</p>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox5_1" name="chkbox5_1" value="예">
  <label class="form-check-label" for="inlineCheckbox1">예</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox5_0" name="chkbox5_0" value="아니오">
  <label class="form-check-label" for="inlineCheckbox2">아니오</label>
</div>
<p>알레르기 증상이 있다면 적어주십시오.</p>
<textarea name="allergy" id="allergy" rows="5" cols="120"></textarea><br><br>


<p>6. 현재 임신 중이거나 또는 다음 한 달 동안 임신할 가능성이 있습니까?</p>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox6_1" name="chkbox6_1" value="예">
  <label class="form-check-label" for="inlineCheckbox1">예</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox6_0" name="chkbox6_0" value="아니오">
  <label class="form-check-label" for="inlineCheckbox2">아니오</label>
</div><br><br>


<p>5. 현재 아픈 증상</p>
<textarea name="symptom" id="symptom" rows="10" cols="120"></textarea><br><br>

<p style="text-align:right">
<button id="sendBtn" class="btn btn-primary btn-dark text-white btn-block"
	type="submit">작성</button>
</p>

</div>

<script>
$(function() {
	$('#sendBtn').click(function(){
		
		
		
	});
	
	
	
	
// 	$('#upBtn').click(function() {
// 		$('#qbUpdate').attr("action",
// 				"${mycontext}/quesboard/qbUpdate");
// 		$('#qbUpdate').submit(function() {
// 			alert("수정되었습니다.");
// 		});
// 	});

});
</script>







