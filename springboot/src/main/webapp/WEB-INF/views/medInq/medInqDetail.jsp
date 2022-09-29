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
</style>

<div class="container">
<br><br>

<h2 style="font-weight: bold; text-align: center;">건강 문진표</h2>
<br>
<p>1. 다음과 같은 질병으로 진단을 받았거나, 현재 약물 치료 중이십니까?</p>
<table class="table" style="text-align: center;">
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
      <th scope="col">없음</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">진단 여부</th>
      <td><input class="form-check-input" id="chkbox0_1" name="chkbox0" value="chkbox0_1" type="checkbox" aria-label="..." onClick="return false;"></td>
      <td><input class="form-check-input" id="chkbox0_2" name="chkbox0" value="chkbox0_2" type="checkbox" aria-label="..." onClick="return false;"></td>
      <td><input class="form-check-input" id="chkbox0_3" name="chkbox0" value="chkbox0_3" type="checkbox" aria-label="..." onClick="return false;"></td>
      <td><input class="form-check-input" id="chkbox0_4" name="chkbox0" value="chkbox0_4" type="checkbox" aria-label="..." onClick="return false;"></td>
      <td><input class="form-check-input" id="chkbox0_5" name="chkbox0" value="chkbox0_5" type="checkbox" aria-label="..." onClick="return false;"></td>
      <td><input class="form-check-input" id="chkbox0_6" name="chkbox0" value="chkbox0_6" type="checkbox" aria-label="..." onClick="return false;"></td>
      <td><input class="form-check-input" id="chkbox0_7" name="chkbox0" value="chkbox0_7" type="checkbox" aria-label="..." onClick="return false;"></td>
      <td><input class="form-check-input" id="chkbox0_0" name="chkbox0" value="chkbox0_0" type="checkbox" aria-label="..." onClick="return false;"></td>
    </tr>
    <tr>
      <th scope="row">약물치료 여부</th>
      <td><input class="form-check-input" id="chkbox1_1" name="chkbox1" value="chkbox1_1" type="checkbox" aria-label="..." onClick="return false;"></td>
      <td><input class="form-check-input" id="chkbox1_2" name="chkbox1" value="chkbox1_2" type="checkbox" aria-label="..." onClick="return false;"></td>
      <td><input class="form-check-input" id="chkbox1_3" name="chkbox1" value="chkbox1_3" type="checkbox" aria-label="..." onClick="return false;"></td>
      <td><input class="form-check-input" id="chkbox1_4" name="chkbox1" value="chkbox1_4" type="checkbox" aria-label="..." onClick="return false;"></td>
      <td><input class="form-check-input" id="chkbox1_5" name="chkbox1" value="chkbox1_5" type="checkbox" aria-label="..." onClick="return false;"></td>
      <td><input class="form-check-input" id="chkbox1_6" name="chkbox1" value="chkbox1_6" type="checkbox" aria-label="..." onClick="return false;"></td>
      <td><input class="form-check-input" id="chkbox1_7" name="chkbox1" value="chkbox1_7" type="checkbox" aria-label="..." onClick="return false;"></td>
      <td><input class="form-check-input" id="chkbox1_0" name="chkbox1" value="chkbox1_0" type="checkbox" aria-label="..." onClick="return false;"></td>
    </tr>
  </tbody>
</table><br><br>


<p>2. 부모, 형제, 자매 중에 다음 질환을 앓았거나 해당 질환으로 사망한 경우가 있으십니까?</p>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox2_0" name="chkbox2" value="chkbox2_0" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox0">없음</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox2_1" name="chkbox2" value="chkbox2_1" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox1">뇌졸중(중풍)</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox2_2" name="chkbox2" value="chkbox2_2" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox2">심장병(심근경색/협심증)</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox2_3" name="chkbox2" value="chkbox2_3" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox3">고혈압</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox2_4" name="chkbox2" value="chkbox2_4" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox1">당뇨병</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox2_5" name="chkbox2" value="chkbox2_5" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox2">기타(암 포함)</label>
</div><br><br>


<p> - 기타 질환 - 1, 2문항에서 기타(암 포함) 표기하신 분만 작성</p>
<textarea name="diseaseV" id="diseaseV" rows="5" cols="120" readonly="readonly"></textarea><br><br>

<p>3. 과거 혹은 현재 흡연 상태를 표시해 주십시오.</p>
<div class="form-check ">
  <input class="form-check-input" type="checkbox" id="chkbox3_1" name="chkbox3" value="chkbox3_1" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox1">전혀 피운 적 없음</label>
</div>
<div class="form-check ">
  <input class="form-check-input" type="checkbox" id="chkbox3_2" name="chkbox3" value="chkbox3_2" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox2">지금은 끊었음</label>
</div>
<div class="form-check ">
  <input class="form-check-input" type="checkbox" id="chkbox3_3" name="chkbox3" value="chkbox3_3" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox3">현재도 흡연 중</label>
</div><br><br>


<p>4. 1주일에 평균 며칠 술을 마십니까?</p>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox4_0" name="chkbox4" value="chkbox4_0" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox1">안 마심</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox4_1" name="chkbox4" value="chkbox4_1" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox2">1일</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox4_2" name="chkbox4" value="chkbox4_2" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox3">2일</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox4_3" name="chkbox4" value="chkbox4_3" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox1">3일</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox4_4" name="chkbox4" value="chkbox4_4" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox2">4일</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox4_5" name="chkbox4" value="chkbox4_5" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox2">5일</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox4_6" name="chkbox4" value="chkbox4_6" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox2">6일</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox4_7" name="chkbox4" value="chkbox4_7" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox2">7일</label>
</div><br><br>


<p>5. 약이나 음식물(계란 포함) 혹은 백신접종으로 두드러기 또는 발진 등의 알레르기 증상을 보인 적이 있습니까?</p>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox5_1" name="chkbox5" value="chkbox5_1" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox1">예</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox5_0" name="chkbox5" value="chkbox5_0" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox2">아니오</label>
</div>
<p>알레르기 증상이 있다면 적어주십시오.</p>
<textarea name="allergyV" id="allergyV" rows="5" cols="120" readonly="readonly"></textarea><br><br>


<p>6. 현재 임신 중이거나 또는 다음 한 달 동안 임신할 가능성이 있습니까?</p>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox6_1" name="chkbox6" value="chkbox6_1" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox1">예</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="chkbox6_0" name="chkbox6" value="chkbox6_0" onClick="return false;">
  <label class="form-check-label" for="inlineCheckbox2">아니오</label>
</div><br><br>


<p>7. 현재 아픈 증상</p>
<textarea name="symptomV" id="symptomV" rows="10" cols="120" readonly="readonly"></textarea><br><br>

<p style="text-align:right">
<button id="inqUpbtn" class="btn btn-primary btn-dark text-white btn-block" onclick="location='medInqUpForm?num=${sessionScope.sessionNUM}'">문진표 수정</button>
<button id="inqDelbtn" class="btn btn-primary btn-dark text-white btn-block">문진표 삭제</button>
</p>
</div>

<script>
$('#inqDelbtn').click(function(){
	alert("삭제되었습니다.");
	location="medInqDelete?num=${sessionScope.sessionNUM}";
});

window.onload = function () {
	
	var disease1 = "${vo.disease1}";
	for(var e of disease1.split("/")){
		if(e == 'chkbox0_1'){
			$('#chkbox0_1').attr('checked', 'checked');
		}
		if(e == 'chkbox0_2'){
			$('#chkbox0_2').attr('checked', 'checked');
		}
		if(e == 'chkbox0_3'){
			$('#chkbox0_3').attr('checked', 'checked');
		}
		if(e == 'chkbox0_4'){
			$('#chkbox0_4').attr('checked', 'checked');
		}
		if(e == 'chkbox0_5'){
			$('#chkbox0_5').attr('checked', 'checked');
		}
		if(e == 'chkbox0_6'){
			$('#chkbox0_6').attr('checked', 'checked');
		}
		if(e == 'chkbox0_7'){
			$('#chkbox0_7').attr('checked', 'checked');
		}
	}
	
	var disease2 = "${vo.disease2}";
	for(var e of disease2.split("/")){
		if(e == 'chkbox1_1'){
			$('#chkbox1_1').attr('checked', 'checked');
		}
		if(e == 'chkbox1_2'){
			$('#chkbox1_2').attr('checked', 'checked');
		}
		if(e == 'chkbox1_3'){
			$('#chkbox1_3').attr('checked', 'checked');
		}
		if(e == 'chkbox1_4'){
			$('#chkbox1_4').attr('checked', 'checked');
		}
		if(e == 'chkbox1_5'){
			$('#chkbox1_5').attr('checked', 'checked');
		}
		if(e == 'chkbox1_6'){
			$('#chkbox1_6').attr('checked', 'checked');
		}
		if(e == 'chkbox1_7'){
			$('#chkbox1_7').attr('checked', 'checked');
		}
	}
	
	var diseasehist = "${vo.diseasehist}";
	for(var e of diseasehist.split("/")){
		if(e == 'chkbox2_0'){
			$('#chkbox2_0').attr('checked', 'checked');
		}
		if(e == 'chkbox2_1'){
			$('#chkbox2_1').attr('checked', 'checked');
		}
		if(e == 'chkbox2_2'){
			$('#chkbox2_2').attr('checked', 'checked');
		}
		if(e == 'chkbox2_3'){
			$('#chkbox2_3').attr('checked', 'checked');
		}
		if(e == 'chkbox2_4'){
			$('#chkbox2_4').attr('checked', 'checked');
		}
		if(e == 'chkbox2_5'){
			$('#chkbox2_5').attr('checked', 'checked');
		}
	}
	
	$('#diseaseV').val("${vo.diseaseetc}")
	
	var smoke = "${vo.smoke}";
	if(smoke == 'chkbox3_1'){
		$('#chkbox3_1').attr('checked', 'checked');
	}
	if(smoke == 'chkbox3_2'){
		$('#chkbox3_2').attr('checked', 'checked');
	}
	if(smoke == 'chkbox3_3'){
		$('#chkbox3_3').attr('checked', 'checked');
	}
	
	var alcohol = "${vo.alcohol}";
	if(alcohol == 'chkbox4_0'){
		$('#chkbox4_0').attr('checked', 'checked');
	}
	if(alcohol == 'chkbox4_1'){
		$('#chkbox4_1').attr('checked', 'checked');
	}
	if(alcohol == 'chkbox4_2'){
		$('#chkbox4_2').attr('checked', 'checked');
	}
	if(alcohol == 'chkbox4_3'){
		$('#chkbox4_3').attr('checked', 'checked');
	}
	if(alcohol == 'chkbox4_4'){
		$('#chkbox4_4').attr('checked', 'checked');
	}
	if(alcohol == 'chkbox4_5'){
		$('#chkbox4_5').attr('checked', 'checked');
	}
	if(alcohol == 'chkbox4_6'){
		$('#chkbox4_6').attr('checked', 'checked');
	}
	if(alcohol == 'chkbox4_7'){
		$('#chkbox4_7').attr('checked', 'checked');
	}
	
	var allergy = "${vo.allergy}";
	if(allergy == 'chkbox5_1'){
		$('#chkbox5_1').attr('checked', 'checked');
	}
	if(allergy == 'chkbox5_0'){
		$('#chkbox5_0').attr('checked', 'checked');
	}

	$('#allergyV').val("${vo.allergyetc}")
	
	var pregnancy = "${vo.pregnancy}";
	if(pregnancy == 'chkbox6_1'){
		$('#chkbox6_1').attr('checked', 'checked');
	}
	if(pregnancy == 'chkbox6_0'){
		$('#chkbox6_0').attr('checked', 'checked');
	}
	
	$('#symptomV').val("${vo.symptom}")
	
}

</script>







