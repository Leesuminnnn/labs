<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/testinfocss.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/coopinfocss.css">

<style>

</style>
</head>
<body>
<div class="main">
<form action="${pageContext.request.contextPath}/d/Form" method="post">
<div class="logo">
<c:if test="${ sessionScope.loginmember eq '12365478' or sessionScope.loginmember eq '1' or empty sessionScope.loginmember }">
	<div style="position:absolute; width: 30px; height: 30px; display: flex; justify-content: center; align-items: center; border: 1px solid; border-radius: 30px; cursor: pointer;"
		onclick="location.href='${pageContext.request.contextPath}/d/admin'">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="30" height="30" fill="currentColor">
		    <path d="M21 11H7.414l4.293-4.293-1.414-1.414L3.586 12l6.707 6.707 1.414-1.414L7.414 13H21v-2z"/>
		</svg>
	</div>
</c:if>

<%-- <c:choose>
	<c:when test="${info.hspt_name eq '효사랑전주요양병원'}">
		<img src="${pageContext.request.contextPath}/resources/img/1hspt.png">
	</c:when>
	<c:when test="${info.hspt_name eq '효사랑가족요양병원'}">
		<img src="${pageContext.request.contextPath}/resources/img/2hspt.png">
	</c:when>
	<c:when test="${info.hspt_name eq '가족사랑요양병원'}">
		<img src="${pageContext.request.contextPath}/resources/img/3hspt.png">
	</c:when>
</c:choose> --%>
${info.c_name }
<a style="position: absolute; right: 0;" href="${pageContext.request.contextPath}/d/Logout">로그아웃</a>
</div>
<div>
▣ 사원정보( ※ 개인정보를 확인해주세요 )
</div>
<div class="info">
	<table class="infotb">
		<tr>
			<td>기관명</td>
			<td>소속기관</td>
			<td>부서명</td>
			<td>사원번호</td>
			<td>직급 / 직책</td>
			<td>사원명</td>
			<td>입사일자</td>
			
		</tr>
		<tr>
			<td>
				${info.c_name }
			</td>
			<td>
				${info.c_name2 }
			</td>
			<td>
				${info.c_subname }
			</td>
			<td>
				${info.id}
			</td>
			<td>
				${info.c_position }
			</td>
			<td>
				${info.name }
			</td>
			<td>
				<fmt:formatDate var="date" value="${info.reg_date }" pattern="yyyy. MM. dd" />${date}
			</td>
		</tr>
	</table>
</div>

<div style="border-bottom: 3px solid #000; margin: 10px 0 10px 0;"></div>
<div class="target-text"><span>▣ 평가대상자( ※ 평가대상자를 확인 후 평가를 진행해주세요)</span></div>
<script>
</script>

<!-- 운영진 -->
<div style="display:<c:if test="${info.c_M eq 'F' }">none</c:if>;">
▶ 운영진 평가
<div class="targetC_area">
<table class="targettb_C">
	<tr>
		<td class="td1"></td><td class="td8">기관명</td><td class="td2">부서명</td><td class="td3">사원번호</td><td class="td6">직급</td><td class="td4">성명</td><td class="td5">평가진행</td><td class="td7">평가진행률</td>
	</tr>
	
	<c:set var="index1" value="1" />
	<c:forEach items="${target }" var="t">
		<c:if test="${t.idx ne info.idx}">
			<c:if test="${t.c_M eq 'T'}">
				<tr>
					<td>${index1 }</td>
					<td>${t.c_name }</td>
					<td>${t.c_subname }</td>
					<td>${t.id }</td>
					<td>${t.c_position }</td>
					<td>${t.name }</td>
					<td class="form_go" onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'E'}">${e.d3 }</c:if></c:forEach>" 
					data-ev="E" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
					평가하기
					</td>
					<td>
						<c:forEach items="${endlist}" var="e">
							<!-- 평가받은사람과 리스트사람이 같고, 평가자와 로그인한사람이 같으면  -->
								<c:choose>
									<c:when test="${t.idx eq e.d2 and e.team eq 'E'}">
										${e.d3 }
									</c:when>
								</c:choose>
						</c:forEach>	
					</td>
				</tr>
				<c:set var="index1" value="${index1 + 1}" />	
			</c:if>
		</c:if>
		
	</c:forEach>
</table>
</div>

</div>


<!-- 부서장 -->
<div style="display:<c:if test="${info.grade < 5 or info.id eq '621003'}">none</c:if>;">
▶ 부서장 평가
<div class="targetC_area">
<table class="targettb_C">
	<tr>
		<td class="td1"></td><td class="td8">기관명</td><td class="td2">부서명</td><td class="td3">사원번호</td><td class="td6">직급</td><td class="td4">성명</td><td class="td5">평가진행</td><td class="td7">평가진행률</td>
	</tr>
	<c:set var="index2" value="1" />
	<c:forEach items="${target }" var="t">
		<c:if test="${t.idx ne info.idx}">
			<c:if test="${t.grade == 1 or t.grade == 2 or t.grade == 3  }">
				<tr>
					<td>${index2 }</td>
					<td>${t.c_name }</td>
					<td>${t.c_subname }</td>
					<td>${t.id }</td>
					<td>${t.c_position }</td>
					<td>${t.name }</td>
					<td class="form_go" onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'C'}">${e.d3 }</c:if></c:forEach>" 
					data-ev="C" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
					평가하기
					</td>
					<td>
						<c:forEach items="${endlist}" var="e">
							<c:choose>
								<c:when test="${t.idx eq e.d2 and e.team eq 'C'}">
									${e.d3 }
								</c:when>
							</c:choose>
						</c:forEach>
					</td>
				</tr>			
		<c:set var="index2" value="${index2 + 1}" />
			</c:if>
		</c:if>
	</c:forEach>
</table>
</div>

</div>
<!-- 부서원 -->
<div style="">
<div style="border-bottom: 2px dotted #000; margin: 10px 0 10px 0;"></div>
▶ 부서원 평가
<div class="targetD_area">
<table class="targettb_D" style="border:1px solid #000; border-collapse: collapse;">
	<tr>
		<td class="td1"></td><td class="td8">기관명</td><td class="td2">부서명</td><td class="td3">사원번호</td><td class="td6">직급</td><td class="td4">성명</td><td class="td5">평가진행</td><td class="td7">평가진행률</td>
	</tr>
	<c:set var="index3" value="1" />
	<c:forEach items="${target }" var="t">
		<c:if test="${t.idx ne info.idx}">
			<c:choose>
				<c:when test="${info.grade eq 1 }">
				<!-- 대표이사의 경우 -->
					<tr>
						<td>${index3 }</td>
						<td>${t.c_name }</td>
						<td>${t.c_subname }</td>
						<td>${t.id }</td>
						<td>${t.c_position }</td>
						<td>${t.name }</td>
						<td class="form_go"  onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'D'}">${e.d3 }</c:if></c:forEach>" 
						data-ev="D" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
						평가하기
						</td>
						<td>
							<c:forEach items="${endlist}" var="e">
								<c:choose>
									<c:when test="${t.idx eq e.d2 and e.team eq 'D'}">
										${e.d3 }
									</c:when>
								</c:choose>
							</c:forEach>
						</td>
					</tr>	
			<c:set var="index3" value="${index3 + 1}" />
				</c:when>
				<c:when test="${info.id eq 722000}">
				<!-- 대표이사의 경우 -->
					<tr>
						<td>${index3 }</td>
						<td>${t.c_name }</td>
						<td>${t.c_subname }</td>
						<td>${t.id }</td>
						<td>${t.c_position }</td>
						<td>${t.name }</td>
						<td class="form_go"  onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'D'}">${e.d3 }</c:if></c:forEach>" 
						data-ev="D" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
						평가하기
						</td>
						<td>
							<c:forEach items="${endlist}" var="e">
								<c:choose>
									<c:when test="${t.idx eq e.d2 and e.team eq 'D'}">
										${e.d3 }
									</c:when>
								</c:choose>
							</c:forEach>
						</td>
					</tr>	
			<c:set var="index3" value="${index3 + 1}" />
				</c:when>
				<c:otherwise>
					<c:if test="${t.grade eq 5 or t.grade eq 6}">
						<c:if test="${t.c_M ne 'T' }">
							<tr>
								<td>${index3 }</td>
								<td>${t.c_name }</td>
								<td>${t.c_subname }</td>
								<td>${t.id }</td>
								<td>${t.c_position }</td>
								<td>${t.name }</td>
								<td class="form_go"  onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'D'}">${e.d3 }</c:if></c:forEach>" 
								data-ev="D" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
								평가하기
								</td>
								<td>
									<c:forEach items="${endlist}" var="e">
										<c:choose>
											<c:when test="${t.idx eq e.d2 and e.team eq 'D'}">
												${e.d3 }
											</c:when>
										</c:choose>
									</c:forEach>
								</td>
							</tr>		
							<c:set var="index3" value="${index3 + 1}" />
						</c:if>	
					</c:if>
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:forEach> 
</table> 
</div>
</div>


<div style="border-bottom: 3px solid #000; margin: 10px 0 10px 0;"></div>
<div style="text-align: center;">
<img style="height: 35px;" src="${pageContext.request.contextPath}/resources/img/core_logo.png">
</div>
</form>
</div>
</body>

<script>
var id = "${sessionScope.loginmember}";
var info = "${info.id}";
var date = ${specificDate};
console.log("세션아이디 ${sessionScope.loginmember}");
console.log("model아이디 ${info.id}");
console.log("특정 날짜를 넘겼는지 확인 "+ date);
// 뒤로가기 버튼을 비활성화하는 함수
function disableBackButton() {
	window.history.pushState(null, '', window.location.href);
	window.onpopstate = function () {
		window.history.pushState(null, '', window.location.href);
	};
}

function formgo(element) {
	var infoidx = ${info.idx};
	var targetidx = element.getAttribute("data-t-idx");
	var ev = element.getAttribute("data-ev");
	var eidx = element.getAttribute("data-e-idx");
	var link = "${pageContext.request.contextPath}/d/Form/${info.idx}/"+targetidx+"/"+ev
	var d3 = element.getAttribute("data-d3");
	
	if(d3 === '평가완료'){
		alert("이미 평가가 완료된 대상입니다.");
		window.location.reload();
	}else{
		//링크 이동
//		location.href=link;
		window.location.replace(link);
		// 뒤로가기 버튼 비활성화
		disableBackButton();
	}
	/* 
	if(date == 1){
		console.log("아직안넘음");
		alert("12월 6일 오픈 예정입니다. \n직원평가기간은 12월6일(수)~12월8일(금) 입니다.");
		window.location.reload();
	}else {
		console.log("넘음");
		if(d3 === '평가완료'){
			alert("이미 평가가 완료된 대상입니다.");
		}else{
			//링크 이동
//			location.href=link;
			window.location.replace(link);
			// 뒤로가기 버튼 비활성화
			disableBackButton();
		}
	}  */
}

</script>
</html>