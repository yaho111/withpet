function check() {
    if ($.trim($("#id").val()) == "") {
        alert("아이디를 입력하세요!");
        $("#join_id").val("").focus();
        return false;
    }
    if ($.trim($("#pwd").val()) == "") {
        alert("비밀번호를 입력하세요!");
        $("#join_pwd1").val("").focus();
        return false;
    }
    if ($.trim($("#pwd_check").val()) == "") {
        alert("비밀번호 확인을 입력하세요!");
        $("#join_pwd2").val("").focus();
        return false;
    }
    if ($.trim($("#pwd").val()) != $.trim($("#pwd_check").val())) {
        //!=같지않다 연산. 비번이 다를 경우
        alert("비밀번호가 다릅니다!");
        $("#pwd").val("").focus();
        $("#pwd_check").val("");

        return false;
    }
    if ($.trim($("#name").val()) == "") {
        alert("이름을 입력하세요!");
        $("#name").val("").focus();
        return false;
    }
    if ($.trim($("#birth").val()) == "") {
        alert("생년월일을 입력하세요!");
        $("#birth").val("").focus();
        return false;
    }
    if($("input[name=gender]:radio:checked").length < 1) {
        alert("성별을 선택하세요");
        $("#male").focus();
        return false;
    }
    if ($.trim($("#addr").val()) == "") {
        alert("주소를 입력하세요!");
        $("#addr").val("").focus();
        return false;
    }
    if ($.trim($("#specificAddress").val()) == "") {
        alert("상세 주소를 입력하세요!");
        $("#specificAddress").val("").focus();
        return false;
    }
    if ($.trim($("#middleNum").val()) == "") {
        alert("휴대전화번호를 입력하세요!");
        $("#middleNum").val("").focus();
        return false;
    }
    if ($.trim($("#backNum").val()) == "") {
        alert("휴대전화번호를 입력하세요!");
        $("#backNum").val("").focus();
        return false;
    }
    if ($.trim($("#mailId").val()) == "") {
        alert("메일 아이디를 입력하세요!");
        $("#mailId").val("").focus();
        return false;
    }
    if ($.trim($("#domain").val()) == "") {
        alert("메일 주소를 입력하세요!");
        $("#domain").val("").focus();
        return false;
    }

    if(validate_userpwd() == false) {
        return false;
    }
}

function post_search() {
    alert("우편번호 검색 버튼을 클릭하세요!");
}

/* 아이디 중복 체크*/
function id_check() {
    $("#id_check").hide();//id_check span 아이디 영역을 숨긴다.
    var id = $("#id").val();

    //1.입력글자 길이 체크
    if ($.trim($("#id").val()).length < 4) {
        var idText = '<font color="red">아이디는 4자 이상이어야 합니다.</font>';
        $("#id_check").text('').show().append(idText);
        $("#id").val("").focus();
        return false;
    }

    if ($.trim($("#id").val()).length > 12) {
        var idText = '<font color="red">아이디는 12자 이하이어야 합니다.</font>';
        $("#id_check").text('').show().append(idText);
        $("#id").val("").focus();
        return false;
    }

    //입력아이디 유효성 검사
    if (!(validate_userid(id))) {
        var idText = '<font color="red">아이디는 영문소문자,숫자,_ 조합만 가능합니다.</font>';
        $("#id_check").text('').show().append(idText);
        $("#id").val("").focus();
        return false;
    }

    //아이디 중복확인
    $.ajax({
        type: "POST",
        url: "idCheck",
        data: {"id": id},
        success: function (data) {

            if (data == 1) {	//중복 ID
                alert("중복 아이디입니다");
                var idText = '<font color="red">중복 아이디입니다.</font>';
                $("#id_check").text('').show().append(idText);
                $("#id").val('').focus();
                return false;

            } else {	//사용 가능한 ID
                alert("사용 가능한 아이디입니다");
                var idText = '<font color="blue">사용가능한 아이디입니다.</font>';
                $("#id_check").text('').show().append(idText);
                $("#pwd").focus();
            }
        }
        ,
        error: function (e) {
            alert("data error" + e);
        }
    });//$.ajax
}

/*아이디 중복 체크 끝*/

function validate_userid(id) {
    var pattern = new RegExp(/^[a-z0-9_]+$/);
    //영문 소문자,숫자 ,_가능,정규표현식
    return pattern.test(id);
}

function validate_userpwd() {
    var pwd = $("#pwd").val();
    var num = pwd.search(/[0-9]/g);
    var eng = pwd.search(/[a-z]/ig);
    var spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

    if(pwd.length < 8 || pwd.length > 20){

        alert("8자리 ~ 20자리 이내로 입력해주세요.");
        $("#pwd_check").val("");
        $("#pwd").val("").focus();
        return false;
    }else if(pwd.search(/\s/) != -1){
        alert("비밀번호는 공백 없이 입력해주세요.");
        $("#pwd_check").val("");
        $("#pwd").val("").focus();
        return false;
    }else if(num < 0 || eng < 0 || spe < 0 ){
        alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
        $("#pwd_check").val("");
        $("#pwd").val("").focus();
        return false;
    }else {
        return true;
    }
}

function domain_list() {
    var num = form.mail_list.selectedIndex;

    /*selectedIndex속성은 select객체하위의 속성으로서 해당리스트 목록번호를 반환
    */
    if (num == -1) {
        //num==-1은 해당 리스트목록이 없다
        return true;
    }
    if (form.mail_list.value == "0") // 직접입력
    {
        /*리스트에서 직접입력을 선택했을때*/
        form.domain.value = "";
        //@뒤의 도메인입력란을 빈공간시켜라.
        form.domain.readOnly = false;
        //@뒤의 도메인입력란을 쓰기 가능
        form.domain.focus();
        //도메인입력란으로 입력대기상태
    } else {
        //리스트목록을 선택했을때
        form.domain.value = form.mail_list.options[num].value;
        /*num변수에는 해당리스트 목록번호가 저장되어있다.해당리스트 번호의 option value값이 도메인입력란에 선택된다.options속성은 select객체의 속성으로서 해당리스트번호의 value값을 가져온다
        */
        form.domain.readOnly = true;
    }
}


/* 회원정보 수정 경고창 */
function edit_check() {
    if ($.trim($("#pwd").val()) == "") {
        alert("비밀번호 입력하세요!");
        $("#pwd").val("").focus();
        return false;
    }
    if ($.trim($("#pwd_check").val()) == "") {
        alert("회원비번확인을 입력하세요!");
        $("#pwd_check").val("").focus();
        return false;
    }
    if ($.trim($("#pwd").val()) != $.trim($("#pwd_check").val())) {
        //!=같지않다 연산. 비번이 다를 경우
        alert("비번이 다릅니다!");
        $("#pwd").val("");
        $("#pwd_check").val("");
        $("#pwd").focus();
        return false;
    }
    if ($.trim($("#name").val()) == "") {
        alert("이름을 입력하세요!");
        $("#name").val("").focus();
        return false;
    }

    if ($.trim($("#addr").val()) == "") {
        alert("주소를 입력하세요!");
        $("#addr").val("").focus();
        return false;
    }
    if ($.trim($("#specificAddress").val()) == "") {
        alert("상세 주소를 입력하세요!");
        $("#specificAddress").val("").focus();
        return false;
    }
    if ($.trim($("#middleNum").val()) == "") {
        alert("휴대전화번호를 입력하세요!");
        $("#middleNum").val("").focus();
        return false;
    }
    if ($.trim($("#backNum").val()) == "") {
        alert("휴대전화번호를 입력하세요!");
        $("#backNum").val("").focus();
        return false;
    }
    if ($.trim($("#mailId").val()) == "") {
        alert("메일 아이디를 입력하세요!");
        $("#mailId").val("").focus();
        return false;
    }
    if ($.trim($("#domain").val()) == "") {
        alert("메일 주소를 입력하세요!");
        $("#domain").val("").focus();
        return false;
    }

    if(validate_userpwd() == false) {
        return false;
    }
}

















