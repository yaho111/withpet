// 기본 유효성 검사
function check() {
	if ($("#hos_name").val() == "") {
		alert("병원 이름을 입력하세요!");
		$("#hos_name").focus();
		return false;
	}
	if ($("#hos_name").val().length > 15) {
		alert("병원 이름을 15자 이하로 입력하세요!");
		$("#hos_name").focus();
		return false;
	}
	if ($("#addr").val() == "") {
		alert("주소를 입력하세요!");
		$("#addr").val("").focus();
		return false;
	}
	if ($("#specificAddress").val() == "") {
		alert("상세 주소를 입력하세요!");
		$("#specificAddress").val("").focus();
		return false;
	}
	if ($("#specificAddress").val().length > 20) {
		alert("상세 주소를 20자 이하로 입력하세요!");
		$("#specificAddress").focus();
		return false;
	}
	if ($("#hos_tel").val() == "") {
		alert("전화번호를 입력하세요!");
		$("#hos_tel").focus();
		return false;
	}
	if ($("#hos_tel").val().length > 50) {
		alert("전화번호를 50자 이하로 입력하세요!");
		$("#hos_tel").focus();
		return false;
	}
	if ($("#hos_time").val() == "") {
		alert("운영 시간을 입력하세요!");
		$("#hos_time").focus();
		return false;
	}
	if ($("#hos_time").val().length > 80) {
		alert("운영 시간을 80자 이하로 입력하세요!");
		$("#hos_time").focus();
		return false;
	}
	if ($("#hos_24_Y").is(":checked")==false && $("#hos_24_N").is(":checked")==false) {
		alert("24시 여부를 선택하세요!");
		return false;
	}
	if ($("#hos_holiday_Y").is(":checked")==false && $("#hos_holiday_N").is(":checked")==false) {
		alert("연중무휴 여부를 선택하세요!");
		return false;
	}
	if ($("#hos_parking_Y").is(":checked")==false && $("#hos_parking_N").is(":checked")==false) {
		alert("주차 가능 여부를 선택하세요!");
		return false;
	}
	if ($("#hos_content").val() == "") {
		alert("병원 소개를 입력하세요!");
		$("#hos_content").focus();
		return false;
	}
	if ($("#hos_content").val().length > 150) {
		alert("병원 소개를 150자 이하로 입력하세요!");
		$("#hos_content").focus();
		return false;
	}
}


// 주소 검사
function post_search() {
	alert("우편번호 검색 버튼을 클릭하세요!");
}
