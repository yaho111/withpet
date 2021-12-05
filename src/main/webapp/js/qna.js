function qna_check() {
	if ($("#qna_title").val() == "") {
		alert("제목를 입력하세요!");
		$("#qna_title").val("").focus();
		return false;
	}
	if(CKEDITOR.instances.qna_content.getData() =='' 
        || CKEDITOR.instances.qna_content.getData().length ==0){
    alert("질문을 입력하세요!");
    $("#qna_content").focus();
    return false;
	}
}
