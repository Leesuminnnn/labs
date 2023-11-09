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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/testinfocss.css">

<style>

</style>
</head>
<body>
<div class="main">
<form action="${pageContext.request.contextPath}/e/Form" method="post">
<div class="logo">
<c:choose>
	<c:when test="${info.hspt_name eq '효사랑전주요양병원'}">
		<img src="${pageContext.request.contextPath}/resources/img/1hspt.png">
	</c:when>
	<c:when test="${info.hspt_name == '효사랑가족요양병원'}">
		<img src="${pageContext.request.contextPath}/resources/img/2hspt.png">
	</c:when>
	<c:when test="${info.hspt_name == '가족사랑요양병원'}">
		<img src="${pageContext.request.contextPath}/resources/img/3hspt.png">
	</c:when>
</c:choose>

</div>
<div>
▣ 사원정보( ※ 개인정보를 확인해주세요 )
</div>
<div class="info">
	<table class="infotb">
		<tr>
			<td>기관명</td>
			<td>부서명</td>
			<td>사원번호</td>
			<td>직급 / 직책</td>
			<td>사원명</td>
			<td>입사일자</td>
			
		</tr>
		<tr>
			<td>
				${info.hspt_name}
			</td>
			<!-- 1,2,3병원별 설정 필요 -->
			<td>
				${info.hspt_subname }
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
		</tr>
	</table>
</div>

<div style="border-bottom: 3px solid #000; margin: 10px 0 10px 0;"></div>
<div class="target-text"><span>▣ 평가대상자( ※ 평가대상자를 확인 후 평가를 진행해주세요)</span></div>
<script>
</script>




<div style="display:<c:if test="${(info.hspt_subcode == 'A00' && info.hspt_Z == 'F' && info.hspt_V == 'F') || (info.hspt_V == 'F' && info.hspt_B == 'T') || (info.hspt_V == 'F' && info.hspt_B == 'F' && info.hspt_Z == 'F')}">none</c:if>;">
<!-- 진료부만 해당될 경우 진료팀장이 아닐경우, 경혁팀일 경우


 -->
▶ 진료부 평가
<div class="targetA_area">
<table class="targettb_A"style="">
	<tr>
		<td class="td1"></td><td class="td2">부서명</td><td class="td3">사원번호</td><td class="td6">직급</td><td class="td4">성명</td><td class="td5">평가진행</td><td class="td7">평가진행률</td>
	</tr>
<c:set var="index" value="1" />
<c:forEach items="${target}" var="t">
	<c:set var="sub" value = "${t.hspt_subcode }"/>
	<!-- 평가자와 평가대상자의 idx가 다른 -->
	<!-- 평가자idx와 평가완료테이블의 d1이 같은것만 d1이 0인것  -->
	<!-- 평가자 idx와 d1이 다르고 평가완료된것 -->
    <c:if test="${t.idx != info.idx}">
	    <c:if test="${info.idx == t.d1 || t.d1 == 0 || (info.idx != d1 && fn:contains(t.d3, '평가완료'))}">
		    <c:if test="${sub == 'A00' || sub == 'A01'}">
			    <tr>
					<td>${index}</td>
					<td>
						${t.hspt_subname }
					</td>
					<td>${t.id }</td>
					<td>
						${t.hspt_position }
					</td>
					<td>${t.name}</td>
					<td class="form_go" onclick="formgo(this)" data-ev="A" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 == t.idx}">${e.d2}</c:if>">
					
					
					평가하기
					</td>
					<td>
							<!-- 평가받은사람과 리스트사람이 같고, 평가자와 로그인한사람이 같으면  -->
						<c:choose>
							<c:when test="${t.d2 == t.idx && t.d1 == info.idx }">
								평가완료
							</c:when>
							<c:otherwise>
								미평가
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			   <c:set var="index" value="${index + 1}" />
			</c:if>
		</c:if>
	</c:if>
</c:forEach>
</table>
</div>


<%-- <c:choose>
	<c:when test="${e.d2 == t.idx }">
		<script>
			function formgo(element){
				alert("이미 평가가 완료된 대상입니다.");
			}
		</script>
	</c:when>
	<c:otherwise>
		<script>
					function formgo(element){
						var e = ${e.d2}
						var t = ${t.idx}
						var link = "${pageContext.request.contextPath}/t/Testform/${info.idx}/${t.idx}/A"
					
						//링크 이동
						location.href=link;
//						location.replace(link);
					}
				</script>
	</c:otherwise>
</c:choose> --%>
<div style="border-bottom: 2px dotted #000; margin: 10px 0 10px 0;"></div>
</div>
<!-- 경혁팀 -->
<div style="display:
<c:if test="${info.hspt_V == 'F' || info.hspt_subcode != 'A00' || info.hspt_subcode != 'A01' || info.hspt_S != 'T' || info.hspt_subcode != 'F00' || info.hspt_subcode != 'E00' || info.hspt_subcode != 'G00' || info.hspt_subcode != 'I00' || info.hspt_subcode != 'X00' || info.hspt_subcode != 'Y00' || info.hspt_subcode != 'Z00'}">none</c:if>;">
▶ 경혁팀 평가
<div class="targetB_area">
<c:set var="index1" value="1" />
<table class="targettb_B">
	<tr>
		<td class="td1"></td><td class="td2">부서명</td><td class="td3">사원번호</td><td class="td6">직급</td><td class="td4">성명</td><td class="td5">평가진행</td><td class="td7">평가진행률</td>
	</tr>

<c:forEach items="${target}" var="t">
<c:set var="sub" value = "${t.hspt_subcode }"/>
    <c:if test="${t.idx != info.idx && fn:contains(t.user_code, 'VT') && not fn:contains(t.user_code, 'A00') && (info.idx == t.d1 || t.d1 == 0)}">
	<tr>
		<td>${index1}</td>
		<td>
			${t.hspt_subname }
		</td>
		<td>${t.id }</td>
		<td>
			${t.hspt_position }
		</td>
		<td>${t.name}</td>
		<td class="form_go" onclick="formgo(this)" data-ev="B" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 == t.idx}">${e.d2}</c:if>">
		평가하기
		</td>
		<td>
			<c:choose>
				<c:when test="${t.d2 == t.idx }">
					평가완료
				</c:when>
				<c:otherwise>
					미평가
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	    <c:set var="index1" value="${index1 + 1}" />
	    </c:if>
</c:forEach>
</table>
</div>
<div style="border-bottom: 2px dotted #000; margin: 10px 0 10px 0;display:
<c:if test="${info.hspt_subcode == 'A00' || info.hspt_subcode == 'A01' || info.hspt_B =='T' || info.hspt_X =='T'}">none</c:if>;"></div>
</div>
<!-- 부서장 -->
<div style="display:<c:if test="${info.hspt_subcode == 'A00' || info.hspt_subcode == 'A01' || info.hspt_B =='T' || info.hspt_X =='T'}">none</c:if>;">
▶ 부서장 평가
<div class="targetC_area">
<table class="targettb_C">
	<tr>
		<td class="td1"></td><td class="td2">부서명</td><td class="td3">사원번호</td><td class="td6">직급</td><td class="td4">성명</td><td class="td5">평가진행</td><td class="td7">평가진행률</td>
	</tr>
	
<c:set var="index2" value="1" />
<c:forEach items="${target}" var="t">
<c:set var="sub" value = "${t.hspt_subcode }"/>
<c:choose>
	<c:when test="${info.hspt_V == 'T' }">
	<c:if test="${t.idx != info.idx && t.hspt_B == 'T' && t.hspt_subcode != 'A00' && info.hspt_subcode == sub && (info.idx == t.d1 || t.d1 == 0)}">
	<tr>
		<td>${index2}</td>
		<td>
			${t.hspt_subname }
		</td>
		<td>${t.id }</td>
		<td>
			${t.hspt_position }
		</td>
		<td>${t.name}</td>
		<td class="form_go" onclick="formgo(this)" data-ev="C" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 == t.idx}">${e.d2}</c:if>">
		평가하기
		</td>
		<td>
			<c:choose>
				<c:when test="${t.d2 == t.idx }">
					평가완료
				</c:when>
				<c:otherwise>
					미평가
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	  <c:set var="index2" value="${index2 + 1}" />
	</c:if>
	</c:when>
	<c:when test="${info.hspt_V == 'F' }">
		<c:if test="${t.hspt_B == 'T'}">
		<tr>
		<td>${index2}</td>
		<td>
			${t.hspt_subname }
		</td>
		<td>${t.id }</td>
		<td>
			${t.hspt_position }
		</td>
		<td>${t.name}</td>
		<td class="form_go"  onclick="formgo(this)" data-ev="C" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 == t.idx}">${e.d2}</c:if>">
		평가하기
		</td>
		<td>
			<c:choose>
				<c:when test="${t.d2 == t.idx }">
					평가완료
				</c:when>
				<c:otherwise>
					미평가
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	  <c:set var="index2" value="${index2 + 1}" />
		</c:if>
	</c:when>
</c:choose>





</c:forEach>
</table>
</div>
<div style="border-bottom: 2px dotted #000; margin: 10px 0 10px 0; display:<c:if test="${info.hspt_subcode == 'A00' || (info.hspt_X == 'T' && info.hspt_K == 'F')}">none</c:if>;"></div>
</div>
<!-- 부서원 -->
<div style="display:<c:if test="${info.hspt_subcode == 'A00'|| info.hspt_subcode == 'A01' || (info.hspt_X == 'T' && info.hspt_K == 'F')}">none</c:if>;">
▶ 부서원 평가
<div class="targetD_area">
<table class="targettb_D" style="border:1px solid #000; border-collapse: collapse;">
	<tr>
		<td class="td1"></td><td class="td2">부서명</td><td class="td3">사원번호</td><td class="td6">직급</td><td class="td4">성명</td><td class="td5">평가진행</td><td class="td7">평가진행률</td>
	</tr>
	
<c:set var="index3" value="1" />
<c:forEach items="${target}" var="t">
<c:set var="sub" value = "${t.hspt_subcode }"/>
<c:choose>
	<c:when test="${info.hspt_V == 'T' && t.hspt_V =='F'}">
	<!-- 경혁팀 / 부서원 -->
	<%--
	${t.hspt_subcode != 'A00' && t.hspt_subcode != 'A01' && info.id != t.id && info.idx != t.d1 && (t.hspt_B == 'F' || t.hspt_X == 'T') && (info.idx == t.d1 || t.d1 == 0) || t.hspt_S = 'T'}
	 --%>
	<c:if test="${t.hspt_subcode != 'A00' && t.hspt_subcode != 'A01' && info.id != t.id && (info.idx == t.d1 || t.d1 == 0) || t.hspt_S == 'T'}">
	<tr>
		<td>${index3}</td>
		<td>
			${t.hspt_subname }
		</td>
		<td>${t.id }</td>
		<td>
			${t.hspt_position }
		</td>
		<td>${t.name}</td>
		<td class="form_go"  onclick="formgo(this)" data-ev="D" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 == t.idx}">${e.d2}</c:if>">
		평가하기
		</td>
		<td>
			<c:choose>
				<c:when test="${t.d2 == t.idx }">
					평가완료
				</c:when>
				<c:otherwise>
					미평가
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	 <c:set var="index3" value="${index3 + 1}" />
	</c:if>
	</c:when>
	<c:when test="${info.hspt_V == 'F' &&info.hspt_V == 'F'}">
	<!-- 부서원 -->
	
	
	<c:if test="${info.hspt_subcode == t.hspt_subcode && info.id != t.id && info.idx != t.d1 && t.hspt_B == 'F' }">
	<tr>
		<td>${index3}</td>
		<td>
			${t.hspt_subname }
		</td>
		<td>${t.id }</td>
		<td>
			${t.hspt_position }
		</td>
		<td>${t.name}</td>
		<td class="form_go" onclick="formgo(this)" data-ev="D" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 == t.idx}">${e.d2}</c:if>">
		평가하기
		</td>
		<td>
			<c:choose>
				<c:when test="${t.d2 == t.idx }">
					평가완료
				</c:when>
				<c:otherwise>
					미평가
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	 <c:set var="index3" value="${index3 + 1}" />
	</c:if>
	</c:when>
	
</c:choose>

    	

</c:forEach>
</table>
</div>
</div>


<div style="border-bottom: 3px solid #000; margin: 10px 0 10px 0;"></div>
<div style="text-align: right;">
<img style="height: 35px;" src="${pageContext.request.contextPath}/resources/img/core_logo.png">
</div>
</form>
</div>
</body>

<script>
// 평가 진행 완료 시 이동 막기
function formgo(element) {
	var infoidx = ${info.idx};
	var targetidx = element.getAttribute("data-t-idx");
	var ev = element.getAttribute("data-ev");
	var eidx = element.getAttribute("data-e-idx");
	var link = "${pageContext.request.contextPath}/e/Form/${info.idx}/"+targetidx+"/"+ev
	
	console.log(infoidx);
	console.log(targetidx);
	console.log("${endlist}");
	
	if(targetidx == eidx){
		alert("이미 평가가 완료된 대상입니다.");
	}else{
		//링크 이동
		location.href=link;
//		location.replace(link); 
	}
	
}
</script>
</html>