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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css"><%-- 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/testinfocss.css"> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/alertcss.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demofootercss.css?ver=240101">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demoheadercss.css?ver=240201">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demoinfocss.css?ver=2402051">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/infomediacss.css?ver=240205">

<style>
	
</style>
</head>
<body>
<div class="main normal">
<form action="${pageContext.request.contextPath}/demo/Form" method="post">
	<div id="header">
	
	</div>
	<jsp:include page="../demo/header.jsp"></jsp:include>
	<div class="info">
		<div class="info-container">
			<div class="info_name">
				<span class="normal">
					<c:set var="infofirstName" value="${fn:substring(info.name, 0, 1)}" />
					${infofirstName}ㅇㅇ
				</span>
				<span class="light info_id">(사원번호 : ${info.id })</span>
			</div>
			<div class="info_hs light">
				<span>${info.hspt_name} / ${info.hspt_subname } / ${info.hspt_position }</span>
			</div>
			<div class="info_date light">
				<span>입사일자 : <fmt:formatDate var="date" value="${info.reg_date }" pattern="yyyy. MM. dd" />${date}</span>
			</div>
		</div>
	</div>
	<div class="target_info" id="targetInfo">
		<div class="target_text flex">
			<div class="notice">
				<img src="${pageContext.request.contextPath}/resources/icon/ev/ok.png">
				<span class="bold">평가대상자를 확인 후 평가를 진행해주세요!</span>
			</div>
			<div class="quick">
				<a href="#title1" ><span class="nav-btn" style="display:<c:if test="${(info.hspt_subcode eq 'A00' and info.hspt_Z eq 'F' and info.hspt_V eq 'F') or (info.hspt_V eq 'F' and info.hspt_B eq 'T') or (info.hspt_V eq 'F' and info.hspt_B eq 'F' and info.hspt_Z eq 'F')}">none</c:if>;">진료부</span></a>
				<a href="#title2" ><span class="nav-btn" style="display:<c:if test="${info.hspt_J eq 'F'}"> none</c:if>;">경혁팀</span></a>
				<a href="#title3"><span class="nav-btn" style="display:<c:if test="${info.hspt_subcode eq 'A00' or info.hspt_subcode eq 'A01' or (info.hspt_B eq 'T' and info.hspt_S eq 'F') or (info.hspt_B eq 'T' and info.hspt_S eq 'T') or (info.hspt_V eq 'T' and info.hspt_X eq 'T')}">none</c:if>;">부서장</span></a>
				<a href="#title4"><span class="nav-btn" style="display:<c:if test="${info.hspt_subcode eq 'A00'or info.hspt_subcode eq 'A01' or (info.hspt_X eq 'T' and info.hspt_K eq 'F') or (info.hspt_S eq 'F' and info.hspt_V eq 'F' and info.hspt_X eq 'T') or (info.hspt_subcode eq 'M00' and info.hspt_B eq 'F')}">none</c:if>;">부서원</span></a>
			</div>
			
		</div>
	</div>

<script>
</script>

<div class="target_area">
	
	<div class="target_container">
	
	<div class="target_section" id="sc1" style="display:<c:if test="${(info.hspt_subcode eq 'A00' and info.hspt_Z eq 'F' and info.hspt_V eq 'F') or (info.hspt_V eq 'F' and info.hspt_B eq 'T') or (info.hspt_V eq 'F' and info.hspt_B eq 'F' and info.hspt_Z eq 'F')}">none</c:if>;">
	<!-- 진료부만 해당될 경우 진료팀장이 아닐경우, 경혁팀일 경우
	
	
	 -->
	<div class="flex target_header" id="title1">
		<img style="" src="${pageContext.request.contextPath}/resources/icon/ev/ev.png">
		<span class="bold">진료부 평가</span>
	</div>
	
	<div class="line2"></div>
	<div class="targetA_area">
	<table class="targettb_A">
		<tr>
			<td class="td1">순번</td><td class="td2">부서명</td><td class="td3">사원번호</td><td class="td6">직급</td><td class="td4">성명</td><td class="td7">평가진행률</td><td class="td8">평가점수</td><td class="td5" style="">평가 및 수정</td>
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
						<td>
							<c:set var="targetfirstName" value="${fn:substring(t.name, 0, 1)}" />
						${targetfirstName}ㅇㅇ</td>
						
						<td class="score-text">
						<c:forEach items="${endlist}" var="e" >
							<!-- 평가받은사람과 리스트사람이 같고, 평가자와 로그인한사람이 같으면  -->
								<c:choose>
									<c:when test="${t.idx eq e.d2 and e.team eq 'D'}">
										${e.d3 }
									</c:when>
								</c:choose>
						</c:forEach>
							
						</td>
						<td>
							<c:forEach items="${score }" var="s">
								<c:if test="${info.id eq s.col1 and t.id eq s.col2 }">${s.col3 }점</c:if>
							</c:forEach>
						</td>
						<td class="form_go" >
							<div>
							<!--  -->
								<c:set var="asd1"/>
								<c:choose>
									<c:when test="${scoreempty eq 0}">
									<!-- 스코어 값이 없을 때 -->
										<c:set var="asd1" value="false" />
									</c:when>
									<c:otherwise>
										<!-- 있을때 -->
										<c:set var="a" value="1"/>
										<c:forEach items="${endlist}" var="e">
											<c:choose>
												<c:when test="${e.d2 eq t.idx}">
													<c:set var="a" value="1"/>
													<!-- 여기는 평가를 했을때 -->
													<c:set var="asd1" value="true" />
												</c:when>
											</c:choose>
										</c:forEach>
											<c:if test="${a eq 2}">
												<!-- 평가를 안했을 때 -->
												<c:set var="asd1" value="false" />
											</c:if>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${asd1 eq true }">
										<div class="modify-btn" onclick="formmodify(this)"
										data-d3-2="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
										data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정하기</div>
									</c:when>
									<c:otherwise>
										<div class="form-btn" onclick="formgo(this)"
										data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
										data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가하기</div>
									</c:otherwise>
								</c:choose>
							<!--  -->
							</div>
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
						<td><c:set var="targetfirstName" value="${fn:substring(t.name, 0, 1)}" />
						${targetfirstName}ㅇㅇ</td>
						
						<td class="score-text" >
							<c:forEach items="${endlist}" var="e">
								<c:choose>
									<c:when test="${t.idx eq e.d2 and e.team eq 'A'}">
										${e.d3 }
									</c:when>
								</c:choose>
							</c:forEach>
						</td>
						<td>
							<c:forEach items="${score }" var="s">
								<c:if test="${info.id eq s.col1 and t.id eq s.col2 }">${s.col3 }점</c:if>
							</c:forEach>
						</td>
						<td class="form_go" >
							<div>
							<!--  -->
								<c:set var="asd1" value="" />
								<c:choose>
									<c:when test="${scoreempty eq 0}">
									<!-- 스코어 값이 없을 때 -->
										<c:set var="asd1" value="false" />
									</c:when>
									<c:otherwise>
										<!-- 있을때 -->
										<c:set var="a" value="1"/>
										<c:forEach items="${endlist}" var="e">
											<c:choose>
												<c:when test="${e.d2 eq t.idx}">
													<c:set var="a" value="1"/>
													<!-- 여기는 평가를 했을때 -->
													<c:set var="asd1" value="true" />
												</c:when>
											</c:choose>
										</c:forEach>
											<c:if test="${a eq 2}">
												<!-- 평가를 안했을 때 -->
												<c:set var="asd1" value="false" />
											</c:if>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${asd1 eq true }">
										<div class="modify-btn" onclick="formmodify(this)"
										data-d3-2="<c:if test='${t.idx eq e.d2 and e.team eq "A"}'>${e.d3 }</c:if>"
										data-ev-2="A" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정하기</div>
									</c:when>
									<c:otherwise>
										<div class="form-btn" onclick="formgo(this)"
										data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "A"}'>${e.d3 }</c:if>"
										data-ev="A" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가하기</div>
									</c:otherwise>
								</c:choose>
							<!--  -->
							</div>
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
	</div>
	
	<!-- 경혁팀 -->
	<div class="target_section" id="sc2"
	<c:choose>
	<c:when test="${info.hspt_J eq 'F'}"> style="display: none;"</c:when>
	</c:choose>
	>
	<div class="flex target_header">
		<img src="${pageContext.request.contextPath}/resources/icon/ev/ev.png">
		<span class="bold" >경혁팀 평가</span>
	</div>
	<div class="line2"></div>
	<div class="targetB_area">
	<c:set var="index1" value="1" />
	<table class="targettb_B">
		<tr>
			<td class="td1">순번</td><td class="td2">부서명</td><td class="td3">사원번호</td><td class="td6">직급</td><td class="td4">성명</td><td class="td7">평가진행률</td><td class="td8">평가점수</td><td class="td5">평가 및 수정</td>
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
			<td><c:set var="targetfirstName" value="${fn:substring(t.name, 0, 1)}" />
						${targetfirstName}ㅇㅇ</td>
			
			<td class="score-text">
				<c:forEach items="${endlist}" var="e">
					<c:choose>
						<c:when test="${t.idx eq e.d2 and e.team eq 'B'}">
							${e.d3 }
						</c:when>
					</c:choose>
				</c:forEach>
			</td>
			<td>
				<c:forEach items="${score }" var="s">
					<c:if test="${info.id eq s.col1 and t.id eq s.col2 }">${s.col3 }점</c:if>
				</c:forEach>
			</td>
			<td class="form_go" >
				<div>
					<c:set var="asd2" value="" />
					<c:choose>
						<c:when test="${scoreempty eq 0}">
						<!-- 스코어 값이 없을 때 -->
							<c:set var="asd2" value="false" />
						</c:when>
						<c:otherwise>
							<!-- 있을때 -->
							<c:set var="a" value="1"/>
							<c:forEach items="${endlist}" var="e">
								<c:choose>
									<c:when test="${e.d2 eq t.idx}">
										<c:set var="a" value="1"/>
										<!-- 여기는 평가를 했을때 -->
										<c:set var="asd2" value="true" />
									</c:when>
								</c:choose>
							</c:forEach>
								<c:if test="${a eq 2}">
									<!-- 평가를 안했을 때 -->
									<c:set var="asd2" value="false" />
								</c:if>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${asd2 eq true }">
							<div class="modify-btn" onclick="formmodify(this)"
							data-d3-2="<c:if test='${t.idx eq e.d2 and e.team eq "B"}'>${e.d3 }</c:if>"
							data-ev-2="B" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정하기</div>
						</c:when>
						<c:otherwise>
							<div class="form-btn" onclick="formgo(this)"
							data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "B"}'>${e.d3 }</c:if>"
							data-ev="B" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가하기</div>
						</c:otherwise>
					</c:choose>
				</div>
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
	<div class="target_section" id="sc3" style="display:<c:if test="${info.hspt_subcode eq 'A00' or info.hspt_subcode eq 'A01' or (info.hspt_B eq 'T' and info.hspt_S eq 'F') or (info.hspt_B eq 'T' and info.hspt_S eq 'T') or (info.hspt_V eq 'T' and info.hspt_X eq 'T')}">none</c:if>;">
	
	<div class="flex target_header">
		<img src="${pageContext.request.contextPath}/resources/icon/ev/ev.png">
		<span class="bold">부서장 평가</span>
	</div>
	<div class="line2"></div>
	<div class="targetC_area">
	<table class="targettb_C">
		<tr>
			<td class="td1">순번</td><td class="td2">부서명</td><td class="td3">사원번호</td><td class="td6">직급</td><td class="td4">성명</td><td class="td7">평가진행률</td><td class="td8">평가점수</td><td class="td5">평가 및 수정</td>
		</tr>
		
	<c:set var="index2" value="1" />
	<c:forEach items="${target}" var="t">
	<c:if test="${t.idx ne info.idx}">
	<c:set var="sub" value = "${t.hspt_subcode }"/>
	<c:choose>
		<c:when test="${info.hspt_name eq '코어솔루션병원' and info.hspt_subcode eq 'C01'}">			<!-- 1병원 관리과의 경우 -->
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
			<td><c:set var="targetfirstName" value="${fn:substring(t.name, 0, 1)}" />
						${targetfirstName}ㅇㅇ</td>
			
			<td class="score-btn">
				<c:forEach items="${endlist}" var="e">
					<c:choose>
						<c:when test="${t.idx eq e.d2 and e.team eq 'C'}">
							${e.d3 }
						</c:when>
					</c:choose>
				</c:forEach>
			</td>
			<td>
				<c:forEach items="${score }" var="s">
					<c:if test="${info.id eq s.col1 and t.id eq s.col2 }">${s.col3 }점</c:if>
				</c:forEach>
			</td>
			<td class="form_go" >
				<div>
				<!--  -->
				<c:set var="asd3" value="" />
				<c:choose>
					<c:when test="${scoreempty eq 0}">
					<!-- 스코어 값이 없을 때 -->
						<c:set var="asd3" value="false" />
					</c:when>
					<c:otherwise>
						<!-- 있을때 -->
						<c:set var="a" value="1"/>
						<c:forEach items="${endlist}" var="e">
							<c:choose>
								<c:when test="${e.d2 eq t.idx}">
									<c:set var="a" value="1"/>
									<!-- 여기는 평가를 했을때 -->
									<c:set var="asd3" value="true" />
								</c:when>
							</c:choose>
						</c:forEach>
							<c:if test="${a eq 2}">
								<!-- 평가를 안했을 때 -->
								<c:set var="asd3" value="false" />
							</c:if>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${asd3 eq true }">
						<div class="modify-btn" onclick="formmodify(this)"
						data-d3-2="<c:if test='${t.idx eq e.d2 and e.team eq "C"}'>${e.d3 }</c:if>"
						data-ev-2="C" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정하기</div>
					</c:when>
					<c:otherwise>
						<div class="form-btn" onclick="formgo(this)"
						data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "C"}'>${e.d3 }</c:if>"
						data-ev="C" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가하기</div>
					</c:otherwise>
				</c:choose>
			<!--  -->
				</div>
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
			<td><c:set var="targetfirstName" value="${fn:substring(t.name, 0, 1)}" />
						${targetfirstName}ㅇㅇ</td>
			
			<td class="score-text">
				<c:forEach items="${endlist}" var="e">
					<c:choose>
						<c:when test="${t.idx eq e.d2 and e.team eq 'C'}">
							${e.d3 }
						</c:when>
					</c:choose>
				</c:forEach>
			</td>
			<td>
				<c:forEach items="${score }" var="s">
					<c:if test="${info.id eq s.col1 and t.id eq s.col2 }">${s.col3 }점</c:if>
				</c:forEach>
			</td>
			<td class="form_go" >
				<div>
					<!--  -->
					<c:set var="asd3" value="" />
					<c:choose>
						<c:when test="${scoreempty eq 0}">
						<!-- 스코어 값이 없을 때 -->
							<c:set var="asd3" value="false" />
						</c:when>
						<c:otherwise>
							<!-- 있을때 -->
							<c:set var="a" value="1"/>
							<c:forEach items="${endlist}" var="e">
								<c:choose>
									<c:when test="${e.d2 eq t.idx}">
										<c:set var="a" value="1"/>
										<!-- 여기는 평가를 했을때 -->
										<c:set var="asd3" value="true" />
									</c:when>
								</c:choose>
							</c:forEach>
								<c:if test="${a eq 2}">
									<!-- 평가를 안했을 때 -->
									<c:set var="asd3" value="false" />
								</c:if>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${asd3 eq true }">
							<div class="modify-btn" onclick="formmodify(this)"
							data-d3-2="<c:if test='${t.idx eq e.d2 and e.team eq "C"}'>${e.d3 }</c:if>"
							data-ev-2="C" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정하기</div>
						</c:when>
						<c:otherwise>
							<div class="form-btn" onclick="formgo(this)"
							data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "C"}'>${e.d3 }</c:if>"
							data-ev="C" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가하기</div>
						</c:otherwise>
					</c:choose>
					<!--  -->
				</div>
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
			<td><c:set var="targetfirstName" value="${fn:substring(t.name, 0, 1)}" />
						${targetfirstName}ㅇㅇ</td>
			
			<td class="score-text">
				<c:forEach items="${endlist}" var="e">
					<c:choose>
						<c:when test="${t.idx eq e.d2 and e.team eq 'C'}">
							${e.d3 }
						</c:when>
					</c:choose>
				</c:forEach>
			</td>
			<td>
				<c:forEach items="${score }" var="s">
					<c:if test="${info.id eq s.col1 and t.id eq s.col2 }">${s.col3 }점</c:if>
				</c:forEach>
			</td>
			<td class="form_go" >
				<div>
					<!--  -->
					<c:set var="asd3" value="" />
					<c:choose>
						<c:when test="${scoreempty eq 0}">
						<!-- 스코어 값이 없을 때 -->
							<c:set var="asd3" value="false" />
						</c:when>
						<c:otherwise>
							<!-- 있을때 -->
							<c:set var="a" value="1"/>
							<c:forEach items="${endlist}" var="e">
								<c:choose>
									<c:when test="${e.d2 eq t.idx}">
										<c:set var="a" value="1"/>
										<!-- 여기는 평가를 했을때 -->
										<c:set var="asd3" value="true" />
									</c:when>
								</c:choose>
							</c:forEach>
								<c:if test="${a eq 2}">
									<!-- 평가를 안했을 때 -->
									<c:set var="asd3" value="false" />
								</c:if>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${asd3 eq true }">
							<div class="modify-btn" onclick="formmodify(this)"
							data-d3-2="<c:if test='${t.idx eq e.d2 and e.team eq "C"}'>${e.d3 }</c:if>"
							data-ev-2="C" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정하기</div>
						</c:when>
						<c:otherwise>
							<div class="form-btn" onclick="formgo(this)"
							data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "C"}'>${e.d3 }</c:if>"
							data-ev="C" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가하기</div>
						</c:otherwise>
					</c:choose>
					<!--  -->
				</div>
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
			<td><c:set var="targetfirstName" value="${fn:substring(t.name, 0, 1)}" />
						${targetfirstName}ㅇㅇ</td>
			
			<td class="score-text">
				<c:forEach items="${endlist}" var="e">
					<c:choose>
						<c:when test="${t.idx eq e.d2 and e.team eq 'C'}">
							${e.d3 }
						</c:when>
					</c:choose>
				</c:forEach>
			</td>
			<td>
				<c:forEach items="${score }" var="s">
					<c:if test="${info.id eq s.col1 and t.id eq s.col2 }">${s.col3 }점</c:if>
				</c:forEach>
			</td>
			<td class="form_go" >
				<div>
					<!--  -->
					<c:set var="asd3" value="" />
					<c:choose>
						<c:when test="${scoreempty eq 0}">
						<!-- 스코어 값이 없을 때 -->
							<c:set var="asd3" value="false" />
						</c:when>
						<c:otherwise>
							<!-- 있을때 -->
							<c:set var="a" value="1"/>
							<c:forEach items="${endlist}" var="e">
								<c:choose>
									<c:when test="${e.d2 eq t.idx}">
										<c:set var="a" value="1"/>
										<!-- 여기는 평가를 했을때 -->
										<c:set var="asd3" value="true" />
									</c:when>
								</c:choose>
							</c:forEach>
								<c:if test="${a eq 2}">
									<!-- 평가를 안했을 때 -->
									<c:set var="asd3" value="false" />
								</c:if>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${asd3 eq true }">
							<div class="modify-btn" onclick="formmodify(this)"
							data-d3-2="<c:if test='${t.idx eq e.d2 and e.team eq "C"}'>${e.d3 }</c:if>"
							data-ev-2="C" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정하기</div>
						</c:when>
						<c:otherwise>
							<div class="form-btn" onclick="formgo(this)"
							data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "C"}'>${e.d3 }</c:if>"
							data-ev="C" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가하기</div>
						</c:otherwise>
					</c:choose>
					<!--  -->
				</div>
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
	<div class="target_section" id="sc4" style="display:<c:if test="${info.hspt_subcode eq 'A00'or info.hspt_subcode eq 'A01' or (info.hspt_X eq 'T' and info.hspt_K eq 'F') or (info.hspt_S eq 'F' and info.hspt_V eq 'F' and info.hspt_X eq 'T') or (info.hspt_subcode eq 'M00' and info.hspt_B eq 'F')}">none</c:if>;">
	<div class="flex target_header">
		<img src="${pageContext.request.contextPath}/resources/icon/ev/ev.png">
		<span class="bold" >부서원 평가</span>
	</div>
	<div class="line2"></div>
	<div class="targetD_area">
	<table class="targettb_D" style="">
		<tr>
			<td class="td1">순번</td><td class="td2">부서명</td><td class="td3">사원번호</td><td class="td6">직급</td><td class="td4">성명</td><td class="td7">평가진행률</td><td class="td8">평가점수</td><td class="td5">평가 및 수정</td>
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
				<td><c:set var="targetfirstName" value="${fn:substring(t.name, 0, 1)}" />
						${targetfirstName}ㅇㅇ</td>
				
				<td class="score-text">
					<c:forEach items="${endlist}" var="e">
						<c:choose>
							<c:when test="${t.idx eq e.d2 and e.team eq 'D'}">
								${e.d3 }
							</c:when>
						</c:choose>
					</c:forEach>
				</td>
				<td>
					<c:forEach items="${score }" var="s">
						<c:if test="${info.id eq s.col1 and t.id eq s.col2 }">${s.col3 }점</c:if>
					</c:forEach>
				</td>
				<td class="form_go" >
					<div>
						<!--  -->
						<c:set var="asd4" value="" />
						<c:choose>
							<c:when test="${scoreempty eq 0}">
							<!-- 스코어 값이 없을 때 -->
								<c:set var="asd4" value="false" />
							</c:when>
							<c:otherwise>
								<!-- 있을때 -->
								<c:set var="a" value="1"/>
								<c:forEach items="${endlist}" var="e">
									<c:choose>
										<c:when test="${e.d2 eq t.idx}">
											<c:set var="a" value="1"/>
											<!-- 여기는 평가를 했을때 -->
											<c:set var="asd4" value="true" />
										</c:when>
									</c:choose>
								</c:forEach>
									<c:if test="${a eq 2}">
										<!-- 평가를 안했을 때 -->
										<c:set var="asd4" value="false" />
									</c:if>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${asd4 eq true }">
								<div class="modify-btn"  onclick="formmodify(this)"
								data-d3-2="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
								data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정하기</div>
							</c:when>
							<c:otherwise>
								<div class="form-btn" onclick="formgo(this)"
								data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
								data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가하기</div>
							</c:otherwise>
						</c:choose>
						<!--  -->
					</div>
				</td>
			</tr>
			<c:set var="index3" value="${index3 + 1}" />
			</c:if>
	</c:when>
	<c:when test="${info.hspt_subcode eq 'C00' and info.hspt_B eq 'T'}">			<!-- 1병원 총무부 부서장의 경우 -->
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
			<td><c:set var="targetfirstName" value="${fn:substring(t.name, 0, 1)}" />
						${targetfirstName}ㅇㅇ</td>
			
			<td class="score-text">
				<c:forEach items="${endlist}" var="e">
					<c:choose>
						<c:when test="${t.idx eq e.d2 and e.team eq 'D'}">
							${e.d3 }
						</c:when>
					</c:choose>
				</c:forEach>
			</td>
			<td>
				<c:forEach items="${score }" var="s">
					<c:if test="${info.id eq s.col1 and t.id eq s.col2 }">${s.col3 }점</c:if>
				</c:forEach>
			</td>
			<td class="form_go" >
				<div>
					<!--  -->
					<c:set var="asd4" value="" />
					<c:choose>
						<c:when test="${scoreempty eq 0}">
						<!-- 스코어 값이 없을 때 -->
							<c:set var="asd4" value="false" />
						</c:when>
						<c:otherwise>
							<!-- 있을때 -->
							<c:set var="a" value="1"/>
							<c:forEach items="${endlist}" var="e">
								<c:choose>
									<c:when test="${e.d2 eq t.idx}">
										<c:set var="a" value="1"/>
										<!-- 여기는 평가를 했을때 -->
										<c:set var="asd4" value="true" />
									</c:when>
								</c:choose>
							</c:forEach>
								<c:if test="${a eq 2}">
									<!-- 평가를 안했을 때 -->
									<c:set var="asd4" value="false" />
								</c:if>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${asd4 eq true }">
							<div class="modify-btn" onclick="formmodify(this)"
							data-d3-2="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
							data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정하기</div>
						</c:when>
						<c:otherwise>
							<div class="form-btn" onclick="formgo(this)"
							data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
							data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가하기</div>
						</c:otherwise>
					</c:choose>
					<!--  -->
				</div>
			</td>
		</tr>
		<c:set var="index3" value="${index3 + 1}" />
		</c:if>
		</c:when>
		
		<c:when test="${info.hspt_subcode eq 'J00' and info.hspt_B eq 'T'}">			<!-- 2병원 영양과(본관) 부서장  경우 -->
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
			<td><c:set var="targetfirstName" value="${fn:substring(t.name, 0, 1)}" />
						${targetfirstName}ㅇㅇ</td>
			
			<td class="score-text">
				<c:forEach items="${endlist}" var="e">
					<c:choose>
						<c:when test="${t.idx eq e.d2 and e.team eq 'D'}">
							${e.d3 }
						</c:when>
					</c:choose>
				</c:forEach>
			</td>
			<td>
				<c:forEach items="${score }" var="s">
					<c:if test="${info.id eq s.col1 and t.id eq s.col2 }">${s.col3 }점</c:if>
				</c:forEach>
			</td>
			<td class="form_go" >
				<!--  -->
				<c:set var="asd3" value="" />
				<c:choose>
					<c:when test="${scoreempty eq 0}">
					<!-- 스코어 값이 없을 때 -->
						<c:set var="asd4" value="false" />
					</c:when>
					<c:otherwise>
						<!-- 있을때 -->
						<c:set var="a" value="1"/>
						<c:forEach items="${endlist}" var="e">
							<c:choose>
								<c:when test="${e.d2 eq t.idx}">
									<c:set var="a" value="1"/>
									<!-- 여기는 평가를 했을때 -->
									<c:set var="asd4" value="true" />
								</c:when>
							</c:choose>
						</c:forEach> 
							<c:if test="${a eq 2}">
								<!-- 평가를 안했을 때 -->
								<c:set var="asd4" value="false" />
							</c:if>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${asd4 eq true }">
						<div class="modify-btn" onclick="formmodify(this)"
						data-d3-2="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
						data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정하기</div>
					</c:when>
					<c:otherwise>
						<div class="form-btn" onclick="formgo(this)"
						data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
						data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가하기</div>
					</c:otherwise>
				</c:choose>
				<!--  -->
			</td>
		</tr>
		<c:set var="index3" value="${index3 + 1}" />
		</c:if>
		</c:when>
	
	<c:when test="${info.hspt_B eq 'T' and info.hspt_V eq 'T' and info.hspt_K eq 'F' }">	<!-- 경혁팀 / 부서장 -->
		
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
						<td><c:set var="targetfirstName" value="${fn:substring(t.name, 0, 1)}" />
						${targetfirstName}ㅇㅇ</td>
						
						<td class="score-text">
							<c:forEach items="${endlist}" var="e">
								<c:choose>
									<c:when test="${t.idx eq e.d2 and e.team eq 'D'}">
										${e.d3 }
									</c:when>
								</c:choose>
							</c:forEach>
						</td>
						<td>
							<c:forEach items="${score }" var="s">
								<c:if test="${info.id eq s.col1 and t.id eq s.col2 }">${s.col3 }점</c:if>
							</c:forEach>
						</td>
						<td class="form_go" >
							<div>
								<!--  -->
								<c:set var="asd4" value="" />
								<c:choose>
									<c:when test="${scoreempty eq 0}">
									<!-- 스코어 값이 없을 때 -->
										<c:set var="asd4" value="false" />
									</c:when>
									<c:otherwise>
										<!-- 있을때 -->
										<c:set var="a" value="1"/>
										<c:forEach items="${endlist}" var="e">
											<c:choose>
												<c:when test="${e.d2 eq t.idx}">
													<c:set var="a" value="1"/>
													<!-- 여기는 평가를 했을때 -->
													<c:set var="asd4" value="true" />
												</c:when>
											</c:choose>
										</c:forEach>
											<c:if test="${a eq 2}">
												<!-- 평가를 안했을 때 -->
												<c:set var="asd4" value="false" />
											</c:if>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${asd4 eq true }">
										<div class="modify-btn" onclick="formmodify(this)"
										data-d3-2="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
										data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정하기</div>
									</c:when>
									<c:otherwise>
										<div class="form-btn" onclick="formgo(this)"
										data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
										data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가하기</div>
									</c:otherwise>
								</c:choose>
								<!--  -->
							</div>
						</td>
					</tr>
					
					<c:set var="index3" value="${index3 + 1}" />
					</c:if>
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
		<td><c:set var="targetfirstName" value="${fn:substring(t.name, 0, 1)}" />
						${targetfirstName}ㅇㅇ</td>
		
		<td class="score-text">
			<c:forEach items="${endlist}" var="e">
				<c:choose>
					<c:when test="${t.idx eq e.d2 and e.team eq 'D'}">
						${e.d3 }
					</c:when>
				</c:choose>
			</c:forEach>
		</td>
		<td>
			<c:forEach items="${score }" var="s">
				<c:if test="${info.id eq s.col1 and t.id eq s.col2 }">${s.col3 }점</c:if>
			</c:forEach>
		</td>
		<td class="form_go" >
			<div>
				<!--  -->
				<c:set var="asd4" value="" />
				<c:choose>
					<c:when test="${scoreempty eq 0}">
					<!-- 스코어 값이 없을 때 -->
						<c:set var="asd4" value="false" />
					</c:when>
					<c:otherwise>
						<!-- 있을때 -->
						<c:set var="a" value="1"/>
						<c:forEach items="${endlist}" var="e">
							<c:choose>
								<c:when test="${e.d2 eq t.idx}">
									<c:set var="a" value="1"/>
									<!-- 여기는 평가를 했을때 -->
									<c:set var="asd4" value="true" />
								</c:when>
							</c:choose>
						</c:forEach>
							<c:if test="${a eq 2}">
								<!-- 평가를 안했을 때 -->
								<c:set var="asd4" value="false" />
							</c:if>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${asd4 eq true }">
						<div class="modify-btn" onclick="formmodify(this)"
						data-d3-2="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
						data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정하기</div>
					</c:when>
					<c:otherwise>
						<div class="form-btn" onclick="formgo(this)"
						data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
						data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가하기</div>
					</c:otherwise>
				</c:choose>
				<!--  -->
			</div>
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
		<td><c:set var="targetfirstName" value="${fn:substring(t.name, 0, 1)}" />
						${targetfirstName}ㅇㅇ</td>
		
		<td class="line2">
			<c:forEach items="${endlist}" var="e">
				<c:choose>
					<c:when test="${t.idx eq e.d2 and e.team eq 'D'}">
						${e.d3 }
					</c:when>
				</c:choose>
			</c:forEach>
		</td>
		<td>
			<c:forEach items="${score }" var="s">
				<c:if test="${info.id eq s.col1 and t.id eq s.col2 }">${s.col3 }점</c:if>
			</c:forEach>
		</td>
		<td class="form_go" >
			<div>
				<!--  -->
				<c:set var="asd4" value="" />
				<c:choose>
					<c:when test="${scoreempty eq 0}">
					<!-- 스코어 값이 없을 때 -->
						<c:set var="asd4" value="false" />
					</c:when>
					<c:otherwise>
						<!-- 있을때 -->
						<c:set var="a" value="1"/>
						<c:forEach items="${endlist}" var="e">
							<c:choose>
								<c:when test="${e.d2 eq t.idx}">
									<c:set var="a" value="1"/>
									<!-- 여기는 평가를 했을때 -->
									<c:set var="asd4" value="true" />
								</c:when>
							</c:choose>
						</c:forEach>
							<c:if test="${a eq 2}">
								<!-- 평가를 안했을 때 -->
								<c:set var="asd4" value="false" />
							</c:if>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${asd4 eq true }">
						<div class="modify-btn" onclick="formmodify(this)"
						data-d3-2="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
						data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정하기</div>
					</c:when>
					<c:otherwise>
						<div class="form-btn" onclick="formgo(this)"
						data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
						data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가하기</div>
					</c:otherwise>
				</c:choose>
				<!--  -->
			</div>
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
		<td><c:set var="targetfirstName" value="${fn:substring(t.name, 0, 1)}" />
						${targetfirstName}ㅇㅇ</td>
		
		<td class="line2">
			<c:forEach items="${endlist}" var="e">
				<c:choose>
					<c:when test="${t.idx eq e.d2 and e.team eq 'D'}">
						${e.d3 }
					</c:when>
				</c:choose>
			</c:forEach>
		</td>
		<td>
			<c:forEach items="${score }" var="s">
				<c:if test="${info.id eq s.col1 and t.id eq s.col2 }">${s.col3 }점</c:if>
			</c:forEach>
		</td>
		<td class="form_go" >
			<div>
				<!--  -->
				<c:set var="asd4" value="" />
				<c:choose>
					<c:when test="${scoreempty eq 0}">
					<!-- 스코어 값이 없을 때 -->
						<c:set var="asd4" value="false" />
					</c:when>
					<c:otherwise>
						<!-- 있을때 -->
						<c:set var="a" value="1"/>
						<c:forEach items="${endlist}" var="e">
							<c:choose>
								<c:when test="${e.d2 eq t.idx}">
									<c:set var="a" value="1"/>
									<!-- 여기는 평가를 했을때 -->
									<c:set var="asd4" value="true" />
								</c:when>
							</c:choose>
						</c:forEach>
							<c:if test="${a eq 2}">
								<!-- 평가를 안했을 때 -->
								<c:set var="asd4" value="false" />
							</c:if>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${asd4 eq true }">
						<div class="modify-btn" onclick="formmodify(this)"
						data-d3-2="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
						data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정하기</div>
					</c:when>
					<c:otherwise>
						<div class="form-btn" onclick="formgo(this)"
						data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
						data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가하기</div>
					</c:otherwise>
				</c:choose>
				<!--  -->
			</div>
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
		<td><c:set var="targetfirstName" value="${fn:substring(t.name, 0, 1)}" />
						${targetfirstName}ㅇㅇ</td>
		
		<td class="line2">
			<c:forEach items="${endlist}" var="e">
				<c:choose>
					<c:when test="${t.idx eq e.d2 and e.team eq 'D'}">
						${e.d3 }
					</c:when>
				</c:choose>
			</c:forEach>
		</td>
		<td>
			<c:forEach items="${score }" var="s">
				<c:if test="${info.id eq s.col1 and t.id eq s.col2 }">${s.col3 }점</c:if>
			</c:forEach>
		</td>
		<td class="form_go" >
			<div>
				<!--  -->
				<c:set var="asd4" value="" />
				<c:choose>
					<c:when test="${scoreempty eq 0}">
					<!-- 스코어 값이 없을 때 -->
						<c:set var="asd4" value="false" />
					</c:when>
					<c:otherwise>
						<!-- 있을때 -->
						<c:set var="a" value="1"/>
						<c:forEach items="${endlist}" var="e">
							<c:choose>
								<c:when test="${e.d2 eq t.idx}">
									<c:set var="a" value="1"/>
									<!-- 여기는 평가를 했을때 -->
									<c:set var="asd4" value="true" />
								</c:when>
							</c:choose>
						</c:forEach>
							<c:if test="${a eq 2}">
								<!-- 평가를 안했을 때 -->
								<c:set var="asd4" value="false" />
							</c:if>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${asd4 eq true }">
						<div class="modify-btn" onclick="formmodify(this)"
						data-d3-2="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
						data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정하기</div>
					</c:when>
					<c:otherwise>
						<div class="form-btn" onclick="formgo(this)"
						data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
						data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가하기</div>
					</c:otherwise>
				</c:choose>
				<!--  -->
			</div>
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
	</div>	
	
</div>
<jsp:include page="../demo/footer.jsp"></jsp:include>

</form>
</div>
<div class="modal normal">
	<div class="modal_body">
		<div>
			<div class="menu_msg">text</div>
			<div style="top: 40%" class="btn modal_btn" id="modal_insert" onclick="closePopup()">
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
// console.log("특정 날짜를 넘겼는지 확인 "+ date);

if(id != info && id != '12365478'){
	alert("잘못된 접근입니다.");
	location.href = "${pageContext.request.contextPath}/demo/Login";
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
	var link = "${pageContext.request.contextPath}/demo/Form/${info.idx}/"+targetidx+"/"+ev
	var d3 = element.getAttribute("data-d3");
	
	
	if(date == 1){
		console.log("아직안넘음");
		alert("12월 1일 오픈 예정입니다. \n직원평가기간은 12월1일(금)~12월5일(화) 입니다.");
	}else {
		console.log("넘음");
		if(d3 === '평가완료'){
			alert("이미 평가가 완료된 대상입니다.");
		}else{
			//링크 이동
			location.href=link;
//			window.location.replace(link);
		}
	}
	
// 	modal.classList.toggle('show');
//  	msg.style.top = '34%';
// 	msg.innerHTML = "<p><b>[ 직원 근무평가 마감 ]</b></p><p>2023년도 직원 근무평가가 마감되었습니다.</p><p>평가에 응해주셔서 대단히 감사드립니다.</p><p>- 코어솔루션 -</p>"
// 	if (modal.classList.contains('show')) {
// 		body.style.overflow = 'hidden';
// 	}
}
function formmodify(element) {
	var infoidx = ${info.idx};
	var targetidx = element.getAttribute("data-t-idx-2");
	var ev = element.getAttribute("data-ev-2");
	var eidx = element.getAttribute("data-e-idx-2");
	var link = "${pageContext.request.contextPath}/demo/FormModify/${info.idx}/"+targetidx+"/"+ev
	var d3 = element.getAttribute("data-d3-2");
	
	location.href=link;
	
}

document.addEventListener("DOMContentLoaded", function () {
	var targetInfo = document.getElementById("targetInfo");
	var initialOffset = 207;
	var fixedOffset = 62;
	var isFixed = false;
	
	function updateScroll() {
		var scrollY = window.scrollY || window.pageYOffset;
		
		if (scrollY >= initialOffset && !isFixed) {
			targetInfo.classList.add("fixed");
			isFixed = true;
		} else if (scrollY < initialOffset && isFixed) {
			targetInfo.classList.remove("fixed");
			isFixed = false;
		}
	
		requestAnimationFrame(updateScroll);
	}
	
	// Initial call to start the animation loop
	updateScroll();
});

// $(document).ready(function () {
// 	var quickList = $('quick').find('a');
	
// 	function onScroll() {
// 		$(window).scroll(function (event) {
			
// 			if (scrollPos > $('.anchor_div1').offset().top - 267 ) {
// 				quick.removeClass('active');
// 				quick.eq(0).addClass('active');
// 			}
// 		});
// 	}
// });


</script>
<script>
$(document).ready(function () {
	function isInView(element) {
		var windowHeight = $(window).height();
		var elementTop = element.offset().top;
		var elementBottom = elementTop + element.outerHeight();
		var scrollPos = $(document).scrollTop();
	    var headerHeight = $('#header').outerHeight();
	    var targetInfoHeight = $('.target_info').outerHeight();
	    var additionalMargin = 60; // 추가적인 여백
		console.log(elementTop - headerHeight - targetInfoHeight - additionalMargin);
		console.log(scrollPos + windowHeight && elementBottom - headerHeight + targetInfoHeight);
	 // 헤더와 target_info의 영역과 추가 여백만큼 아래로 내려와야 활성화
	    return (elementTop - headerHeight - targetInfoHeight - additionalMargin <= scrollPos + windowHeight && elementBottom - headerHeight - targetInfoHeight >= scrollPos);
}

	// 퀵메뉴 ON
	var quickList = $('.quick a').find('span');
	console.log(quickList);
	
	function onScroll() {
		$(window).scroll(function (event) {
	        var headerHeight = $('#header').outerHeight();
	        var targetInfoHeight = $('.target_info').outerHeight();
			var scrollPos = $(document).scrollTop();
			
// 			HOME, 공연안내, 핫플레이스, 메뉴&상품 각각의 구간에 도달하면 동작하는 조건문
// 			현재 스크롤 위치 > 진료부 영역의 상단부분의 위치 - 헤더 영역 - 공지사항영역 이면 진료부 활성화
// 			현재 스크롤 위치 <= 경혁팀 영역의 상단부분의 위치 - 헤더 영역 - 공지사항 영역 이면 진료부 활성화

// 			if (scrollPos > $('#sc1').offset().top - headerHeight - targetInfoHeight
// 					&& scrollPos <= $('#sc2').offset().top - headerHeight - targetInfoHeight) {
// 				quickList.removeClass('active');
// 				quickList.eq(0).addClass('active');
// 			} else if (scrollPos > $('#sc2').offset().top - headerHeight - targetInfoHeight
// 					&& scrollPos <= $('#sc3').offset().top - headerHeight - targetInfoHeight) {
// 				quickList.removeClass('active');
// 				quickList.eq(1).addClass('active');
// 			} else if (scrollPos > $('#sc3').offset().top - headerHeight - targetInfoHeight
// 					&& scrollPos <= $('#sc4').offset().top - headerHeight - targetInfoHeight) {
// 				quickList.removeClass('active');
// 				quickList.eq(2).addClass('active');
// 			} else if (scrollPos > $('#sc4').offset().top - headerHeight - targetInfoHeight) {
// 				quickList.removeClass('active');
// 				quickList.eq(3).addClass('active');
// 			}
			if (isInView($('#sc1'))) {
				console.log("진료부");
				quickList.removeClass('active');
				quickList.eq(0).addClass('active');
			} else if (isInView($('#sc2'))) {
				console.log("경혁");
				quickList.removeClass('active');
				quickList.eq(1).addClass('active');
			} else if (isInView($('#sc3'))) {
				console.log("부서장");
				quickList.removeClass('active');
				quickList.eq(2).addClass('active');
			} else if (isInView($('#sc4'))) {
				console.log("부서원");
				quickList.removeClass('active');
				quickList.eq(3).addClass('active');
			}
		});
	}

	// 스크롤 이동
	function smoothScroll() {
		var arr = [];
		arr.push($('#sc1'), $('#sc2'), $('#sc3'), $('#sc4'));
		var quickLinks = $('.quick a');
		
		quickLinks.on('click', function (e) {
			e.preventDefault();
			var targetIndex = $(this).index();
			
			$('html, body').stop().animate({
			    scrollTop: arr[targetIndex].offset().top - 122
			}, 500);
			
			// 클릭 이벤트에서 스크롤이 끝난 후에 active 클래스를 추가
			$(document).one('scroll', function () {
				quickList.removeClass('active');
				quickList.eq(targetIndex).addClass('active');
			});
		});
	}
	
	
	/* function smoothScroll() {
		var arr = [];
		arr.push($('#sc1'), $('#sc2'), $('#sc3'), $('#sc4'));
		$('.quick a').on('click', function (e) {
			e.preventDefault();
	
			$('html, body').stop().animate({
				scrollTop: arr[$(this).index()].offset().top - 122
			}, 500);
	
// 			스크롤이벤트에서 on 클래스를 붙이기 때문에 타이밍을 준다.
// 			setTimeout(function () {
// 				quickList.removeClass('active');
// 				quickList.eq($(this).index()).addClass('active');
// 			}, 10);
	
	
		});
	} */
	
	onScroll();
	smoothScroll();
});
</script>

</html>