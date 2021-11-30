function notice_check() {
	if ($.trim($("#not_title").val()) == "") {
		alert("제목를 입력하세요!");
		$("#qna_title").val("").focus();
		return false;
	}
	if ($.trim($("#not_content").val()) == "") {
		alert("내용을 입력하세요!");
		$("#qna_content").val("").focus();
		return false;
	}
	if(CKEDITOR.instances.not_content.getData() =='' 
        || CKEDITOR.instances.not_content.getData().length ==0){
    alert("내용을 입력하세요!");
    $("#not_content").focus();
    return false;
	}
}