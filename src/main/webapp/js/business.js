function check() {
    if($.trim($("#bus_name").val()) == ""){
        alert("사업명을 입력하세요!");
        $("#bus_name").val("").focus();
        return false;
    }
    if($.trim($("#bus_no").val()) == ""){
        alert("사업자 등록번호를 입력하세요!");
        $("#bus_no").val("").focus();
        return false;
    }
    if($.trim($("#addr").val()) == ""){
        alert("주소를 입력하세요!");
        $("#addr").val("").focus();
        return false;
    }
    if($.trim($("#specificAddress").val()) == ""){
        alert("상세 주소를 입력하세요!");
        $("#specificAddress").val("").focus();
        return false;
    }
    if($("#frontNum").val() == ""){
        alert("연락처를 입력하세요!");
        $("#frontNum").focus();
        return false;
    }
    if ($.trim($("#middleNum").val()) == "") {
        alert("연락처를 입력하세요!");
        $("#middleNum").val("").focus();
        return false;
    }
    if ($.trim($("#backNum").val()) == "") {
        alert("연락처를 입력하세요!");
        $("#backNum").val("").focus();
        return false;
    }
    if($("input[name=bus_sort]:radio:checked").length < 1) {
        alert("사업 분류를 선택하세요");
        $("#shopping").focus();
        return false;
    }


}
function post_search() {
    alert("우편번호 검색 버튼을 클릭하세요!");
}