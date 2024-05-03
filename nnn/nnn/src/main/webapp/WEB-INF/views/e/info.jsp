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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/alertcss.css">

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
	<c:when test="${info.hspt_name eq '효사랑가족요양병원'}">
		<img src="${pageContext.request.contextPath}/resources/img/2hspt.png">
	</c:when>
	<c:when test="${info.hspt_name eq '가족사랑요양병원'}">
		<img src="${pageContext.request.contextPath}/resources/img/3hspt.png">
	</c:when>
</c:choose>
<a style="position: absolute; right: 0;" href="${pageContext.request.contextPath}/e/Logout">로그아웃</a>
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
					<c:when test="${info.hspt_K eq 'T'}"> / 경혁팀장</c:when>
					<c:when test="${info.hspt_V eq 'T' and info.hspt_K eq 'F'}"> / 경혁팀</c:when>
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




<div style="display:<c:if test="${(info.hspt_subcode eq 'A00' and info.hspt_Z eq 'F' and info.hspt_V eq 'F') or (info.hspt_V eq 'F' and info.hspt_B eq 'T') or (info.hspt_V eq 'F' and info.hspt_B eq 'F' and info.hspt_Z eq 'F')}">none</c:if>;">
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
    <c:if test="${t.idx ne info.idx}">
	    
		    <c:if test="${sub eq 'A00' or sub eq 'A01'}">
		    <c:choose>
		    	<c:when test="${info.hspt_Z eq 'T'}">
		    	<!--  진료팀장이 진료부 평가는 AB유형 -->
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
					<td class="form_go" onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'D'}">${e.d3 }</c:if></c:forEach>" 
					data-ev="D" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
					평가하기
					</td>
					<td>
					<c:forEach items="${endlist}" var="e">
						<!-- 평가받은사람과 리스트사람이 같고, 평가자와 로그인한사람이 같으면  -->
							<c:choose>
								<c:when test="${t.idx eq e.d2 and e.team eq 'D'}">
									${e.d3 }
								</c:when>
							</c:choose>
					</c:forEach>
						
					</td>
				</tr>
		    	</c:when>
		    	<c:when test="${info.hspt_Z eq 'F'}">
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
					<td class="form_go" onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'A'}">${e.d3 }</c:if></c:forEach>" data-ev="A" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
					평가하기
					</td>
					<td>
<c:forEach items="${endlist}" var="e">
						
							<c:choose>
								<c:when test="${t.idx eq e.d2 and e.team eq 'A'}">
									${e.d3 }
								</c:when>
							</c:choose>
						</c:forEach>
					</td>
				</tr>
		    	</c:when>
		    </c:choose>
			    
			   <c:set var="index" value="${index + 1}" />
			
		</c:if>
	</c:if>
</c:forEach>
</table>
</div>


<%-- <c:choose>
	<c:when test="${e.d2 eq t.idx }">
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

</div>
<!-- 경혁팀 -->
<div 
<c:choose>
<c:when test="${info.hspt_J eq 'F'}"> style="display: none;"</c:when>
</c:choose>
>
<div style="border-bottom: 2px dotted #000; margin: 10px 0 10px 0;"></div>
▶ 경혁팀 평가
<div class="targetB_area">
<c:set var="index1" value="1" />
<table class="targettb_B">
	<tr>
		<td class="td1"></td><td class="td2">부서명</td><td class="td3">사원번호</td><td class="td6">직급</td><td class="td4">성명</td><td class="td5">평가진행</td><td class="td7">평가진행률</td>
	</tr>

<c:forEach items="${target}" var="t">
<c:if test="${t.idx ne info.idx}">
<c:set var="sub" value = "${t.hspt_subcode }"/>
    <c:if test="${fn:contains(t.user_code, 'VT') and not fn:contains(t.user_code, 'A00')}">
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
		<td class="form_go" onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'B'}">${e.d3 }</c:if></c:forEach>" data-ev="B" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
		평가하기
		</td>
		<td>
			<c:forEach items="${endlist}" var="e">
				<c:choose>
					<c:when test="${t.idx eq e.d2 and e.team eq 'B'}">
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
<div style="display:<c:if test="${info.hspt_subcode eq 'A00' or info.hspt_subcode eq 'A01' or (info.hspt_B eq 'T' and info.hspt_S eq 'F') or (info.hspt_B eq 'T' and info.hspt_S eq 'T') or (info.hspt_V eq 'T' and info.hspt_X eq 'T')}">none</c:if>;">
<div style="border-bottom: 2px dotted #000; margin: 10px 0 10px 0;"></div>
▶ 부서장 평가
<div class="targetC_area">
<table class="targettb_C">
	<tr>
		<td class="td1"></td><td class="td2">부서명</td><td class="td3">사원번호</td><td class="td6">직급</td><td class="td4">성명</td><td class="td5">평가진행</td><td class="td7">평가진행률</td>
	</tr>
	
<c:set var="index2" value="1" />
<c:forEach items="${target}" var="t">
<c:if test="${t.idx ne info.idx}">
<c:set var="sub" value = "${t.hspt_subcode }"/>
<c:choose>
	<c:when test="${info.hspt_name eq '효사랑가족요양병원' and info.hspt_subcode eq 'J01'}">			<!-- 2병원 영양과 부서원의 경우 -->
	<c:if test="${t.hspt_B eq 'T' }">
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
	</c:when>
	
	<c:when test="${info.hspt_name eq '효사랑전주요양병원' and info.hspt_subcode eq 'C01'}">			<!-- 1병원 관리과의 경우 -->
	<c:if test="${t.hspt_B eq 'T' }">
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
		<td class="form_go" onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'C'}">${e.d3 }</c:if></c:forEach>" data-ev="C" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
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
	</c:when>
	
	<c:when test="${info.hspt_V eq 'T' and info.hspt_B eq 'F' and info.hspt_X eq 'F'}">				<!-- 경혁팀 / 부서원 -->
	<c:if test="${t.hspt_B eq 'T' and t.hspt_subcode ne 'A00' and info.hspt_subcode eq sub}">
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
		<td class="form_go" onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'C'}">${e.d3 }</c:if></c:forEach>" data-ev="C" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
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
	</c:when>
	
	<c:when test="${info.hspt_V eq 'F' and info.hspt_B eq 'F' and info.hspt_X eq 'F'}">				<!-- 부서원 -->
	<c:if test="${t.hspt_B eq 'T' and t.hspt_subcode ne 'A00' and info.hspt_subcode eq sub}">
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
		<td class="form_go" onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'C'}">${e.d3 }</c:if></c:forEach>" data-ev="C" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
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
	</c:when>
	
	<c:when test="${info.hspt_V eq 'F' and info.hspt_B eq 'F' and info.hspt_X eq 'T'}">				<!-- 1인부서 / 경혁팀 X -->
	
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
		<td class="form_go" onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'C'}">${e.d3 }</c:if></c:forEach>" data-ev="C" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
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
	
	</c:when>
	
</c:choose>




</c:if>
</c:forEach>
</table>
</div>

</div>
<!-- 부서원 -->
<div style="display:<c:if test="${info.hspt_subcode eq 'A00'or info.hspt_subcode eq 'A01' or (info.hspt_X eq 'T' and info.hspt_K eq 'F') or (info.hspt_S eq 'F' and info.hspt_V eq 'F' and info.hspt_X eq 'T')}">none</c:if>;">
<div style="border-bottom: 2px dotted #000; margin: 10px 0 10px 0;"></div>
▶ 부서원 평가
<div class="targetD_area">
<table class="targettb_D" style="border:1px solid #000; border-collapse: collapse;">
	<tr>
		<td class="td1"></td><td class="td2">부서명</td><td class="td3">사원번호</td><td class="td6">직급</td><td class="td4">성명</td><td class="td5">평가진행</td><td class="td7">평가진행률</td>
	</tr>
	
<c:set var="index3" value="1" />
<c:forEach items="${target}" var="t">
<c:set var="sub" value = "${t.hspt_subcode }"/>
<c:if test="${t.idx ne info.idx }">	
<c:if test="${sub ne 'A00' and sub ne 'A01'}"><!-- 진료부 명단 s -->
<c:choose>
<c:when test="${info.hspt_B eq 'T' and info.hspt_V eq 'T' and info.hspt_K eq 'T' }">	<!-- 경혁팀장 / 부서장 -->
	<%-- 경혁팀장 --%>
	<c:if test="${(t.hspt_V eq 'T' and t.hspt_subcode eq info.hspt_subcode) or (t.hspt_V eq 'F' and t.hspt_B eq 'F') or (t.hspt_S eq 'T')}">
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
			<td class="form_go"  onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e">
			<c:if test="${t.idx eq e.d2 and e.team eq 'D'}">${e.d3 }</c:if></c:forEach>" 
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
</c:when>
<c:when test="${info.hspt_name eq '효사랑전주요양병원' and info.hspt_subcode eq 'C00' and info.hspt_B eq 'T'}">			<!-- 1병원 총무부 부서장의 경우 -->
	<c:if test="${t.hspt_subcode eq 'C00' or t.hspt_subcode eq 'C01'}">
	
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
		<td class="form_go" onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'D'}">${e.d3 }</c:if></c:forEach>" data-ev="D" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
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
	</c:when>
	
	<c:when test="${info.hspt_name eq '효사랑가족요양병원' and info.hspt_subcode eq 'J00' and info.hspt_B eq 'T'}">			<!-- 2병원 영양과(본관) 부서장  경우 -->
	<c:if test="${t.hspt_subcode eq 'J00' or t.hspt_subcode eq 'J01'}">
	
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
		<td class="form_go" onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'D'}">${e.d3 }</c:if></c:forEach>" data-ev="D" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
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
	</c:when>

<c:when test="${info.hspt_B eq 'T' and info.hspt_V eq 'T' and info.hspt_K eq 'F' }">	<!-- 경혁팀 / 부서장 -->
	<c:choose>
		<c:when test="${(info.hspt_name eq '효사랑전주요양병원' or info.hspt_name eq '효사랑가족요양병원')}">
				<%-- 1병원 원무부장 / 경혁팀 이병훈  , 2병원 원무부장 / 경혁팀 권미희 --%>
				<c:if test="${(t.hspt_subcode eq info.hspt_subcode) or t.hspt_T eq 'T'}">
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
					<td class="form_go"  onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'D'}">${e.d3 }</c:if></c:forEach>" data-ev="D" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
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
			</c:when>
			<c:when test="${info.hspt_name eq '가족사랑요양병원' }">
			<%-- 3병원 간호부장 / 경혁팀 김강 --%>
			<c:if test="${(t.hspt_V eq 'F' and t.hspt_subcode eq info.hspt_subcode) or (t.hspt_subcode eq 'Q06')}">
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
					<td class="form_go"  onclick="formgo(this)" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'D'}">${e.d3 }</c:if></c:forEach>" data-ev="D" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
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
			</c:when>
			
	</c:choose>
	
</c:when>	
<c:when test="${info.hspt_B eq 'T' and info.hspt_V eq 'F' and info.hspt_K eq 'F' and info.hspt_S eq 'F'}">	<!-- 부서장 -->
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
	<td class="form_go"  onclick="formgo(this)" data-ev="D" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'D'}">${e.d3 }</c:if></c:forEach>" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
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
<c:when test="${info.hspt_B eq 'T' and info.hspt_V eq 'F' and info.hspt_K eq 'F' and info.hspt_S eq 'T'}">	<!-- 변)부서원 평가 hspt_S eq T -->
<c:if test="${t.hspt_B eq 'F' }">
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
	<td class="form_go"  onclick="formgo(this)" data-ev="D" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'D'}">${e.d3 }</c:if></c:forEach>" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
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
</c:when>

<c:when test="${info.hspt_B eq 'F' and info.hspt_V eq 'T' and info.hspt_X eq 'F'}">							<!-- 경혁팀 / 부서원 / 1인부서 X -->
<c:if test="${info.hspt_subcode eq t.hspt_subcode and t.hspt_B eq 'F'}">
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
	<td class="form_go"  onclick="formgo(this)" data-ev="D" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'D'}">${e.d3 }</c:if></c:forEach>" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
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
</c:when>
<c:when test="${info.hspt_B eq 'F' and info.hspt_V eq 'F' and info.hspt_X eq 'F' }">	<!-- 부서원 / 1인부서 X -->	
<c:if test="${t.hspt_B eq 'F' }">
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
	<td class="form_go"  onclick="formgo(this)" data-ev="D" data-d3="<c:forEach items="${endlist }" var="e"><c:if test="${t.idx eq e.d2 and e.team eq 'D'}">${e.d3 }</c:if></c:forEach>" data-t-idx="${t.idx }" data-e-idx="<c:if test="${e.d2 eq t.idx}">${e.d2}</c:if>">
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
</c:when>

</c:choose>
</c:if>
<!-- 진료부 명단 제거 e -->
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
<div class="modal normal">
	<div class="modal_body">
		<div>
			<div class="menu_msg">text</div>
			<div style="top: 40%" class="btn pink_btn" id="modal_insert" onclick="closePopup()">
			확인
			</div>
		</div>
	</div>
</div>
</body>

<script>
const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const modal2 = document.querySelector('.modal2');
const msg = document.querySelector('.menu_msg');
const msg2 = document.querySelector('.menu_msg2');
var id = "${sessionScope.loginmember}";
var info = "${info.id}";
var date = ${specificDate};
console.log("세션아이디 ${sessionScope.loginmember}");
console.log("model아이디 ${info.id}");
console.log("특정 날짜를 넘겼는지 확인 "+ date);

if(id != info && id != '12365478'){
	alert("잘못된 접근입니다.");
	location.href = "${pageContext.request.contextPath}/";
}

function closePopup(){
	modal.classList.toggle('show');
	if (!modal.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}

function formgo(element) {
	var infoidx = ${info.idx};
	var targetidx = element.getAttribute("data-t-idx");
	var ev = element.getAttribute("data-ev");
	var eidx = element.getAttribute("data-e-idx");
	var link = "${pageContext.request.contextPath}/e/Form/${info.idx}/"+targetidx+"/"+ev
	var d3 = element.getAttribute("data-d3");
	
	/* 
	if(date == 1){
		console.log("아직안넘음");
		alert("12월 1일 오픈 예정입니다. \n직원평가기간은 12월1일(금)~12월5일(화) 입니다.");
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
	}
	 */
	modal.classList.toggle('show');
 	msg.style.top = '34%';
	msg.innerHTML = "<p><b>[ 직원 근무평가 마감 ]</b><p><p>2023년도 직원 근무평가가 마감되었습니다.</p><p>평가에 응해주셔서 대단히 감사드립니다.</p><p>- 코어솔루션 -</p>"
	if (modal.classList.contains('show')) {
		body.style.overflow = 'hidden';
	}
	
}




</script>
</html>