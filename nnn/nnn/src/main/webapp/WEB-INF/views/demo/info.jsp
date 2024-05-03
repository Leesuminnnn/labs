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
<title>코어솔루션 인사평가 시스템</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css"><%-- 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/testinfocss.css"> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/alertcss.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demofootercss.css?ver=0226">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demoheadercss.css?ver=0226">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demoinfocss.css?ver=0226">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/infomediacss.css?ver=0226.01">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="icon" sizes="192x192" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">

<style>
	
</style>
</head>
<body id="body">
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
				<span class="nav-btn nav-1" id="title1btn" style="display:<c:if test="${(info.hspt_subcode eq 'A00' and info.hspt_Z eq 'F' and info.hspt_V eq 'F') or (info.hspt_V eq 'F' and info.hspt_B eq 'T') or (info.hspt_V eq 'F' and info.hspt_B eq 'F' and info.hspt_Z eq 'F')}">none</c:if>;">진료부</span>
				<span class="nav-btn nav-2" id="title2btn" style="display:<c:if test="${info.hspt_J eq 'F'}"> none</c:if>;">경혁팀</span>
				<span class="nav-btn nav-3" id="title3btn" style="display:<c:if test="${info.hspt_subcode eq 'A00' or info.hspt_subcode eq 'A01' or (info.hspt_B eq 'T' and info.hspt_S eq 'F') or (info.hspt_B eq 'T' and info.hspt_S eq 'T') or (info.hspt_V eq 'T' and info.hspt_X eq 'T')}">none</c:if>;">부서장</span>
				<span class="nav-btn nav-4" id="title4btn" style="display:<c:if test="${info.hspt_subcode eq 'A00'or info.hspt_subcode eq 'A01' or (info.hspt_X eq 'T' and info.hspt_K eq 'F') or (info.hspt_S eq 'F' and info.hspt_V eq 'F' and info.hspt_X eq 'T') or (info.hspt_subcode eq 'M00' and info.hspt_B eq 'F')}">none</c:if>;">부서원</span>
			</div>
			
		</div>
	</div>

<script>
</script>

<div class="target_area">
	
	<div class="target_container">
	
	<div class="target_section1" id="sc1" style="display:<c:if test="${(info.hspt_subcode eq 'A00' and info.hspt_Z eq 'F' and info.hspt_V eq 'F') or (info.hspt_V eq 'F' and info.hspt_B eq 'T') or (info.hspt_V eq 'F' and info.hspt_B eq 'F' and info.hspt_Z eq 'F')}">none</c:if>;">
	<!-- 진료부만 해당될 경우 진료팀장이 아닐경우, 경혁팀일 경우
	
	
	 -->
	<div class="flex target_header">
		<img style="" src="${pageContext.request.contextPath}/resources/icon/ev/ev.png">
		<span class="bold">진료부 평가</span>
	</div>
	
	<div class="line2"></div>
	<div class="targetA_area">
	<table class="targettb_A">
		<tr>
			<td class="td1">순번</td><td class="td2">부서명</td><td class="td3">사번</td><td class="td6">직급</td><td class="td4">성명</td><td class="td7">평가 진행률</td><td class="td8">평가 점수</td><td class="td5" style="">평가 및 수정</td>
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
										data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정 하기</div>
									</c:when>
									<c:otherwise>
										<div class="form-btn" onclick="formgo(this)"
										data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
										data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가 하기</div>
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
										data-ev-2="A" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정 하기</div>
									</c:when>
									<c:otherwise>
										<div class="form-btn" onclick="formgo(this)"
										data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "A"}'>${e.d3 }</c:if>"
										data-ev="A" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가 하기</div>
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
	<div class="target_section2" id="sc2"
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
			<td class="td1">순번</td><td class="td2">부서명</td><td class="td3">사번</td><td class="td6">직급</td><td class="td4">성명</td><td class="td7">평가 진행률</td><td class="td8">평가 점수</td><td class="td5">평가 및 수정</td>
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
							data-ev-2="B" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정 하기</div>
						</c:when>
						<c:otherwise>
							<div class="form-btn" onclick="formgo(this)"
							data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "B"}'>${e.d3 }</c:if>"
							data-ev="B" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가 하기</div>
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
	<div class="target_section3" id="sc3" style="display:<c:if test="${info.hspt_subcode eq 'A00' or info.hspt_subcode eq 'A01' or (info.hspt_B eq 'T' and info.hspt_S eq 'F') or (info.hspt_B eq 'T' and info.hspt_S eq 'T') or (info.hspt_V eq 'T' and info.hspt_X eq 'T')}">none</c:if>;">
	
	<div class="flex target_header">
		<img src="${pageContext.request.contextPath}/resources/icon/ev/ev.png">
		<span class="bold">부서장 평가</span>
	</div>
	<div class="line2"></div>
	<div class="targetC_area">
	<table class="targettb_C">
		<tr>
			<td class="td1">순번</td><td class="td2">부서명</td><td class="td3">사번</td><td class="td6">직급</td><td class="td4">성명</td><td class="td7">평가 진행률</td><td class="td8">평가 점수</td><td class="td5">평가 및 수정</td>
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
						data-ev-2="C" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정 하기</div>
					</c:when>
					<c:otherwise>
						<div class="form-btn" onclick="formgo(this)"
						data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "C"}'>${e.d3 }</c:if>"
						data-ev="C" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가 하기</div>
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
							data-ev-2="C" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정 하기</div>
						</c:when>
						<c:otherwise>
							<div class="form-btn" onclick="formgo(this)"
							data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "C"}'>${e.d3 }</c:if>"
							data-ev="C" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가 하기</div>
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
							data-ev-2="C" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정 하기</div>
						</c:when>
						<c:otherwise>
							<div class="form-btn" onclick="formgo(this)"
							data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "C"}'>${e.d3 }</c:if>"
							data-ev="C" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가 하기</div>
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
							data-ev-2="C" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정 하기</div>
						</c:when>
						<c:otherwise>
							<div class="form-btn" onclick="formgo(this)"
							data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "C"}'>${e.d3 }</c:if>"
							data-ev="C" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가 하기</div>
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
	<div class="target_section4" id="sc4" style="display:<c:if test="${info.hspt_subcode eq 'A00'or info.hspt_subcode eq 'A01' or (info.hspt_X eq 'T' and info.hspt_K eq 'F') or (info.hspt_S eq 'F' and info.hspt_V eq 'F' and info.hspt_X eq 'T') or (info.hspt_subcode eq 'M00' and info.hspt_B eq 'F')}">none</c:if>;">
	<div class="flex target_header">
		<img src="${pageContext.request.contextPath}/resources/icon/ev/ev.png">
		<span class="bold" >부서원 평가</span>
	</div>
	<div class="line2"></div>
	<div class="targetD_area">
	<table class="targettb_D" style="">
		<tr>
			<td class="td1">순번</td><td class="td2">부서명</td><td class="td3">사번</td><td class="td6">직급</td><td class="td4">성명</td><td class="td7">평가 진행률</td><td class="td8">평가 점수</td><td class="td5">평가 및 수정</td>
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
								data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정 하기</div>
							</c:when>
							<c:otherwise>
								<div class="form-btn" onclick="formgo(this)"
								data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
								data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가 하기</div>
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
							data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정 하기</div>
						</c:when>
						<c:otherwise>
							<div class="form-btn" onclick="formgo(this)"
							data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
							data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가 하기</div>
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
						data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정 하기</div>
					</c:when>
					<c:otherwise>
						<div class="form-btn" onclick="formgo(this)"
						data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
						data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가 하기</div>
					</c:otherwise>
				</c:choose>
				<!--  -->
				</div>
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
							<c:forEach items="${endlist}" var="e">
								<c:forEach items="${score }" var="s">
									<c:if test="${info.id eq s.col1 and t.id eq s.col2 }">
										<c:choose>
											<c:when test='${t.idx eq e.d2 and e.team eq "D" and e.ev eq "AB"}'>
												${s.col3 }점
											</c:when>
										</c:choose>
									</c:if>
								</c:forEach>
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
												<c:when test='${e.d2 eq t.idx and e.ev eq "AB"}'>
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
										data-d3-2="<c:if test='${t.idx eq e.d2 and e.team eq "D" }'>${e.d3 }</c:if>"
										data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정 하기</div>
									</c:when>
									<c:otherwise>
										<div class="form-btn" onclick="formgo(this)"
										data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
										data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가 하기</div>
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
						data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정 하기</div>
					</c:when>
					<c:otherwise>
						<div class="form-btn" onclick="formgo(this)"
						data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
						data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가 하기</div>
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
						data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정 하기</div>
					</c:when>
					<c:otherwise>
						<div class="form-btn" onclick="formgo(this)"
						data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
						data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가 하기</div>
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
						data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정 하기</div>
					</c:when>
					<c:otherwise>
						<div class="form-btn" onclick="formgo(this)"
						data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
						data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가 하기</div>
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
						data-ev-2="D" data-t-idx-2="${t.idx}" data-e-idx-2="${e.d2}">수정 하기</div>
					</c:when>
					<c:otherwise>
						<div class="form-btn" onclick="formgo(this)"
						data-d3="<c:if test='${t.idx eq e.d2 and e.team eq "D"}'>${e.d3 }</c:if>"
						data-ev="D" data-t-idx="${t.idx}" data-e-idx="${e.d2}">평가 하기</div>
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


</form>
</div>
<jsp:include page="../demo/footer.jsp"></jsp:include>
	<div class="modal normal">
		<div class="modal_body">
			<div>
				<img class="menu_icon" src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png">
				<div class="menu_msg">text</div>
				<div class="modal_footer">
					<div class="btn modal_btn" onclick="closePopup()">
						확인
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal2 normal">
		<div class="modal_body2">
			<div>
				<img class="menu_icon" src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png">
				<div class="menu_msg2">text</div>
				<div class="modal_footer2">
					<div class="btn modal_btn2" onclick="closePopup2()">
						확인
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal3 normal">
		<div class="modal_body3">
			<div>
				<img class="menu_icon" src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png">
				<div class="menu_msg3">text</div>
				<div class="modal_footer3">
					<div class="btn modal_btn2" onclick="modal_insert()">
						확인
					</div>
					<div class="btn pink_btn2" onclick="closePopup3()">
						취소
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal4 normal">
		<div class="modal_body4">
			<div>
				<img class="menu_icon" src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png">
				<div class="menu_msg4">text</div>
				<div class="modal_footer4">
					<div class="btn modal_btn2" onclick="modal_insert()">
						확인
					</div>
					<div class="btn pink_btn2" onclick="closePopup4()">
						취소
					</div>
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

/* 
// 페이지의 스크롤된 위치 확인
    var scrollTop = window.pageYOffset || document.documentElement.scrollTop;

    // 버튼 요소 선택
    var title1btn = document.getElementById('title1btn');
    var title2btn = document.getElementById('title2btn');
    var title3btn = document.getElementById('title3btn');
    var title4btn = document.getElementById('title4btn');

    // target_section1 요소의 위치 확인
    var targetSection1 = document.querySelector('.target_section1');
    var targetSection1Top = targetSection1.getBoundingClientRect().top + scrollTop;

    // target_section2 요소의 위치 확인
    var targetSection2 = document.querySelector('.target_section2');
    var targetSection2Top = targetSection2.getBoundingClientRect().top + scrollTop;
    
	 // target_section3 요소의 위치 확인
    var targetSection3 = document.querySelector('.target_section3');
    var targetSection3Top = targetSection3.getBoundingClientRect().top + scrollTop;
    
	 // target_section4 요소의 위치 확인
    var targetSection4 = document.querySelector('.target_section4');
    var targetSection4Top = targetSection4.getBoundingClientRect().top + scrollTop;

    // 각 버튼의 표시 여부 확인
    var title1Visible = title1btn.offsetHeight > 0;
    var title2Visible = title2btn.offsetHeight > 0;
    var title3Visible = title3btn.offsetHeight > 0;
    var title4Visible = title4btn.offsetHeight > 0;	
    

// title1btn 클릭 시
title1btn.addEventListener('click', function() {
    // target_section1로 스크롤
    targetSection1.scrollIntoView({
    	top: targetSection1Top - 122,
        behavior: 'smooth',
    });

    // 클릭된 버튼에 active 클래스 추가
    title1btn.classList.add('active');
    // 나머지 버튼에 active 클래스 제거
    title2btn.classList.remove('active');
    title3btn.classList.remove('active');
    title4btn.classList.remove('active');
});

// title2btn 클릭 시
title2btn.addEventListener('click', function() {
    // target_section2로 스크롤
    targetSection2.scrollIntoView({
    	top: targetSection2Top - 122,
        behavior: 'smooth',
    });

    // 클릭된 버튼에 active 클래스 추가
    title2btn.classList.add('active');
    // 나머지 버튼에 active 클래스 제거
    title1btn.classList.remove('active');
    title3btn.classList.remove('active');
    title4btn.classList.remove('active');
});

// title3btn 클릭 시
title3btn.addEventListener('click', function() {
    // target_section3로 스크롤
    targetSection3.scrollIntoView({
    	top: targetSection3Top - 122,
        behavior: 'smooth',
    });

    // 클릭된 버튼에 active 클래스 추가
    title3btn.classList.add('active');
    // 나머지 버튼에 active 클래스 제거
    title1btn.classList.remove('active');
    title2btn.classList.remove('active');
    title4btn.classList.remove('active');
});

// title4btn 클릭 시
title4btn.addEventListener('click', function() {
    // target_section4로 스크롤
    targetSection4.scrollIntoView({
    	top: targetSection4Top - 122,
        behavior: 'smooth',
    });

    // 클릭된 버튼에 active 클래스 추가
    title4btn.classList.add('active');
    // 나머지 버튼에 active 클래스 제거
    title1btn.classList.remove('active');
    title2btn.classList.remove('active');
    title3btn.classList.remove('active');
});


 */
window.addEventListener('DOMContentLoaded', function() {
    handleScroll();
});

//스크롤 이벤트에 핸들러 함수 연결
window.addEventListener('scroll', handleScroll); 

// 스크롤 이벤트 핸들러 함수
function handleScroll() {
    // 페이지의 스크롤된 위치 확인
    var scrollTop = window.pageYOffset || document.documentElement.scrollTop;

    // 버튼 요소 선택
    var title1btn = document.getElementById('title1btn');
    var title2btn = document.getElementById('title2btn');
    var title3btn = document.getElementById('title3btn');
    var title4btn = document.getElementById('title4btn');
    
	 // target_section1 요소의 위치 확인
    var targetSection1 = document.querySelector('.target_section1');
    var targetSection1Top = targetSection1.getBoundingClientRect().top + scrollTop;

    // target_section2 요소의 위치 확인
    var targetSection2 = document.querySelector('.target_section2');
    var targetSection2Top = targetSection2.getBoundingClientRect().top + scrollTop;
    
	 // target_section3 요소의 위치 확인
    var targetSection3 = document.querySelector('.target_section3');
    var targetSection3Top = targetSection3.getBoundingClientRect().top + scrollTop;
    
	 // target_section4 요소의 위치 확인
    var targetSection4 = document.querySelector('.target_section4');
    var targetSection4Top = targetSection4.getBoundingClientRect().top + scrollTop;

    // 각 버튼의 표시 여부 확인
    var title1Visible = title1btn.offsetHeight > 0;
    var title2Visible = title2btn.offsetHeight > 0;
    var title3Visible = title3btn.offsetHeight > 0;
    var title4Visible = title4btn.offsetHeight > 0;	

    // target_section 요소들 선택
    var targetSections = document.querySelectorAll('.target_section1, .target_section2, .target_section3, .target_section4');

    // 모든 버튼에 대해서 active 클래스 제거
    [title1btn, title2btn, title3btn, title4btn].forEach(function(btn) {
        btn.classList.remove('active');
    });

    // 각 target_section에 대해 스크롤 위치와 화면 높이를 비교하여 active 클래스 추가
    targetSections.forEach(function(section, index) {
        var sectionTop = section.offsetTop;
        var sectionHeight = section.offsetHeight;

        // 스크롤된 위치가 섹션의 위쪽에서 122px 이상이고, 섹션의 아래쪽에서 123px 이하인 경우 active 클래스 추가
        if (screen.width < 767) {
        	if (scrollTop >= sectionTop - 162 && scrollTop <= sectionTop + sectionHeight - 163) {
                // 인덱스에 해당하는 버튼에 active 클래스 추가
                switch (index) {
                    case 0:
                        title1btn.classList.add('active');
                        break;
                    case 1:
                        title2btn.classList.add('active');
                        break;
                    case 2:
                        title3btn.classList.add('active');
                        break;
                    case 3:
                        title4btn.classList.add('active');
                        break;
                    default:
                        break;
                }
            }
        } else {
        	if (scrollTop >= sectionTop - 122 && scrollTop <= sectionTop + sectionHeight - 123) {
                // 인덱스에 해당하는 버튼에 active 클래스 추가
                switch (index) {
                    case 0:
                        title1btn.classList.add('active');
                        break;
                    case 1:
                        title2btn.classList.add('active');
                        break;
                    case 2:
                        title3btn.classList.add('active');
                        break;
                    case 3:
                        title4btn.classList.add('active');
                        break;
                    default:
                        break;
                }
            }
        }
        
    });
    
    
    
    
    // title1btn이 화면에 보이지 않는 경우에만 동작
    if (!title1Visible) {
        // title2btn이 클릭되었을 때
        title2btn.addEventListener('click', function() {
            // target_section2로 스크롤
            if (screen.width < 767) {
            	window.scrollTo({
                    top: document.querySelector('.target_section2').offsetTop - 162,  // target_section2 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            } else {
            	window.scrollTo({
                    top: document.querySelector('.target_section2').offsetTop - 122,  // target_section2 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }
            
         // 클릭된 버튼에 active 클래스 추가
            title2btn.classList.add('active');
            // 나머지 버튼에 active 클래스 제거
            title1btn.classList.remove('active');
            title3btn.classList.remove('active');
            title4btn.classList.remove('active');
        });

        // title3btn이 클릭되었을 때
        title3btn.addEventListener('click', function() {
            // target_section3로 스크롤
            if (screen.width < 767) {
            	window.scrollTo({
                	top: document.querySelector('.target_section3').offsetTop - 162, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }else {
            	window.scrollTo({
                	top: document.querySelector('.target_section3').offsetTop - 122, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }
            
         // 클릭된 버튼에 active 클래스 추가
            title3btn.classList.add('active');
            // 나머지 버튼에 active 클래스 제거
            title1btn.classList.remove('active');
            title2btn.classList.remove('active');
            title4btn.classList.remove('active');
        });

        // title4btn이 클릭되었을 때
        title4btn.addEventListener('click', function() {
            // target_section4로 스크롤
            if (screen.width < 767) {
            	window.scrollTo({
                    top: document.querySelector('.target_section4').offsetTop - 162,  // target_section4 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }else {
            	window.scrollTo({
                    top: document.querySelector('.target_section4').offsetTop - 122,  // target_section4 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }
            
         // 클릭된 버튼에 active 클래스 추가
            title4btn.classList.add('active');
            // 나머지 버튼에 active 클래스 제거
            title1btn.classList.remove('active');
            title3btn.classList.remove('active');
            title2btn.classList.remove('active');
        });
    }
    // title2btn이 화면에 보이지 않는 경우에만 동작
    else if (!title2Visible) {

    	// title1btn이 클릭되었을 때
        title1btn.addEventListener('click', function() {
            // target_section3로 스크롤
            if (screen.width < 767) {
            	window.scrollTo({
                	top: document.querySelector('.target_section1').offsetTop - 162, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }else {
            	window.scrollTo({
                	top: document.querySelector('.target_section1').offsetTop - 122, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }
            
         // 클릭된 버튼에 active 클래스 추가
            title1btn.classList.add('active');
            // 나머지 버튼에 active 클래스 제거
            title1btn.classList.remove('active');
            title2btn.classList.remove('active');
            title4btn.classList.remove('active');
        });
    	
    	// title3btn이 클릭되었을 때
        title3btn.addEventListener('click', function() {
            // target_section3로 스크롤
            if (screen.width < 767) {
            	window.scrollTo({
                	top: document.querySelector('.target_section3').offsetTop - 162, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            } else {
            	window.scrollTo({
                	top: document.querySelector('.target_section3').offsetTop - 122, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }
            
         // 클릭된 버튼에 active 클래스 추가
            title3btn.classList.add('active');
            // 나머지 버튼에 active 클래스 제거
            title1btn.classList.remove('active');
            title2btn.classList.remove('active');
            title4btn.classList.remove('active');
        });
    	
    	// title4btn이 클릭되었을 때
        title4btn.addEventListener('click', function() {
            // target_section3로 스크롤
            if (screen.width < 767) {
            	window.scrollTo({
                	top: document.querySelector('.target_section4').offsetTop - 162, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            } else {
            	window.scrollTo({
                	top: document.querySelector('.target_section4').offsetTop - 122, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }
            
         // 클릭된 버튼에 active 클래스 추가
            title4btn.classList.add('active');
            // 나머지 버튼에 active 클래스 제거
            title1btn.classList.remove('active');
            title3btn.classList.remove('active');
            title2btn.classList.remove('active');
        });
    }
    // title3btn이 화면에 보이지 않는 경우에만 동작
    else if (!title3Visible) {

    	// title1btn이 클릭되었을 때
        title1btn.addEventListener('click', function() {
            // target_section3로 스크롤
            if (screen.width < 767) {
            	window.scrollTo({
                	top: document.querySelector('.target_section1').offsetTop - 162, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            } else {
            	window.scrollTo({
                	top: document.querySelector('.target_section1').offsetTop - 122, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }
            
         // 클릭된 버튼에 active 클래스 추가
            title1btn.classList.add('active');
            // 나머지 버튼에 active 클래스 제거
            title2btn.classList.remove('active');
            title3btn.classList.remove('active');
            title4btn.classList.remove('active');
        });
    	
    	// title2btn이 클릭되었을 때
        title2btn.addEventListener('click', function() {
            // target_section3로 스크롤
            if (screen.width < 767) {
            	window.scrollTo({
                	top: document.querySelector('.target_section2').offsetTop - 162, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            } else {
            	window.scrollTo({
                	top: document.querySelector('.target_section2').offsetTop - 122, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }
            
         // 클릭된 버튼에 active 클래스 추가
            title2btn.classList.add('active');
            // 나머지 버튼에 active 클래스 제거
            title1btn.classList.remove('active');
            title3btn.classList.remove('active');
            title4btn.classList.remove('active');
        });
    	
    	// title4btn이 클릭되었을 때
        title4btn.addEventListener('click', function() {
            // target_section3로 스크롤
            if (screen.width < 767) {
            	window.scrollTo({
                	top: document.querySelector('.target_section4').offsetTop - 162, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            } else {
            	window.scrollTo({
                	top: document.querySelector('.target_section4').offsetTop - 122, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }
            
         // 클릭된 버튼에 active 클래스 추가
            title4btn.classList.add('active');
            // 나머지 버튼에 active 클래스 제거
            title1btn.classList.remove('active');
            title3btn.classList.remove('active');
            title2btn.classList.remove('active');
        });
    }
    // title4btn이 화면에 보이지 않는 경우에만 동작
    else if (!title4Visible) {

    	// title1btn이 클릭되었을 때
        title1btn.addEventListener('click', function() {
            // target_section3로 스크롤
            if (screen.width < 767) {
            	window.scrollTo({
                	top: document.querySelector('.target_section1').offsetTop - 162, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            } else {
            	window.scrollTo({
                	top: document.querySelector('.target_section1').offsetTop - 122, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }
            
         // 클릭된 버튼에 active 클래스 추가
            title1btn.classList.add('active');
            // 나머지 버튼에 active 클래스 제거
            title1btn.classList.remove('active');
            title3btn.classList.remove('active');
            title2btn.classList.remove('active');
        });
    	
    	// title2btn이 클릭되었을 때
        title2btn.addEventListener('click', function() {
            // target_section3로 스크롤
            if (screen.width < 767) {
            	window.scrollTo({
                	top: document.querySelector('.target_section2').offsetTop - 162, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            } else {
            	window.scrollTo({
                	top: document.querySelector('.target_section2').offsetTop - 122, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }
            
         // 클릭된 버튼에 active 클래스 추가
            title2btn.classList.add('active');
            // 나머지 버튼에 active 클래스 제거
            title1btn.classList.remove('active');
            title3btn.classList.remove('active');
            title4btn.classList.remove('active');
        });
    	
    	// title3btn이 클릭되었을 때
        title3btn.addEventListener('click', function() {
            // target_section3로 스크롤
            if (screen.width < 767) {
            	window.scrollTo({
                	top: document.querySelector('.target_section3').offsetTop - 162, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            } else {
            	window.scrollTo({
                	top: document.querySelector('.target_section3').offsetTop - 122, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }
            
         // 클릭된 버튼에 active 클래스 추가
            title3btn.classList.add('active');
            // 나머지 버튼에 active 클래스 제거
            title1btn.classList.remove('active');
            title2btn.classList.remove('active');
            title4btn.classList.remove('active');
        });
    } else {
    	// title1btn이 클릭되었을 때
        title1btn.addEventListener('click', function() {
            // target_section3로 스크롤
            if (screen.width < 767) {
            	window.scrollTo({
                	top: document.querySelector('.target_section1').offsetTop - 162, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            } else {
            	window.scrollTo({
                	top: document.querySelector('.target_section1').offsetTop - 122, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }
            
         // 클릭된 버튼에 active 클래스 추가
            title1btn.classList.add('active');
            // 나머지 버튼에 active 클래스 제거
            title4btn.classList.remove('active');
            title3btn.classList.remove('active');
            title2btn.classList.remove('active');
        });
    	
    	// title2btn이 클릭되었을 때
        title2btn.addEventListener('click', function() {
            // target_section3로 스크롤
            if (screen.width < 767) {
            	window.scrollTo({
                	top: document.querySelector('.target_section2').offsetTop - 162, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            } else {
            	window.scrollTo({
                	top: document.querySelector('.target_section2').offsetTop - 122, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }
            
         // 클릭된 버튼에 active 클래스 추가
            title2btn.classList.add('active');
            // 나머지 버튼에 active 클래스 제거
            title1btn.classList.remove('active');
            title3btn.classList.remove('active');
            title4btn.classList.remove('active');
        });
    	
    	// title3btn이 클릭되었을 때
        title3btn.addEventListener('click', function() {
            // target_section3로 스크롤
            if (screen.width < 767) {
            	window.scrollTo({
                	top: document.querySelector('.target_section3').offsetTop - 162, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            } else {
            	window.scrollTo({
                	top: document.querySelector('.target_section3').offsetTop - 122, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }
            
         // 클릭된 버튼에 active 클래스 추가
            title3btn.classList.add('active');
            // 나머지 버튼에 active 클래스 제거
            title1btn.classList.remove('active');
            title2btn.classList.remove('active');
            title4btn.classList.remove('active');
        });
     // title4btn이 클릭되었을 때
        title4btn.addEventListener('click', function() {
            // target_section3로 스크롤
            if (screen.width < 767) {
            	window.scrollTo({
                	top: document.querySelector('.target_section4').offsetTop - 162, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            } else {
            	window.scrollTo({
                	top: document.querySelector('.target_section4').offsetTop - 122, // target_section3 요소가 top에서 122px 떨어지도록 스크롤
                    behavior: 'smooth' // 부드러운 스크롤 애니메이션 사용
                });
            }
            
         // 클릭된 버튼에 active 클래스 추가
            title4btn.classList.add('active');
            // 나머지 버튼에 active 클래스 제거
            title1btn.classList.remove('active');
            title3btn.classList.remove('active');
            title2btn.classList.remove('active');
        });
    }
}
if (screen.width < 767) {
	console.log("너비 767이하");
	if ($(".nav-1").css("display") == "none") {
		// 진료부가 안보임
		if ($(".nav-3").css("display") == "none" && $(".nav-4").css("display") == "none" && $(".nav-2").css("display") != "none") {
			// 부서장 부서원 안보임 경혁팀 보임
			console.log("진료부");
			// 보이지 않게 설정
			$(".target_area").css({
				paddingTop: '257px'
			});
			$(".target_info").css({
				height: '50px'
			});
			$(".quick").css({
				display: 'none'
			});
		}
		else if ($(".nav-3").css("display") == "none" && $(".nav-2").css("display") != "none" && $(".nav-4").css("display") != "none") {
			// 부서장 안보임 경혁팀 부서원 보임
			console.log("경혁팀X 부서장의 경우");
			$(".nav-2").css({
			    width : 'calc((100vw - 48px) / 2)'
			});
			$(".nav-4").css({
				width : 'calc((100vw - 48px) / 2)'
			});
		}
		else if ($(".nav-2").css("display") == "none" && $(".nav-3").css("display") != "none" && $(".nav-4").css("display") != "none") {
			// 경혁팀 안보임 부서장 부서원 보임
			console.log("부서원");
			$(".nav-3").css({
			    width : 'calc((100vw - 48px) / 2)'
			});
			$(".nav-4").css({
				width : 'calc((100vw - 48px) / 2)'
			});
		}else {
			// 진료부, 경혁팀, 부서장 안보임
			console.log("진료부, 경혁팀, 부서장 안보임 부서원만 보임");
			// 보이지 않게 설정
			$(".target_area").css({
				paddingTop: '257px',
			});
			$(".target_info").css({
				height: '50px'
			});
			$(".quick").css({
				display: 'none'
			});
			$(".notice").css({
				height: '100%'
			})
		}
	}
// 	else if ($(".nav-2").css("display") == "none") {
// 		console.log('경혁팀 안보임');
// 	} 
	else if ($(".nav-3").css("display") == "none") {
		console.log('부서장 안보임');
		if ($(".nav-4").css("display") == "none") {
			// 부서원이 안보일때
			console.log("진료팀장");
			$(".nav-1").css({
			    width : 'calc((100vw - 48px) / 2)'
			});
			$(".nav-2").css({
				width : 'calc((100vw - 48px) / 2)'
			});
			
		} else {
			console.log("부서장만 안보임");
			$(".nav-1").css({
			    width : 'calc((100vw - 48px) / 3)'
			});
			$(".nav-2").css({
				width : 'calc((100vw - 48px) / 3)'
			});
			$(".nav-4").css({
				width : 'calc((100vw - 48px) / 3)'
			});
		}
	}
	else {
		console.log("다보임");
		$(".nav-1").css({
		    width : 'calc((100vw - 56px) / 4)'
		});
		$(".nav-2").css({
			width : 'calc((100vw - 56px) / 4)'
		});
		$(".nav-3").css({
			width : 'calc((100vw - 56px) / 4)'
		});
		$(".nav-4").css({
			width : 'calc((100vw - 56px) / 4)'
		});
	}
	
}else {
	
}

var headerHeight = 122; // Height of the header in pixels
var headerHeightMobile = 162;
//Check if the element is in the viewport
function isElementInViewport(el) {
  var rect = el.getBoundingClientRect();
  
	// target_section1 요소의 위치 확인
	var targetSection1 = document.querySelector('.target_section1');
	
	// target_section2 요소의 위치 확인
	var targetSection2 = document.querySelector('.target_section2');
	
	 // target_section3 요소의 위치 확인
	var targetSection3 = document.querySelector('.target_section3');
	
	 // target_section4 요소의 위치 확인
	var targetSection4 = document.querySelector('.target_section4');
	if (screen.width < 767) {
		return (
			rect.bottom >= headerHeight &&
			rect.right >= 0 &&
			rect.top <= (window.innerHeight || document.documentElement.clientHeight) &&
			rect.left <= (window.innerWidth || document.documentElement.clientWidth)
		);
	} else {
		return (
			rect.bottom >= headerHeightMobile &&
			rect.right >= 0 &&
			rect.top <= (window.innerHeight || document.documentElement.clientHeight) &&
			rect.left <= (window.innerWidth || document.documentElement.clientWidth)
		);
	}
	 
}
//Function to add or remove the 'active' class based on visibility
function toggleActiveClass() {

    var title1btn = document.getElementById('title1btn');
    var title2btn = document.getElementById('title2btn');
    var title3btn = document.getElementById('title3btn');
    var title4btn = document.getElementById('title4btn');
    
	 // target_section1 요소의 위치 확인
   var targetSection1 = document.querySelector('.target_section1');

   // target_section2 요소의 위치 확인
   var targetSection2 = document.querySelector('.target_section2');
   
	 // target_section3 요소의 위치 확인
   var targetSection3 = document.querySelector('.target_section3');
   
	 // target_section4 요소의 위치 확인
   var targetSection4 = document.querySelector('.target_section4');
    
    
  if (isElementInViewport(targetSection1)) {
	  title1btn.classList.add('active');
  } else {
	  title1btn.classList.remove('active');
  }
  if (isElementInViewport(targetSection2)) {
	  title2btn.classList.add('active');
  } else {
	  title2btn.classList.remove('active');
  }
  if (isElementInViewport(targetSection3)) {
	  title3btn.classList.add('active');
  } else {
	  title3btn.classList.remove('active');
  }
  if (isElementInViewport(targetSection4)) {
	  title4btn.classList.add('active');
  } else {
	  title4btn.classList.remove('active');
  }
}
//Run the toggleActiveClass function on scroll and resize events
window.addEventListener('scroll', toggleActiveClass);
window.addEventListener('resize', toggleActiveClass);

//Initial check when the page loads
toggleActiveClass();
</script>

</html>