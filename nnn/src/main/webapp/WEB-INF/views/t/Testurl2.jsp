<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>

<style>

/* 
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}
 */
 
 /* GOOGLE FONTS */
@media print {
    .l-navbar { display:none; }
    .noprint { display: none; }
}
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap");

/* VARIABLES CSS */
:root {
    --nav--width: 145px;

    /* Colores */
    --first-color: #035397;
    --bg-color: #08254c;
    --sub-color: #2b93a8;
    --white-color: #fff;

    /* Fuente y tipografia */
    --body-font: 'Poppins', sans-serif;
    --normal-font-size: 1rem;
    --small-font-size: .875rem;

    /* z index */
    --z-fixed: 100;
}

/* BASE */
*, ::before, ::after {
    box-sizing: border-box;
}
:focus {
	outline : none;
}
.nav::-webkit-scrollbar {
    display: none;
}
/* 
.nav::-webkit-scrollbar-thumb {
    height: 30%; /* 스크롤바의 길이 */
/*    background: #0a4b73; /* 스크롤바의 색상 */
 /*   border-radius: 10px;
}

.nav::-webkit-scrollbar-track {
    background: rgba(33, 122, 244, .1);  /*스크롤바 뒷 배경 색상*/
/*} */
body {
    position: relative;
    margin: 0;
    /* padding: 2rem 0 0 6.75rem; */
    font-family: var(--body-font);
    font-size: var(--normal-font-size);
    transition: .5s; 
    height: 99vh;/*
    width: calc(100vw - 293px); */
}

h1 {
    margin: 0;
}

ul {
    margin: 0;
    padding: 0;
    list-style: none;
}

a {
    text-decoration: none;
}

/* l NAV */
.l-navbar {
    position: fixed;
    top: 80px;
    left: 0;
    width: var(--nav--width);
    height: calc(100% - 64.14px - 80px);
    background-color: var(--bg-color);
    color: var(--white-color);
    padding: 1.5rem 1.5rem 10px;	/* 위, 오른쪽 왼쪽, 아래 순서 */
    transition: .5s;
    z-index: var(--z-fixed);
    
}

/* NAV */
.nav {
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
   /* overflow: hidden; */
	overflow-y: scroll;
	-ms-overflow-style: none; /* for Internet Explorer, Edge */
	scrollbar-width: none; /* for Firefox */
}

.nav__brand {
    display: grid;
    grid-template-columns: max-content max-content;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
}

.nav__toggle {
    font-size: 1.25rem;
    padding: .75rem;
    cursor: pointer;
}

.nav__logo {
    color: var(--white-color);
    font-weight: 600;
    font-size: 1.8rem;		/* 폰트사이즈 키움 */
}

.nav__link {
    display: grid;
    grid-template-columns: max-content max-content;
    align-items: center;
    column-gap: .75rem;
    padding: .75rem;
    color: var(--white-color);
    border-radius: .5rem;
    margin-bottom: 1rem;
    transition: .3s;
    cursor: pointer;
    /* hover , active 시 오른쪽이 밀리는 현상 때문에 width 추가 */
/*     width: 92%; */
}

.nav__link2 {
    display: grid;
    grid-template-columns: max-content max-content;
    align-items: center;
    column-gap: .75rem;
    padding: .75rem;
    color: var(--white-color);
    border-radius: .5rem;
    margin-bottom: 1rem;
    transition: .3s;
    cursor: default;
    /* hover , active 시 오른쪽이 밀리는 현상 때문에 width 추가 */
/*     width: 92%; */
}
.nav__link:hover {
    background-color: var(--first-color);
}

.nav__icon {
    font-size: 1.25rem;
}

.nav_name {
    font-size: var(--normal-font-size);
}
.nav__name2{
	font-size: 1.4rem;	
}
.nav_subname {
    font-size: var(--small-font-size);
    color: #A7ABB1;
}

/* Expander menu */
.expander {
    width: calc(var(--nav--width) + 9.25rem);
}

/* Add padding body*/
.body-pd {
    /* padding: 2rem 0 0 16rem; */
    padding: 0 0 0 0;
}

/* Active links menu */
.active {
    background-color: var(--first-color);
}

/* COLLAPSE */
.collapse {
    grid-template-columns: 20px max-content 1fr;
}

.collapse__link {
    justify-self: flex-end;
    transition: .5;
}

.collapse__menu {
    display: none;
    padding: .75rem 2.25rem;
}

.collapse__sublink {
    color: var(--sub-color);
    font-size: var(--small-font-size);
}

.collapse__sublink:hover {
    color: var(--white-color);
}

/* Show collapse */
.showCollapse {
    display: block;
}

/* Rotate icon */
.rotate {
    transform: rotate(180deg);
    transition: .5s;
}
</style>
</head>
<body id="body-pd" class="">
	<div style="background-color: var(--bg-color); color: var(--white-color); padding: 1.5rem 1.5rem 10px; padding-left: 33px;
    transition: .5s; z-index: 101; position: fixed; width: calc(var(--nav--width) + 9.25rem); top: 0; left: 0; height: 80px;">
		<div style="display: flex; justify-content: space-between;">
			<div style="width: 100%;">
				<div class="nav__brand" style="">
					<a href="#" class="nav__logo" onclick="window.location.reload()">Core Hospital</a>
					<div style="/* position: fixed; top: 80px; left: calc(var(--nav--width) + 9.25rem - 48px); */ color: #fff; z-index: 102; cursor: pointer;" id="toggleButton" >
						<img style="width:25px;" id="playPauseIcon" src="${pageContext.request.contextPath}/resources/icon/stop.png">
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<!-- 버튼 클릭으로 자동 재생 일시정지 및 재개 -->
	
	<div class="l-navbar expander" id="navbar">
		<nav class="nav" style="">
			<div style="width: 100%;">
			<!-- 
				<div class="nav__brand">
					<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
					<a href="#" class="nav__logo">Core Hospital</a>
				</div>
				 -->
				<div class="nav__list">
					<a href="#" class="nav__link active" style="margin-bottom: 0;" data-menu="googleSheetWeb">
					<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">병실현황 Total VIEW</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="googleSheetSubMenu1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;재원현황 목표</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="googleSheetSubMenu2">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;최근7일간 입원 환자 수</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="googleSheetSubMenu3">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;병동&의료진별 재원현황</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="googleSheetSubMenu4">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;보험유형&재원일수기준 재원현황</span>
					</a>
					<a href="#" class="nav__link" data-menu="googleSheetSubMenu5">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;연령 및 남여성비 현황</span>
					</a>
					<!-- 구분 st -->
					<div style="border-top:1px solid #fff; margin-bottom: 16px; margin-top: 16px;"></div>
					<!-- 구분 ed -->
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="googleSheetweb3">
                        <!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
                        <span class="nav_name">재원환자통계 VIEW</span>
                    </a>
                    <a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="googleSheetweb4">
                        <!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
                        <span class="nav_subname">&nbsp;&nbsp;병실별 입원현황 VIEW (B-type)</span>
                    </a>
                    <a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="googleSheetweb5">
                        <!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
                        <span class="nav_subname">&nbsp;&nbsp;병실별 입원현황 VIEW (C-type)</span>
                    </a>
                    
                    <!-- 구분 st -->
					<div style="border-top:1px solid #fff; margin-top: 16px;"></div>
					<!-- 구분 ed -->
					<a href="#" class="nav__link2" style="margin-bottom: 0; grid-template-columns: auto; justify-content: space-evenly;" data-menu="harsMain2">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav__name2 nav_name">HARS</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsMain1">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">병상가동률</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0; " data-menu="harsMain2">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">환자분류군</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub2_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;환자분류군 분포(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub2_2">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;환자분류군 분포(병동별)</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0;" data-menu="harsMain3">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">양방진료</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub3_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;의료진별 매출(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub3_2">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;병동별 매출(월별)</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0;" data-menu="harsMain4">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">일당진료비</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub4_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;병동별 일당진료비(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub4_2">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;병동별 일당진료비 상/하위(20%)</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0;" data-menu="harsMain5">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">비급여</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub5_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;비급여 매출(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub5_2">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;비급여 매출(병동별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub5_3">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;비급여 매출(양방의료진)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub5_4">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;비급여 매출(한방의료진)</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0;" data-menu="harsMain6">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">한방진료</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub6_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;의료진별 매출(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub6_2">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;치료수가별 매출(의료진별) -1</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub6_3">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;치료수가별 매출(의료진별) -2</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub6_4">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;병동별 매출(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub6_5">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;치료수가별 매출(병동별) -1</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub6_6">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;치료수가별 매출(병동별) -2</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0;" data-menu="harsMain7">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">재활치료</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub7_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;재활치료 매출(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub7_2">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;재활치료 환자 1인당 지표(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub7_3">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;치료사별 실적</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0;" data-menu="harsMain8">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">작업치료</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub8_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;작업치료 매출(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub8_2">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;작업치료 환자 1인당 지표(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub8_3">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;치료사별 실적</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0;" data-menu="harsMain9">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">인공신장실</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub9_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;투석 환자수 현황(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub9_2">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;투석 시행 현황(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub9_3">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;투석 치료 매출 현황(월별)</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0;" data-menu="harsMain10">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">외래</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub10_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;외래 진료 월별 현황(형태별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub10_2">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;외래 진료 현황(의료진별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub10_3">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;외래 진료 현황 (형태별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub10_4">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;외래 진료 월별 현황(의료진별)</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0;" data-menu="harsMain11">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">EKG</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub11_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;청구 건수 및 매출 현황(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub11_2">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;청구 건수 및 매출 현황(병동별)</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0;" data-menu="harsMain12">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">고빈도흉벽진동요법(토닥이)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub12_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;청구금액 및 청구율 현황(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub12_2">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;청구금액 및 청구율 현황(병동별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub12_3">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;청구금액 및 청구율 현황(의료진별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub12_4">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;폐렴환자 토닥이 시행 현황(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub12_5">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;폐렴환자 토닥이 시행 현황(병동별)</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0;" data-menu="harsMain13">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">특정환자</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub13_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;병동별 특정환자 현황(월별)</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0;" data-menu="harsMain14">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">특정기간 검사</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub14_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;특정기간 검사 수가 현황(의료진별)</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0;" data-menu="harsMain15">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">항정신성의약품</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub15_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;의료진별 처방 현황(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub15_2">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;항정신성의약품별 사용량 현황</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0;" data-menu="harsMain16">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">다종처방</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub16_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;의료진별 일일평균 처방 현황</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0;" data-menu="harsMain17">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">진료비감면</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub17_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;진료비 감면율 현황</span>
					</a>
					
					<a href="#" class="nav__link2" style="margin-bottom: 0;" data-menu="harsMain18">
						<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">진료비미수</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub18_1">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;재원환자 미수 현황</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub18_2">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;퇴원환자 미수 현황</span>
					</a>
					
					
					<!-- 구분 st -->
                    <div style="border-top:1px solid #fff; margin-bottom: 16px; margin-top: 16px;"></div>
                    <!-- 구분 ed -->
                    <!-- 
                    <a href="#" class="nav__link"  style="margin-top:16px; " data-menu="googleSheetimg4">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">이미지 예3 (최종)</span>
                    </a>
                    <a href="#" class="nav__link" data-menu="showGoogleSheetaa1">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">웹게시 예</span>
                    </a>
                     -->
                    
                    
                     
                    
                    
                    <!-- 
                    <div href="#" class="nav__link collapse">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Projects</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="#" class="collapse__sublink">Data</a>
                            <a href="#" class="collapse__sublink">Group</a>
                            <a href="#" class="collapse__sublink">Members</a>
                        </ul>
                    </div> -->
<!-- 
                    <a href="#" class="nav__link">
                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Analytics</span>
                    </a>

                    <div href="#" class="nav__link collapse">
                        <ion-icon name="people-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Team</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="#" class="collapse__sublink">Data</a>
                            <a href="#" class="collapse__sublink">Group</a>
                            <a href="#" class="collapse__sublink">Members</a>
                        </ul>
                    </div>

                    <a href="#" class="nav__link">
                        <ion-icon name="settings-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Settings</span>
                    </a>	-->
                </div>
                <!--
                <a href="#" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">Log out</span>
                </a> -->
            </div>
        </nav>
    </div>
	<div class="nav__link2" style="margin: 0; position: fixed; bottom: 0; width: calc(var(--nav--width) + 9.25rem); background-color: #08254c; z-index: 100;
	display: flex; justify-content: space-evenly; left: 0; align-items: center; border-radius: 0;">
		<div style="display: flex; justify-content: center;">
			<img style="width: 90%;" src="<%=request.getContextPath() %>/resources/img/core_logo.png">
		</div>
	</div>
			<!-- 나머지 컨텐츠 -->
			<main id="main-content" 
			style="width : calc(100vw - (var(--nav--width) + 9.25rem)); height : 100%; margin-left: calc(var(--nav--width) + 9.25rem);">
				<!-- 내용을 이곳에 추가 -->
				<!-- class="col-md-9 ms-sm-auto col-lg-10 px-md-4"  -->
			</main>
			<%-- <div class="noprint" style="background-color: #ddd;  height: 50px; width: calc(100vw - 286px);
			position: fixed; bottom: 0px; left: 293px; display: flex; align-items: center; z-index: 98"></div>
			<div class="noprint" style="background-color: rgba(60,64,67,.15);  height: 50px; width: calc(100vw - 286px); 
			position: fixed; bottom: 0px; left: 293px; display: flex; align-items: center; z-index: 99">
				
				<div class="container text-center">
					<div class="row">
						<div class="col" style="align-items: center; display: flex; justify-content: center;">
						<img src="${pageContext.request.contextPath}/resources/icon/pdf-icon.png" style="height: 43px;">
						<span>저장</span>
						</div>
						<div class="col"  style="align-items: center; display: flex; justify-content: center;">
						<img src="${pageContext.request.contextPath}/resources/icon/print-icon.png" style="height: 43px;">
						<span>인쇄</span>
						</div>
						<div class="col"></div>
						<div class="col"></div>
						<div class="col"></div>
						<div class="col"  style="align-items: center; display: flex; justify-content: center;">
						<img src="${pageContext.request.contextPath}/resources/icon/logout-icon.png" style="height: 43px;">
						<span>로그아웃</span>
						</div>
					</div>
				</div>
				
			</div> --%>
	<script>
	
	/* EXPANDER MENU *//* 
	const showMenu = (toggleId, navbarId, bodyId) => {
	    const toggle = document.getElementById(toggleId),
	    navbar = document.getElementById(navbarId),
	    bodypadding = document.getElementById(bodyId)

	    if( toggle && navbar ) {
	        toggle.addEventListener('click', ()=>{
	            navbar.classList.toggle('expander');

	            bodypadding.classList.toggle('body-pd')
	        })
	    }
	}

	showMenu('nav-toggle', 'navbar', 'body-pd')
 */
	/* LINK ACTIVE */
	/* 
	const linkColor = document.querySelectorAll('.nav__link')
	let currentMenuIndex = 0; // 현재 메뉴 인덱스
	function colorLink() {
	    linkColor.forEach(l=> l.classList.remove('active'))
	    this.classList.add('active')
	}
	linkColor.forEach(l=> l.addEventListener('click', colorLink))
	
	 */
	 
	const menuLinks = document.querySelectorAll('.nav__link'); // 메뉴 링크 요소들
	let currentMenuIndex = 0; // 현재 메뉴 인덱스
	
	let isScriptActive = true; // 스크립트의 활성화 상태를 나타내는 변수
	let lastMenuVisited = false; // 사용자가 마지막 메뉴를 방문했는지 여부를 나타내는 변수
	let inactiveTime = 0; // 페이지 비활성 시간을 나타내는 변수
	let timer = null; // 타이머 변수
	let lastMenuVisitTime = 0;
	
	
	
	/* 키보드로 메뉴 이동 */
	
	/* 키보드 방향키 입력 이벤트 리스너 */
	document.addEventListener('keydown', function(event) {
		if (event.key === 'ArrowUp') {
			// 위쪽 방향키를 누르면 이전 메뉴로 이동
			event.preventDefault();
			goToPreviousMenu();
//			navigateMenu('prev');
		}else if (event.key === 'ArrowDown') {
			// 아래쪽 방향키를 누르면 다음 메뉴로 이동
			event.preventDefault();
			goToNextMenu();
//			navigateMenu('next');
		}
	});
	
	/* 이전 메뉴로 이동하는 함수 */
	function goToPreviousMenu(){
		if (currentMenuIndex > 0) {
			currentMenuIndex--;
			activateMenu(currentMenuIndex);
//			scrollToSelectedMenu();
		}
	}
	
	/* 다음 메뉴로 이동하는 함수 */
	function goToNextMenu(){
		if (currentMenuIndex < menuLinks.length - 1) {
			currentMenuIndex++;
			activateMenu(currentMenuIndex);
//			scrollToSelectedMenu();
		}
	}
	
	/* 메뉴 활성화 및 해당 스크립트 실행 함수 */
	
	/* COLLAPSE MENU */
	const linkCollapse = document.getElementsByClassName('collapse__link')
	var i

	for(i=0;i<linkCollapse.length;i++) {
	    linkCollapse[i].addEventListener('click', function(){
	        const collapseMenu = this.nextElementSibling
	        collapseMenu.classList.toggle('showCollapse')

	        const rotate = collapseMenu.previousElementSibling
	        rotate.classList.toggle('rotate')
	    });
	}
	
		const mainContent = document.getElementById('main-content');
		
		// 키보드로 이동하기 위해 클릭 리스너 재설정
		menuLinks.forEach(link => {
			link.addEventListener('click', function(event){
				event.preventDefault();
				currentMenuIndex = Array.from(menuLinks).indexOf(this);	// 클린된 메뉴의 인덱스를 업데이트
				activateMenu(currentMenuIndex);
				
			});
		});
		function googleSheetweb2() {
			const iframe = document.createElement('iframe');
			iframe.src = 'https://docs.google.com/presentation/d/e/2PACX-1vQEWIf82Ut4WgB7UgcOqdtnboQccUr9pFJTEs1i7LLc3pgVbvpEEPAvYh6NGkzYgBgXWwiXnmmzRsuL/embed?start=false&loop=false&delayms=3000'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
	//		iframe.width = '100%';
	//		iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.style.width = '100%';
			iframe.style.height = '100%';
			iframe.allowfullscreen="true" ;
			iframe.mozallowfullscreen="true";
			iframe.webkitallowfullscreen="true";
			iframe.allowfullscreen = true;
			  
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		function showGoogleSheetWebView() {
			const iframe = document.createElement('iframe');
			iframe.src = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR6JOk436AoXyveEv4VWOQ5CrbgL3orbrEysB9rQnY5BGLMpmii72CuJVKUTst_TZrRnFmMJyhzqCrM/pubhtml'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.width = '100%';
			iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 재원현황 목표
		function showGoogleSheetSubMenu1() {
			const iframe = document.createElement('iframe');
			iframe.src = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR6JOk436AoXyveEv4VWOQ5CrbgL3orbrEysB9rQnY5BGLMpmii72CuJVKUTst_TZrRnFmMJyhzqCrM/pubhtml?gid=729631478&single=true'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.width = '100%';
			iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.allowfullscreen = true;
			
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 최근7일간입원환자 수
		function showGoogleSheetSubMenu2() {
			const iframe = document.createElement('iframe');
			iframe.src = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR6JOk436AoXyveEv4VWOQ5CrbgL3orbrEysB9rQnY5BGLMpmii72CuJVKUTst_TZrRnFmMJyhzqCrM/pubhtml?gid=2068231873&single=true'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.width = '100%';
			iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.allowfullscreen = true;
			
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 병동&의료진별 재원현황
		function showGoogleSheetSubMenu3() {
			const iframe = document.createElement('iframe');
			iframe.src = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR6JOk436AoXyveEv4VWOQ5CrbgL3orbrEysB9rQnY5BGLMpmii72CuJVKUTst_TZrRnFmMJyhzqCrM/pubhtml?gid=354748894&single=true'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.width = '100%';
			iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.allowfullscreen = true;
			
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 보험유형&재원일수기준 재원현황
		function showGoogleSheetSubMenu4() {
			const iframe = document.createElement('iframe');
			iframe.src = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR6JOk436AoXyveEv4VWOQ5CrbgL3orbrEysB9rQnY5BGLMpmii72CuJVKUTst_TZrRnFmMJyhzqCrM/pubhtml?gid=2104170411&single=true'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.width = '100%';
			iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.allowfullscreen = true;
			
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 연령 및 남여성비 현황
		function showGoogleSheetSubMenu5() {
			const iframe = document.createElement('iframe');
			iframe.src = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR6JOk436AoXyveEv4VWOQ5CrbgL3orbrEysB9rQnY5BGLMpmii72CuJVKUTst_TZrRnFmMJyhzqCrM/pubhtml?gid=116728830&single=true'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.width = '100%';
			iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.allowfullscreen = true;
			
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		
		 // 이미지 예 최종
		function showGoogleSheetimg4(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/test/111.png'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 웹게시 예
		function showGoogleSheetaa1() {
			const iframe = document.createElement('iframe');
			iframe.src = "https://docs.google.com/presentation/d/e/2PACX-1vQEWIf82Ut4WgB7UgcOqdtnboQccUr9pFJTEs1i7LLc3pgVbvpEEPAvYh6NGkzYgBgXWwiXnmmzRsuL/embed?start=true&loop=true&delayms=3000"; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = '100vh';
			iframe.style.width = "100%";
			iframe.frameborder = '0';
			iframe.allowfullscreen="true";
			iframe.mozallowfullscreen="true";
			iframe.webkitallowfullscreen="true";
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		 // 병상가동율
		function harsMain1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0003.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		 // 환자분류군 - 환자분류군 분포(월별)
		function harsSub2_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0004.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 환자분류군 - 환자분류군 분포(병동별)
		function harsSub2_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0005.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 양방진료 - 의료진별 매출(월별)
		function harsSub3_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0006.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 양방진료 - 병동별 매출(월별)
		function harsSub3_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0007.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 일당진료비 - 병동별 일당진료비(월별)
		function harsSub4_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0008.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 일당진료비 - 병동별 일당진료비 상/하위(20%) 
		function harsSub4_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0009.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 비급여 - 비급여 매출(월별) 
		function harsSub5_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0010.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 비급여 - 비급여 매출(병동별)
		function harsSub5_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0011.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 비급여 - 비급여 매출(양방의료진)
		function harsSub5_3(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0012.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 비급여 - 비급여 매출(한방의료진)
		function harsSub5_4(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0013.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 한방진료 - 의료진별 매출(월별)
		function harsSub6_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0014.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다..
		}
		// 한방진료 - 치료수가별 매출(의료진별) -1
		function harsSub6_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0015.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 한방진료 - 치료수가별 매출(의료진별) -2
		function harsSub6_3(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0016.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 한방진료 - 병동별 매출(월별)
		function harsSub6_4(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0017.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 한방진료 - 치료수가별 매출(병동별) -1
		function harsSub6_5(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0018.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 한방진료 - 치료수가별 매출(병동별) -2
		function harsSub6_6(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0019.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 재활치료 - 재활치료 매출(월별)
		function harsSub7_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0020.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 재활치료 - 재활치료 환자 1인당 지표(월별)
		function harsSub7_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0021.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 재활치료 - 치료사별 실적
		function harsSub7_3(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0022.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 작업치료 - 작업치료 매출(월별)
		function harsSub8_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0023.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 작업치료 - 작업치료 환자 1인당 지표(월별)
		function harsSub8_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0024.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 작업치료 - 치료사별 실적
		function harsSub8_3(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0025.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 인공신장실 - 투석 환자수 현황(월별)
		function harsSub9_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0026.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 인공신장실 - 투석 시행 현황(월별)
		function harsSub9_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0027.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 인공신장실 - 투석 치료 매출 현황(월별)
		function harsSub9_3(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0028.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 외래 - 외래 진료 월별 현황(형태별)
		function harsSub10_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0029.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 외래 - 외래 진료 현황(의료진별)
		function harsSub10_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0030.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 외래 - 외래 진료 현황 (형태별)
		function harsSub10_3(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0031.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 외래 - 외래 진료 월별 현황(의료진별)
		function harsSub10_4(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0032.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// EKG - 청구 건수 및 매출 현황(월별)
		function harsSub11_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0033.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// EKG - 청구 건수 및 매출 현황(병동별)
		function harsSub11_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0034.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 고빈도흉벽진동요법(토닥이) - 청구금액 및 청구율 현황(월별)
		function harsSub12_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0035.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 고빈도흉벽진동요법(토닥이) - 청구금액 및 청구율 현황(병동별)
		function harsSub12_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0036.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 고빈도흉벽진동요법(토닥이) - 청구금액 및 청구율 현황(의료진별)
		function harsSub12_3(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0037.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 고빈도흉벽진동요법(토닥이) - 특정환자 토닥이 시행 현황(월별)
		function harsSub12_4(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0038.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 고빈도흉벽진동요법(토닥이) - 특정환자 토닥이 시행 현황(병동별)
		function harsSub12_5(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0039.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 특정환자 - 병동별 특정환자 현황(월별)
		function harsSub13_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0040.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 특정기간 검사 - 특정기간 검사 수가 현황(의료진별)
		function harsSub14_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0041.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 항정신성의약품 - 의료진별 처방 현황(월별)
		function harsSub15_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0042.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 항정신성의약품 - 항정신성의약품별 사용량 현황
		function harsSub15_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0043.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 다종처방 - 의료진별 일일평균 처방 현황
		function harsSub16_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0044.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 진료비감면 - 진료비 감면율 현황
		function harsSub17_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0045.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 진료비미수 - 재원환자 미수 현황
		function harsSub18_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0046.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 진료비미수 - 퇴원환자 미수 현황
		function harsSub18_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0051.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			const div = document.createElement('div');
			iframe.style.height = 'calc(100vh - 50px)';
			iframe.allowfullscreen = true;
			div.style.display = "flex"
			div.style.justifyContent = "center";
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(div);
			div.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		
		
		function showGoogleSheet(){
			const iframe = document.createElement('iframe');
			iframe.src = '<%=request.getContextPath() %>/resources/img/test/qwe.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.width = '100%';
			iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.allowfullscreen = true;
				
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		function showGoogleSheet3(){
			const iframe = document.createElement('iframe');
			  iframe.src = '<%=request.getContextPath() %>/resources/img/test/1.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			  iframe.width = '100%';
			  iframe.height = '100%';
			  iframe.frameborder = '0';
			  iframe.allowfullscreen = true;

			  mainContent.innerHTML = ''; // 기존 내용을 지우고
			  mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 재원환자통계뷰
		function googleSheetweb3() {
			const iframe = document.createElement('iframe');
			iframe.src = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTqqSx5-gvpK53MLlPBnjD9_e-MunXutjun2Bjyqn2ReJKl-9MVl1mecdV2-iMlYqQJEh6TLXi3p6nV/pubhtml?gid=989350309&single=true'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.width = '100%';
			iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// B-type
		function googleSheetweb4() {
			const iframe = document.createElement('iframe');
			iframe.src = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTqqSx5-gvpK53MLlPBnjD9_e-MunXutjun2Bjyqn2ReJKl-9MVl1mecdV2-iMlYqQJEh6TLXi3p6nV/pubhtml?gid=966115724&single=true'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.width = '100%';
			iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// C-type
		function googleSheetweb5() {
			const iframe = document.createElement('iframe');
			iframe.src = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTqqSx5-gvpK53MLlPBnjD9_e-MunXutjun2Bjyqn2ReJKl-9MVl1mecdV2-iMlYqQJEh6TLXi3p6nV/pubhtml?gid=1700249851&single=true'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.width = '100%';
			iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		
		
		function showGoogleSheet4(){
			const iframe = document.createElement('iframe');
			  iframe.src = '<%=request.getContextPath() %>/resources/img/test/2.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			  iframe.width = '100%';
			  iframe.height = '100%';
			  iframe.frameborder = '0';
			  iframe.allowfullscreen = true;

			  const iframe2 = document.createElement('iframe');
			  iframe2.src = '<%=request.getContextPath() %>/resources/img/test/3.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			  iframe2.width = '100%';
			  iframe2.height = '100%';
			  iframe2.frameborder = '0';
			  iframe2.allowfullscreen = true;

			  const iframe3 = document.createElement('iframe');
			  iframe3.src = '<%=request.getContextPath() %>/resources/img/test/3.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			  iframe3.width = '100%';
			  iframe3.height = '100%';
			  iframe3.frameborder = '0';
			  iframe3.allowfullscreen = true;
			  
			  const iframe4 = document.createElement('iframe');
			  iframe4.src = '<%=request.getContextPath() %>/resources/img/test/3.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			  iframe4.width = '100%';
			  iframe4.height = '100%';
			  iframe4.frameborder = '0';
			  iframe4.allowfullscreen = true;
			  
			  
			  mainContent.innerHTML = ''; // 기존 내용을 지우고
			  mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
			  mainContent.appendChild(iframe2); // 웹 뷰를 추가합니다.
			  mainContent.appendChild(iframe3); // 웹 뷰를 추가합니다.
			  mainContent.appendChild(iframe4); // 웹 뷰를 추가합니다.
		}
		
		
		
		
		const menuScripts = [
		    { id: 'googleSheetWeb', script: showGoogleSheetWebView },
		    { id: 'googleSheetSubMenu1', script: showGoogleSheetSubMenu1 },
		    { id: 'googleSheetSubMenu2', script: showGoogleSheetSubMenu2 },
		    { id: 'googleSheetSubMenu3', script: showGoogleSheetSubMenu3 },
		    { id: 'googleSheetSubMenu4', script: showGoogleSheetSubMenu4 },
		    { id: 'googleSheetSubMenu5', script: showGoogleSheetSubMenu5 },
		    { id: 'googleSheetimg4', script: showGoogleSheetimg4 },
		    { id: 'googleSheetweb2', script: googleSheetweb2 },
		    { id: 'googleSheetweb3', script: googleSheetweb3 },
		    { id: 'googleSheetweb4', script: googleSheetweb4 },
		    { id: 'googleSheetweb5', script: googleSheetweb5 },
		    { id: 'harsMain1', script: harsMain1 },
		    { id: 'harsSub2_1', script: harsSub2_1 },
		    { id: 'harsSub2_2', script: harsSub2_2 },
		    { id: 'harsSub3_1', script: harsSub3_1 },
		    { id: 'harsSub3_2', script: harsSub3_2 },
		    { id: 'harsSub4_1', script: harsSub4_1 },
		    { id: 'harsSub4_2', script: harsSub4_2 },
		    { id: 'harsSub5_1', script: harsSub5_1 },
		    { id: 'harsSub5_2', script: harsSub5_2 },
		    { id: 'harsSub5_3', script: harsSub5_3 },
		    { id: 'harsSub5_4', script: harsSub5_4 },
		    { id: 'harsSub6_1', script: harsSub6_1 },
		    { id: 'harsSub6_2', script: harsSub6_2 },
		    { id: 'harsSub6_3', script: harsSub6_3 },
		    { id: 'harsSub6_4', script: harsSub6_4 },
		    { id: 'harsSub6_5', script: harsSub6_5 },
		    { id: 'harsSub6_6', script: harsSub6_6 },
		    { id: 'harsSub7_1', script: harsSub7_1 },
		    { id: 'harsSub7_2', script: harsSub7_2 },
		    { id: 'harsSub7_3', script: harsSub7_3 },
		    { id: 'harsSub8_1', script: harsSub8_1 },
		    { id: 'harsSub8_2', script: harsSub8_2 },
		    { id: 'harsSub8_3', script: harsSub8_3 },
		    { id: 'harsSub9_1', script: harsSub9_1 },
		    { id: 'harsSub9_2', script: harsSub9_2 },
		    { id: 'harsSub9_3', script: harsSub9_3 },
		    { id: 'harsSub10_1', script: harsSub10_1 },
		    { id: 'harsSub10_2', script: harsSub10_2 },
		    { id: 'harsSub10_3', script: harsSub10_3 },
		    { id: 'harsSub10_4', script: harsSub10_4 },
		    { id: 'harsSub11_1', script: harsSub11_1 },
		    { id: 'harsSub11_2', script: harsSub11_2 },
		    { id: 'harsSub12_1', script: harsSub12_1 },
		    { id: 'harsSub12_2', script: harsSub12_2 },
		    { id: 'harsSub12_3', script: harsSub12_3 },
		    { id: 'harsSub12_4', script: harsSub12_4 },
		    { id: 'harsSub12_5', script: harsSub12_5 },
		    { id: 'harsSub13_1', script: harsSub13_1 },
		    { id: 'harsSub14_1', script: harsSub14_1 },
		    { id: 'harsSub15_1', script: harsSub15_1 },
		    { id: 'harsSub15_2', script: harsSub15_2 },
		    { id: 'harsSub16_1', script: harsSub16_1 },
		    { id: 'harsSub17_1', script: harsSub17_1 },
		    { id: 'harsSub18_1', script: harsSub18_1 },
		    { id: 'harsSub18_2', script: harsSub18_2 },
		    { id: 'harsSub12_5', script: harsSub12_5 },
		    { id: 'harsSub12_5', script: harsSub12_5 },
		    { id: 'harsSub12_5', script: harsSub12_5 },
		    { id: 'harsSub12_5', script: harsSub12_5 },
		    { id: 'harsSub12_5', script: harsSub12_5 },
		    { id: 'harsSub12_5', script: harsSub12_5 },
		    { id: 'harsSub12_5', script: harsSub12_5 },
		    { id: 'harsSub12_5', script: harsSub12_5, additionalAction: onLastMenuVisited },
		    // 여기에 다른 메뉴와 스크립트 정보를 추가하세요
		];
	function activateMenu(menuIndex) {
		menuLinks.forEach(link => link.classList.remove('active'));
		menuLinks[menuIndex].classList.add('active');
		menuLinks[menuIndex].focus(); // 선택된 메뉴 항목에 포커스 설정
		const menuId = menuLinks[menuIndex].getAttribute('data-menu');
		const menuScript = menuScripts.find(item => item.id === menuId);
		if (menuScript) {
	        menuScript.script();
	        onMenuNavigation();
	        
	     // 추가 작업 함수가 정의되어 있으면 실행
	        if (menuScript.additionalAction) {
	            menuScript.additionalAction();
	        }
	    }
		
		/* 해당 메뉴에 따른 스크립트 실행 */
		/* 
		if (menuId === 'googleSheetWeb') {				// 병실 현황 Total VIEW
			showGoogleSheetWebView();
			onMenuNavigation();
		}else if(menuId === 'googleSheetSubMenu1'){		// 재원 현황 목표
			showGoogleSheetSubMenu1();
			onMenuNavigation();
		}else if(menuId === 'googleSheetSubMenu2'){		// 최근 7일간 입원 환자 수 
			showGoogleSheetSubMenu2();
			onMenuNavigation();
		}else if(menuId === 'googleSheetSubMenu3'){		// 병동 & 의료진 별 재원현황
			showGoogleSheetSubMenu3();
			onMenuNavigation();
		}else if(menuId === 'googleSheetSubMenu4'){		// 보험유형 & 재원일수기준 재원현황
			showGoogleSheetSubMenu4();
			onMenuNavigation();
		}else if(menuId === 'googleSheetSubMenu5'){		// 연령 및 남여성비 현황
			showGoogleSheetSubMenu5();
			onMenuNavigation();
		}else if(menuId === 'googleSheetimg4'){
			showGoogleSheetimg4();
			onMenuNavigation();
		}else if(menuId === 'googleSheetweb2'){
			googleSheetweb2();
			onMenuNavigation();
		}else if(menuId === 'googleSheetweb3'){
			googleSheetweb3();
			onMenuNavigation();
		}else if(menuId === 'googleSheetweb4'){
			googleSheetweb4();
			onMenuNavigation();
		}else if(menuId === 'googleSheetweb5'){
			googleSheetweb5();
			onMenuNavigation();
		}else if(menuId === 'harsMain1'){
			harsMain1();
			onMenuNavigation();
		}else if(menuId === 'harsSub2_1'){
			harsSub2_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub2_2'){
			harsSub2_2();
			onMenuNavigation();
		}else if(menuId === 'harsSub3_1'){
			harsSub3_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub3_2'){
			harsSub3_2();
			onMenuNavigation();
		}else if(menuId === 'harsSub4_1'){
			harsSub4_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub4_2'){
			harsSub4_2();
			onMenuNavigation();
		}else if(menuId === 'harsSub5_1'){
			harsSub5_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub5_2'){
			harsSub5_2();
			onMenuNavigation();
		}else if(menuId === 'harsSub5_3'){
			harsSub5_3();
			onMenuNavigation();
		}else if(menuId === 'harsSub5_4'){
			harsSub5_4();
			onMenuNavigation();
		}else if(menuId === 'harsSub6_1'){
			harsSub6_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub6_2'){
			harsSub6_2();
			onMenuNavigation();
		}else if(menuId === 'harsSub6_3'){
			harsSub6_3();
			onMenuNavigation();
		}else if(menuId === 'harsSub6_4'){
			harsSub6_4();
			onMenuNavigation();
		}else if(menuId === 'harsSub6_5'){
			harsSub6_5();
			onMenuNavigation();
		}else if(menuId === 'harsSub6_6'){
			harsSub6_6();
			onMenuNavigation();
		}else if(menuId === 'harsSub7_1'){
			harsSub7_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub7_2'){
			harsSub7_2();
			onMenuNavigation();
		}else if(menuId === 'harsSub7_3'){
			harsSub7_3();
			onMenuNavigation();
		}else if(menuId === 'harsSub8_1'){
			harsSub8_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub8_2'){
			harsSub8_2();
			onMenuNavigation();
		}else if(menuId === 'harsSub8_3'){
			harsSub8_3();
			onMenuNavigation();
		}else if(menuId === 'harsSub9_1'){
			harsSub9_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub9_2'){
			harsSub9_2();
			onMenuNavigation();
		}else if(menuId === 'harsSub9_3'){
			harsSub9_3();
			onMenuNavigation();
		}else if(menuId === 'harsSub10_1'){
			harsSub10_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub10_2'){
			harsSub10_2();
			onMenuNavigation();
		}else if(menuId === 'harsSub10_3'){
			harsSub10_3();
			onMenuNavigation();
		}else if(menuId === 'harsSub10_4'){
			harsSub10_4();
			onMenuNavigation();
		}else if(menuId === 'harsSub11_1'){
			harsSub11_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub11_2'){
			harsSub11_2();
			onMenuNavigation();
		}else if(menuId === 'harsSub12_1'){
			harsSub12_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub12_2'){
			harsSub12_2();
			onMenuNavigation();
		}else if(menuId === 'harsSub12_3'){
			harsSub12_3();
			onMenuNavigation();
		}else if(menuId === 'harsSub12_4'){
			harsSub12_4();
			onMenuNavigation();
		}else if(menuId === 'harsSub12_5'){
			harsSub12_5();
			onMenuNavigation();
		}else if(menuId === 'harsSub13_1'){
			harsSub13_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub14_1'){
			harsSub14_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub15_1'){
			harsSub15_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub15_2'){
			harsSub15_2();
			onMenuNavigation();
		}else if(menuId === 'harsSub16_1'){
			harsSub16_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub17_1'){
			harsSub17_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub18_1'){
			harsSub18_1();
			onMenuNavigation();
		}else if(menuId === 'harsSub18_2'){
			harsSub18_2();
			onLastMenuVisited();
		}else if(menuId === 'showGoogleSheetaa1'){
			showGoogleSheetaa1();
			console.log("asdad");
			onLastMenuVisited();
		} */
	}
		
		
		// 방향키 입력을 모방하는 함수
		function simulateArrowKey() {
			if (!isScriptActive) return; // 스크립트가 비활성화되어 있다면 실행하지 않음
			
			const event = new Event('keydown'); // 새 키 이벤트 생성

			// 아래쪽 화살키 입력 모방 (포커스를 다음 메뉴 항목으로 이동)
			event.key = 'ArrowDown';
			document.dispatchEvent(event);
			

		  	// 10초 후에 다시 호출 (10000ms = 10초)
			setTimeout(simulateArrowKey, 5000);
		  	
			// 스크립트가 실행될 때마다 비활성 시간 초기화
			resetInactiveTime();
		}

		// 사용자가 마지막 메뉴로 이동했을 때 호출하는 함수
		function onLastMenuVisited() {
			console.log("onLastMenuVisited : "+onLastMenuVisited);
		    lastMenuVisited = true;
		    // 사용자가 마지막 메뉴를 방문한 시간을 기록
		    lastMenuVisitTime = new Date().getTime();

		    // 일정 주기로 확인하여 페이지를 새로 고침
		    const timer = setInterval(function () {
		        if (lastMenuVisited) {
		            const currentTime = new Date().getTime();
		            console.log(currentTime);
		            const elapsedTime = currentTime - lastMenuVisitTime;
					console.log(elapsedTime);
		            if (elapsedTime >= 7000) { // 5초 이상 아무 동작이 없으면 새로 고침
		                clearInterval(timer);
		                location.reload(); // 페이지 새로 고침
		            }
		        }
		    }, 1000); // 1초마다 확인
		}
		// 초기에 함수 호출
		setTimeout(simulateArrowKey, 5000);
		
		// 사용자가 메뉴 이동 조작을 할 때 호출하는 함수 (예: 화살표 아래키를 누를 때)
		function onMenuNavigation() {
		    lastMenuVisited = false;
		    
		}

		// 예시: 사용자가 마지막 메뉴로 이동했을 때 onLastMenuVisited 함수 호출
//		onLastMenuVisited();

		// 예시: 사용자가 메뉴 이동 조작을 할 때 onMenuNavigation 함수 호출
//		onMenuNavigation();
		
		// 스크립트 일시정지 및 재개를 토글하는 함수
		function toggleScript() {
			isScriptActive = !isScriptActive;
			const playPauseIcon = document.getElementById('playPauseIcon');
			
			if (isScriptActive) {
				playPauseIcon.src = '${pageContext.request.contextPath}/resources/icon/stop.png'; // 재생 중 이미지로 변경
				// 스크립트가 다시 활성화된 경우, 다음 실행 예약
				if (!lastMenuVisited) {
		            simulateArrowKey();
		        }
			} else {
				playPauseIcon.src = '${pageContext.request.contextPath}/resources/icon/play.png'; // 일시정지 이미지로 변경
				// 스크립트가 일시정지된 경우에는 타이머를 중지
		        if (timer) {
		            clearInterval(timer);
		        }
			}
			if (!isScriptActive && !lastMenuVisited) {
		        // 스크립트가 일시정지되었고 마지막 메뉴를 방문하지 않았을 때만 타이머 시작
		        startRefreshTimer();
		    }
			// 버튼 클릭 시 비활성 시간을 초기화
			resetInactiveTime();
		    // 마지막 메뉴를 방문하지 않았고, 스크립트가 일시 정지되었을 때만 타이머 시작
		    if (!lastMenuVisited && !isScriptActive) {
		        startRefreshTimer();
		    }

		}
		// 버튼 클릭 시 스크립트 일시정지/재개 토글
		const toggleButton = document.getElementById('toggleButton'); // HTML에서 해당 버튼을 찾아야 함
		toggleButton.addEventListener('click', toggleScript);
		
		// 타이머 시작 함수
		function startRefreshTimer() {
			if (!isScriptActive && !lastMenuVisited) { // 스크립트가 활성화되고 마지막 메뉴를 방문하지 않은 경우에만 타이머 시작
			
			    timer = setInterval(function () {
			        const currentTime = new Date().getTime();
			        const elapsedTime = currentTime - lastMenuVisitTime;
	
			        if (elapsedTime >= 5000) { // 5초 이상 아무 동작이 없으면 새로 고침
			            clearInterval(timer);
			            location.reload(); // 페이지 새로 고침
			        }
			    }, 1000); // 1초마다 확인
			}
		}
		
		
		// 페이지를 새로 고치는 함수
		function refreshPage() {
			location.reload(); // 페이지 새로고침
		}
		
		// 페이지의 비활성 시간을 체크하고 페이지 새로 고치기
		function checkInactiveTime() {
			
		//	resetInactiveTime();
			
			inactiveTime += 1000; // 1초마다 증가 (1000 밀리초)
			console.log("inactiveTime : "+inactiveTime);
			// 5초(5000 밀리초) 동안 스크립트가 실행되지 않으면 페이지 새로고침
			if (inactiveTime >= 5500) {
				console.log("6초지남");
				refreshPage();
			}
			
		}
		
		// 페이지 로드 시 초기화 및 비활성 시간 체크 타이머 설정
		window.addEventListener('load', function () {
			resetInactiveTime(); // 초기화
			setInterval(checkInactiveTime, 1000); // 1초마다 비활성 시간 체크
		});
		
		// 스크립트가 실행될 때마다 비활성 시간 초기화
		function resetInactiveTime() {
			if (!lastMenuVisited) {
		        // 마지막 메뉴를 방문하지 않은 경우에만 초기화
		        inactiveTime = 0;
		        console.log("inactiveTime : " + inactiveTime);
		    }
		}
		
		activateMenu(currentMenuIndex);
		
		
			
	</script>
	
</body>
</html>