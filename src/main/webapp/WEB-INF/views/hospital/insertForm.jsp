<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 게시판</title>

<!-- jquery 라이브러리 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- 외부 자바스크립트 파일(유효성 검사) 불러오기 -->
<script src="${path}/js/hospitalCheck.js"></script>

<!-- 다음 주소 API -->
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        //우편번호, 주소 Daum API
        function openDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    // 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
                    document.getElementById('post').value = data.zonecode;
                    document.getElementById('addr').value = data.address; 
                    document.getElementById('hos_loc').value = data.sido+' '+data.sigungu;
                   // document.getElementById('hos_loc').value = data.sido.concat	(" ", data.sigungu);
                }
            }).open();
        }
    </script>

</head>
<body>
	<div class="container" align="center">
		<h2>병원 등록</h2>
		<form action="insert" method="post" onsubmit="return check()" enctype="multipart/form-data">
		<input type="hidden" name="hos_loc" id="hos_loc">
			<table border=1 align="center" width="650">
				<tr>
					<th>병원 이름</th>
					<td><input type="text" name="hos_name" id="hos_name"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="hos_writer" id="hos_writer"></td>
				</tr>
				<tr>
                <th>우편번호</th>
                <td>
                    <input name="post" id="post" size="5" class="input_box" readonly 
                    	   onclick="post_search()"/>
                    <!-- -<input name="join_zip2" id="join_zip2" size="3" class="input_box" readonly
                            onclick="post_search()"/> -->
                    <input type="button" value="우편번호검색" class="input_button"
                           onclick="openDaumPostcode()"/>
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <input name="addr" id="addr" size="50" class="input_box"
                           readonly onclick="post_search()"/>
                </td>
            </tr>

            <tr>
                <th>상세 주소</th>
                <td>
                    <input name="specificAddress" id="specificAddress" size="37" class="input_box"/>
                </td>
            </tr>
				<tr>
					<th>전화번호</th>
					<td>
						<select name="frontNum" id="frontNum">
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option> 
						</select> -		
						<input type="text" name="middleNum" id="middleNum"> -	
						<input type="text" name="backNum" id="backNum">		
					</td>
				</tr>
				<tr>
					<th>병원 이미지 <font size="1" color="gray">*선택</font></th>
					<td><input type="file" name="hos_file1" id="hos_file1"></td>
				</tr>
				<tr>
					<th>운영 시간</th>
					<td><textarea rows="5" cols="30" name= "hos_time" id= "hos_time"
						placeholder="평일 10:00 - 20:00 &#13;&#10;토요일 10:00 - 19:00&#13;&#10;일요일  휴무
						&#13;&#10;위의 형식으로 입력해주세요."></textarea></td>
				</tr>
				<tr>
					<th>24시 여부</th>
					<td><input type="radio" name= "hos_24" id= "hos_24_Y" value="Y">24시 운영
						<input type="radio" name= "hos_24" id= "hos_24_N" value="N">24시 운영 아님</td>
				</tr>
				<tr>
					<th>연중무휴 여부</th>
					<td><input type="radio" name= "hos_holiday" id= "hos_holiday_Y" value="Y">연중무휴
						<input type="radio" name= "hos_holiday" id= "hos_holiday_N"  value="N">연중무휴 아님</td>
				</tr>
				<tr>
					<th>주차 가능 여부</th>
					<td><input type="radio" name= "hos_parking" id= "hos_parking_Y" value="Y">주차 가능
						<input type="radio" name= "hos_parking" id= "hos_parking_N" value="N">주차 불가</td>
				</tr>
				<tr>
					<th>병원 소개</th>
					<td><textarea rows="5" cols="30" name="hos_content" id="hos_content"></textarea></td>
				</tr>
				<tr>
					<th>병원 홈페이지/블로그 링크 <font size="1" color="gray">*선택</font></th>
					<td><input type="text" name="hos_link" id="hos_link" style="width:300px;" placeholder="www.naver.com의 형식으로 입력해주세요."></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="확인">
					<input type="button" value="뒤로 가기" onClick="history.go(-1)"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>

<%@ include file="../layout/footer.jsp"%>