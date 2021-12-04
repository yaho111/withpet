<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript">
        // 수정 삭제 처리
        $(function() {
            $('.edit').click(function() {	   // 아래 수정버튼의 class 값으로 불러온다.
                var id  = $(this).attr('id');  // 댓글 번호 : id 값을 불러온다.
//			alert('id:'+id);
                var txt = $('#td_'+id).text(); // 댓글 내용을 불러옴
                $('#td_'+id).html("<textarea rows='1' cols='30' id='tt_"+id+"'>"+txt+"</textarea>");	// text 박스를 id마다 다르게 구분함
                /* 'tt'를 붙여서id 값을 다르게 하기 위해서 */
                $('#btn_'+id).html(
                    "<input type='button' value='확인' onclick='up("+id+")'> "// 수정을 확인으로 바꿔주는 작업 : up 함수 사용
                    +"<input type='button' value='취소' onclick='lst()'>");	// lst() 함수 사용
            });
        });

        // up함수 : 수정
        function up(uid) {
            var proReply_content = $('#tt_'+uid).val();
            var formData = "proReply_no="+uid+"&proReply_content="+proReply_content+"&pro_no=${product.pro_no}";// 바꿔줘야함
            console.log(formData);
            // 수정후 댓글 목록 출력 : post 함수를 사용
            $.post('${path}/proReUpdate', formData, function(data) {	// post함수로 컨트롤러에 요청
                $('#proReList').html(data);	// 결과를 돌려받음, 출력
            });
        }

        // lst() 함수
        function lst() {
            $('#proReList').load('${path}/proReList?pro_no=${product.pro_no}');// 바꿔줘야함
        }

        // 삭제
        function del(proReply_no,pro_no) {
            var formData="proReply_no="+proReply_no+"&pro_no="+pro_no;// 바꿔줘야함
            $.post("${path}/proReDelete", formData, function(data) {	// post함수로 컨트롤러에 요청
                $('#proReList').html(data);	// 결과를 돌려받음, 출력
            });
        }
    </script>
    </head>
    <body>
    <section class="py-5">
        <div class="container">
            <h2 class="text-primary">댓글</h2>
            <form>
                <input type="hidden" value="">
                <table class="table table-hover">
                    <tr>
                        <td>작성자</td>
                        <td>내용</td>
                        <td>수정일</td>
                        <td></td>
                    </tr>
                    <c:forEach var="proReList" items="${proReList}">	<!-- 컨트롤에서 공유되는  -->
                        <tr>
                            <td>${sessionScope.id}</td>	<!-- 작성자 -->
                            <!-- 전부 바꿔줘야함 -->
                            <td id="td_${proReList.proReply_no}">${proReList.proReply_content}</td>	<!-- 내용 -->
                            <td><fmt:formatDate value="${proReList.regdate}" pattern="MM월 dd일 HH:mm EEE요일" /> </td>	<!-- 수정일 -->
                            <td id="btn_${proReList.proReply_no}">	<!-- 버튼 -->
                                <c:if test="${proReList.proReply_writer == sessionScope.id || sessionScope.role == 'master' || sessionScope.role == product}">
                                    <input type="button" value="수정" class="edit" id="${proReList.proReply_no}"><!-- 수정하기 위해서는 id값이 달라야 한다.  -->
                                    <input type="button" value="삭제" onclick="del('${proReList.proReply_no}','${proReList.pro_no}')">
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
        </div>
    </section>
    </body>
</html>
