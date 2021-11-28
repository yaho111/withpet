<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp"%>

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

<section class="py-5">
 <div class="container-body">
		<h2 align="center">병원 등록</h2>
		<form action="insert" method="post" onsubmit="return check()" enctype="multipart/form-data">
		<input type="hidden" name="hos_loc" id="hos_loc">
			<table class="table">
				<tr>
					<th>병원 이름</th>
					<td><input type="text" name="hos_name" id="hos_name" class="form-control"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="hos_writer" id="hos_writer" readonly class="form-control" value="${sessionScope.id}"></td>
				</tr>
				<tr>
                <th>우편번호</th>
                <td>
                	<div class="input-group"> 
                    <input name="post" id="post" size="5" class="form-control" readonly
                    	   onclick="post_search()"/>
                    <!-- -<input name="join_zip2" id="join_zip2" size="3" class="input_box" readonly
                            onclick="post_search()"/> -->
                    <input type="button" value="우편번호검색" class="btn btn-outline-secondary"
                           onclick="openDaumPostcode()"/>
                    </div>
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <input name="addr" id="addr" size="50" class="form-control"
                           readonly onclick="post_search()"/>
                </td>
            </tr>

            <tr>
                <th>상세 주소</th>
                <td>
                    <input name="specificAddress" id="specificAddress" size="37" class="form-control"/>
                </td>
            </tr>
				<tr>
					<th>전화번호</th>
					<td>
					<div class="input-group">
						<input type="text" name="frontNum" id="frontNum" class="form-control">
						<span class="input-group-text">-</span>		
						<input type="text" name="middleNum" id="middleNum" class="form-control">
						<span class="input-group-text">-</span>	
						<input type="text" name="backNum" id="backNum" class="form-control">	
					</div>	
					</td>
				</tr>
				<tr>
					<th>병원 이미지 <font size="1" color="gray">*선택</font></th>
					<td><input type="file" name="hos_file1" id="hos_file1" class="form-control"></td>
				</tr>
				<tr>
					<th>운영 시간</th>
					<td><textarea rows="5" cols="30" name= "hos_time" id= "hos_time" class="form-control"
						placeholder="평일 10:00 - 20:00 &#13;&#10;토요일 10:00 - 19:00&#13;&#10;일요일  휴무
						&#13;&#10;위의 형식으로 입력해주세요."></textarea></td>
				</tr>
				<tr>
					<th>24시 여부</th>
					<td>
						<label class="form-check-label" for="hos_24_Y">
							24시 운영
						</label>
							<input class="form-check-input" type="radio" name= "hos_24" id= "hos_24_Y" value="Y">
						<label class="form-check-label" for="hos_24_N">
							24시 운영 아님
						</label>
							<input class="form-check-input" type="radio" name= "hos_24" id= "hos_24_N" value="N">
					</td>
				</tr>
				<tr>
					<th>연중무휴 여부</th>
					<td>
						<label class="form-check-label" for="hos_holiday_Y">
							연중무휴
						</label>
							<input type="radio" name= "hos_holiday" id= "hos_holiday_Y" value="Y">
						<label class="form-check-label" for="hos_holiday_N">
							연중무휴 아님
						</label>
							<input type="radio" name= "hos_holiday" id= "hos_holiday_N"  value="N">
					</td>
				</tr>
				<tr>
					<th>주차 가능 여부</th>
					<td>
						<label class="form-check-label" for="hos_parking_Y">
							주차 가능
						</label>
							<input type="radio" name= "hos_parking" id= "hos_parking_Y" value="Y">
						<label class="form-check-label" for="hos_parking_N">	
							주차 불가
						</label>	
							<input type="radio" name= "hos_parking" id= "hos_parking_N" value="N">
					</td>
				</tr>
				<tr>
					<th>병원 소개</th>
					<td><textarea rows="5" cols="30" name="hos_content" id="hos_content" class="form-control"></textarea></td>
				</tr>
				<tr>
					<th>병원 홈페이지/블로그 링크 <font size="1" color="gray">*선택</font></th>
					<td><input type="text" name="hos_link" id="hos_link" class="form-control" placeholder="www.naver.com의 형식으로 입력해주세요."></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="확인" class="btn btn-primary">
					<input type="button" value="뒤로 가기" class="btn btn-danger" onClick="history.go(-1)"></td>
				</tr>
			</table>
		</form>
	
 </div>
</section>

<%@ include file="../layout/footer.jsp"%>