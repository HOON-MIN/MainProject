/**
 * 
 */
$("#kakaoForm").submit(function(){
	if($("#ssn1").val().length==0 || $("#ssn2").val().length==0 || $("#telv").val().length==0 || $("#email").val().length==0){
		alert("입력되지 않은 정보가 존재합니다.");
		return false;
	}
	const ssn = $("#ssn1").val()+"-"+$("#ssn2").val();
	var telv= $("#telv").val();
	
	$("#ssn").val(ssn);	//주민번호 하이픈 추가
	$("#tel").val(telv.substring(0,3)+"-"+telv.substring(3,7)+"-"+telv.substring(7)); //전화번호 하이픈 추가
	
	alert($("#ssn").val()+" : "+$("#id").val()+" : "+$("#tel").val());
	return true;
});