function qna_check() {
	if ($.trim($("#qna_title").val()) == "") {
		alert("제목를 입력하세요!");
		$("#qna_title").val("").focus();
		return false;
	}
	if ($.trim($("#qna_content").val()) == "") {
		alert("질문을 입력하세요!");
		$("#qna_content").val("").focus();
		return false;
	}
}