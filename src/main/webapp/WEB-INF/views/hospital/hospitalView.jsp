<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp"%>

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

	<table border="1" width=600 align="center">
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
					        
					     	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					        var content = '<div class="customoverlay">' +
					            '  <a href="https://map.kakao.com/link/search/${addr}" target="_blank">' +
					            '    <span class="title">${hospital.hos_name}</span>' +
					            '  </a>' +
					            '</div>';

					        // 커스텀 오버레이가 표시될 위치입니다 
					        var position = new kakao.maps.LatLng(result[0].y, result[0].x);  

					        // 커스텀 오버레이를 생성합니다
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
			<td colspan=2>${hospital.hos_addr}</td>
		</tr>
		<tr>
			<td colspan=2>${hospital.hos_tel}</td>
		</tr>
		<tr>
			<td colspan=2>${hos_time}</td>
		</tr>
		<tr>
			<td colspan=2>${hos_content}</td>
		</tr>
		<tr>
			<c:if test="${not empty hospital.hos_link}">
				<td colspan=2><a href="http://${hospital.hos_link}" target="_blank"
					style="text-decoration: none">${hospital.hos_link}</a></td>
			</c:if>
		</tr>
		<tr>
			<c:if test="${hospital.hos_24 == 'Y' || hospital.hos_holiday == 'Y' || hospital.hos_parking == 'Y'}">
				<td colspan=2><c:if test="${not empty hospital.hos_24 && hospital.hos_24 == 'Y'}">24시&nbsp;</c:if>
					<c:if test="${not empty hospital.hos_holiday && hospital.hos_holiday == 'Y'}">연중무휴&nbsp;&nbsp;</c:if>
					<c:if test="${not empty hospital.hos_parking && hospital.hos_parking == 'Y'}">주차 가능</c:if>
				</td>
			</c:if>
		</tr>
			<tr>
				<td colspan=2 align="center">
					<input type="button" value="추천" onClick="hosLikeButton()" >
				</td>
			</tr>
	</table>

	<div align="center">
		<c:if test="${sessionScope.id == hospital.hos_writer}">
			<input type="button" value="수정"
				onClick="location.href='updateForm?hos_no=${hospital.hos_no}&page=${page}'">
			<input type="button" value="삭제"
				onClick="deleteCheck()">
		</c:if>
			<input type="button" value="목록"
				onClick="location.href='hospitalList?page=${page}'">
	</div>

<%@ include file="../layout/footer.jsp"%>