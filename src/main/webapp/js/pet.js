function check() {
    if ($("input[name=pet_sort]:radio:checked").length < 1) {
        alert("종류를 선택하세요!");
        $("#cat").focus();
        return false;
    }
    if ($.trim($("#pet_name").val()) == "") {
        alert("이름 입력하세요!");
        $("#pet_name").val("").focus();
        return false;
    }
    if ($("input[name=pet_gender]:radio:checked").length < 1) {
        alert("성별을 선택하세요!");
        $("#male").focus();
        return false;
    }
}