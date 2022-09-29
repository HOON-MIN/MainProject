<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>


.hboard2 {
	background-color: white;
	border-radius: 8px;
	margin: 40px;
}

a {
	text-decoration: none;
	color: white;
}
td {
	text-align: center;
}

p {
	font-weight: bold;
}
</style>
<div class="container-fluid">


	<!-- 컨텐츠 (연회색배경) -->
	<div class="col-10 flex-column" style="margin: auto;">
		<div class="hboard2 p-3">
			<!-- 안 쪽에 자신의 컨텐츠를 넣어주세요 -->

			<h2 class="hanna m-3"style="font-weight: bold; text-align: center;">건강 문진표</h2>
			<br>
			
			
			<div id="target">
			
			<form action="medInqIns" method="post" class="p-5">
				<p>1. 다음과 같은 질병으로 진단을 받았거나, 현재 약물 치료 중이십니까?</p>
				<table class="table" style="text-align: center;">
					<thead style="text-align: center;">
						<tr>
							<th scope="col"></th>
							<th scope="col">뇌졸중<br>(중풍)
							</th>
							<th scope="col">심장병<br>(심근경색/협심증)
							</th>
							<th scope="col">고혈압</th>
							<th scope="col">당뇨병</th>
							<th scope="col">이상지질혈증</th>
							<th scope="col">폐결핵</th>
							<th scope="col">기타<br>(암 포함)
							</th>
							<th scope="col">없음</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<th scope="row">진단 여부</th>
							<td><input class="form-check-input chkbox0" id="chkbox0_1"
								name="chkbox0" value="chkbox0_1" type="checkbox"
								aria-label="..."></td>
							<td><input class="form-check-input chkbox0" id="chkbox0_2"
								name="chkbox0" value="chkbox0_2" type="checkbox"
								aria-label="..."></td>
							<td><input class="form-check-input chkbox0" id="chkbox0_3"
								name="chkbox0" value="chkbox0_3" type="checkbox"
								aria-label="..."></td>
							<td><input class="form-check-input chkbox0" id="chkbox0_4"
								name="chkbox0" value="chkbox0_4" type="checkbox"
								aria-label="..."></td>
							<td><input class="form-check-input chkbox0" id="chkbox0_5"
								name="chkbox0" value="chkbox0_5" type="checkbox"
								aria-label="..."></td>
							<td><input class="form-check-input chkbox0" id="chkbox0_6"
								name="chkbox0" value="chkbox0_6" type="checkbox"
								aria-label="..."></td>
							<td><input class="form-check-input chkbox0" id="chkbox0_7"
								name="chkbox0" value="chkbox0_7" type="checkbox"
								aria-label="..."></td>
							<td><input class="form-check-input" id="chkbox0_0"
								name="chkbox0" value="chkbox0_0" type="checkbox"
								checked="checked" aria-label="..."></td>
						</tr>
						<tr>
							<th scope="row">약물치료 여부</th>
							<td><input class="form-check-input chkbox1" id="chkbox1_1"
								name="chkbox1" value="chkbox1_1" type="checkbox"
								aria-label="..."></td>
							<td><input class="form-check-input chkbox1" id="chkbox1_2"
								name="chkbox1" value="chkbox1_2" type="checkbox"
								aria-label="..."></td>
							<td><input class="form-check-input chkbox1" id="chkbox1_3"
								name="chkbox1" value="chkbox1_3" type="checkbox"
								aria-label="..."></td>
							<td><input class="form-check-input chkbox1" id="chkbox1_4"
								name="chkbox1" value="chkbox1_4" type="checkbox"
								aria-label="..."></td>
							<td><input class="form-check-input chkbox1" id="chkbox1_5"
								name="chkbox1" value="chkbox1_5" type="checkbox"
								aria-label="..."></td>
							<td><input class="form-check-input chkbox1" id="chkbox1_6"
								name="chkbox1" value="chkbox1_6" type="checkbox"
								aria-label="..."></td>
							<td><input class="form-check-input chkbox1" id="chkbox1_7"
								name="chkbox1" value="chkbox1_7" type="checkbox"
								aria-label="..."></td>
							<td><input class="form-check-input" id="chkbox1_0"
								name="chkbox1" value="chkbox1_0" type="checkbox"
								checked="checked" aria-label="..."></td>
						</tr>
					</tbody>
				</table>
				<br>
				<br>


				<p>2. 부모, 형제, 자매 중에 다음 질환을 앓았거나 해당 질환으로 사망한 경우가 있으십니까?</p>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" checked="checked"
						id="chkbox2_0" name="chkbox2" value="chkbox2_0"> <label
						class="form-check-label" for="inlineCheckbox0">없음</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input chkbox2" type="checkbox"
						id="chkbox2_1" name="chkbox2" value="chkbox2_1"> <label
						class="form-check-label" for="inlineCheckbox1">뇌졸중(중풍)</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input chkbox2" type="checkbox"
						id="chkbox2_2" name="chkbox2" value="chkbox2_2"> <label
						class="form-check-label" for="inlineCheckbox2">심장병(심근경색/협심증)</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input chkbox2" type="checkbox"
						id="chkbox2_3" name="chkbox2" value="chkbox2_3"> <label
						class="form-check-label" for="inlineCheckbox3">고혈압</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input chkbox2" type="checkbox"
						id="chkbox2_4" name="chkbox2" value="chkbox2_4"> <label
						class="form-check-label" for="inlineCheckbox1">당뇨병</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input chkbox2" type="checkbox"
						id="chkbox2_5" name="chkbox2" value="chkbox2_5"> <label
						class="form-check-label" for="inlineCheckbox2">기타(암 포함)</label>
				</div>
				<br>
				<br>

				<p>- 기타 질환 - 1, 2문항에서 기타(암 포함) 표기하신 분만 작성</p>
				<textarea name="diseaseV" id="diseaseV" rows="5" cols="120"></textarea>
				<br>
				<br>

				<p>3. 과거 혹은 현재 흡연 상태를 표시해 주십시오.</p>
				<div class="form-check ">
					<input class="form-check-input" type="checkbox" id="chkbox3_1"
						name="chkbox3" value="chkbox3_1"
						onclick="clickCheck(this, 'input[name=chkbox3]')"> <label
						class="form-check-label" for="inlineCheckbox1">전혀 피운 적 없음</label>
				</div>
				<div class="form-check ">
					<input class="form-check-input" type="checkbox" id="chkbox3_2"
						name="chkbox3" value="chkbox3_2"
						onclick="clickCheck(this, 'input[name=chkbox3]')"> <label
						class="form-check-label" for="inlineCheckbox2">지금은 끊었음</label>
				</div>
				<div class="form-check ">
					<input class="form-check-input" type="checkbox" id="chkbox3_3"
						name="chkbox3" value="chkbox3_3"
						onclick="clickCheck(this, 'input[name=chkbox3]')"> <label
						class="form-check-label" for="inlineCheckbox3">현재도 흡연 중</label>
				</div>
				<br>
				<br>

				<p>4. 1주일에 평균 며칠 술을 마십니까?</p>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="chkbox4_0"
						name="chkbox4" value="chkbox4_0"
						onclick="clickCheck(this, 'input[name=chkbox4]')"> <label
						class="form-check-label" for="inlineCheckbox1">안 마심</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="chkbox4_1"
						name="chkbox4" value="chkbox4_1"
						onclick="clickCheck(this, 'input[name=chkbox4]')"> <label
						class="form-check-label" for="inlineCheckbox2">1일</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="chkbox4_2"
						name="chkbox4" value="chkbox4_2"
						onclick="clickCheck(this, 'input[name=chkbox4]')"> <label
						class="form-check-label" for="inlineCheckbox3">2일</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="chkbox4_3"
						name="chkbox4" value="chkbox4_3"
						onclick="clickCheck(this, 'input[name=chkbox4]')"> <label
						class="form-check-label" for="inlineCheckbox1">3일</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="chkbox4_4"
						name="chkbox4" value="chkbox4_4"
						onclick="clickCheck(this, 'input[name=chkbox4]')"> <label
						class="form-check-label" for="inlineCheckbox2">4일</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="chkbox4_5"
						name="chkbox4" value="chkbox4_5"
						onclick="clickCheck(this, 'input[name=chkbox4]')"> <label
						class="form-check-label" for="inlineCheckbox2">5일</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="chkbox4_6"
						name="chkbox4" value="chkbox4_6"
						onclick="clickCheck(this, 'input[name=chkbox4]')"> <label
						class="form-check-label" for="inlineCheckbox2">6일</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="chkbox4_7"
						name="chkbox4" value="chkbox4_7"
						onclick="clickCheck(this, 'input[name=chkbox4]')"> <label
						class="form-check-label" for="inlineCheckbox2">7일</label>
				</div>
				<br>
				<br>


				<p>5. 약이나 음식물(계란 포함) 혹은 백신접종으로 두드러기 또는 발진 등의 알레르기 증상을 보인 적이
					있습니까?</p>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="chkbox5_1"
						name="chkbox5" value="chkbox5_1"
						onclick="clickCheck(this, 'input[name=chkbox5]')"> <label
						class="form-check-label" for="inlineCheckbox1">예</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="chkbox5_0"
						name="chkbox5" value="chkbox5_0"
						onclick="clickCheck(this, 'input[name=chkbox5]')"> <label
						class="form-check-label" for="inlineCheckbox2">아니오</label>
				</div>
				<p>알레르기 증상이 있다면 적어주십시오.</p>
				<textarea name="allergyV" id="allergyV" rows="5" cols="120"></textarea>
				<br>
				<br>


				<p>6. 현재 임신 중이거나 또는 다음 한 달 동안 임신할 가능성이 있습니까?</p>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="chkbox6_1"
						name="chkbox6" value="chkbox6_1"
						onclick="clickCheck(this, 'input[name=chkbox6]')"> <label
						class="form-check-label" for="inlineCheckbox1">예</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" id="chkbox6_0"
						name="chkbox6" value="chkbox6_0"
						onclick="clickCheck(this, 'input[name=chkbox6]')"> <label
						class="form-check-label" for="inlineCheckbox2">아니오</label>
				</div>
				<br>
				<br>


				<p>7. 현재 아픈 증상</p>
				<textarea name="symptomV" id="symptomV" rows="10" cols="120"></textarea>
				<br>
				<br>

				<p style="text-align: right">
					<input type="hidden" id="disease1" name="disease1" value="">
					<input type="hidden" id="disease2" name="disease2" value="">
					<input type="hidden" id="diseasehist" name="diseasehist" value="">
					<input type="hidden" id="diseaseetc" name="diseaseetc" value="">
					<input type="hidden" id="smoke" name="smoke" value=""> <input
						type="hidden" id="alcohol" name="alcohol" value=""> <input
						type="hidden" id="allergy" name="allergy" value=""> <input
						type="hidden" id="allergyetc" name="allergyetc" , value="">
					<input type="hidden" id="pregnancy" name="pregnancy" value="">
					<input type="hidden" id="symptom" name="symptom" value="">
					<div class="text-center">
					<button id="sendBtn"
						class="btn btn-primary text-white col-6" style="color : #3478f5;"
						type="submit">작성</button>
					</div>
				</p>
			</form>

		</div>
	</div>
	<!-- 컨텐츠 영역 끝 -->
</div>
</div>


<script>
var num = ${sessionNUM}
 $(function(){
	$.ajax({
		url:'checkMedNum?num='+ num,
		success:function(data){
			//console.log('check = ' , data);
			if(data == 0){
				console.log('문진표 작성 내역 없음')
			}else{
				console.log('문진표 작성 내역 존재함')
				var box = [];
				$.ajax({
					url:'medInqSave?mednum='+num,
					success:function(data){
						for(var e in data){
							box.push(e);
						}
						var b = document.getElementById("#target2");

						$("#target").html(data);
					}
				})
			}		
		}
	})
}) 
function clickCheck(target, name) {
    document.querySelectorAll(name)
        .forEach(el => el.checked = false);

    target.checked = true;
}
	

$(".chkbox0").change(function(){
    if($(this).is(":checked")){
        $('#chkbox0_0').prop("checked", false);
        
    }
});

$(".chkbox1").change(function(){
    if($(this).is(":checked")){
        $('#chkbox1_0').prop("checked", false);
    }
});

$(".chkbox2").change(function(){
    if($(this).is(":checked")){
        $('#chkbox2_0').prop("checked", false);
    }
});
	
	$('#sendBtn').click(function(){
		var dislist1 = [];
		var dislist2 = [];
		var dishistlist = [];
// 		disease, diseasehist,
// 		etc, smoke, alcohol, allergy, pregnancy, symptom
		//1.1번 문항
		$('input[name=chkbox0]:checked').each(function(){
			var disease1 = $(this).val();
			dislist1.push(disease1);
		});
		var inq1 = "";
		for(var e of dislist1){
			console.log(e);
			inq1 += e+"/";
		}
		$('#disease1').val(inq1);
		
		//1.2번 문항
		$('input[name=chkbox1]:checked').each(function(){
			var disease2 = $(this).val();
			dislist2.push(disease2);
		});
		var inq2 = "";
		for(var e of dislist2){
			console.log(e);
			inq2 += e+"/";
		}
		$('#disease2').val(inq2);
		
		$('#diseaseetc').val($('#diseaseV').val());
		
		//2번 문항
		$('input[name=chkbox2]:checked').each(function(){
			var diseasehist = $(this).val();
			dishistlist.push(disease2);
			$('#diseasehist').val(diseasehist);
		});
		var inq3 = "";
		for(var e of diseasehist){
			console.log(e);
			inq3 += e+"/";
		}
		$('#diseasehist').val(inq3);
		
		
		//3번문항
		$('input[name=chkbox3]:checked').each(function(){
			var smoke = $(this).val();
			$('#smoke').val(smoke);
		});
		
		//4번문항
		$('input[name=chkbox4]:checked').each(function(){
			var alcohol = $(this).val();
			$('#alcohol').val(alcohol);
			
		});
		
		//5번문항:알러지
		$('input[name=chkbox5]:checked').each(function(){
			var allergy = $(this).val();
			$('#allergy').val(allergy);
		});
		
		$('#allergyetc').val($('#allergyV').val());
		
		//6번문항
		$('input[name=chkbox6]:checked').each(function(){
			var pregnancy = $(this).val();
			$('#pregnancy').val(pregnancy);
		});
		
		$('#symptom').val($('#symptomV').val());
	});
	
/*	
	$('#btn12').click(function(){
		var dislist1 = [];
		$('input[name=chkbox0]:checked').each(function(){
			disease1 = $(this).val();
			dislist1.push(disease1);
			console.log(dislist1);
			
		});
		var strdis1 = "";
		for(var e of dislist1){
			console.log(e);
			strdis1 += e+",";
		}
		console.log("str=>"+strdis1);
		console.log(strdis1.split(',')[2])
	});
*/	
	
	
	
	
	
	
// 	$('#upBtn').click(function() {
// 		$('#qbUpdate').attr("action",
// 				"${mycontext}/quesboard/qbUpdate");
// 		$('#qbUpdate').submit(function() {
// 			alert("수정되었습니다.");
// 		});
// 	});


</script>