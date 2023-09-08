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
    padding: 2rem 0 0 6.75rem;
    font-family: var(--body-font);
    font-size: var(--normal-font-size);
    transition: .5s;
    height: 99vh;
    width: calc(100vw - 293px);
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
    top: 0;
    left: 0;
    width: var(--nav--width);
    height: 100vh;
    background-color: var(--bg-color);
    color: var(--white-color);
    padding: 1.5rem 1.5rem 2rem;
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
<body id="body-pd" class="body-pd">

	<div class="l-navbar expander" id="navbar">
		<nav class="nav">
			<div style="width: 100%;">
				<div class="nav__brand">
					<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
					<a href="#" class="nav__logo">Core Hospital</a>
				</div>
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
						<span class="nav_subname">&nbsp;&nbsp;특정환자 토닥이 시행 현황(월별)</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="harsSub12_5">
						<!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_subname">&nbsp;&nbsp;특정환자 토닥이 시행 현황(병동별)</span>
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
                    
                    <a href="#" class="nav__link"  style="margin-top:16px;" data-menu="googleSheetimg4">
                        <!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
                        <span class="nav_name">이미지 예3 (최종)</span>
                    </a>
                    <a href="#" class="nav__link" data-menu="showGoogleSheetaa1">
                        <!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
                        <span class="nav_name">웹게시 예</span>
                    </a>
                    
                    
                     
                    
                    
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
                    </a>
                </div>
                <a href="#" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">Log out</span>
                </a> -->
            </div>
        </nav>
    </div>
					 
			<!-- 나머지 컨텐츠 -->
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" id="main-content" 
			style="height: 99vh; margin: 0px -150px 150px 0; width: calc(100vw - 436px);">
				<!-- 내용을 이곳에 추가 -->
				
			</main>
			<div class="noprint" style="background-color: #ddd;  height: 50px; width: calc(100vw - 310px); bottom: -19px; 
			position: absolute; bottom: -13px; left: 293px; display: flex; align-items: center; z-index: 98"></div>
			<div class="noprint" style="background-color: rgba(60,64,67,.15);  height: 50px; width: calc(100vw - 310px); bottom: -19px; 
			position: absolute; bottom: -13px; left: 293px; display: flex; align-items: center; z-index: 99">
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
			</div>
			
	<script>
		const mainContent = document.getElementById('main-content');
		const menuLinks = document.querySelectorAll('[data-menu]');
		
		
		
		// 메뉴 클릭 이벤트 처리
		menuLinks.forEach(link => {
	      link.addEventListener('click', function (event) {
	        event.preventDefault();
	        const menuId = this.getAttribute('data-menu');
	        if (menuId === 'googleSheetWeb') {
	          showGoogleSheetWebView();
	        }else if(menuId === 'googleSheetSubMenu1'){
	        	showGoogleSheetSubMenu1();
	        }else if(menuId === 'googleSheetSubMenu2'){
	        	showGoogleSheetSubMenu2();
	        }else if(menuId === 'googleSheetSubMenu3'){
	        	showGoogleSheetSubMenu3();
	        }else if(menuId === 'googleSheetSubMenu4'){
	        	showGoogleSheetSubMenu4();
	        }else if(menuId === 'googleSheetSubMenu5'){
	        	showGoogleSheetSubMenu5();
	        }else if(menuId === 'googleSheetimg4'){
	        	showGoogleSheetimg4();
	        }else if(menuId === 'googleSheetweb2'){
	        	googleSheetweb2();
	        }else if(menuId === 'googleSheetweb3'){
	        	googleSheetweb3();
	        }else if(menuId === 'googleSheetweb4'){
	        	googleSheetweb4();
	        }else if(menuId === 'googleSheetweb5'){
	        	googleSheetweb5();
	        }else if(menuId === 'harsMain1'){
	        	harsMain1();
	        }else if(menuId === 'harsSub2_1'){
	        	harsSub2_1();
	        }else if(menuId === 'harsSub2_2'){
	        	harsSub2_2();
	        }else if(menuId === 'harsSub3_1'){
	        	harsSub3_1();
	        }else if(menuId === 'harsSub3_2'){
	        	harsSub3_2();
	        }else if(menuId === 'harsSub4_1'){
	        	harsSub4_1();
	        }else if(menuId === 'harsSub4_2'){
	        	harsSub4_2();
	        }else if(menuId === 'harsSub5_1'){
	        	harsSub5_1();
	        }else if(menuId === 'harsSub5_2'){
	        	harsSub5_2();
	        }else if(menuId === 'harsSub5_3'){
	        	harsSub5_3();
	        }else if(menuId === 'harsSub5_4'){
	        	harsSub5_4();
	        }else if(menuId === 'harsSub6_1'){
	        	harsSub6_1();
	        }else if(menuId === 'harsSub6_2'){
	        	harsSub6_2();
	        }else if(menuId === 'harsSub6_3'){
	        	harsSub6_3();
	        }else if(menuId === 'harsSub6_4'){
	        	harsSub6_4();
	        }else if(menuId === 'harsSub6_5'){
	        	harsSub6_5();
	        }else if(menuId === 'harsSub6_6'){
	        	harsSub6_6();
	        }else if(menuId === 'harsSub7_1'){
	        	harsSub7_1();
	        }else if(menuId === 'harsSub7_2'){
	        	harsSub7_2();
	        }else if(menuId === 'harsSub7_3'){
	        	harsSub7_3();
	        }else if(menuId === 'harsSub8_1'){
	        	harsSub8_1();
	        }else if(menuId === 'harsSub8_2'){
	        	harsSub8_2();
	        }else if(menuId === 'harsSub8_3'){
	        	harsSub8_3();
	        }else if(menuId === 'harsSub9_1'){
	        	harsSub9_1();
	        }else if(menuId === 'harsSub9_2'){
	        	harsSub9_2();
	        }else if(menuId === 'harsSub9_3'){
	        	harsSub9_3();
	        }else if(menuId === 'harsSub10_1'){
	        	harsSub10_1();
	        }else if(menuId === 'harsSub10_2'){
	        	harsSub10_2();
	        }else if(menuId === 'harsSub10_3'){
	        	harsSub10_3();
	        }else if(menuId === 'harsSub10_4'){
	        	harsSub10_4();
	        }else if(menuId === 'harsSub11_1'){
	        	harsSub11_1();
	        }else if(menuId === 'harsSub11_2'){
	        	harsSub11_2();
	        }else if(menuId === 'harsSub12_1'){
	        	harsSub12_1();
	        }else if(menuId === 'harsSub12_2'){
	        	harsSub12_2();
	        }else if(menuId === 'harsSub12_3'){
	        	harsSub12_3();
	        }else if(menuId === 'harsSub12_4'){
	        	harsSub12_4();
	        }else if(menuId === 'harsSub12_5'){
	        	harsSub12_5();
	        }else if(menuId === 'harsSub13_1'){
	        	harsSub13_1();
	        }else if(menuId === 'harsSub14_1'){
	        	harsSub14_1();
	        }else if(menuId === 'harsSub15_1'){
	        	harsSub15_1();
	        }else if(menuId === 'harsSub15_2'){
	        	harsSub15_2();
	        }else if(menuId === 'harsSub16_1'){
	        	harsSub16_1();
	        }else if(menuId === 'harsSub17_1'){
	        	harsSub17_1();
	        }else if(menuId === 'harsSub18_1'){
	        	harsSub18_1();
	        }else if(menuId === 'harsSub18_2'){
	        	harsSub18_2();
	        }else if(menuId === 'showGoogleSheetaa1'){
	        	showGoogleSheetaa1();
	        }
	      });
	    });
		
		// 메뉴에 해당하는 컨텐츠를 보여주는 함수
		function showMenuContent(menuId) {
			// 메뉴에 따른 컨텐츠 내용을 여기에서 설정
			const content = getMenuContent(menuId);
			mainContent.innerHTML = content;
		}
		
		// 메뉴 ID에 따른 컨텐츠 내용을 반환하는 함수
		function getMenuContent(menuId) {
			switch (menuId) {
			case 'menu1':
				return '<h2>메뉴 1의 내용</h2><p>메뉴 1에 대한 내용을 여기에 작성합니다.</p>';
			case 'menu2':
				return '<h2>메뉴 2의 내용</h2><p>메뉴 2에 대한 내용을 여기에 작성합니다.</p>';
			case 'menu3':
				return '<h2>메뉴 3의 내용</h2><p>메뉴 3에 대한 내용을 여기에 작성합니다.</p>';
			default:
				return '<p>선택된 메뉴의 내용이 없습니다.</p>';
			}
		}
		
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
		
		
		/* 
		function shewGoogleSheet(range){
			const iframe = document.createElement('iframe');
			  iframe.src = 'https://docs.google.com/spreadsheets/d/1MECrScp7CxVALaZKH9R9KpA_eEFTweLr-sqpMQGQQEA/edit#gid=989350309&range=${range}/1/public/full?alt=json'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			  iframe.width = '100%';
			  iframe.height = '100%';
			  iframe.frameborder = '0';
			  iframe.allowfullscreen = true;
			
			  mainContent.innerHTML = ''; // 기존 내용을 지우고
			  mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		 */
		 // 이미지 예 최종
		function showGoogleSheetimg4(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/test/111.png'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 웹게시 예
			function showGoogleSheetaa1() {
				const iframe = document.createElement('iframe');
				iframe.src = "https://docs.google.com/presentation/d/e/2PACX-1vQEWIf82Ut4WgB7UgcOqdtnboQccUr9pFJTEs1i7LLc3pgVbvpEEPAvYh6NGkzYgBgXWwiXnmmzRsuL/embed?start=false&loop=false&delayms=3000"; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
				iframe.style.width = '1550px';
				iframe.style.height = '1200px';
				iframe.frameborder = '0';
				iframe.allowfullscreen="true";
				iframe.mozallowfullscreen="true";
				iframe.webkitallowfullscreen="true";
				iframe.allowfullscreen = true;
				iframe.style.marginTop = 'calc(100vh - 60%)';
				mainContent.innerHTML = ''; // 기존 내용을 지우고
				mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
			}
		 // 병상가동율
		function harsMain1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0003.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			 
			iframe.allowfullscreen = true;
			
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		 // 환자분류군 - 환자분류군 분포(월별)
		function harsSub2_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0004.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 환자분류군 - 환자분류군 분포(병동별)
		function harsSub2_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0005.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 양방진료 - 의료진별 매출(월별)
		function harsSub3_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0006.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 양방진료 - 병동별 매출(월별)
		function harsSub3_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0007.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 일당진료비 - 병동별 일당진료비(월별)
		function harsSub4_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0008.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 일당진료비 - 병동별 일당진료비 상/하위(20%) 
		function harsSub4_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0009.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 비급여 - 비급여 매출(월별) 
		function harsSub5_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0010.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 비급여 - 비급여 매출(병동별)
		function harsSub5_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0011.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 비급여 - 비급여 매출(양방의료진)
		function harsSub5_3(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0012.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 비급여 - 비급여 매출(한방의료진)
		function harsSub5_4(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0013.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 한방진료 - 의료진별 매출(월별)
		function harsSub6_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0014.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 한방진료 - 치료수가별 매출(의료진별) -1
		function harsSub6_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0015.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 한방진료 - 치료수가별 매출(의료진별) -2
		function harsSub6_3(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0016.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 한방진료 - 병동별 매출(월별)
		function harsSub6_4(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0017.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 한방진료 - 치료수가별 매출(병동별) -1
		function harsSub6_5(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0018.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 한방진료 - 치료수가별 매출(병동별) -2
		function harsSub6_6(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0019.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 재활치료 - 재활치료 매출(월별)
		function harsSub7_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0020.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 재활치료 - 재활치료 환자 1인당 지표(월별)
		function harsSub7_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0021.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 재활치료 - 치료사별 실적
		function harsSub7_3(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0022.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 작업치료 - 작업치료 매출(월별)
		function harsSub8_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0023.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 작업치료 - 작업치료 환자 1인당 지표(월별)
		function harsSub8_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0024.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 작업치료 - 치료사별 실적
		function harsSub8_3(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0025.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 인공신장실 - 투석 환자수 현황(월별)
		function harsSub9_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0026.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 인공신장실 - 투석 시행 현황(월별)
		function harsSub9_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0027.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 인공신장실 - 투석 치료 매출 현황(월별)
		function harsSub9_3(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0028.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 외래 - 외래 진료 월별 현황(형태별)
		function harsSub10_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0029.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 외래 - 외래 진료 현황(의료진별)
		function harsSub10_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0030.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 외래 - 외래 진료 현황 (형태별)
		function harsSub10_3(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0031.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 외래 - 외래 진료 월별 현황(의료진별)
		function harsSub10_4(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0032.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// EKG - 청구 건수 및 매출 현황(월별)
		function harsSub11_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0033.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// EKG - 청구 건수 및 매출 현황(병동별)
		function harsSub11_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0034.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 고빈도흉벽진동요법(토닥이) - 청구금액 및 청구율 현황(월별)
		function harsSub12_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0035.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 고빈도흉벽진동요법(토닥이) - 청구금액 및 청구율 현황(병동별)
		function harsSub12_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0036.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 고빈도흉벽진동요법(토닥이) - 청구금액 및 청구율 현황(의료진별)
		function harsSub12_3(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0037.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 고빈도흉벽진동요법(토닥이) - 특정환자 토닥이 시행 현황(월별)
		function harsSub12_4(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0038.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 고빈도흉벽진동요법(토닥이) - 특정환자 토닥이 시행 현황(병동별)
		function harsSub12_5(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0039.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 특정환자 - 병동별 특정환자 현황(월별)
		function harsSub13_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0040.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 특정기간 검사 - 특정기간 검사 수가 현황(의료진별)
		function harsSub14_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0041.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 항정신성의약품 - 의료진별 처방 현황(월별)
		function harsSub15_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0042.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 항정신성의약품 - 항정신성의약품별 사용량 현황
		function harsSub15_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0043.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 다종처방 - 의료진별 일일평균 처방 현황
		function harsSub16_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0044.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 진료비감면 - 진료비 감면율 현황
		function harsSub17_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0045.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 진료비미수 - 재원환자 미수 현황
		function harsSub18_1(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0046.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 진료비미수 - 퇴원환자 미수 현황
		function harsSub18_2(){
			const iframe = document.createElement('img');
			iframe.src = '<%=request.getContextPath() %>/resources/img/HARS_img/0047.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.style.width = '1440px';
			iframe.style.height = '1200px';
			iframe.allowfullscreen = true;
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
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
		/* 
		async function fetchGoogleSheetData() {
			  try {
				  const response = await fetch(
						  'https://script.google.com/macros/s/AKfycbx4rbvC14NkU_IPveSqyLueH3t766VdS8U1H23GdSjC-h6ZPX90gtyHYRwsOcNXl-z0/exec'); // 배포한 스크립트의 URL 입력
				    
			    if (response.ok) {
			      const data = await response.json();
			      return data;
			    } else {
			      throw new Error('Fetch failed with status: ' + response.status);
			    }
			  } catch (error) {
			    console.error('Fetch error:', error);
			    return null;
			  }
			} */
		/* 	
		async function fetchGoogleSheetData() {
			  const response = await fetch('https://script.google.com/macros/s/AKfycbyVqbEkdYL2BmC6QZy0jBcw02A1_AjdHlWQ4r_YEPA_1Pk7kWro5YrX8PS9KVtE5qCsaQ/exec');
			  const data = await response.json();
			  return data;
			} */
		function fetchGoogleSheetData() {
			  var sheetId = "1kT6_er2dzrxNNTCnttU1TW5vOGs3nRG51dSXDtdSnL8"; // 수정된 스프레드시트 ID 입력
			  var sheetName = "재원환자통계VIEW"; // 시트의 이름 입력
			  var range = "B7:V16"; // 읽어올 데이터의 범위 입력
			  var sheet = SpreadsheetApp.openById(sheetId).getSheetByName(sheetName);
			  var dataRange = sheet.getRange(range); // 범위 내의 셀 객체 가져오기
			  var data = dataRange.getValues(); // 셀 내용을 실제 값으로 가져오기
			  return data;
			}
		function createDataTableView(data) {
		      let tableHtml = '<table border=1 style="width:100%; height:100%;">';
		      for (const row of data) {
		        tableHtml += '<tr>';
		        for (const cell of row) {
		          tableHtml += `<td>${cell}</td>`;
		        }
		        tableHtml += '</tr>';
		      }
		      tableHtml += '</table>';
		      return tableHtml;
		    }
		async function showGoogleSheetDataView() {
		      // 구글 스크립트를 사용하여 데이터를 가져와서 표시
		      // 구글 스크립트를 활용하여 원하는 데이터만 가져올 수 있습니다.
		      const data = await fetchGoogleSheetData();
		      const content = createDataTableView(data);
		      mainContent.innerHTML = content;
		    }
		
		
		// 초기 화면 로딩 시 첫 번째 메뉴를 보여줌
//		showGoogleSheetDataView();
		showGoogleSheetWebView();
		
	</script>
	<script>
	/* EXPANDER MENU */
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

	/* LINK ACTIVE */
	const linkColor = document.querySelectorAll('.nav__link')
	function colorLink() {
	    linkColor.forEach(l=> l.classList.remove('active'))
	    this.classList.add('active')
	}
	linkColor.forEach(l=> l.addEventListener('click', colorLink))

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
	</script>
</body>
</html>