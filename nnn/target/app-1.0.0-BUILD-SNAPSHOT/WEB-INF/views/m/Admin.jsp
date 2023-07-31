<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>


	$(function() {
		alert("jquery 실행");

		$("#change").click(function() {
			alert("버튼 클릭됨");
			//ajax
			/* $.ajax({
				type:'post',
				url:"${pageContext.request.contextPath}/m/status.do",
				data:{	"m_status":m_status,
						"m_id":m_id
						},
				success:function(data){
					//데이터
					if(data == "Y"){
						alert("승인성공");
						alert(data);
					}else{
						alert("승인실패");
						
						alert(data);
					}
				},
				error:function(error)
				{
					alert(error);
					}
			}); */
		});
		

	});
	
</script>

</head>
<style>
a {
	text-decoration: none;
}
</style>
<body>
<form action="${pageContext.request.contextPath}/m/status.do" method="post">
	<!-- 
필요한 기능

전체 회원의 정보를 받아오고
그 회원의 status를 변경하여 승인처리를 해준다
 -->

	<table>
		<tr>
			<td colspan=1>회원정보</td>
		</tr>
		<tr>
			<td>아이디</td><td>이름</td><td>이메일</td><td>기관명</td><td>부서명</td><td>사번</td><td>가입일</td><td>승인상태 변경</td>
		</tr>
		<c:forEach items="${mlist}" var="list">
			
			<tr>
				<td>${list.m_id }<input type="hidden" name="m_id" value="${list.m_id }"></td>
				<td>${list.m_name }</td>
				<td>${list.m_email }</td>
				<td>${list.m_in }</td>
				<td>${list.m_de }</td>
				<td>${list.m_no }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.m_regdate}"/></td>
				<td>
					<!-- 가입승인 상태 변경 -->
					
						<c:if test="${list.m_status == 0}">미승인</c:if>
						<c:if test="${list.m_status == 1}">승인완료</c:if>
					
					<input type="hidden" value="1" name="m_status">
					
					<input type="button" id="change" value="승인처리">
					<input type="submit" id="change2" value="승인">
					<a href="${pageContext.request.contextPath}/m/status.do/midx=${list.m_id}/m_status=${list.m_status}">승인</a>
				</td>
			</tr>
		</c:forEach>


	</table>
	<a href="${pageContext.request.contextPath}/">홈으로</a>
	</form>
</body>
</html>