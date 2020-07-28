function checkReg() {
	
	if(document.registFrm.custname.value.length == 0) {
		alert("회원성명이 입력되지 않았습니다");
		registFrm.custname.focus();
		return false;
	}
	
	if(document.registFrm.phone.value.length == 0) {
		alert("회원전화가 입력되지 않았습니다");
		registFrm.phone.focus();
		return false;
	}
	
	if(document.registFrm.address.value.length == 0) {
		alert("회원주소가 입력되지 않았습니다");
		registFrm.address.focus();
		return false;
	}
	
	var g = document.registFrm.grade.value;
	
	if(g.length == 0) {
		alert("고객등급이 입력되지 않았습니다");
		registFrm.grade.focus();
		return false;
	}
	
	if(g != 'A' && g != 'B' && g != 'C') {
		alert("고객등급은 A,B,C 중 하나로 입력해주세요");
		registFrm.grade.focus();
		return false;
	}
	
	if(document.registFrm.city.value.length == 0) {
		alert("도시코드가 입력되지 않았습니다");
		registFrm.city.focus();
		return false;
	}
	
	return true;
}