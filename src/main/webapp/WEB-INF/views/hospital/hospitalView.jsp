<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp"%>

<!-- 댓글 처리 -->
<script type="text/javascript">
	/* 	window.onload=function() {
	
	 } */
	 $(function() {
			$('#hosReList').load('${path}/hosReList?hos_no=${hospital.hos_no}') // 리스트를 불러온다., 
			
			// 댓글창 유효성 검사
			$('#hosReInsert').click(function() {
				if (!hos_form.hosReply_content.value) {
					alert('댓글 입력 후에 클릭하세요.');
					hos_form.hosReply_content.focus();
					return false;
				}
			
			// 댓글 입력, 입력후 
			var frmData = $('form').serialize();	// serialize() : 아래의 form태그를 읽는함수. 			  
			$.post('${path}/hosReInsert ', frmData, function(data) {
				$('#hosReList').html(data);
				hos_form.hosReply_content.value = '';
			});
		});
	});
</script>

<!-- 추천 버튼 클릭 시 -->
<script>
	function hosLikeButton(){
		if(${empty sessionScope.id}) {
			alert("로그인이 필요한 서비스입니다!");
			return false;
			
		}else if("${sessionScope.id}" == "${hospital.hos_writer}"){
			alert("자신의 글은 추천할 수 없습니다!");
			return false;
	
		}else {
			var hosLikeData = 'hos_no='+${hospital.hos_no}+'&id='+"${sessionScope.id}";		
			$.post('${path}/hosLikeInsert', hosLikeData, function(message) {
				alert(message);
			});
			return false;
		}
	}
</script>

<!-- 글 삭제 confirm 창 띄우기 -->
<script>
	function deleteCheck(){
		if(confirm("정말로 삭제하시겠습니까?") == true){	// 확인
			location.href="delete?hos_no=${hospital.hos_no}&page=${page}"
		}else{										// 취소
			alert("취소되었습니다.");
			return false;
		}
	}
</script>

<section class="py-5">
 <div class="container-body">
    
	<table class="table">
		<tr align="center">
			<td colspan=2><h2>${hospital.hos_name}</h2></td>
		</tr>
		<tr>
			<td><c:if test="${empty hospital.hos_file}">
					<img src="${path}/upload/hospital/hospitalimg.jpg" height="300" width="300" />
				</c:if> <c:if test="${not empty hospital.hos_file}">
					<img src="${path}/upload/hospital/${hospital.hos_file}" height="300" width="300" />
				</c:if></td>
			<td>
			<!-- 지도 출력 -->
				<div id="map" style="width: 400px; height: 300px;"></div> <script
					type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${appKey}&libraries=services,clusterer,drawing"></script>
				<script>
				// 지도를 표시할 영역(container) 지정
					var mapContainer = document.getElementById('map');
					var mapOption = {
						center: new kakao.maps.LatLng(33.450701, 126.570667),	// 지도의 중심 좌표
						level: 2	// 지도의 확대 레벨
					};

					var map = new kakao.maps.Map(mapContainer, mapOption);
					
					var geocoder = new kakao.maps.services.Geocoder();
					
					// 주소로 좌표를 검색
					geocoder
							.addressSearch('${addr}', function(result, status) {

					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {

					    	 // 마커가 표시될 위치
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

					        // 마커 생성(결과값으로 받은 위치를 마커로 표시)
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
					        
					     	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능
					        var content = '<div class="customoverlay">' +
					            '  <a href="https://map.kakao.com/link/search/${addr}" target="_blank">' +
					            '    <span class="title">${hospital.hos_name}</span>' +
					            '  </a>' +
					            '</div>';

					        // 커스텀 오버레이가 표시될 위치
					        var position = new kakao.maps.LatLng(result[0].y, result[0].x);  

					        // 커스텀 오버레이를 생성
					        var customOverlay = new kakao.maps.CustomOverlay({
					            map: map,
					            position: position,
					            content: content,
					            yAnchor: 0 
					        });

					        map.setCenter(coords);
					    } 
					});    					
				</script>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${addr} ${specificAddress}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${hospital.hos_tel}</td>
		</tr>
		<tr>
			<td>운영 시간</td>
			<td>${hos_time}</td>
		</tr>
		<tr>
			<td>병원 소개</td>
			<td>${hospital.hos_content}</td>
		</tr>
		<tr>
			<c:if test="${not empty hospital.hos_link}">
				<td>병원 홈페이지/블로그 링크</td>
				<td><a href="http://${hospital.hos_link}" target="_blank"
					style="text-decoration: none">${hospital.hos_link}</a></td>
			</c:if>
		</tr>
		<tr>
			<c:if test="${hospital.hos_24 == 'Y' || hospital.hos_holiday == 'Y' || hospital.hos_parking == 'Y'}">
				<td colspan=2 align="center"><c:if test="${not empty hospital.hos_24 && hospital.hos_24 == 'Y'}">24시&nbsp;</c:if>
					<c:if test="${not empty hospital.hos_holiday && hospital.hos_holiday == 'Y'}">연중무휴&nbsp;&nbsp;</c:if>
					<c:if test="${not empty hospital.hos_parking && hospital.hos_parking == 'Y'}">주차 가능</c:if>
				</td>
			</c:if>
		</tr>
			<tr>
				<td colspan=2 align="center">
					<input type="button" value="추천" class="btn btn-outline-secondary" onClick="hosLikeButton()" >
				</td>
			</tr>
	</table>

	<div align="center">
		<c:if test="${sessionScope.id == hospital.hos_writer || sessionScope.role == 'hospital'||
			          sessionScope.role == 'master'}">
			<input type="button" value="수정" class="btn btn-outline-secondary"
				onClick="location.href='updateForm?hos_no=${hospital.hos_no}&page=${page}'">
			<input type="button" value="삭제" class="btn btn-outline-secondary"
				onClick="deleteCheck()">
		</c:if>
			<input type="button" value="목록" class="btn btn-outline-secondary"
				onClick="location.href='hospitalList?page=${page}'">
	</div>
		<!-- 댓글 처리 -->
<p>		<!-- 위의 자바스크립에 값을 전달해줘야함 -->
		<form name="hos_form" id="hos_form" >
			<input type="hidden" name="hosReply_writer" value="${sessionScope.id}">
			<input type="hidden" name="hos_no" value="${hospital.hos_no}"> 
			<c:if test="${sessionScope.id != null}">
			<input type="text" value="댓글" class="form-control" readonly="readonly" style="text-align:center;" >
			<textarea name="hosReply_content" rows="2" style="width:100%; border: 0; resize: none;"></textarea>
			<input type="button" value="확인" id="hosReInsert" class="form-control">
			</c:if>
		</form>
 </div>
</section>

<div id="hosReList"></div>

<%@ include file="../layout/footer.jsp"%>