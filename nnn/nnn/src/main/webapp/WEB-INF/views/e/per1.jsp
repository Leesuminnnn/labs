<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<table class="scrolltable" style="/* border: 1px solid #000; border-collapse: collapse; text-align: center; table-layout: fixed; */">
	<thead>
	<tr>
		<td colspan="5">평가자정보</td>
		<td rowspan="2">평가대상자수</td>
		<td rowspan="2">평가결과수</td>
		<td rowspan="2">진행율</td>
		<td rowspan="2">미평가자 리스트</td>
		<td rowspan="2">평가자 마이페이지</td>
	</tr>
	<tr>
		<td style="width: 230px;">사원코드</td>
		<td>기관명</td>
		<td>부서명</td>
		<td>직급/직책</td>
		<td>사원명</td>
	</tr>
	</thead>
	<tbody>
		<c:forEach  items="${list }" var="l">
			
				<tr>
					<td style="width: 230px;">${l.user_code }</td>
					<td>${l.hspt_name }</td>
					<td>${l.hspt_subname }</td>
					<td>${l.hspt_position }</td>
					<td>${l.name }</td>
					
					<td>
						<c:forEach items="${target }" var="t">
							<c:if test="${l.id eq t.id }">
							${t.target }
							</c:if>
						</c:forEach>
					</td>
					
					<td>
						<c:forEach items="${answer }" var="a" varStatus="status">
							<c:if test="${status.count eq 1 }">
								<c:if test="${l.id eq a.u2 }">
									<c:out value="${answer.size()}"/>
								</c:if>
							</c:if>
						</c:forEach>
					</td>
					<td></td>
					<td></td>
					<td style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/e/Info/${l.idx }'">
						링크
					</td>
					
				</tr>
		</c:forEach>
	</tbody>
</table>
</body>
<script>

</script>
</html>