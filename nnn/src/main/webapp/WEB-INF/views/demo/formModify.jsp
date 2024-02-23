<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/alertcss.css?ver=0222">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demoheadercss.css?ver=0222">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demofootercss.css?ver=0222">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demoformcss.css?ver=0222">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/formmediacss.css?ver=0222">
<title>근무평가</title>
<style>
</style>
</head>
<body>
<div class="main normal">
<form id="frm" onsubmit="return false;">
	<jsp:include page="../demo/header.jsp"></jsp:include>
	
		<div class="info">
			<div>
				<div class="info_area">
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
					<div class="info_date light" >
						<span>입사일자 : <fmt:formatDate var="date" value="${info.reg_date }" pattern="yyyy. MM. dd" />${date}</span>
					</div>
				</div>
				
			</div>
		</div>
		<div class="target_info" id="targetInfo">
			<div class="target_text flex">
				<img src="${pageContext.request.contextPath}/resources/icon/ev/ok.png">
				<span class="bold">평가대상자를 확인 후 평가를 진행해주세요!</span>
			</div>
		</div>
		<div class="target_area">
			<div class="target">
				<div class="target_box">
					<table>
						<tr class="target_box_header">
							<td colspan="4">평가대상자</td>
						</tr>
						<tr class="target_box_1">
							<td>부서명</td><td>사원번호</td><td>직급</td><td>성명</td>
						</tr>
						<tr class="target_box_2">
							<td>${target.hspt_subname }</td><td>${target.id }</td><td>${target.hspt_position }</td>
							<td>
							<c:set var="targetfirstName" value="${fn:substring(target.name, 0, 1)}" />
	    						${targetfirstName }ㅇㅇ
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	
	<div class="section">
		<div class="container">
			<div class="content">
				<div class="scrollbase">
			<div class="area">
				<div class="bold area_header">섬김</div>
				<c:set var="index" value="1"/>
				<c:set var="a" value="1"/>
					<c:forEach items="${evf}" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '섬김' }"><p class="question bold">${status.count}. ${ev.d1}</p><br>
							<c:choose>
								<c:when test="${es eq 'AA'}">
									<!-- 부서장 1 ~ 11 문제 -->
										<p class="answer">
											<c:forEach items="${resultList}" var="t" >
											
											    <c:choose>
											        <c:when test="${t.index eq '1' and ev.idx eq 1 }">
											       		<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
								                    <c:when test="${t.index eq '2' and ev.idx eq 2}">
								                        <label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
												</c:choose>
											</c:forEach>	
										</p><br><br>
									</c:when>
									<c:when test="${es eq 'AB'}">
										<!-- 부서원 1 ~ 21 문제 -->
										
										<p class="answer">
											<c:forEach items="${resultList}" var="t">
											
											    <c:choose>
											        <c:when test="${t.index eq '1' and ev.idx eq 12 }">
											       
								                        <label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
								                    <c:when test="${t.index eq '2' and ev.idx eq 13}">
								                        <label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
								                    <c:when test="${t.index eq '3' and ev.idx eq 14}">
								                        <label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
								                    <c:when test="${t.index eq '4' and ev.idx eq 15}">
								                        <label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
								                    <c:when test="${t.index eq '5' and ev.idx eq 16}">
								                        <label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
								                    
								                    <c:when test="${t.index eq '6' and ev.idx eq 17}">
								                        <label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
								                    <c:when test="${t.index eq '7' and ev.idx eq 18}">
								                        <label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="a${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
												</c:choose>
											</c:forEach>
										</p><br><br>
									</c:when>
								</c:choose>
							</c:if>
						<c:set var="a" value="${a +1 }"/>
					</c:forEach>
				<div class="bold area_header">배움</div>
				<c:set var="b" value="1"/>
					<c:forEach items="${evf}" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '배움' }"><p class="question bold">${status.count}. ${ev.d1}</p><br>
							<c:choose>
								<c:when test="${es eq 'AA'}">
									<!-- 부서장 1 ~ 11 문제 -->
									<p class="answer">
										<c:forEach items="${resultList}" var="t">
										    <c:choose>
										        <c:when test="${t.index eq '3' and ev.idx eq 3 }">
							                        <label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="b${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="b${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="b${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">보통</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="b${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">미흡</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="b${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우미흡</span>
														</span>
													</label>
							                    </c:when>
							                    <c:when test="${t.index eq '4' and ev.idx eq 4 }">
							                        <label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="b${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="b${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="b${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">보통</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="b${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">미흡</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="b${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우미흡</span>
														</span>
													</label>
							                    </c:when>
											</c:choose>
										</c:forEach>
									</p><br><br>
								</c:when>
								<c:when test="${es eq 'AB'}">
									<!-- 부서원 1 ~ 21 문제 -->
										<p class="answer">
											<c:forEach items="${resultList}" var="t">
											    <c:choose>
											        <c:when test="${t.index eq '8' and ev.idx eq 19 }">
											       		<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
								                    <c:when test="${t.index eq '9' and ev.idx eq 20}">
								                        <label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
								                    <c:when test="${t.index eq '10' and ev.idx eq 21}">
								                        <label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
								                    <c:when test="${t.index eq '11' and ev.idx eq 22}">
								                        <label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="b${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
												</c:choose>
											</c:forEach>
										</p><br><br>
			                    </c:when>
							</c:choose>
						</c:if>
						<c:set var="b" value="${b +1 }"/>
					</c:forEach>
				<div class="bold area_header">키움</div>
				
				<c:set var="c" value="1"/>
					<c:forEach items="${evf}" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '키움' }"><p class="question bold">${status.count}. ${ev.d1}</p><br>
							<c:choose>
								<c:when test="${es eq 'AA'}">
									<p class="answer">
										<c:forEach items="${resultList}" var="t">
										    <c:choose>
										        <c:when test="${t.index eq '5' and ev.idx eq 5 }">
										        	<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="c${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="c${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="c${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">보통</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="c${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">미흡</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="c${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우미흡</span>
														</span>
													</label>
							                    </c:when>
							                    <c:when test="${t.index eq '6' and ev.idx eq 6 }">
							                        <label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="c${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="c${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="c${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">보통</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="c${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">미흡</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="c${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우미흡</span>
														</span>
													</label>
							                    </c:when>
											</c:choose>
										</c:forEach>
									</p><br><br>
								</c:when>
								<c:when test="${es eq 'AB'}">
									<!-- 부서원 1 ~ 21 문제 -->
										<p class="answer">
											<c:forEach items="${resultList}" var="t">
											
											    <c:choose>
											        <c:when test="${t.index eq '12' and ev.idx eq 23 }">
											       		<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
								                    <c:when test="${t.index eq '13' and ev.idx eq 24}">
								                        <label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
								                    <c:when test="${t.index eq '14' and ev.idx eq 25}">
								                        <label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
								                    <c:when test="${t.index eq '15' and ev.idx eq 26}">
								                        <label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}"value="우수"  <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
								                    <c:when test="${t.index eq '16' and ev.idx eq 27}">
								                        <label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="c${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
												</c:choose>
											</c:forEach>
										</p><br><br>
			                    </c:when>
							</c:choose>
						</c:if>
						<c:set var="c" value="${c +1 }"/>
					</c:forEach>
				<div class="bold area_header">나눔</div>
				<c:set var="d" value="1"/>
					<c:forEach items="${evf}" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '나눔' }"><p class="question bold">${status.count}. ${ev.d1}</p><br>
							<c:choose>
								<c:when test="${es eq 'AA'}">
									<p class="answer">
										<c:forEach items="${resultList}" var="t">
										    <c:choose>
										        <c:when test="${t.index eq '7' and ev.idx eq 7 }">
										        	<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">보통</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">미흡</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우미흡</span>
														</span>
													</label>
							                    </c:when>
							                    <c:when test="${t.index eq '8' and ev.idx eq 8 }">
							                    	<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">보통</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">미흡</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우미흡</span>
														</span>
													</label>
								                </c:when>
											</c:choose>
										</c:forEach>
									</p><br><br>
								</c:when>
								<c:when test="${es eq 'AB'}">
									<!-- 부서원 1 ~ 21 문제 -->
										<p class="answer">
											<c:forEach items="${resultList}" var="t">
											
											    <c:choose>
											        <c:when test="${t.index eq '17' and ev.idx eq 28 }">
											        	<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">보통</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">미흡</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우미흡</span>
														</span>
													</label>
								                    </c:when>
								                    <c:when test="${t.index eq '18' and ev.idx eq 29}">
								                    	<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">보통</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">미흡</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="d${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우미흡</span>
														</span>
													</label>
								                    </c:when>
												</c:choose>
											</c:forEach>
										</p><br><br>
			                    </c:when>
							</c:choose>
						</c:if>
						<c:set var="d" value="${d +1 }"/>
					</c:forEach>
				<div class="bold area_header">목표관리</div>
				<c:set var="e" value="1"/>
					<c:forEach items="${evf}" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '목표관리' }"><p class="question bold">${status.count}. ${ev.d1}</p><br>
							<c:choose>
								<c:when test="${es eq 'AA'}">
									<p class="answer">
										<c:forEach items="${resultList}" var="t">
										    <c:choose>
										        <c:when test="${t.index eq '9' and ev.idx eq 9 }">
										        	<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="e${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="e${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="e${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">보통</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="e${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">미흡</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="e${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우미흡</span>
														</span>
													</label>
							                    </c:when>
							                    <c:when test="${t.index eq '10' and ev.idx eq 10 }">
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="e${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="e${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">우수</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="e${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">보통</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="e${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">미흡</span>
														</span>
													</label>
													<label class="label">
														<span class="alignBox">
															<input class="radio" type="radio" name="e${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
											                <span class="radioimg"></span>
											                <span class="inputTxt">매우미흡</span>
														</span>
													</label>
							                    </c:when>
											</c:choose>
										</c:forEach>
									</p><br><br>
								</c:when>
								<c:when test="${es eq 'AB'}">
									<!-- 부서원 1 ~ 21 문제 -->
										<p class="answer">
											<c:forEach items="${resultList}" var="t">
											
											    <c:choose>
											        <c:when test="${t.index eq '19' and ev.idx eq 30 }">
											        	<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="e${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="e${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="e${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="e${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="e${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
									                    </c:when>
									                    <c:when test="${t.index eq '20' and ev.idx eq 31}">
									                        <label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="e${ev.idx}" value="매우우수" <c:if test="${t.var eq '매우우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="e${ev.idx}" value="우수" <c:if test="${t.var eq '우수' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">우수</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="e${ev.idx}" value="보통" <c:if test="${t.var eq '보통' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">보통</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="e${ev.idx}" value="미흡" <c:if test="${t.var eq '미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">미흡</span>
															</span>
														</label>
														<label class="label">
															<span class="alignBox">
																<input class="radio" type="radio" name="e${ev.idx}" value="매우미흡" <c:if test="${t.var eq '매우미흡' }">checked</c:if>/>
												                <span class="radioimg"></span>
												                <span class="inputTxt">매우미흡</span>
															</span>
														</label>
								                    </c:when>
												</c:choose>
											</c:forEach>
										</p><br><br>
			                    </c:when>
							</c:choose>
						</c:if>
						<c:set var="e" value="${e +1 }"/>
					</c:forEach>
				<div class="bold area_header"></div>
					<c:forEach items="${evf}" var="ev">
						<c:if test="${ev.d3 eq '주관식' }">
						<c:forEach items="${resultList}" var="t">
							<c:choose>
						        <c:when test="${t.index eq '11' and ev.idx eq 11 }">
						        	<table class="text-area-table">
										<tr class="text-area-tr1">
											<td><p class="question question-text bold">${ev.d1}</p></td>
										</tr>
										<tr class="text-area-tr2">
											<td>
											<textarea id="f${ev.idx }" name="f${ev.idx }" >${t.var }</textarea></td>
										</tr>
									</table>
								</c:when>
								<c:when test="${t.index eq '21' and ev.idx eq 32 }">
									<table class="text-area-table">
										<tr class="text-area-tr1">
											<td><p class="question question-text bold">${ev.d1}</p></td>
										</tr>
										<tr class="text-area-tr2">
											<td>
											<textarea id="f${ev.idx }" name="f${ev.idx }" >${t.var }</textarea></td>
										</tr>
									</table>
								</c:when>
							</c:choose>
						</c:forEach>
							
						</c:if>
					</c:forEach>
					<div class="end_area flex flex-center">
					<!--  -->
						<button class="end" id="end">
							평가완료
						</button>
					</div>
			</div>
			
		</div>
			</div>
			

		
		</div>
	</div>
	
	<jsp:include page="../demo/footer.jsp"></jsp:include>
	<input type="hidden" name="score" value="" id="score">
</form>
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
				<div class="btn modal_btn2" id="modal_insert" onclick="modal_insert()">
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
var form = document.getElementById("frm");
var scoreInput = document.getElementById("score");
const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const modal2 = document.querySelector('.modal2');
const modal3 = document.querySelector('.modal3');
const modal4 = document.querySelector('.modal4');
const msg = document.querySelector('.menu_msg');
const msg2 = document.querySelector('.menu_msg2');
const msg3 = document.querySelector('.menu_msg3');
const msg4 = document.querySelector('.menu_msg4');
const modal_submit = document.getElementById("modal_insert");
//문제유형
var ev = "${ev}";
console.log(ev);
$("#end").click(function() {
	// 답안 체크
	var a1 = $('input[name=a1]').is(":checked");
	var a2 = $('input[name=a2]').is(":checked");
	var b3 = $('input[name=b3]').is(":checked");
	var b4 = $('input[name=b4]').is(":checked");
	var c5 = $('input[name=c5]').is(":checked");
	var c6 = $('input[name=c6]').is(":checked");
	var d7 = $('input[name=d7]').is(":checked");
	var d8 = $('input[name=d8]').is(":checked");
	var e9 = $('input[name=e9]').is(":checked");
	var e10 = $('input[name=e10]').is(":checked");
	var f11 = $("#f11").val();
	
	var a12 = $('input[name=a12]').is(":checked");
	var a13 = $('input[name=a13]').is(":checked");
	var a14 = $('input[name=a14]').is(":checked");
	var a15 = $('input[name=a15]').is(":checked");
	var a16 = $('input[name=a16]').is(":checked");
	var a17 = $('input[name=a17]').is(":checked");
	var a18 = $('input[name=a18]').is(":checked");
	var b19 = $('input[name=b19]').is(":checked");
	var b20 = $('input[name=b20]').is(":checked");
	var b21 = $('input[name=b21]').is(":checked");
	var b22 = $('input[name=b22]').is(":checked");
	var c23 = $('input[name=c23]').is(":checked");
	var c24 = $('input[name=c24]').is(":checked");
	var c25 = $('input[name=c25]').is(":checked");
	var c26 = $('input[name=c26]').is(":checked");
	var c27 = $('input[name=c27]').is(":checked");
	var d28 = $('input[name=d28]').is(":checked");
	var d29 = $('input[name=d29]').is(":checked");
	var e30 = $('input[name=e30]').is(":checked");
	var e31 = $('input[name=e31]').is(":checked");
	var f32 = $("#f32").val();

	// AA
	var g1 = $('input[name=a1]:checked').val();
	var g2 = $('input[name=a2]:checked').val();
	var g3 = $('input[name=b3]:checked').val();
	var g4 = $('input[name=b4]:checked').val();
	var g5 = $('input[name=c5]:checked').val();
	var g6 = $('input[name=c6]:checked').val();
	var g7 = $('input[name=d7]:checked').val();
	var g8 = $('input[name=d8]:checked').val();
	var g9 = $('input[name=e9]:checked').val();
	var g10 = $('input[name=e10]:checked').val();
	// AB
	var k1 = $('input[name=a12]:checked').val();
	var k2 = $('input[name=a13]:checked').val();
	var k3 = $('input[name=a14]:checked').val();
	var k4 = $('input[name=a15]:checked').val();
	var k5 = $('input[name=a16]:checked').val();
	var k6 = $('input[name=a17]:checked').val();
	var k7 = $('input[name=a18]:checked').val();
	var k8 = $('input[name=b19]:checked').val();
	var k9 = $('input[name=b20]:checked').val();
	var k10 = $('input[name=b21]:checked').val();
	var k11 = $('input[name=b22]:checked').val();
	var k12 = $('input[name=c23]:checked').val();
	var k13 = $('input[name=c24]:checked').val();
	var k14 = $('input[name=c25]:checked').val();
	var k15 = $('input[name=c26]:checked').val();
	var k16 = $('input[name=c27]:checked').val();
	var k17 = $('input[name=d28]:checked').val();
	var k18 = $('input[name=d29]:checked').val();
	var k19 = $('input[name=e30]:checked').val();
	var k20 = $('input[name=e31]:checked').val();
	
	function mapValueToScore(value) {
	    switch (value) {
	        case '매우우수':
	            return 5;
	        case '우수':
	            return 4;
	        case '보통':
	            return 3;
	        case '미흡':
	            return 2;
	        case '매우미흡':
	            return 1;
	        default:
	            return 0; 
	    }
	}
	function mapValueToScore2(value) {
	    switch (value) {
	        case '매우우수':
	            return 10;
	        case '우수':
	            return 8;
	        case '보통':
	            return 6;
	        case '미흡':
	            return 4;
	        case '매우미흡':
	            return 2;
	        default:
	            return 0; 
	    }
	}
	
	var sumAA = mapValueToScore2(g1) + mapValueToScore2(g2) + mapValueToScore2(g3) + mapValueToScore2(g4) + mapValueToScore2(g5) + mapValueToScore2(g6) + mapValueToScore2(g7) + mapValueToScore2(g8) + mapValueToScore2(g9) + mapValueToScore2(g10);
	var sumAB = mapValueToScore(k1) + mapValueToScore(k2) + mapValueToScore(k3) + mapValueToScore(k4) + mapValueToScore(k5) + mapValueToScore(k6) + mapValueToScore(k7) + mapValueToScore(k8) + mapValueToScore(k9) + mapValueToScore(k10) + mapValueToScore(k11) + mapValueToScore(k12) + mapValueToScore(k13) + mapValueToScore(k14) + mapValueToScore(k15) + mapValueToScore(k16) + mapValueToScore(k17) + mapValueToScore(k18) + mapValueToScore(k19) + mapValueToScore(k20);
	
	// 문제유형으로 나누기
	// A, B, C 인 경우와 D인 경우
	if(ev == 'A' || ev == 'B' || ev == 'C'){
		if(!a1 || !a2 || !b3 || !b4 || !c5 || !c6 || !d7 || !d8 || !e9 || !e10 || $.trim(f11) === ''){
			console.log(a1);console.log(a2);console.log(b3);console.log(b4);console.log(c5);console.log(c6);
			console.log(d7);console.log(d8);console.log(e9);console.log(e10);console.log(f11);
			
			
			//alert("현재 답변하지 않은 평가가 있습니다. \n확인해주세요.");

			modal.classList.toggle('show');
		 	msg.style.top = '34%';
			msg.innerHTML = '<p>현재 답변하지 않은 평가가 있습니다.</p><p>확인해주세요.</p>'
			if (modal.classList.contains('show')) {
				body.style.overflow = 'hidden';
			}
			return false;
		}else {
			modal3.classList.toggle('show');
		 	msg3.style.top = '34%';
			msg3.innerHTML = '<p>${targetfirstName }ㅇㅇ 님의 평가 예상점수는 '+sumAA+'점입니다.</p><p>평가완료를 하시겠습니까?</p>'
			if (modal3.classList.contains('show')) {
				body.style.overflow = 'hidden';
			}

			modal_submit.addEventListener("click", function() {
				if (modal3.classList.contains('show')) {
					body.style.overflow = 'hidden';
				}
				score.value = sumAA;
// 				form.action = "${pageContext.request.contextPath}/demo/formUpdate/${info.idx}/${target.idx}/${team}";
// 				form.submit();
				$.ajax({
					url: '${pageContext.request.contextPath}/demo/formUpdate/${info.idx}/${target.idx}/${team}',
					type: 'post',
					dataType: 'json',
					data: {
						"a1"  : g1,
						"a2"  : g2,
						"b3"  : g3,
						"b4"  : g4,
						"c5"  : g5,
						"c6"  : g6,
						"d7"  : g7,
						"d8"  : g8,
						"e9"  : g9,
						"e10" : g10,
						"f11" : f11,
						"score" : sumAA
					},
					success : function (response) {
						res = response.result;
						if(res == "Y") {
							// 평가 완료
							modal3.classList.toggle('show');
							modal2.classList.toggle('show');
							msg2.innerHTML = '<p>수정이 완료되었습니다.</p>';
							if (modal2.classList.contains('show')) {
								body.style.overflow = 'hidden';
							}
							$(".btn").attr("onclick", "endlink()");
						} else if (res == "N") {
							// 평가 오류
							modal3.classList.toggle('show');
							modal2.classList.toggle('show');
							msg2.innerHTML = '<p>평가 수정 중 오류가 발생하였습니다.</p><p>다시 시도해주세요.</p>';
							if (modal2.classList.contains('show')) {
								body.style.overflow = 'hidden';
							}
							$(".btn").attr("onclick", "endlink()");
						} 
					},
					error : function(error) {
						console.error('Error fetching data :' ,error);
						modal3.classList.toggle('show');
						modal2.classList.toggle('show');
						msg2.innerHTML = '<p>평가 수정 중 오류가 발생하였습니다.</p><p>다시 시도해주세요.</p>';

						$(".btn").attr("onclick", "endlink()");
					}
				});
			});
		}
	}else {
		if(!a12 || !a13 || !a14 || !a15 || !a16 || !a17 || !a18 || 
				!b19 || !b20 || !b21 || !b22 || 
				!c23 || !c24 || !c25 || !c26 || !c27 ||
				!d28 || !d29|| !e30|| !e31 ||				
				$.trim(f32) === ''){
//			alert("현재 답변하지 않은 평가가 있습니다. \n확인해주세요.");
			modal2.classList.toggle('show');
			msg2.innerHTML = '<p>현재 답변하지 않은 평가가 있습니다.</p><p>확인해주세요.</p>'
			if (modal2.classList.contains('show')) {
				body.style.overflow = 'hidden';
			}
			
			return false;
		} else {
// 			if(window.confirm("${targetfirstName }ㅇㅇ 님의 평가 예상점수는 "+sumAB+"점입니다.\n평가완료를 하시겠습니까?")){
// 				score.value = sumAB;
// 				form.action = "${pageContext.request.contextPath}/demo/formUpdate/${info.idx}/${target.idx}/${team}";
// 				form.submit();
// 				// 뒤로가기 버튼 비활성화
// 				window.history.pushState(null, null, window.location.href);
// 				window.onpopstate = function(event) {
// 				    window.history.pushState(null, null, window.location.href);
// 				};
// 			}
			modal3.classList.toggle('show');
			msg3.innerHTML = '<p>${targetfirstName }ㅇㅇ 님의 평가 예상점수는 '+sumAB+'점입니다.</p><p>평가완료를 하시겠습니까?</p>'
			if (modal3.classList.contains('show')) {
				body.style.overflow = 'hidden';
			}

			modal_submit.addEventListener("click", function() {
				if (modal3.classList.contains('show')) {
					body.style.overflow = 'hidden';
				}
				score.value = sumAB;
// 				form.action = "${pageContext.request.contextPath}/demo/formUpdate/${info.idx}/${target.idx}/${team}";
// 				form.submit();
				$.ajax({
					url: '${pageContext.request.contextPath}/demo/formUpdate/${info.idx}/${target.idx}/${team}',
					type: 'post',
					dataType: 'json',
					data: {
						"a12"  : k1,
						"a13"  : k2,
						"a14"  : k3,
						"a15"  : k4,
						"a16"  : k5,
						"a17"  : k6,
						"a18"  : k7,
						"b19"  : k8,
						"b20"  : k9,
						"b21"  : k10,
						"b22"  : k11,
						"c23"  : k12,
						"c24"  : k13,
						"c25"  : k14,
						"c26"  : k15,
						"c27"  : k16,
						"d28"  : k17,
						"d29"  : k18,
						"e30"  : k19,
						"e31"  : k20,
						"f32"  : f32,
						"score" : sumAB
					},
					success : function (response) {
						res = response.result;
						if(res == "Y") {
							// 평가 완료
							modal3.classList.toggle('show');
							modal2.classList.toggle('show');
							msg2.innerHTML = '<p>수정이 완료되었습니다.</p>';
							if (modal2.classList.contains('show')) {
								body.style.overflow = 'hidden';
							}
							$(".btn").attr("onclick", "endlink()");
						} else if (res == "N") {
							// 평가 오류
							modal3.classList.toggle('show');
							modal2.classList.toggle('show');
							msg2.innerHTML = '<p>평가 수정 중 오류가 발생하였습니다.</p><p>다시 시도해주세요.</p>';
							if (modal2.classList.contains('show')) {
								body.style.overflow = 'hidden';
							}
							$(".btn").attr("onclick", "endlink()");
						} 
					},
					error : function(error) {
						console.error('Error fetching data :' ,error);
						modal3.classList.toggle('show');
						modal2.classList.toggle('show');
						msg2.innerHTML = '<p>평가 수정 중 오류가 발생하였습니다.</p><p>다시 시도해주세요.</p>';

						$(".btn").attr("onclick", "endlink()");
					}
				});
			});
		}
	}
	
	
});


function closePopup(){
	modal.classList.toggle('show');
	if (!modal.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}
function closePopup2(){
	modal2.classList.toggle('show');
	if (!modal2.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}
function closePopup3(){
	modal3.classList.toggle('show');
	if (!modal3.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}
function closePopup4(){
	modal4.classList.toggle('show');
	if (!modal4.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
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

function link() {
	var link = "${pageContext.request.contextPath}/demo/Info/${info.idx}";
	location.href = link;
}
function endlink() {
	var link = "${pageContext.request.contextPath}/demo/FormEnd/${info.idx}/${target.idx}";
	location.href = link;
}
/* 
$(document).ready(function(){ 
    window.onbeforeunload = function(){
        doExit();
    };
});

function doExit(){
    event.returnValue = '"페이지를 벗어 나시겠습니까?"';
}
 */
/* 
var next = document.querySelector(".next");
var prev = document.querySelector(".prev");
var progress = document.querySelector("#progress");
next.addEventListener("click", NextPage);
prev.addEventListener("click", PrevPage)
function NextPage() {
	progress.value = progress.value + 10;
	console.log(progress.value);
}
function PrevPage() {
	progress.value = progress.value - 10;
	console.log(progress.value);
}
 */


</script>	
</div>
</body>
</html>