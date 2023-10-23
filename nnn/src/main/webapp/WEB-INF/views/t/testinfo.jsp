<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
td {
border:1px solid #000;
padding: 15px;
text-align: center;
}
</style>
</head>
<body>
<div style="margin : 20px 0 20px 0;">
<c:choose>
	<c:when test=""></c:when>
	<c:when test=""></c:when>
	<c:when test=""></c:when>
</c:choose>

로고가 들어갈 영역입니다
</div>
<div>
▣ 사원정보( ※ 개인정보를 확인해주세요 )
</div>
<div>
	<table style="border:1px solid #000; border-collapse: collapse;">
		<tr>
			<td>기관명</td>
			<td>부서명</td>
			<td>사원번호</td>
			<td>직급/직책</td>
			<td>사원명</td>
			<td>입사일자</td>
			<td>경혁팀</td>
			<td>1인부서</td>
			
		</tr>
		<tr>
			<td>
				<c:choose>
					<c:when test="${info.hspt_name == 1}">효사랑가족요양병원</c:when>
					<c:when test="${info.hspt_name == 2}">효사랑전주요양병원</c:when>
					<c:when test="${info.hspt_name == 3}">가족사랑요양병원</c:when>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test="${info.hspt_sub == 'A00'}">진료부</c:when>
					<c:when test="${info.hspt_sub == 'B00'}">원무부</c:when>
					<c:when test="${info.hspt_sub == 'C00'}">총무부</c:when>
					<c:when test="${info.hspt_sub == 'D00'}">관리과</c:when>
					<c:when test="${info.hspt_sub == 'E00'}">QPS</c:when>
					<c:when test="${info.hspt_sub == 'F00'}">임상병리</c:when>
					<c:when test="${info.hspt_sub == 'G00'}">방사선</c:when>
					<c:when test="${info.hspt_sub == 'H00'}">약국</c:when>
					<c:when test="${info.hspt_sub == 'I00'}">사회사업실</c:when>
					<c:when test="${info.hspt_sub == 'J00'}">영양과</c:when>
					<c:when test="${info.hspt_sub == 'K00'}">물리치료실</c:when>
					<c:when test="${info.hspt_sub == 'L00'}">작업치료실</c:when>
					<c:when test="${info.hspt_sub == 'M00'}">외래</c:when>
					<c:when test="${info.hspt_sub == 'N00'}">가정간호</c:when>
					<c:when test="${info.hspt_sub == 'O00'}">인공신장</c:when>
					<c:when test="${info.hspt_sub == 'P00'}">감염관리</c:when>
					<c:when test="${info.hspt_sub == 'Q01'}">1병동</c:when>
					<c:when test="${info.hspt_sub == 'Q02'}">2병동</c:when>
					<c:when test="${info.hspt_sub == 'Q03'}">3병동</c:when>
					<c:when test="${info.hspt_sub == 'Q04'}">4병동</c:when>
					<c:when test="${info.hspt_sub == 'Q05'}">5병동</c:when>
					<c:when test="${info.hspt_sub == 'Q06'}">6병동</c:when>
					<c:when test="${info.hspt_sub == 'Q07'}">7병동</c:when>
					<c:when test="${info.hspt_sub == 'Q08'}">8병동</c:when>
					<c:when test="${info.hspt_sub == 'Q09'}">9병동</c:when>
					<c:when test="${info.hspt_sub == 'Q10'}">10병동</c:when>
					<c:when test="${info.hspt_sub == 'Q11'}">11병동</c:when>
					<c:when test="${info.hspt_sub == 'R00'}">경영전략연구소</c:when>
					<c:when test="${info.hspt_sub == 'S00'}">고객지원</c:when>
					<c:when test="${info.hspt_sub == 'T00'}">의료정보실</c:when>
					<c:when test="${info.hspt_sub == 'U00'}">장래문화원</c:when>
					<c:when test="${info.hspt_sub == 'V00'}">재활치료실</c:when>
					<c:when test="${info.hspt_sub == 'W00'}">홍보기획실</c:when>
				</c:choose>
			</td>
			<td>
				${info.id}
			</td>
			<td>
				${info.hspt_position }
				<c:choose>
					<c:when test="${info.hspt_K == 'T'}"> / 경혁팀장</c:when>
					<c:when test="${info.hspt_V == 'T' && info.hspt_K == 'F'}"> / 경혁팀</c:when>
				</c:choose>
			</td>
			<td>
				${info.name }
			</td>
			<td>
				<fmt:formatDate var="date" value="${info.reg_date }" pattern="yyyy. MM. dd" />${date}
			</td>
			<td>
				<c:choose>
					<c:when test="${info.hspt_V == 'T'}">O</c:when>
					<c:when test="${info.hspt_V == 'F'}">X</c:when>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test="${info.hspt_X == 'T'}">O</c:when>
					<c:when test="${info.hspt_X == 'F'}">X</c:when>
				</c:choose>
			</td>
		</tr>
	</table>
</div>

<div style="border-bottom: 3px solid #000; margin: 10px 0 10px 0;"></div>
<div><span>▣ 평가대상자( ※ 평가대상자를 확인 후 평가를 진행해주세요)</span></div>
<script>
</script>
<c:choose>
<c:when test="${info.hspt_X == 'T' and info.hspt_V == 'F' }">
평가 대상자가 아닙니다.
</c:when>
<c:otherwise>



<div style="display:<c:if test="${info.hspt_sub == 'A00'}">none</c:if>;">
▶ 진료부 평가
<div>
<table style="border:1px solid #000; border-collapse: collapse;">
	<tr>
		<td></td><td>부서명</td><td>사원번호</td><td>성명</td><td rowspan="1"></td>
	</tr>
<c:set var="index" value="1" />
<c:forEach items="${target}" var="t">
<c:set var="sub" value = "${t.hspt_sub }"/>
    <c:if test="${t.idx != info.idx && fn:startsWith(t.user_code, 'A')}">
	<tr>
		<td>${index}</td>
		<td>
			<c:choose>
				<c:when test="${fn:contains(sub, 'A00')}">진료부</c:when>
				<c:when test="${fn:contains(sub, 'B00')}">원무부</c:when>
				<c:when test="${fn:contains(sub, 'C00')}">총무과</c:when>
				<c:when test="${fn:contains(sub, 'D00')}">관리과</c:when>
				<c:when test="${fn:contains(sub, 'E00')}">QPS</c:when>
				<c:when test="${fn:contains(sub, 'F00')}">임상병리</c:when>
				<c:when test="${fn:contains(sub, 'G00')}">방사선</c:when>
				<c:when test="${fn:contains(sub, 'H00')}">약국</c:when>
				<c:when test="${fn:contains(sub, 'I00')}">사회사업실</c:when>
				<c:when test="${fn:contains(sub, 'J00')}">영양과</c:when>
				<c:when test="${fn:contains(sub, 'K00')}">물리치료실</c:when>
				<c:when test="${fn:contains(sub, 'L00')}">작업치료실</c:when>
				<c:when test="${fn:contains(sub, 'M00')}">외래</c:when>
				<c:when test="${fn:contains(sub, 'N00')}">가정간호</c:when>
				<c:when test="${fn:contains(sub, 'O00')}">인공신장</c:when>
				<c:when test="${fn:contains(sub, 'P00')}">감염관리</c:when>
				<c:when test="${fn:contains(sub, 'Q01')}">1병동</c:when>
				<c:when test="${fn:contains(sub, 'Q02')}">2병동</c:when>
				<c:when test="${fn:contains(sub, 'Q03')}">3병동</c:when>
				<c:when test="${fn:contains(sub, 'Q04')}">4병동</c:when>
				<c:when test="${fn:contains(sub, 'Q05')}">5병동</c:when>
				<c:when test="${fn:contains(sub, 'Q06')}">6병동</c:when>
				<c:when test="${fn:contains(sub, 'Q07')}">7병동</c:when>
				<c:when test="${fn:contains(sub, 'Q08')}">8병동</c:when>
				<c:when test="${fn:contains(sub, 'Q09')}">9병동</c:when>
				<c:when test="${fn:contains(sub, 'Q10')}">10병동</c:when>
				<c:when test="${fn:contains(sub, 'Q11')}">11병동</c:when>
				<c:when test="${fn:contains(sub, 'R00')}">경영전략연구소</c:when>
				<c:when test="${fn:contains(sub, 'S00')}">고객지원</c:when>
				<c:when test="${fn:contains(sub, 'T00')}">의료정보실</c:when>
				<c:when test="${fn:contains(sub, 'U00')}">장래문화원</c:when>
				<c:when test="${fn:contains(sub, 'V00')}">재활치료실</c:when>
				<c:when test="${fn:contains(sub, 'W00')}">홍보기획실</c:when>
			</c:choose>
		</td>
		<td>${t.id }</td><td>${t.name}</td><td><a href="${pageContext.request.contextPath}/t/Testform">평가하기</a></td><td>평가완료</td>
	</tr>
	    </c:if>
	    <c:set var="index" value="${index + 1}" />
</c:forEach>
</table>
</div>
</div>
<!-- 경혁팀 -->
<div style="display:<c:if test="${info.hspt_V == 'F' and info.hspt_sub != 'A00'}">none</c:if>;">
▶ 경혁팀 평가
<div>
<c:set var="index1" value="1" />
<table style="border:1px solid #000; border-collapse: collapse;">
	<tr>
		<td></td><td>부서명</td><td>사원번호</td><td>성명</td><td rowspan="1"></td>
	</tr>

<c:forEach items="${target}" var="t">
<c:set var="sub" value = "${t.hspt_sub }"/>
    <c:if test="${t.idx != info.idx && fn:contains(t.user_code, 'VT') && not fn:contains(t.user_code, 'A00')}">
	<tr>
		<td>${index1}</td>
		<td>
			<c:choose>
				<c:when test="${fn:contains(sub, 'A00')}">진료부</c:when>
				<c:when test="${fn:contains(sub, 'B00')}">원무부</c:when>
				<c:when test="${fn:contains(sub, 'C00')}">총무과</c:when>
				<c:when test="${fn:contains(sub, 'D00')}">관리과</c:when>
				<c:when test="${fn:contains(sub, 'E00')}">QPS</c:when>
				<c:when test="${fn:contains(sub, 'F00')}">임상병리</c:when>
				<c:when test="${fn:contains(sub, 'G00')}">방사선</c:when>
				<c:when test="${fn:contains(sub, 'H00')}">약국</c:when>
				<c:when test="${fn:contains(sub, 'I00')}">사회사업실</c:when>
				<c:when test="${fn:contains(sub, 'J00')}">영양과</c:when>
				<c:when test="${fn:contains(sub, 'K00')}">물리치료실</c:when>
				<c:when test="${fn:contains(sub, 'L00')}">작업치료실</c:when>
				<c:when test="${fn:contains(sub, 'M00')}">외래</c:when>
				<c:when test="${fn:contains(sub, 'N00')}">가정간호</c:when>
				<c:when test="${fn:contains(sub, 'O00')}">인공신장</c:when>
				<c:when test="${fn:contains(sub, 'P00')}">감염관리</c:when>
				<c:when test="${fn:contains(sub, 'Q01')}">1병동</c:when>
				<c:when test="${fn:contains(sub, 'Q02')}">2병동</c:when>
				<c:when test="${fn:contains(sub, 'Q03')}">3병동</c:when>
				<c:when test="${fn:contains(sub, 'Q04')}">4병동</c:when>
				<c:when test="${fn:contains(sub, 'Q05')}">5병동</c:when>
				<c:when test="${fn:contains(sub, 'Q06')}">6병동</c:when>
				<c:when test="${fn:contains(sub, 'Q07')}">7병동</c:when>
				<c:when test="${fn:contains(sub, 'Q08')}">8병동</c:when>
				<c:when test="${fn:contains(sub, 'Q09')}">9병동</c:when>
				<c:when test="${fn:contains(sub, 'Q10')}">10병동</c:when>
				<c:when test="${fn:contains(sub, 'Q11')}">11병동</c:when>
				<c:when test="${fn:contains(sub, 'R00')}">경영전략연구소</c:when>
				<c:when test="${fn:contains(sub, 'S00')}">고객지원</c:when>
				<c:when test="${fn:contains(sub, 'T00')}">의료정보실</c:when>
				<c:when test="${fn:contains(sub, 'U00')}">장래문화원</c:when>
				<c:when test="${fn:contains(sub, 'V00')}">재활치료실</c:when>
				<c:when test="${fn:contains(sub, 'W00')}">홍보기획실</c:when>
			</c:choose>
		</td>
		<td>${t.id }</td><td>${t.name}</td><td><a href="${pageContext.request.contextPath}/t/Testform">평가하기</a></td><td>평가완료</td>
	</tr>
	    <c:set var="index1" value="${index1 + 1}" />
	    </c:if>
</c:forEach>
</table>
</div>
</div>
<!-- 부서장 -->
<div style="display:<c:if test="${info.hspt_sub == 'A00' or info.hspt_B =='T'}">none</c:if>;">
▶ 부서장 평가
<div>
<table style="border:1px solid #000; border-collapse: collapse;">
	<tr>
		<td></td><td>부서명</td><td>사원번호</td><td>성명</td><td rowspan="1"></td>
	</tr>
	
<c:set var="index2" value="1" />
<c:forEach items="${target}" var="t">
<c:set var="sub" value = "${t.hspt_sub }"/>
<c:if test="${t.idx != info.idx and t.hspt_B == 'T'}">
<script>
</script>
    
	<tr>
		<td>${index2}</td>
		<td>
			<c:choose>
				<c:when test="${fn:contains(sub, 'A00')}">진료부</c:when>
				<c:when test="${fn:contains(sub, 'B00')}">원무부</c:when>
				<c:when test="${fn:contains(sub, 'C00')}">총무과</c:when>
				<c:when test="${fn:contains(sub, 'D00')}">관리과</c:when>
				<c:when test="${fn:contains(sub, 'E00')}">QPS</c:when>
				<c:when test="${fn:contains(sub, 'F00')}">임상병리</c:when>
				<c:when test="${fn:contains(sub, 'G00')}">방사선</c:when>
				<c:when test="${fn:contains(sub, 'H00')}">약국</c:when>
				<c:when test="${fn:contains(sub, 'I00')}">사회사업실</c:when>
				<c:when test="${fn:contains(sub, 'J00')}">영양과</c:when>
				<c:when test="${fn:contains(sub, 'K00')}">물리치료실</c:when>
				<c:when test="${fn:contains(sub, 'L00')}">작업치료실</c:when>
				<c:when test="${fn:contains(sub, 'M00')}">외래</c:when>
				<c:when test="${fn:contains(sub, 'N00')}">가정간호</c:when>
				<c:when test="${fn:contains(sub, 'O00')}">인공신장</c:when>
				<c:when test="${fn:contains(sub, 'P00')}">감염관리</c:when>
				<c:when test="${fn:contains(sub, 'Q01')}">1병동</c:when>
				<c:when test="${fn:contains(sub, 'Q02')}">2병동</c:when>
				<c:when test="${fn:contains(sub, 'Q03')}">3병동</c:when>
				<c:when test="${fn:contains(sub, 'Q04')}">4병동</c:when>
				<c:when test="${fn:contains(sub, 'Q05')}">5병동</c:when>
				<c:when test="${fn:contains(sub, 'Q06')}">6병동</c:when>
				<c:when test="${fn:contains(sub, 'Q07')}">7병동</c:when>
				<c:when test="${fn:contains(sub, 'Q08')}">8병동</c:when>
				<c:when test="${fn:contains(sub, 'Q09')}">9병동</c:when>
				<c:when test="${fn:contains(sub, 'Q10')}">10병동</c:when>
				<c:when test="${fn:contains(sub, 'Q11')}">11병동</c:when>
				<c:when test="${fn:contains(sub, 'R00')}">경영전략연구소</c:when>
				<c:when test="${fn:contains(sub, 'S00')}">고객지원</c:when>
				<c:when test="${fn:contains(sub, 'T00')}">의료정보실</c:when>
				<c:when test="${fn:contains(sub, 'U00')}">장래문화원</c:when>
				<c:when test="${fn:contains(sub, 'V00')}">재활치료실</c:when>
				<c:when test="${fn:contains(sub, 'W00')}">홍보기획실</c:when>
			</c:choose>
		</td>
		<td>${t.id }</td><td>${t.name}</td><td><a href="${pageContext.request.contextPath}/t/Testform">평가하기</a></td><td>평가완료</td>
	</tr>

	    <c:set var="index2" value="${index2 + 1}" />
	    </c:if>
</c:forEach>
</table>
</div>
</div>
<!-- 부서원 -->
<div style="display:<c:if test="${info.hspt_sub == 'A00'}">none</c:if>;">
▶ 부서원 평가
<div>
<table style="border:1px solid #000; border-collapse: collapse;">
	<tr>
		<td></td><td>부서명</td><td>사원번호</td><td>성명</td><td rowspan="1"></td>
	</tr>
	
<c:set var="index3" value="1" />
<c:forEach items="${target}" var="t">
<c:set var="sub" value = "${t.hspt_sub }"/>
<c:if test="${t.idx != info.idx and t.hspt_B == 'F' and t.hspt_V == 'F' and t.hspt_sub != 'A00'}">
<script>
</script>
    
	<tr>
		<td>${index3}</td>
		<td>
			<c:choose>
				<c:when test="${fn:contains(sub, 'A00')}">진료부</c:when>
				<c:when test="${fn:contains(sub, 'B00')}">원무부</c:when>
				<c:when test="${fn:contains(sub, 'C00')}">총무과</c:when>
				<c:when test="${fn:contains(sub, 'D00')}">관리과</c:when>
				<c:when test="${fn:contains(sub, 'E00')}">QPS</c:when>
				<c:when test="${fn:contains(sub, 'F00')}">임상병리</c:when>
				<c:when test="${fn:contains(sub, 'G00')}">방사선</c:when>
				<c:when test="${fn:contains(sub, 'H00')}">약국</c:when>
				<c:when test="${fn:contains(sub, 'I00')}">사회사업실</c:when>
				<c:when test="${fn:contains(sub, 'J00')}">영양과</c:when>
				<c:when test="${fn:contains(sub, 'K00')}">물리치료실</c:when>
				<c:when test="${fn:contains(sub, 'L00')}">작업치료실</c:when>
				<c:when test="${fn:contains(sub, 'M00')}">외래</c:when>
				<c:when test="${fn:contains(sub, 'N00')}">가정간호</c:when>
				<c:when test="${fn:contains(sub, 'O00')}">인공신장</c:when>
				<c:when test="${fn:contains(sub, 'P00')}">감염관리</c:when>
				<c:when test="${fn:contains(sub, 'Q01')}">1병동</c:when>
				<c:when test="${fn:contains(sub, 'Q02')}">2병동</c:when>
				<c:when test="${fn:contains(sub, 'Q03')}">3병동</c:when>
				<c:when test="${fn:contains(sub, 'Q04')}">4병동</c:when>
				<c:when test="${fn:contains(sub, 'Q05')}">5병동</c:when>
				<c:when test="${fn:contains(sub, 'Q06')}">6병동</c:when>
				<c:when test="${fn:contains(sub, 'Q07')}">7병동</c:when>
				<c:when test="${fn:contains(sub, 'Q08')}">8병동</c:when>
				<c:when test="${fn:contains(sub, 'Q09')}">9병동</c:when>
				<c:when test="${fn:contains(sub, 'Q10')}">10병동</c:when>
				<c:when test="${fn:contains(sub, 'Q11')}">11병동</c:when>
				<c:when test="${fn:contains(sub, 'R00')}">경영전략연구소</c:when>
				<c:when test="${fn:contains(sub, 'S00')}">고객지원</c:when>
				<c:when test="${fn:contains(sub, 'T00')}">의료정보실</c:when>
				<c:when test="${fn:contains(sub, 'U00')}">장래문화원</c:when>
				<c:when test="${fn:contains(sub, 'V00')}">재활치료실</c:when>
				<c:when test="${fn:contains(sub, 'W00')}">홍보기획실</c:when>
			</c:choose>
		</td>
		<td>${t.id }</td><td>${t.name}</td><td><a href="${pageContext.request.contextPath}/t/Testform">평가하기</a></td><td>평가완료</td>
	</tr>

	    <c:set var="index3" value="${index3 + 1}" />
	    </c:if>
</c:forEach>
</table>
</div>
</div>

</c:otherwise>
</c:choose>


<div style="border-bottom: 3px solid #000; margin: 10px 0 10px 0;"></div>
<div>
코어솔루션 로고가 들어갈 영역
</div>
</body>
</html>