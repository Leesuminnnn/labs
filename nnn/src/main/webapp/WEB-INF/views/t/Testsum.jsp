<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />

		<title>Sharing Memories 2024 | 페스티벌 | 롯데월드 어드벤처</title>
				<meta id="ogTitle" property="og:title" content="Sharing Memories 2024 | 페스티벌 | 롯데월드 어드벤처" />
				<meta property="og:description" content="Sharing Memories 2024" />
				<meta property="og:image" id="ogImage" content="http://adventure.lotteworld.com/common/images/logo_sns.png" />
				<meta property="og:url" content="http://adventure.lotteworld.com/kor/enjoy/festival/view.do?" />
			<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,maximum-scale=1.0,minimum-scale=1.0,target-densitydpi=medium-dpi" />
		<meta name="author" content="http://adventure.lotteworld.com" />
		<meta name="keywords" content="" />
		<meta name="description" content="당신을 모험과 신비가 가득한 나라로 초대합니다!" />
			<meta name="format-detection" content="telephone=no" />
		<meta property="og:type" content="article" />
		<meta property="og:site_name" content="롯데월드 어드벤처" />
		<link rel="shortcut icon" href="/common/images/favicon.ico" type="image/x-icon" />
		<link rel="icon" href="/common/images/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="/common/css/swiper.min.css" />
		<link rel="stylesheet" href="/common/css/lotteworld_style.css" />
		<link rel="stylesheet" href="/common/css/mCustomScrollbar.css" />
		<script type="text/javascript" src="/common/js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="/common/js/TweenMax.js"></script>
		<script type="text/javascript" src="/common/js/placeholders.min.js"></script>
		<script type="text/javascript" src="/common/js/swiper.min.js"></script>
		<script type="text/javascript" src="/common/js/jquery.mCustomScrollbar.js"></script>
		<script type="text/javascript" src="/common/js/jquery.touchFlow.js"></script>
		<script type="text/javascript" src="/common/js/jquery.lazyload.min.js"></script>
		<script type="text/javascript" src="/common/js/script.js?ver=1206"></script>
		<script type="text/javascript" src="/common/js/browser.js"></script>
		<script type="text/javascript" src="/common/js/lib/jquery/jquery.cookies.js"></script>
		<script type="text/javascript" src="/common/js/lib/ezValidation/jquery.ez.validation-1.3.4.js"></script>
		<script type="text/javascript" src="/common/js/kakao.min.js"></script>
		<script type='text/javascript' src="https://members.lpoint.com/api/js/serialize.object.js"></script>
		<script type='text/javascript' src="https://members.lpoint.com/api/js/json2.js"></script>
		<script type='text/javascript' src="https://members.lpoint.com/api/js/lotte.sso.api.js"></script>
		<script type="text/javascript" src="/common/js/sso_common.js"></script>
		<!-- Google tag (gtag.js)  --> <script async src="https://www.googletagmanager.com/gtag/js?id=G-PDYE7343Q1"></script> <script> window.dataLayer = window.dataLayer || []; function gtag(){dataLayer.push(arguments);} gtag('js', new Date()); gtag('config', 'G-PDYE7343Q1'); </script>
		<script type="text/javascript" src="/common/js/netfunnel.js"></script>
		
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript">
			function goBTicket() {
				var today  = new Date();
				var TIME_ZONE = 3240 * 10000;
				var date = new Date(+today + TIME_ZONE).toISOString().replace(/[-]/g, '').substring(0,8);
				var time = new Date().toTimeString().replace(/[:]/g, '').substring(0,4);
				var _setTime = date + time;
				// console.log(_setTime);

				var pmtfilter = "win16|win32|win64|macintel|mac|"; // PC일 경우 가능한 값

				if(_setTime >= 202306160020 && _setTime < 202306160300){
					alert('시스템 점검으로 접속이 불가합니다. (점검기간 :  6.16(금) 00: 20 ~ 03:00)') ;
				}else{
					if( navigator.platform) {
						if( pmtfilter.indexOf(navigator.platform.toLowerCase())<0 ) {
							SSO_COMMON.GoMticket('https://mticket.lotteworld.com/web/pdt/productList.do?ei_gsber=1210&amp;ei_bukrs=1200', 'pop');
						} else {
							NetFunnel_Action({action_id:"reservation_adv"},function(ev,ret){
								//window.open("https://mticket.lotteworld.com/web/pdt/productList.do?ei_gsber=1210&ei_bukrs=", "", "");
								SSO_COMMON.GoMticket('https://mticket.lotteworld.com/web/pdt/productList.do?ei_gsber=1210&amp;ei_bukrs=1200', 'pop');
								$(".layerPop.infoPop").fadeIn(300);
								$(".blackBg").fadeIn(300);
								$(".blackBg").css("z-index",100);
							});
						}
					}
				}
			}
		</script>

		<!--[if lt IE 9]>
			<script type="text/javascript" src="/common/js/html5shiv.js"></script>
			<script type="text/javascript" src="/common/js/selectivizr.js"></script>
		<![endif]-->
		<script type="text/javascript">
		//<![CDATA[
			//TOTAL SEARCH
			function setTotalSrch(obj)
			{
				$("#" + obj).submit();
			}
        //]]>
		</script>
		<!-- Google Tag Manager -->
		<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
		new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
		j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
		'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
		})(window,document,'script','dataLayer','GTM-PZTZVG3');</script>
		<!-- End Google Tag Manager -->
	<style type="text/css">/* 공통 */
	.clfix:after,
	.clfix:before {
		display: table;
		line-height: 0;
		content: ""
	}

	.clfix:after {
		clear: both
	}

	.hideText {
		padding: 0;
		height: 0;
		font-size: 0;
		color: transparent;
		position: absolute;
		left: -999.9rem;
		top: -999.9rem;
		text-indent: -999.9rem;
	}

	.festivalTop .topTit {
		color: #fff !important;
	}

	.festivalTop {
		padding: 0 !important;
		display: none;
	}

	.festivalTop .infoTit {
		padding: 0 !important;
	}

	.mo {
		display: none;
	}

	.subWrap {
		padding-bottom: 0;
	}

	.festivalDiv {
		position: relative;
	}

	.festivalMain {
		position: relative;
		z-index: 2;
	}

	.swiperBox {
		font-size: 0;
	}

	.swiperBox .swiper-wrapper .swiper-slide img {
		width: 100%;
		max-width: 100%;
        height: 34.8vw;
	}

	.swiperBox .swiper-pagination {
		display: inline-block;
		padding: 1.5rem 3.1rem 1.5rem 3.1rem;
		width: auto;
		left: 50%;
		bottom: 5%;
		background: rgba(0, 0, 0, 0.5);
		overflow: hidden;
		border-radius: 2.05rem;
		-ms-transform: translate(-50%, 0);
		-webkit-transform: translate(-50%, 0);
		-moz-transform: translate(-50%, 0);
		-o-transform: translate(-50%, 0);
		transform: translate(-50%, 0);
	}

	.swiperBox .swiper-pagination .swiper-pagination-bullet {
		vertical-align: top;
		width: 1.1rem;
		height: 1.1rem;
		margin: 0 0 0 1rem;
		background: url("/common/images/btn/imgRoll_indi.png") no-repeat 50% 50%;
	}

	.swiperBox .swiper-pagination .swiper-pagination-bullet:first-child {
		margin: 0;
	}

	.swiperBox .swiper-pagination .swiper-pagination-bullet-active {
		background: url("/common/images/btn/imgRoll_indi_on.png") no-repeat 50% 50%;
	}

	.swiperBox .swiper-pagination .playBtn {
		display: block;
		width: 4.1rem;
		height: 4.1rem;
		position: absolute;
		top: 0;
		right: 0;
		background: url("/common/images/btn/play_bt.png") no-repeat 50% 50%;
	}

	.swiperBox .swiper-pagination .playBtn.on {
		background: url("/common/images/btn/play_bt_on.png") no-repeat 50% 50%;
	}

	.hide-txt {
		font-size: 0;
		width: 0;
		height: 0;
		text-indent: -999px;
	}

	/* // 공통 */

	/* 1920 vw */
	.festivalMain .visualWrap img {
		width: 100%;
	}

	.festivalMain .storyWrap img {
		width: 100%;
        margin-top: -1px;
	}

	.festivalDiv .fullBgWrap {
		/* padding-top: 11.406vw; */
		/* height: 305.885vw; */
		background: url("/common/images/icon/2024_memories/pc/bg_full2.jpg") no-repeat top center #ffc581;
		background-size: contain;
		box-sizing: border-box;
	}

	.festivalCont .inner {
		margin: 0px 11.5vw 0;
        width: 78.125vw;
        height: 61.5vw;
		background: url("/common/images/icon/2024_memories/pc/bg_frame.png") no-repeat center center/cover;
	}

    /* 20231220 */
    .festivalCont .inner .ui-tabWrap {
        padding: 0 5.8vw 4.688vw 4.9vw;
    }

	.festivalCont .contTit {
		font-size: 0;
	}

	/* 3개 기준 */
	.tabListWrap {
		/* padding-top: 2.344vw; */
	}

	.tabListWrap .tabList {
		margin-bottom: 0.042vw;
		display: flex;
		height: 6.938vw;
		justify-content: space-between;
		width: 100%;
	}

	.tabListWrap .tabList li {
		position: relative;
		text-align: center;
		width: 21.2vw;
		height: 100%;
	}

    /* 20231220 */

    .tabListWrap .tabList li>a {
        width: 100%;
        height: 100%;
        display: block;
        background: url(/common/images/festival/2023_winter/pc/tab_off.png) no-repeat 0 0;
        display: flex;
        background-size: contain;
        justify-content: center;
        align-items: center;
    }

    .tabListWrap .tabList li>a>span {
        position: relative;
        display: inline-block;
        color: #909090;
        font-size: 1.563vw;
        font-weight: 700;
        line-height: 1.2;
        z-index: 10;
        font-family: "Noto Sans KR";
    }

    .tabListWrap .tabList li>a.on {
        background: url(/common/images/festival/2023_winter/pc/tab_on.png) no-repeat 0 0;
        background-size: contain;
        font-weight: 500;
    }

    .tabListWrap .tabList li a.on span {
        color: #238ccf;
    }

	/* 4개 탭 */
    /* 20231220 2개 탭 */
	.festivalCont.sc4 .tabListWrap .tabList li {
		width: 33.24vw;
	}

	.tabListWrap .tabList li a {
		display: block;
		width: 100%;
		height: 100%;
		background-size: contain !important;
	}

	.festivalCont .tabCont {
		display: none;
	}

	.festivalCont .tabCont.active {
		display: flex;
	}

    /* 20231220 */

    .festivalCont.sc2 .tabListWrap .tabList {
        margin-top: -0.5vw;
    }

    .festivalCont .tabCont > div {
        width: 67.5%;
        height: 34.8vw;
        margin-top: 0.65vw;
    }

    .festivalCont .tabCont div.slide-content {
        width: 32.5%;
        background: #62addc;        
    }
    

	.festivalCont .tabCont .slide-content .tit {
		margin-top: 1.271vw;
		text-align: left;
        padding: 1.406vw 1.406vw 0 1.406vw;
	}

    /* 20231220 */
    .festivalCont .tabCont .slide-content .tit span {
        font-size: 2.083vw;
        text-align: left;
        color: #fefefe;
        font-weight: 900;
        line-height: 1.3;
        font-family: "Noto Sans KR";
    }

	.festivalCont .tabCont .slide-content .tit img {
		max-width: 100%;
	}

	.festivalCont .tabCont .slide-content .sub {
		margin-top: 0.7vw;
		font-size: 1.042vw;
        font-weight: 300;
		color: #fff;
		line-height: 1.6;
		text-align: left;
        padding: 0 1.406vw;
        min-height: 7.813vw;
        max-height: 7.813vw;
        /* overflow-y: scroll; */
	}

	.festivalCont .tabCont .slide-content .location-info {
		margin-top: 0.73vw;
        padding: 0 1.406vw;
	}

    /* 20231220 */
    .festivalCont .tabCont .slide-content .location-info.mt52 {
        margin-top: 3.43vw;
    }

	.festivalCont .tabCont .slide-content .location-info ul {
		display: flex;
		gap: 1.5vw;
        flex-direction: column;
		justify-content: center;
	}

	.festivalCont .tabCont .slide-content .location-info ul li {
		display: flex;
        flex-direction: column;
		gap: 0.7vw;
	}

	.festivalCont .tabCont .slide-content .location-info .icon {
		display: block;
		width: 5.677vw;
		height: 4.219vw;
		font-size: 0;
		text-indent: -9999px;
	}

	.festivalCont .tabCont .slide-content .location-info .time {
        background: #26509d;
        font-size: 0.885vw;
        color: #ffffff;
        width: fit-content;
        padding: 0.16vw 0.781vw;
    }

	.festivalCont .tabCont .slide-content .location-info .place {
        background: #26509d;
        font-size: 0.885vw;
        color: #ffffff;
        width: fit-content;
        padding: 0.16vw 0.781vw;
	}

	.festivalCont .tabCont .slide-content .location-info .txt {
		/* padding-top: 1.198vw; */
		font-size: 1.042vw;
        font-weight: 300;
		color: #fff;
	}

	.festivalCont .tabCont .slide-content .location-info .txt span {
		display: inline-block;
		margin-top: 0.5vw;
	}

	.festivalCont .tabCont .slide-content .location-info.st2 ul {
		margin: 0 auto;
		max-width: 33.1vw;
		flex-direction: row;
		flex-wrap: wrap;
		justify-content: flex-start;
		gap: 1.146vw
	}

	.festivalCont .tabCont .slide-content .location-info.st2 .txt {
		line-height: 1.875vw;
	}

	.festivalCont .tabCont .slide-content .info-detail {
		margin: 2.688vw 0 0 0;
		text-align: left;
        padding: 0 1.406vw;
	}

	.festivalCont .tabCont .slide-content .info-detail a {
		display: block;
		width: 17.344vw;
		height: 4.531vw;
	}

	.festivalCont .tabCont .slide-content .info-detail a img {
		max-width: 100%;
	}

	.festivalCont .tabCont .slide-content .etcTxt {
		margin-top: 1.302vw;
		font-size: 1.25vw;
		color: #ffd900;
		text-align: center;
	}

    /* 20231220 */
    .festivalCont {
        position: relative;
    }
    
    .festivalCont.sc2 {
        margin-top: 6.5vw;
		padding-bottom: 8vw;
		padding-top: 3vw;
    }

    .festivalCont.sc2::after {
        display: block;
        content: "";
        position: absolute;
        top: 51.5%;
        left: 73%;
        width: 25.885vw;
        height: 31.927vw;
		background: url("/common/images/icon/2024_memories/pc/sc2_decoration.png") no-repeat center center/contain;
    }

	/* 공연안내 */
	.festivalCont.sc2 .contTit {
		margin: 0 29.7vw;
		width: 16.979vw;
		height: 10.167vw;
		background: url("/common/images/icon/2024_memories/pc/tit_sc2.png") no-repeat center center;
		background-size: contain;
        padding-top: 2vw;
	}

    /* 20231220 */

	.festivalCont .tabListWrap .tabList li a {
		display: flex;
    /* flex-wrap: wrap; */
	}

	.festivalCont.sc2 .tabListWrap .tabList li a {
		background: url("/common/images/icon/2024_memories/pc/tab_off.png") no-repeat center center;
	}

	.festivalCont.sc2 .tabListWrap .tabList li .on {
		background: url("/common/images/icon/2024_memories/pc/tab_on.png") no-repeat center center;
	}

    /* 20231220 */
    .festivalCont.sc3::after {
        display: block;
        content: "";
        position: absolute;
        top: 63.9%;
        left: 73.9%;
        width: 22.24vw;
        height: 31.198vw;
		background: url("/common/images/icon/2024_memories/pc/sc3_decoration.png") no-repeat center center/contain;
    }


	/* 포토존 */
	.festivalCont.sc3 {
		margin-top: 5.5vw;
		/* min-height: 74.479vw; */
		padding-bottom: 1.45vw;
		padding-top: 3vw;
	}

	.festivalCont.sc3 .contTit {
		margin: 0 32.3vw;
		width: 12.448vw;
		height: 12.6vw;
		background: url("/common/images/icon/2024_memories/pc/tit_sc3.png") no-repeat center center;
		background-size: contain;
	}

    .festivalCont.sc3 .tabListWrap .tabList li a {
		background: url("/common/images/icon/2024_memories/pc/tab_off.png") no-repeat center center;
	}

	.festivalCont.sc3 .tabListWrap .tabList li .on {
		background: url("/common/images/icon/2024_memories/pc/tab_on.png") no-repeat center center;
	}

	.festivalCont.sc3 .tabListWrap .tabList {
		margin-top: -1vw;
	}

	/* 이벤트&핫플레이스 */
	.festivalCont.sc4 {
		margin-top: 0vw;
		padding-top: 3vw;
		padding-bottom: 14vw;
	}

    /* 20231220 */
    .festivalCont.sc4 .inner {
        background: url("/common/images/icon/2024_memories/pc/bg_frame2.png") no-repeat center center/cover;
        height:61.7vw;

    }

    .festivalCont.sc4::after {
        display: block;
        content: "";
        position: absolute;
        top: 66.3%;
        left: 62.5%;
        width: 30.781vw;
        height: 15.208vw;
		background: url("/common/images/icon/2024_memories/pc/sc4_decoration.png") no-repeat center center/contain;
    }

	.festivalCont.sc4 .contTit {
		margin: 0 21.9vw;
		width: 33.156vw;
		height: 13.313vw;
		background: url("/common/images/icon/2024_memories/pc/tit_sc4.png") no-repeat center center;
		background-size: contain;
	}

	.festivalCont.sc4 .tabListWrap .tabList li a {
		background: url("/common/images/icon/2024_memories/pc/tab2_off.png") no-repeat center center;
	}

	.festivalCont.sc4 .tabListWrap .tabList li .on {
		background: url("/common/images/icon/2024_memories/pc/tab2_on.png") no-repeat center center;
	}

	.festivalCont.sc4 .tabListWrap .tabList {
		margin-top: -1.3vw;
	}

    /* 20231220 */
    .festivalCont.sc5 {
        margin-top: 1.5vw;
    }

	/* 굿즈&푸드 */
	.festivalCont.sc5 .inner {
		width: 100%;
		height: auto;
        margin: 0;
        background: none;
	}

	.festivalCont.sc5 .titWrap {
		padding-top: 5.313vw;
		height: 21.406vw;
		/* background: url("/common/images/icon/2023_miraclewinter/pc/bg_sc5.jpg") no-repeat center center; */
		box-sizing: border-box;
		background-size: cover;
	}

	.festivalCont.sc5 .contTit {
		margin: -2vw auto 0;
		width: 30.5vw;
		height: 9.2vw;
		background: url("/common/images/icon/2024_memories/pc/tit_sc5.png") no-repeat center center;
		background-size: contain;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap {
		position: relative;
		display: block;
		margin-top: -4.7vw;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabList ul {
		display: flex;
		justify-content: center;
		align-items: flex-end;
		font-size: 0;
		width: 100%;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabList ul li {
		position: relative;
		width: 50%;
		height: 6.167vw;
		/* border-top-left-radius: 40px;
		border-top-right-radius: 40px; */
        background: url("/common/images/icon/2024_memories/pc/goods_tab.png") no-repeat top center/cover;
		z-index: 1;
	}

    .festivalCont.sc5 .inner .tabSt2Wrap .tabList ul li.food {
        background: url("/common/images/icon/2024_memories/pc/food_tab.png") no-repeat top center/cover;
    }


	.festivalCont.sc5 .inner .tabSt2Wrap .tabList ul li.on {
		/* height: 5.208vw; */
		z-index: 5;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabList ul li a {
		display: flex;
		width: 100%;
		height: 100%;
		align-items: center;
        justify-content: flex-end;
	}

    /* 20231220 */

    .festivalCont.sc5 .inner .tabSt2Wrap .tabList ul li.food a {
        justify-content: flex-start;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabList ul li a span {
		background-size: contain !important;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabList ul li.goods a span {
		width: 14.823vw;
		height: 5.615vw;
		background: url("/common/images/icon/2024_memories/pc/text_goods.png") no-repeat center center;
        margin: 0 11vw;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabList ul li.food a span {
		width: 14.823vw;
		height: 5.615vw;
		background: url("/common/images/icon/2024_memories/pc/text_food.png") no-repeat center center;
        margin: 0 11.45vw;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont.goods {
		background: #ffd4ef;
	}
	
	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont.food {
		background: #93d1fb;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont {
		display: none;
		padding-top: 6vw;
		padding-bottom: 14vw;
        margin-top: -1px;
        
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont.food {
		padding-bottom: 11vw;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont.active {
		display: block;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul {
		margin: 0 auto;
		display: flex;
		flex-wrap: wrap;
		max-width: 52.083vw;
		justify-content: space-around;
		position: relative;
		z-index: 1;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont.food ul {
		/* max-width: 67.5vw; */
		justify-content: space-between;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li {
		position: relative;
		width: 15.8vw;
		text-align: center;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont.goods ul li:nth-child(n+4) {
		margin-top: 3.646vw;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont.food ul li:nth-child(n+4) {
		margin-top: 1.8vw;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li .imgWrap img {
		max-width: 100%;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li .imgWrap {
		position: relative;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li .imgWrap::after {
		content: "";
		display: block;
		position: absolute;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li p {
		margin-top: 1vw;
		font-size: 1.198vw;
		font-weight: 700;
		color: #111;
		text-align: center;
        font-family: "Noto Sans KR";
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li .tag {
		position: relative;
		top: 12%;
		left: 10%;
		z-index: 1;
		display: flex;
		flex-direction: row;
		align-items: center;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li .tag::before {
		content: "";
		display: inline-block;
		width: 0.833vw;
		height: 1.146vw;
		background: url("/common/images/icon/2023_miraclewinter/pc/ico_food.png") no-repeat center center;
		background-size: cover;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li .tag span {
		margin-left: 0.313vw;
		font-size: 0.833vw;
		color: #000;
		line-height: 1;
	}

	.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li p em {
		margin-top: 0.3vw;
		display: block;
		font-style: normal;
		font-weight: normal;
		line-height: 1.563vw;
	}

	.rightQuick {
		display: block;
		position: absolute;
		top: 5.625vw;
		left: 1.5vw;
		z-index: 100;
	}

	.rightQuick.fixed {
		position: fixed;
		top: 8.625vw;
	}

	.rightQuick .box {
		position: relative;
		width: 10.7vw;
		height: 32.479vw;
		background: url("/common/images/icon/2024_memories/pc/img_q_bg2.png") no-repeat top center;
		background-size: contain;
	}

	.rightQuick .box a {
		position: absolute;
		left: 3.8vw;
		font-family: "Noto Sans KR";
        font-weight: 900;
	}

	.rightQuick .box a.homeTxt {
		top: 11.3vw;
		
	}

	.rightQuick .box a.mappingTxt {
		top: 13.8vw;
		left: 2.3vw;
	}

	.rightQuick .box a.showTxt {
		top: 16.25vw;
		left: 3.4vw;
	}

	.rightQuick .box a.photoTxt {
		top: 18.7vw;
		left: 3.9vw;
	}

	.rightQuick .box a.eventTxt {
		top: 21.1vw;
		left: 3vw;
        text-align: center;
        line-height: 1.1;
	}

	.rightQuick .box a.menuTxt {
		left: 3vw;
		top: 24.9vw;
        letter-spacing: 0.3px;
	}

/* 
	.rightQuick .box span {
		font-size: 0;
		text-indent: -9999px;
	} */

    /* 20231220 */
    .rightQuick .box span {
        font-size: 1.1vw;
        color: #9e9bb7;
    }

    .rightQuick .box .on span {
        color: #dd4563;
    }


	@media (max-width:1500px) {
		.festivalDiv .rightQuick {
			display: none;
		}
	}


	/* 750vw */
	@media (max-width: 1024px) {
		.pc {
			display: none !important;
		}

		.mo {
			display: block !important;
            margin-top: -1px;
		}

		.swiperBox .swiper-pagination {
			padding: 5px 15px 5px 15px;
			bottom: 5%;
			border-radius: 11px;
		}

		.swiperBox .swiper-pagination .swiper-pagination-bullet {
			vertical-align: top;
			width: 11px;
			height: 11px;
			margin: 0 0 0 10px;
			background-size: 8px 8px;
		}

		.festivalDiv .fullBgWrap {
			/* padding-top: 15.867vw; */
			height: fit-content;
			background: url("/common/images/icon/2024_memories/mo/bg_full2.jpg") no-repeat top center;
			background-size: contain;
			box-sizing: border-box;
            margin-top: -1px;
		}

		.festivalCont .inner {
			margin: 0 auto;
			width: 100vw;
            height: 239vw;
            background: url("/common/images/icon/2024_memories/mo/bg_frame.png") no-repeat center center/cover;
            padding-top: 6.7vw;
		}

		/* 20231220 */
		.festivalCont.sc3 .inner {
			height: 235vw;
			/* margin-top: 25.3vw; */
		}	

		.festivalCont.sc4 .inner {
			background: url("/common/images/icon/2024_memories/mo/bg_frame2.png") no-repeat center center/cover;
            height: 239vw;
		}	

		.tabListWrap {
			padding-top: 2.5vw;
		}

		.tabListWrap .tabList {
			margin-bottom: 14.667vw;
			display: flex;
			height: 11.867vw;
			justify-content: space-between;
			width: 100%;
            flex-wrap: wrap;
		}

		.tabListWrap .tabList li {
			position: relative;
			text-align: center;
			width: 30.133vw;
			height: 100%;
		}
        
        /* 20231220 */
        .festivalCont .inner .ui-tabWrap {
            padding: 0 1.26vw;
        }

		.festivalCont.sc4 .tabCont .slide-content .location-info.mt52+.info-detail {
			margin-top: 24.667vw;
		}

		.festivalCont .tabCont .slide-content .location-info.mt52 {
			margin-top: 8.667vw;
		}

		.tabListWrap .tabList li a {
			background-size: cover !important;
		}

		.tabListWrap .tabList li>a>span {
			font-size: 3.467vw;
		}

		.festivalCont .tabCont.active {
			display: block;
		}

		.festivalCont .tabCont > div {
			width: 100%;
			height: 100%;
		}

		.swiperBox .swiper-wrapper .swiper-slide img {
			height: 73.9vw;
		}

		.festivalCont .tabCont div.slide-content {
			width: 100%;
			margin-top: 0;
		}

        .festivalCont.sc2 .tabListWrap .tabList li {
            width: 33.133vw;
			/* height: 12.41vw; */
        }

		.festivalCont.sc2 .tabListWrap .tabList {
			flex-wrap: nowrap;
			height: 20.867vw;
			margin-bottom: 2.3vw;
		}

		.festivalCont.sc4 .tabListWrap .tabList {
			display: flex;
			flex-direction: row;
			flex-wrap: nowrap;
			/* height: 29.333vw; */
			margin-bottom: 2.9vw;
			margin-top: 0;
		}

		.festivalCont.sc4 .tabListWrap .tabList li {
			width: 50vw;
			height: 13vw;
		}

		.festivalCont .tabCont .slide-content .tit {
			margin-top: 0;
			/* max-height: 6.667vw; */
			padding: 8.7vw 0 0 10.3vw;
		}

		.festivalCont .tabCont .slide-content .tit span {
			font-size: 6.4vw;
			letter-spacing: 0.3px;
		}

		.festivalCont .tabCont .slide-content .tit img {
			margin: 0 auto;
			max-height: 6.667vw;
		}

		.festivalCont .tabCont .slide-content .sub {
			margin-top: 6.7vw;
			font-size: 3.733vw;
			line-height: 1.4;
			padding: 0 10.2vw;
			min-height: 21.3vw;
			max-height: 21.3vw;
		}

		.festivalCont .tabCont.sc4 .slide-content .sub {
			min-height: 27.3vw;
			max-height: 27.3vw;
		}

		.festivalCont .tabCont .slide-content .location-info {
			margin-top: 8.667vw;
			padding: 0 10.406vw;
		}

		.festivalCont .tabCont .slide-content .location-info ul {
			gap: 4.5vw;
		}

		.festivalCont .tabCont .slide-content .location-info ul li {
			gap: 3vw;
			flex-direction: row;
			margin-top: 1vw;
			align-items: center;
		}

		.festivalCont .tabCont .slide-content .location-info .icon {
			width: 12vw;
			height: 8.933vw;
		}

		.festivalCont .tabCont .slide-content .location-info .time {
			/* background: url("/common/images/icon/2023_miraclewinter/mo/icon_time.png") no-repeat center center; */
			/* background-size: cover; */
			font-size: 3.733vw;
			font-weight: bold;
			padding: 0.8vw 1.781vw;
		}

		.festivalCont .tabCont .slide-content .location-info .place {
			/* background: url("/common/images/icon/2023_miraclewinter/mo/icon_place.png") no-repeat center center; */
			/* background-size: cover; */
			font-size: 3.733vw;
			font-weight: bold;
			padding: 0.8vw 1.781vw;
		}

		.festivalCont .tabCont .slide-content .location-info .txt {
			/* padding-top: 2.267vw; */
			font-size: 3.733vw;
			color: #fff;
			line-height: 1.3;
		}

		.festivalCont .tabCont .slide-content .info-detail {
			margin: 10vw auto 0;
			text-align: center;
			padding: 0 10.406vw 7vw;
		}

		.festivalCont .tabCont .slide-content .info-detail a {
			width: 44.4vw;
			height: 11.6vw;
		}

		.festivalCont .tabCont .slide-content .location-info.st2 ul {
			max-width: 68vw;
		}

		.festivalCont .tabCont .slide-content .location-info.st2 .txt {
			line-height: 4.8vw;
		}

		.festivalCont .tabCont .slide-content .etcTxt {
			font-size: 3.067vw;
		}

        /* 20231220 */
        .festivalCont.sc2 {
            padding-top: 2vw;
			margin-top: 21.5vw;
			margin-bottom: 0;
        }

		.festivalCont.sc2::after {
			display: none;
		}

		.festivalCont.sc2 .contTit {
			margin: 0 auto;
			width: 37.933vw;
			height: 19.6vw;
			background: url("/common/images/icon/2024_memories/mo/tit_sc2.png") no-repeat center center;
			background-size: contain;
		}

		.festivalCont.sc2 .tabListWrap .tabList li a {
			background: url("/common/images/icon/2024_memories/mo/tab_off.png") no-repeat center center;
		}

        .festivalCont.sc2 .tabListWrap .tabList li .on {
			background: url("/common/images/icon/2024_memories/mo/tab_on.png") no-repeat center center;
        }

		.festivalCont.sc3 {
			margin-top: 10vw;
			min-height: auto;
		}

		.festivalCont.sc3::after {
			display: none;
		}

		.festivalCont.sc3 .contTit {
			margin: 0 auto;
			width: 26.933vw;
			height: 19.6vw;
			background: url("/common/images/icon/2024_memories/mo/tit_sc3.png") no-repeat center center;
			background-size: contain;
		}

		/* 20231220 */
		.festivalCont.sc3 .tabListWrap .tabList {
			flex-wrap: nowrap;
			height: 20.867vw;
			margin-bottom: 2.3vw;
		}

		.festivalCont.sc3 .tabListWrap .tabList li {
			width: 33.133vw;
		}

		.festivalCont.sc3 .tabCont .slide-content .location-info {
			min-height: 45.5vw;
		}


		.festivalCont.sc3 .tabListWrap .tabList li a {
			background: url("/common/images/icon/2024_memories/mo/tab_off.png") no-repeat center center;
		}

		.festivalCont.sc3 .tabListWrap .tabList li .on {
			background: url("/common/images/icon/2024_memories/mo/tab_on.png") no-repeat center center;
		}

		.festivalCont.sc4 {
			margin-top: 19vw;
		}

		/* 20231220 */
		.festivalCont.sc4::after {
			display: none;
		}

		.festivalCont.sc4 .contTit {
			margin: 0 auto;
			width: 66.733vw;
			height: 20vw;
			background: url("/common/images/icon/2024_memories/mo/tit_sc4.png") no-repeat center center;
			background-size: contain;
		}

		.festivalCont.sc4 .tabListWrap .tabList li a {
			background: url("/common/images/icon/2024_memories/mo/tab2_off.png") no-repeat center center/contain !important;
		}

		.festivalCont.sc4 .tabListWrap .tabList li .on {
			background: url("/common/images/icon/2024_memories/mo/tab2_on.png") no-repeat center center/contain !important;
		}

		.festivalCont.sc5 .titWrap {
			padding-top: 0;
			height: 43.867vw;
			/* background: url("/common/images/icon/2023_miraclewinter/mo/bg_sc5.jpg") no-repeat center center; */
			box-sizing: border-box;
			background-size: cover;
		}

		/* 20231220 */
		.festivalCont.sc5 .inner {
			padding-top: 1.3vw;
			height: fit-content;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap {
			margin-top: -3.333vw;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabList ul {
			justify-content: space-between;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabList ul li {
			width: 48%;
			height: 13.333vw;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabList ul li.goods {
			border-top-right-radius: 20px;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabList ul li.food {
			border-top-left-radius: 20px;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabList ul li a span {
			background-size: contain !important;
		}

		/* .festivalCont.sc5 .inner .tabSt2Wrap .tabList ul li.on {
			height: 13.333vw;
		} */

		.festivalCont.sc5 .inner .tabSt2Wrap .tabList ul li.goods a span {
			width: 33.667vw;
			height: 8.8vw;
			background: url("/common/images/icon/2024_memories/mo/text_goods.png") no-repeat center center;
			margin: 2vw 7vw 0 0;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabList ul li.food a span {
			width: 33.667vw;
			height: 8.8vw;
			background: url("/common/images/icon/2024_memories/mo/text_food.png") no-repeat center center;
			margin: 2vw 0 0 7vw;
		}

		.festivalCont.sc5 .contTit {
			margin: 0 auto;
			width: 66.667vw;
			height: 33vw;
			background: url("/common/images/icon/2024_memories/mo/tit_sc5.png") no-repeat center center;
			background-size: contain;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabcont {
			padding-top: 17.267vw;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul,
		.festivalCont.sc5 .inner .tabSt2Wrap .tabcont.food ul {
			max-width: 81.667vw;
			justify-content: space-between
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li {
			width: 37.333vw;
			margin-top: 12.733vw !important;
		}

		/* 20231220 */
		.festivalCont.sc5 .inner .tabSt2Wrap .tabcont.food ul li {
			margin-top: 7.733vw !important;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabcont {
			padding-top: 16.267vw;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabcont.food ul {
			max-width: 83.667vw;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabcont.food ul li {
			width: 39.333vw;	
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li:nth-child(-n+2) {
			margin-top: 0 !important;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li .imgWrap::after {
			background-size: cover !important;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li p {
			margin-top: 4vw;
			font-size: 3.067vw;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li p em {
			margin-top: 0.333vw;
			font-size: 3.067vw;
			line-height: 4vw;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li .tag {
			/* top: 3.2vw; */
			left: 17%;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li .tag::before {
			width: 2.133vw;
			height: 2.933vw;
			background-size: cover;
		}

		.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li .tag span {
			font-size: 2.133vw;
		}
	}

	/* sc6 */
	.festivalCont.sc6 {
		padding-top: 3.5vw;
		margin-top: -1px;
	}

	.festivalCont.sc6 .tabListWrap {
		display: none;
	}

	.festivalCont.sc6::after {
		display: none;
	}

	.festivalCont.sc6 .contTit {
		margin: 0 23.7vw;
		width: 29.979vw;
		height: 12.167vw;
		background: url("/common/images/icon/2024_memories/pc/tit_sc6.png") no-repeat center center;
		background-size: contain;
        padding-top: 2vw;
	}

	.festivalCont.sc6 .inner {
		height: 61.7vw;
		background: url("/common/images/icon/2024_memories/pc/bg_frame2.png") no-repeat center center/cover;
	}

	.festivalCont.sc6 .inner .ui-tabWrap {
		margin-top: -2vw;
	}

	.festivalCont.sc6 .swiperBox .swiper-wrapper .swiper-slide img {
		height: 42.5vw;
	}

	.festivalCont.sc6 .tabCont > div {
		height: 42.5vw;
	}

	.festivalCont.sc6 .tabCont .slide-content .tit {
		padding-top: 6.406vw;
	}

	.festivalCont.sc6 .tabCont .slide-content .location-info {
		margin-top: 1.2vw;
	}

	.festivalCont.sc6 .tabCont .slide-content .info-detail {
		margin-top: 5.688vw;
	}

	@media (max-width: 1024px) {
		.festivalCont.sc6 .contTit {
			margin: 0 auto;
			width: 65.933vw;
			height: 19.6vw;
			background: url("/common/images/icon/2024_memories/mo/tit_sc6.png") no-repeat center center;
			background-size: contain;
		}

		.festivalCont.sc6 .inner {
			background: url("/common/images/icon/2024_memories/mo/bg_frame3.png") no-repeat center center/cover;
			height: 218vw;
		}

		.festivalCont.sc6 {
			padding-top: 11.5vw;
		}

		.festivalCont.sc6 .swiperBox .swiper-wrapper .swiper-slide img {
			height: 90.9vw;
		}

		.festivalCont.sc6 .tabCont > div {
			width: 100%;
			height: 100%;
		}

		.festivalCont.sc6 .tabCont .slide-content .info-detail {
			margin-top: 10.8vw;
		}
	}

	@media (max-width: 900px) {
		.festivalCont.sc5 .inner .tabSt2Wrap .tabcont ul li .tag {
			left: 12%;
		}
	}
</style>
		</head>
	<body data-drv-seq="206" data-device-type="web">
		<!-- Google Tag Manager (noscript) -->
		<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PZTZVG3"
		height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
		<!-- End Google Tag Manager (noscript) -->
		<a href="#cBody" class="goCon" >본문바로가기</a>
		<div id="wrapper">

			<div id="util">
				<div class="container">
					<div class="family">
						<a href="https://adventurebusan.lotteworld.com/kor/main/index.do" class="busan" target="_blank"><span>롯데월드 어드벤처 부산</span></a>
						<a href="https://seoulsky.lotteworld.com/" class="sky" target="_blank"><span>SEOUL SKY</span></a>
						<a href="http://www.lotteworld.com/aquarium/index.asp"  class="aqua" target="_blank"><span>롯데월드 아쿠아리움</span></a>
						<a href="http://www.lotteworld.com/waterpark/index.asp" class="water" target="_blank"><span>롯데워터파크</span></a>
						<a href="https://lotteworld.vn/" class="aquaVn" target="_blank"><span>롯데월드 아쿠아리움 하노이</span></a>
					</div>
					<div class="right">
						<div class="links">
							<a href="/museum/main/index.do" target="_blank" title="민속박물관 새창열기">민속박물관</a>
							<a href="/icerink/main/index.do" target="_blank" title="아이스링크 새창열기">아이스링크</a>
						</div>
						<div class="login">
							<a href="https://adventure.lotteworld.com/kor/member/login/index.do">Login</a>
									<a href="javascript:SSO_COMMON.MemberJoin();" title="아이디와 패스워드가 없으시면 회원가입 버튼을 클릭하세요.">회원가입</a>
								</div>
						<div class="lang">
							<a href="javascript:">KOR</a>
							<div>
								<a href="/kor/main/index.do" class="kor">KOR</a>
								<a href="/eng/main/index.do" class="eng">ENG</a>
								</div>
						</div>
					</div>
				</div>
			</div><!-- // util -->
			<div id="header">
				<div class="container">
					<h1><a href="/kor/main/index.do"><img src="/common/images/logo.png" alt="롯데월드 어드벤쳐 로고" /></a></h1>
					<ul id="gnb">
						<li>
											<a href="javascript:" class="oneD" target="_self" >즐길거리</a>
												<div class="openDiv">
													<div class="inner">
														<div class="leftArea">
															<div class="timeInfo">
																<div class="time"><p class="tit"><strong class="date">02.05 (월)</strong><span>오늘의 파크</span><br/> 운영시간</p>
																	<p class="txt"><span>10:00</span> <span>- 21:00</span></p>
																</div>
															</div>
															<ul class="twoD">
															<li>
																	<a href="/kor/enjoy/attrctn/list.do" target="_self" >어트랙션</a>
																	<div class="thrD">
																	<!-- 이전 뎊스가 5이면 닫아준다. -->
																	</div>
															</li>
															<li>
																	<a href="/kor/enjoy/festival/view.do" target="_self" >페스티벌</a>
																	<div class="thrD">
																	<!-- 이전 뎊스가 5이면 닫아준다. -->
																	</div>
															</li>
															<li>
																	<a href="/kor/enjoy/performance/list.do" target="_self" >공연</a>
																	<div class="thrD">
																	<a href="/kor/enjoy/performance/list.do" target="_self" >금주의 공연</a>
										<a href="/kor/participating-programs/performance/list.do" target="_self" >공연 참여</a>
										<!-- 이전 뎊스가 5이면 닫아준다. -->
																	</div>
															</li>
															<li>
																	<a href="/kor/enjoy/restaurant/list.do" target="_self" >다이닝/쇼핑</a>
																	<div class="thrD">
																	<a href="/kor/enjoy/restaurant/list.do" target="_self" >레스토랑</a>
										<a href="/kor/enjoy/giftshop/list.do" target="_self" >기프트샵</a>
										<a href="/kor/enjoy/playshop/list.do" target="_self" >체험플레이샵</a>
										<!-- 이전 뎊스가 5이면 닫아준다. -->
																</div>
															</li>
														</ul>
													</div>
													<div class="rightArea">
														<div class="appDown">
															<a href="javascript:setAppDownload();" title="APP 설치 새창 열림">
																<p class="tit"><span>앱 다운로드</span>로<br> 더 스마트하게!</p>
																<ul>
																	<li>모바일 예매</li>
																	<li>모바일 티켓발권</li>
																	<!-- <li>매직패스 예약</li> -->
																</ul>
																<strong class="arrowBg"></strong>
															</a>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li>
											<a href="javascript:" class="oneD" target="_self" >요금/우대혜택</a>
												<div class="openDiv">
													<div class="inner">
														<div class="leftArea">
															<div class="timeInfo">
																<div class="time"><p class="tit"><strong class="date">02.05 (월)</strong><span>오늘의 파크</span><br/> 운영시간</p>
																	<p class="txt"><span>10:00</span> <span>- 21:00</span></p>
																</div>
															</div>
															<ul class="twoD">
															<li>
																	<a href="/kor/price/ticket/contentsid/282/index.do" target="_self" >이용요금 </a>
																	<div class="thrD">
																	<a href="/kor/price/ticket/contentsid/282/index.do" target="_self" >티켓요금 </a>
										<a href="/kor/price/premium-magic-pass/contentsid/283/index.do" target="_self" >매직패스 프리미엄</a>
										<!-- 이전 뎊스가 5이면 닫아준다. -->
																	</div>
															</li>
															<li>
																	<a href="/kor/price/benefit/information/list.do" target="_self" >이달의 혜택</a>
																	<div class="thrD">
																	<a href="/kor/price/benefit/information/list.do" target="_self" >혜택 정보</a>
										<a href="/kor/price/card/information/list.do" target="_self" >제휴 카드조회</a>
										<!-- 이전 뎊스가 5이면 닫아준다. -->
																	</div>
															</li>
															<li>
																	<a href="/kor/price/member/base/contentsid/294/index.do" target="_self" >연간이용</a>
																	<div class="thrD">
																	<a href="/kor/price/member/base/contentsid/294/index.do" target="_self" >권종별 기본가격</a>
										<a href="/kor/price/member/information/list.do" target="_self" >할인정보</a>
										<a href="/kor/price/member/discount/contentsid/293/index.do" target="_self" >특별혜택</a>
										<!-- 이전 뎊스가 5이면 닫아준다. -->
																</div>
															</li>
														</ul>
													</div>
													<div class="rightArea">
														<div class="appDown">
															<a href="javascript:setAppDownload();" title="APP 설치 새창 열림">
																<p class="tit"><span>앱 다운로드</span>로<br> 더 스마트하게!</p>
																<ul>
																	<li>모바일 예매</li>
																	<li>모바일 티켓발권</li>
																	<!-- <li>매직패스 예약</li> -->
																</ul>
																<strong class="arrowBg"></strong>
															</a>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li>
											<a href="javascript:" class="oneD" target="_self" >이용가이드</a>
												<div class="openDiv">
													<div class="inner">
														<div class="leftArea">
															<div class="timeInfo">
																<div class="time"><p class="tit"><strong class="date">02.05 (월)</strong><span>오늘의 파크</span><br/> 운영시간</p>
																	<p class="txt"><span>10:00</span> <span>- 21:00</span></p>
																</div>
															</div>
															<ul class="twoD">
															<li>
																	<a href="/kor/usage-guide/service/index.do" target="_self" >운영/운휴</a>
																	<div class="thrD">
																	<!-- 이전 뎊스가 5이면 닫아준다. -->
																	</div>
															</li>
															<li>
																	<a href="/kor/usage-guide/park/contentsid/335/index.do" target="_self" >파크 이용안내</a>
																	<div class="thrD">
																	<!-- 이전 뎊스가 5이면 닫아준다. -->
																	</div>
															</li>
															<li>
																	<a href="/kor/usage-guide/service/convenient-facilities/app/contentsid/390/index.do" target="_self" >편의시설/제도</a>
																	<div class="thrD">
																	<a href="/kor/usage-guide/service/convenient-facilities/app/contentsid/390/index.do" target="_self" >모바일 APP</a>
										<a href="/kor/usage-guide/service/convenient-facilities/information/contentsid/391/index.do" target="_self" >편의시설</a>
										<a href="/kor/usage-guide/service/convenient-facilities/disabled-person/contentsid/393/index.do" target="_self" >장애인 편의제도</a>
										<!-- 이전 뎊스가 5이면 닫아준다. -->
																	</div>
															</li>
															<li>
																	<a href="/kor/usage-guide/service/location/index.do" target="_self" >오시는 길</a>
																	<div class="thrD">
																	<!-- 이전 뎊스가 5이면 닫아준다. -->
																	</div>
															</li>
															<li>
																	<a href="/kor/usage-guide/service/guide-map/contentsid/375/index.do" target="_self" >가이드맵</a>
																	<div class="thrD">
																	</ul>
													</div>
													<div class="rightArea">
														<div class="appDown">
															<a href="javascript:setAppDownload();" title="APP 설치 새창 열림">
																<p class="tit"><span>앱 다운로드</span>로<br> 더 스마트하게!</p>
																<ul>
																	<li>모바일 예매</li>
																	<li>모바일 티켓발권</li>
																	<!-- <li>매직패스 예약</li> -->
																</ul>
																<strong class="arrowBg"></strong>
															</a>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li>
											<a href="javascript:" class="oneD" target="_self" >소통서비스</a>
												<div class="openDiv">
													<div class="inner">
														<div class="leftArea">
															<div class="timeInfo">
																<div class="time"><p class="tit"><strong class="date">02.05 (월)</strong><span>오늘의 파크</span><br/> 운영시간</p>
																	<p class="txt"><span>10:00</span> <span>- 21:00</span></p>
																</div>
															</div>
															<ul class="twoD">
															<li>
																	<a href="/kor/communication/notice/list.do" target="_self" >공지사항</a>
																	<div class="thrD">
																	<!-- 이전 뎊스가 5이면 닫아준다. -->
																	</div>
															</li>
															<li>
																	<a href="/kor/communication/faq/list.do" target="_self" >FAQ</a>
																	<div class="thrD">
																	<!-- 이전 뎊스가 5이면 닫아준다. -->
																	</div>
															</li>
															<li>
																	<a href="/kor/communication/visit-before-inquire/write.do" target="_self" >고객소리함</a>
																	<div class="thrD">
																	<a href="/kor/communication/visit-before-inquire/write.do" target="_self" >이용문의</a>
										<a href="/kor/communication/visit-after-inquire/write.do" target="_self" >칭찬/불편/건의</a>
										<a href="/kor/communication/lost-property/list.do" target="_self" >분실물 센터</a>
										<a href="/kor/communication/broadcast-inquire/write.do" target="_self" >촬영문의</a>
										<!-- 이전 뎊스가 5이면 닫아준다. -->
																</div>
															</li>
														</ul>
													</div>
													<div class="rightArea">
														<div class="appDown">
															<a href="javascript:setAppDownload();" title="APP 설치 새창 열림">
																<p class="tit"><span>앱 다운로드</span>로<br> 더 스마트하게!</p>
																<ul>
																	<li>모바일 예매</li>
																	<li>모바일 티켓발권</li>
																	<!-- <li>매직패스 예약</li> -->
																</ul>
																<strong class="arrowBg"></strong>
															</a>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li>
											<a href="javascript:" class="oneD" target="_self" >더 알아보기</a>
												<div class="openDiv">
													<div class="inner">
														<div class="leftArea">
															<div class="timeInfo">
																<div class="time"><p class="tit"><strong class="date">02.05 (월)</strong><span>오늘의 파크</span><br/> 운영시간</p>
																	<p class="txt"><span>10:00</span> <span>- 21:00</span></p>
																</div>
															</div>
															<ul class="twoD">
															<li>
																	<a href="/kor/enjoy/performance/character/contentsid/2285/index.do" target="_self" >캐릭터소개</a>
																	<div class="thrD">
																	<!-- 이전 뎊스가 5이면 닫아준다. -->
																	</div>
															</li>
															<li>
																	<a href="/kor/enjoy/reshow/contentsid/2286/index.do" target="_self" >다시만난월드 : 캐릭터전시회</a>
																	<div class="thrD">
																	</ul>
													</div>
													<div class="rightArea">
														<div class="appDown">
															<a href="javascript:setAppDownload();" title="APP 설치 새창 열림">
																<p class="tit"><span>앱 다운로드</span>로<br> 더 스마트하게!</p>
																<ul>
																	<li>모바일 예매</li>
																	<li>모바일 티켓발권</li>
																	<!-- <li>매직패스 예약</li> -->
																</ul>
																<strong class="arrowBg"></strong>
															</a>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li>
											<a href="javascript:" class="oneD" target="_self" >리뷰</a>
												<div class="openDiv">
													<div class="inner">
														<div class="leftArea">
															<div class="timeInfo">
																<div class="time"><p class="tit"><strong class="date">02.05 (월)</strong><span>오늘의 파크</span><br/> 운영시간</p>
																	<p class="txt"><span>10:00</span> <span>- 21:00</span></p>
																</div>
															</div>
															<ul class="twoD">
															<li>
																	<a href="/kor/review/vreview/index.do" target="_self" >리뷰</a>
																	<div class="thrD">
																	</ul>
									</div>
									<div class="rightArea">
										<div class="appDown">
											<a href="javascript:setAppDownload();" title="APP 설치 새창 열림">
												<p class="tit"><span>앱 다운로드</span>로<br> 더 스마트하게!</p>
												<ul>
													<li>모바일 예매</li>
													<li>모바일 티켓발권</li>
													<!-- <li>매직패스 예약</li> -->
												</ul>
												<strong class="arrowBg"></strong>
											</a>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
					<div class="right" data-controller="controller/COSrchController" data-drv-nm="kor">
						<p class="srchBtn"><a href="javascript:" class="btnHeaderSrch"><span><img src="/common/images/btn/header_srch_btn.png" alt="검색창 열기" /></span><span class="txt">검색</span></a></p>
						<p class="reserBtn" id="reserBtn"><a href="javascript:goBTicket();"><span><img src="/common/images/btn/reser_btn.png" alt="온라인예매"></span><span class="txt">예매</span></a></p>
						<p class="groupBtn"><a href="/kor/group-program/introduce/contentsid/2281/index.do"><span><img src="/common/images/btn/group_btn.png" alt="단체프로그램" /></span><span class="txt">단체</span></a></p>
						<p class="groupBtn type2">
							<a href="/kor/company-program/introduce/contentsid/697/index.do">
								<span><img src="/common/images/btn/company_btn.png" alt="기업체" /></span>
								<span class="txt">기업체</span>
							</a>
						</p>
						<p class="productBtn">
							<a href="https://smartstore.naver.com/lotteworld" target="_blank">
								<span><img src="/common/images/btn/product_btn.png" alt="상품몰" /></span>
								<span class="txt">상품몰</span>
							</a>
						</p>
					</div>
				</div>
				<div class="srchArea" >
					<div class="container"><!-- 2018-06-12 container로 묶음 -->
						<div class="inputArea">
							<form name="frmWebTotalSrch" id="frmWebTotalSrch" method="get" action="/kor/lotteworld/total/search.do">
								<input type="text" style="display:none;" class="notRequired" />
								<input type="text" placeholder="검색어를 입력해주세요." title="검색어" name="totalq" maxlength="30" onkeydown="if(event.keyCode==13){setTotalSrch('frmWebTotalSrch');return false;}"/>
								<a href="javascript:setTotalSrch('frmWebTotalSrch')"><img src="/common/images/btn/header_srch_btn.gif" alt=""></a>
							</form>
						</div>
						<div class="exArea">
							<p class="ex">ex</p>
							<div class="divSrchExContainer"></div>
						</div>
						<a href="javascript:" class="closeBtn"></a>
					</div>
				</div>
			</div><!-- // header -->

			<!-- 모바일 헤더 -->
			<div class="mHeader">
				<div>
					<a href="javascript:" class="menuBtn"><img src="/common/images/btn/m_gnb_btn.png" alt="" /></a>
					<h1 class="logo">
						<a href="/"><img src="/common/images/m_logo.png" alt="" /></a>
					</h1>
					<a href="javascript:srchCtrl.getSrchTag();" class="srchBtn"></a>
				</div>
				<div class="mSrchArea"><!-- 모바일 검색 -->
					<div class="inputArea">
						<form name="frmMblTotalSrch" id="frmMblTotalSrch" method="get" action="/kor/lotteworld/total/search.do">
							<input type="text" style="display:none;" class="notRequired" />
							<input type="text" placeholder="검색어를 입력해주세요." title="검색어" name="totalq" maxlength="30" onkeydown="if(event.keyCode==13){setTotalSrch('frmMblTotalSrch');return false;} "/>
							<a href="javascript:setTotalSrch('frmMblTotalSrch')"><img src="/common/images/btn/mheader_srch_btn.png" alt=""></a>
						</form>
					</div>
					<div class="exArea">
						<p class="ex">ex</p>
						<div class="divSrchExContainer"></div>
					</div>
				</div><!-- // srchArea -->
			</div><!-- // mHeader -->

			<div class="mMenuArea"><!-- 모바일 메뉴 -->
				<div class="mMenuBgWrap">

					<div class="top">
						<a href="https://adventure.lotteworld.com/kor/member/login/index.do" class="loginBt">로그인</a>
							<div class="langSel">
							<select id="langSel" title="다국어" onchange="location.href=this.value">
								<option value="/kor/main/index.do"     selected>KOR</option>
								<option value="/eng/main/index.do"     >ENG</option>

								</select>
						</div>
						<a href="javascript:" class="closeBt"><img src="/common/images/gnb/m_close_btn.png" alt="" /></a>
					</div>
					<div class="util">
						<a href="javascript:SSO_COMMON.MemberJoin();" title="아이디와 패스워드가 없으시면 회원가입 버튼을 클릭하세요.">회원가입</a>
							<a href="/kor/group-program/introduce/contentsid/2281/index.do">단체 안내</a>
						<a href="/kor/company-program/introduce/contentsid/697/index.do" class="reserBtn" >기업체</a>
					</div>
					<div class="reservationWrap">
						<a href="javascript:goBTicket();"><span>온라인 예매</span></a>
					</div>


				</div>

				<div class="adventureLink">
                    <a href="/museum/main/index.do" class="museum" target="_blank">
                        <img src="/common/images/gnb/m_museum_btn.jpg" alt="">
                        <span class="blind">롯데월드 민속박물관</span>
                    </a>
                    <a href="/icerink/main/index.do" class="rink" target="_blank">
                        <img src="/common/images/gnb/m_icerink_btn.jpg" alt="">
                        <span class="blind">롯데월드 아이스링크</span>
                    </a>
                </div>
				<div class="gnbArea">
					<a data-dpth="3"  href="javascript:" class="oneD on" target="_self" >즐길거리</a>
									<div class="twoD" style="display:block;">
									<a data-dpth="4" class=""  href="/kor/enjoy/attrctn/list.do" class="" target="_self" >어트랙션</a>
										<div class="thrD" >
											<!-- 5 end. -->
										</div>
										<a data-dpth="4" class=" on"  href="/kor/enjoy/festival/view.do" class="on" target="_self" >페스티벌</a>
										<div class="thrD" >
											<!-- 5 end. -->
										</div>
										<a data-dpth="4" class="thrBt"  href="javascript:" class="" target="_self" >공연</a>
										<div class="thrD " style="display:;">
											<a data-dpth="5" href="/kor/enjoy/performance/list.do" target="_self" >금주의 공연</a>
											<a data-dpth="5" href="/kor/participating-programs/performance/list.do" target="_self" >공연 참여</a>
											<!-- 5 end. -->
										</div>
										<a data-dpth="4" class="thrBt"  href="javascript:" class="" target="_self" >다이닝/쇼핑</a>
										<div class="thrD " style="display:;">
											<a data-dpth="5" href="/kor/enjoy/restaurant/list.do" target="_self" >레스토랑</a>
											<a data-dpth="5" href="/kor/enjoy/giftshop/list.do" target="_self" >기프트샵</a>
											<a data-dpth="5" href="/kor/enjoy/playshop/list.do" target="_self" >체험플레이샵</a>
											</div>
										</div>
									<a data-dpth="3"  href="javascript:" class="oneD " target="_self" >요금/우대혜택</a>
									<div class="twoD" style="display:;">
									<a data-dpth="4" class="thrBt"  href="javascript:" class="" target="_self" >이용요금 </a>
										<div class="thrD " style="display:;">
											<a data-dpth="5" href="/kor/price/ticket/contentsid/282/index.do" target="_self" >티켓요금 </a>
											<a data-dpth="5" href="/kor/price/premium-magic-pass/contentsid/283/index.do" target="_self" >매직패스 프리미엄</a>
											<!-- 5 end. -->
										</div>
										<a data-dpth="4" class="thrBt"  href="javascript:" class="" target="_self" >이달의 혜택</a>
										<div class="thrD " style="display:;">
											<a data-dpth="5" href="/kor/price/benefit/information/list.do" target="_self" >혜택 정보</a>
											<a data-dpth="5" href="/kor/price/card/information/list.do" target="_self" >제휴 카드조회</a>
											<!-- 5 end. -->
										</div>
										<a data-dpth="4" class="thrBt"  href="javascript:" class="" target="_self" >연간이용</a>
										<div class="thrD " style="display:;">
											<a data-dpth="5" href="/kor/price/member/base/contentsid/294/index.do" target="_self" >권종별 기본가격</a>
											<a data-dpth="5" href="/kor/price/member/information/list.do" target="_self" >할인정보</a>
											<a data-dpth="5" href="/kor/price/member/discount/contentsid/293/index.do" target="_self" >특별혜택</a>
											</div>
										</div>
									<a data-dpth="3"  href="javascript:" class="oneD " target="_self" >이용가이드</a>
									<div class="twoD" style="display:;">
									<a data-dpth="4" class=""  href="/kor/usage-guide/service/index.do" class="" target="_self" >운영/운휴</a>
										<div class="thrD" >
											<!-- 5 end. -->
										</div>
										<a data-dpth="4" class=""  href="/kor/usage-guide/park/contentsid/335/index.do" class="" target="_self" >파크 이용안내</a>
										<div class="thrD" >
											<!-- 5 end. -->
										</div>
										<a data-dpth="4" class="thrBt"  href="javascript:" class="" target="_self" >편의시설/제도</a>
										<div class="thrD " style="display:;">
											<a data-dpth="5" href="/kor/usage-guide/service/convenient-facilities/app/contentsid/390/index.do" target="_self" >모바일 APP</a>
											<a data-dpth="5" href="/kor/usage-guide/service/convenient-facilities/information/contentsid/391/index.do" target="_self" >편의시설</a>
											<a data-dpth="5" href="/kor/usage-guide/service/convenient-facilities/disabled-person/contentsid/393/index.do" target="_self" >장애인 편의제도</a>
											<!-- 5 end. -->
										</div>
										<a data-dpth="4" class=""  href="/kor/usage-guide/service/location/index.do" class="" target="_self" >오시는 길</a>
										<div class="thrD" >
											<!-- 5 end. -->
										</div>
										<a data-dpth="4" class=""  href="/kor/usage-guide/service/guide-map/contentsid/375/index.do" class="" target="_self" >가이드맵</a>
										<div class="thrD" >
											</div>
										</div>
									<a data-dpth="3"  href="javascript:" class="oneD " target="_self" >소통서비스</a>
									<div class="twoD" style="display:;">
									<a data-dpth="4" class=""  href="/kor/communication/notice/list.do" class="" target="_self" >공지사항</a>
										<div class="thrD" >
											<!-- 5 end. -->
										</div>
										<a data-dpth="4" class=""  href="/kor/communication/faq/list.do" class="" target="_self" >FAQ</a>
										<div class="thrD" >
											<!-- 5 end. -->
										</div>
										<a data-dpth="4" class="thrBt"  href="javascript:" class="" target="_self" >고객소리함</a>
										<div class="thrD " style="display:;">
											<a data-dpth="5" href="/kor/communication/visit-before-inquire/write.do" target="_self" >이용문의</a>
											<a data-dpth="5" href="/kor/communication/visit-after-inquire/write.do" target="_self" >칭찬/불편/건의</a>
											<a data-dpth="5" href="/kor/communication/lost-property/list.do" target="_self" >분실물 센터</a>
											<a data-dpth="5" href="/kor/communication/broadcast-inquire/write.do" target="_self" >촬영문의</a>
											</div>
										</div>
									<a data-dpth="3"  href="javascript:" class="oneD " target="_self" >더 알아보기</a>
									<div class="twoD" style="display:;">
									<a data-dpth="4" class=""  href="/kor/enjoy/performance/character/contentsid/2285/index.do" class="" target="_self" >캐릭터소개</a>
										<div class="thrD" >
											<!-- 5 end. -->
										</div>
										<a data-dpth="4" class=""  href="/kor/enjoy/reshow/contentsid/2286/index.do" class="" target="_self" >다시만난월드 : 캐릭터전시회</a>
										<div class="thrD" >
											</div>
										</div>
									<a data-dpth="3"  href="javascript:" class="oneD " target="_self" >리뷰</a>
									<div class="twoD" style="display:;">
									<a data-dpth="4" class=""  href="/kor/review/vreview/index.do" class="" target="_self" >리뷰</a>
										<div class="thrD" >
											</div>
						</div>
						</div>
				<div class="linkWrap">
                    <ul>
                        <li class="item down">
                            <a href="https://adventure.lotteworld.com/kor/usage-guide/service/convenient-facilities/app/contentsid/390/index.do">
                                <span>앱 다운로드</span>
                            </a>
                        </li>
                        <li class="item mall">
                            <a href="https://smartstore.naver.com/lotteworld" target="_blank">
                                <span>상품몰</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="familyWrap">
                    <ul class="familyList">
                        <li class="icon1">
                            <a href="https://adventurebusan.lotteworld.com/kor/main/index.do" target="_blank">
                                <span class="blind">롯데월드 어드벤처 부산</span>
                            </a>
                        </li>
                        <li class="icon2">
                            <a href="https://seoulsky.lotteworld.com/" target="_blank" >
                                <span class="blind">SEOUL SKY</span>
                            </a>
                        </li>
                        <li class="icon3">
                            <a href="http://www.lotteworld.com/aquarium/index.asp" target="_blank">
                                <span class="blind">롯데월드 아쿠아리움</span>
                            </a>
                        </li>
                        <li class="icon4">
                            <a href="http://www.lotteworld.com/waterpark/index.asp" target="_blank">
                                <span class="blind">롯데워터파크</span>
                            </a>
                        </li>
						<li class="icon5">
                            <a href="https://lotteworld.vn/" target="_blank">
                                <span class="blind">롯데월드 아쿠아리움 하노이</span>
                            </a>
                        </li>
                    </ul>
                </div>
				<!-- gnbArea end -->
				</div><!-- // menuArea -->



			<div id="cBody">
				<div class="subWrap">
				<div class="subVisArea type4">
	<div class="lnbArea" data-controller="controller/COLnbAreaController">
		<div class="lnb">
				<a href="/kor/main/index.do" class="home"></a>
				<div class="oneD">
					<a href="javascript:" class="">즐길거리</a>
					<div class="moreMenu">
						<a href="/kor/enjoy/attrctn/list.do" target="_self" class="menuBtn" data-menu-seq="238" data-dpth="3" class="current">즐길거리</a>
							<a href="/kor/price/ticket/contentsid/282/index.do" target="_self" class="menuBtn" data-menu-seq="237" data-dpth="3" class="">요금/우대혜택</a>
							<a href="/kor/usage-guide/service/index.do" target="_self" class="menuBtn" data-menu-seq="321" data-dpth="3" class="">이용가이드</a>
							<a href="/kor/communication/notice/list.do" target="_self" class="menuBtn" data-menu-seq="322" data-dpth="3" class="">소통서비스</a>
							<a href="/kor/enjoy/performance/character/contentsid/2285/index.do" target="_self" class="menuBtn" data-menu-seq="2283" data-dpth="3" class="">더 알아보기</a>
							<a href="/kor/group-program/introduce/contentsid/2281/index.do" target="_self" class="menuBtn" data-menu-seq="329" data-dpth="3" class="">단체</a>
							<a href="/kor/review/vreview/index.do" target="_self" class="menuBtn" data-menu-seq="2284" data-dpth="3" class="">리뷰</a>
							<a href="/kor/lotteworld/introduce/esg/contentsid/711/index.do" target="_self" class="menuBtn" data-menu-seq="709" data-dpth="3" class="">롯데월드 소개</a>
							<a href="/kor/lotteworld/introduce/alliance/contentsid/353/index.do" target="_self" class="menuBtn" data-menu-seq="340" data-dpth="3" class="">유틸리티</a>
							<a href="/kor/company-program/introduce/contentsid/697/index.do" target="_self" class="menuBtn" data-menu-seq="695" data-dpth="3" class="">기업체 프로그램</a>
							</div>
				</div>
				<div class="twoD">
					<a href="javascript:" class="">페스티벌</a>
						<div class="moreMenu">
							<a href="/kor/enjoy/attrctn/list.do" target="_self"  data-menu-seq="239" data-dpth="4" class="">어트랙션</a>
								<a href="/kor/enjoy/festival/view.do" target="_self"  data-menu-seq="240" data-dpth="4" class="current">페스티벌</a>
								<a href="/kor/enjoy/performance/list.do" target="_self"  data-menu-seq="241" data-dpth="4" class="">공연</a>
								<a href="/kor/enjoy/restaurant/list.do" target="_self"  data-menu-seq="396" data-dpth="4" class="">다이닝/쇼핑</a>
								</div>
					</div>
				<div class="thrD">
					</div>
			</div><!-- // lnb -->
		<a href="javascript:history.back(-1);" class="mBackBt"><img src="/common/images/btn/mback_bt_w.png" alt="이전페이지로"></a>
			<div class="shareArea" data-controller="controller/COSnSSharingController">
		<div class="share">
					<a href="javascript:"></a>
					<div>
						<a href="javascript:" class="facebook snsSharing" data-gb="facebook" data-type-gb="view" title="페스티벌"></a>
						<a href="javascript:" class="twitter snsSharing" data-gb="twitter" data-type-gb="view" title="페스티벌"></a>
						<a href="javascript:" class="kakao snsSharing" data-gb="kakao" data-type-gb="view" title="페스티벌" id="kakao-link-btn"></a>
						<a href="javascript:" class="link snsSharing" data-gb="copyurl" data-type-gb="view" title="페스티벌"></a>				
					</div>
				</div>
			<div class="print"><a href="javascript:" class="snsSharing" data-gb="print" data-type-gb="view"></a></div>
	</div><!-- // shareArea -->
</div><!-- // lnbArea -->
	<h2 class="cWhite">페스티벌</h2>
			<p class="h2Txt cWhite">시즌별로 새로워지는 롯데월드 페스티벌을 만나보세요!</p>
			</div>
	<div>
			<div class="container">
				<div class="festivalTop" style="background:url() no-repeat top center;">
					<p class="topTit">Sharing Memories 2024</p>

					<p class="infoTit"></p>
				</div>
			</div>

			<div>
				<!-- 2024 memories -->

<div class="festivalDiv">
<div class="festivalMain">
<div class="visualWrap"><img class="pc" src="/common/images/icon/2024_memories/pc/bg_main2.jpg" /> <img class="mo" src="/common/images/icon/2024_memories/mo/bg_main2.jpg" />
<div class="hideText">
<h2 class="hideText">MIRACLE WINTER 2023</h2>
<span class="hideText">2023.11.25(토) ~ 12.31(일)</span></div>
</div>

<div class="storyWrap"><img class="pc" src="/common/images/icon/2024_memories/pc/bg_synopsis2.jpg" /> <img class="mo" src="/common/images/icon/2024_memories/mo/bg_synopsis2.jpg" />
<div class="txtWrap">
<p class="hideText">시놉시스</p>

<p class="hideText">청룡의 해가 떠오르는 2024년, 롯데월드도 35주년을 맞이했어요! 따뜻하고 신비로운 롯데월드에서 로티로리와 친구들이 아주 재미난 이벤트를 준비했다고 하는데요! 어떤 신나고 즐거운 일들이 있을 지, 지금 보러 가실까요?</p>
</div>
</div>
</div>

<div class="fullBgWrap"><!-- 35주년 맵핑쇼 -->
<div class="festivalCont sc6" id="mapping">
<div class="inner">
<p class="contTit">35주년 맵핑쇼</p>

<div class="ui-tabWrap">
<div class="tabListWrap">
<ul class="tabList">
	<li class="item1"><a class="on" href="#" id="tab-1"><span>35주년 맵핑쇼</span> </a></li>
</ul>
</div>

<div class="tabWrap"><!-- 35주년 맵핑쇼 -->
<div class="tabCont active" id="content-1">
<div>
<div class="swiperBox">
<div class="swiper-container">
<div class="swiper-wrapper">
<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont01_01_01.jpg" /></div>

<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont01_01_02.jpg" /></div>

<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont01_01_03.jpg" /></div>
</div>

<div class="swiper-pagination">&nbsp;</div>
</div>
</div>
</div>

<div class="slide-content">
<div class="tit"><span>35주년 맵핑쇼 </span></div>

<div class="sub">35주년을 맞이하여 진행되는 환상적인 맵핑쇼, Luminous Memories of the Magical World!<br />
매직캐슬에서 로티로리가 걸어온<br />
35년간의 모험이야기를 확인해보세요!</div>

<div class="location-info">
<ul>
	<li><span class="place">장소</span> <span class="txt">매직아일랜드 매직캐슬</span></li>
	<li><span class="time">시간</span> <span class="txt">오후 8시 40분</span></li>
</ul>
</div>

<div class="info-detail"><a href="https://adventure.lotteworld.com/kor/communication/notice/view.do?pageIndex=1&amp;detailsKey=548&amp;ancmCd=&amp;q=" target="_blank"><img class="pc" src="/common/images/icon/2024_memories/pc/btn_info_detail2.png" /> <img class="mo" src="/common/images/icon/2024_memories/mo/btn_info_detail2.png" /> <span class="hide-txt">자세히 보기</span> </a></div>
</div>
</div>
</div>
</div>
</div>
</div>
<!-- 공연안내 -->

<div class="festivalCont sc2" id="show">
<div class="inner">
<p class="contTit">공연안내</p>

<div class="ui-tabWrap">
<div class="tabListWrap">
<ul class="tabList">
	<li class="item1"><a class="on" href="#" id="tab-1"><span>35th<br class="mo" />
	셀러브레이션 파티 </span> </a></li>
	<li class="item2"><a href="#" id="tab-2"><span>마법 성냥과<br class="mo" />
	꿈꾸는 밤 </span> </a></li>
	<li class="item3"><a href="#" id="tab-3"><span>민속 한마당 </span> </a></li>
</ul>
</div>

<div class="tabWrap"><!-- 35th 셀러브레이션 파티 -->
<div class="tabCont active" id="content-1">
<div>
<div class="swiperBox">
<div class="swiper-container">
<div class="swiper-wrapper">
<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont01_02_01.jpg" /></div>

<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont01_02_02.jpg" /></div>

<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont01_02_03.jpg" /></div>
</div>

<div class="swiper-pagination">&nbsp;</div>
</div>
</div>
</div>

<div class="slide-content">
<div class="tit"><span>35th<br class="pc" />
셀러브레이션 파티 </span></div>

<div class="sub">로티로리와 친구들의 신나는 35주년<br />
셀러브레이션 파티 퍼레이드!<br />
새로운 의상을 입은 로티로리와 함께 다같이<br />
파티를 즐겨봐요!</div>

<div class="location-info">
<ul>
	<li><span class="place">장소</span> <span class="txt">어드벤처 1층 퍼레이드 코스</span></li>
	<li><span class="time">시간</span> <span class="txt">토, 일, 공휴일 오후 3시 30분</span></li>
</ul>
</div>

<div class="info-detail"><a href="https://adventure.lotteworld.com/kor/enjoy/performance/view.do?detailsKey=1240&amp;planDate=20231222&amp;planCsfCd=" target="_blank"><img class="pc" src="/common/images/icon/2024_memories/pc/btn_info_detail.png" /> <img class="mo" src="/common/images/icon/2024_memories/mo/btn_info_detail.png" /> <span class="hide-txt">자세히 보기</span> </a></div>
</div>
</div>
<!-- 마법 성냥과 꿈꾸는 밤 -->

<div class="tabCont" id="content-2">
<div>
<div class="swiperBox">
<div class="swiper-container">
<div class="swiper-wrapper">
<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont01_03_01.jpg" /></div>

<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont01_03_02.jpg" /></div>

<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont01_03_03.jpg" /></div>
</div>

<div class="swiper-pagination">&nbsp;</div>
</div>
</div>
</div>

<div class="slide-content">
<div class="tit"><span>마법 성냥과<br class="pc" />
꿈꾸는 밤 </span></div>

<div class="sub">성냥팔이 소녀의 간절한 소원을 들어주러<br />
로티로리와 함께 출동!</div>

<div class="location-info">
<ul>
	<li><span class="place">장소</span> <span class="txt">어드벤처 1층 가든스테이지</span></li>
	<li><span class="time">시간</span> <span class="txt">오후 6시 30분</span></li>
</ul>
</div>

<div class="info-detail"><a href="https://adventure.lotteworld.com/kor/enjoy/performance/view.do?detailsKey=1219&amp;planDate=20231222&amp;planCsfCd=" target="_blank"><img class="pc" src="/common/images/icon/2024_memories/pc/btn_info_detail.png" /> <img class="mo" src="/common/images/icon/2024_memories/mo/btn_info_detail.png" /> <span class="hide-txt">자세히 보기</span> </a></div>
</div>
</div>
<!-- 민속 한마당 -->

<div class="tabCont" id="content-3">
<div>
<div class="swiperBox">
<div class="swiper-container">
<div class="swiper-wrapper">
<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont01_04_01.jpg" /></div>

<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont01_04_02.jpg" /></div>

<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont01_04_03.jpg" /></div>
</div>

<div class="swiper-pagination">&nbsp;</div>
</div>
</div>
</div>

<div class="slide-content">
<div class="tit"><span>민속 한마당</span></div>

<div class="sub">얼쑤 좋다~!<br />
롯데월드에서 펼쳐지는 신명나는<br />
민속 한마당 퍼레이드!<br />
민속 한마당 보고 새해 복 많이 받으세요~</div>

<div class="location-info mt52">
<ul>
	<li><span class="place">장소</span> <span class="txt">어드벤처 1층 퍼레이드 코스</span></li>
	<li><span class="time">시간</span> <span class="txt">오후 5시<br />
	<span>※ 1.12(금) OPEN!</span></span></li>
</ul>
</div>

<div class="info-detail"><a href="https://adventure.lotteworld.com/kor/enjoy/performance/view.do?detailsKey=1242&amp;planDate=20231222&amp;planCsfCd=" target="_blank"><img class="pc" src="/common/images/icon/2024_memories/pc/btn_info_detail.png" /> <img class="mo" src="/common/images/icon/2024_memories/mo/btn_info_detail.png" /> <span class="hide-txt">자세히 보기</span> </a></div>
</div>
</div>
</div>
</div>
</div>
</div>
<!-- 포토존 -->

<div class="festivalCont sc3" id="photo">
<div class="inner">
<p class="contTit">포토존</p>

<div class="ui-tabWrap">
<div class="tabListWrap">
<ul class="tabList">
	<li class="item1"><a class="on" href="#" id="tab-1"><span>Sharing Memories</span> </a></li>
	<li class="item2"><a href="#" id="tab-2"><span>미라클 트리</span> </a></li>
	<li class="item3"><a href="#" id="tab-3"><span>마법과 빛의 계단</span> </a></li>
	<!-- <li class="item3">
											<a class="" href="#" id="tab-3">
												<div><span class="hideText">Merry Go Round Lights Up</span></div>
											</a>
										</li> -->
</ul>
</div>

<div class="tabWrap"><!-- Sharing Memories -->
<div class="tabCont active" id="content-1">
<div>
<div class="swiperBox">
<div class="swiper-container">
<div class="swiper-wrapper">
<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont02_01_01_2.jpg" /></div>
</div>
<!-- <div class="swiper-pagination"></div> --></div>
</div>
</div>

<div class="slide-content">
<div class="tit"><span>Sharing Memories </span></div>

<div class="sub">영차영차! 로티로리와 친구들은<br />
여러분의 소원을 이뤄주기 위해<br />
새해에도 열심히 일을 하고 있어요!</div>

<div class="location-info mt52">
<ul>
	<li><span class="place">장소</span> <span class="txt">어드벤처 1층 드림캐슬</span></li>
</ul>
</div>
<!-- <div class="info-detail">
													<a href="https://adventure.lotteworld.com/kor/enjoy/performance/list.do" target="_blank">
														<img src="/common/images/icon/2023_miraclewinter/pc/btn_info_detail.png" class="pc">
														<span class="hide-txt">자세히 보기</span>
													</a>
												</div> --></div>
</div>
<!-- 미라클 트리 -->

<div class="tabCont" id="content-2">
<div>
<div class="swiperBox">
<div class="swiper-container">
<div class="swiper-wrapper">
<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont02_02_01_2.jpg" /></div>
</div>
<!-- <div class="swiper-pagination"></div> --></div>
</div>
</div>

<div class="slide-content">
<div class="tit"><span>미라클 트리 </span></div>

<div class="sub">롯데월드의 트리는 새해에도 빛난다!<br />
한 해 이루고 싶은 소원을 말해보세요!<br />
소원 트리가 들어드릴게요!</div>

<div class="location-info mt52">
<ul>
	<li><span class="place">장소</span> <span class="txt">어드벤처 1층 만남의 광장</span></li>
</ul>
</div>
<!-- <div class="info-detail">
													<a href="https://adventure.lotteworld.com/kor/enjoy/performance/list.do" target="_blank">
														<img src="/common/images/icon/2023_miraclewinter/pc/btn_info_detail.png" class="pc">
														<span class="hide-txt">자세히 보기</span>
													</a>
												</div> --></div>
</div>
<!-- 마법과 빛의 계단 -->

<div class="tabCont" id="content-3">
<div>
<div class="swiperBox">
<div class="swiper-container">
<div class="swiper-wrapper">
<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont02_03_01_2.jpg" /></div>
</div>
<!-- <div class="swiper-pagination"></div> --></div>
</div>
</div>

<div class="slide-content">
<div class="tit"><span>마법과 빛의 계단 </span></div>

<div class="sub">한 걸음씩 올라가며 새해 사진을 기록해보세요!<br />
매직아일랜드의 멋진 야경 감상도 필수!</div>

<div class="location-info mt52">
<ul>
	<li><span class="place">장소</span> <span class="txt">매직아일랜드 매직캐슬 옆 계단</span></li>
</ul>
</div>
<!-- <div class="info-detail">
												<a href="https://adventure.lotteworld.com/kor/enjoy/performance/list.do" target="_blank">
													<img src="/common/images/icon/2023_miraclewinter/pc/btn_info_detail.png" class="pc">
													<span class="hide-txt">자세히 보기</span>
												</a>
											</div> --></div>
</div>
<!-- Merry Go Round Lights Up --><!-- <div class="tabCont" id="content-3">
										<div>
											<div class="swiperBox">
												<div class="swiper-container">
													<div class="swiper-wrapper">
														<div class="swiper-slide">
															<img src="/common/images/icon/2023_miraclewinter/slide_image/coming_soon.jpg" />
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="slide-content">
											<div class="tit">
												<img src="/common/images/icon/2023_miraclewinter/pc/sc3_tit_03.png" class="pc">
												<img src="/common/images/icon/2023_miraclewinter/mo/sc3_tit_03.png" class="mo">
												<span class="hideText">Merry Go Round Lights Up</span>
											</div>
											<div class="sub">회전목마가 크리스마스를 맞아 눈부시게 변신했어요!<br>한층 더 예쁜 사진을 찍으며 미리 만나는 롯데월드 35주년을 축하해주세요!</div>
											<div class="location-info">
												<ul>
													<li>
														<span class="icon place">장소</span>
														<span class="txt">어드벤처 1층 회전목마</span>
													</li>
												</ul>
											</div>
										</div>
									</div> --></div>
</div>
</div>
</div>
<!-- 이벤트&핫플레이스 -->

<div class="festivalCont sc4" id="event">
<div class="inner">
<p class="contTit">이벤트&amp;핫플레이스</p>

<div class="ui-tabWrap">
<div class="tabListWrap">
<ul class="tabList">
	<li class="item1"><a class="on" href="#" id="tab-1"><span>AI 프로필 이벤트</span> </a></li>
	<li class="item2"><a href="#" id="tab-2"><span>설 맞이 민속 농악대 &amp;<br class="mo" />
	민속 놀이 한마당</span> </a></li>
	<!-- <li class="item3"><a href="#" id="tab-3">
	<div><span class="hideText">크리스마스 &#39;스페셜 환타지&#39;</span></div>
	</a></li>
	<li class="item4"><a href="#" id="tab-4">
	<div><span class="hideText">슬릭스튜디오</span></div>
	</a></li> -->
</ul>
</div>

<div class="tabWrap"><!-- AI 프로필 이벤트 -->
<div class="tabCont active" id="content-1">
<div>
<div class="swiperBox">
<div class="swiper-container">
<div class="swiper-wrapper">
<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont03_01_01.jpg" /></div>
</div>
<!-- <div class="swiper-pagination"> </div> --></div>
</div>
</div>

<div class="slide-content">
<div class="tit"><span>AI 프로필 이벤트 </span></div>

<div class="sub">어트랙션 대기만 해도<br />
무료 AI프로필 받을 수 있다구요?<br />
롯데월드 최고 인기 스팟에 서있는<br />
나만의 AI 프로필 사진을 받으러 GO!</div>

<div class="location-info mt52">
<ul>
	<li><span class="place">장소</span> <span class="txt">롯데월드 내 인기 포토스팟 및<br class="mo" />
	어트랙션 대기줄</span></li>
</ul>
</div>

<div class="info-detail"><a href="https://adventure.lotteworld.com/kor/communication/notice/view.do?pageIndex=1&amp;detailsKey=546&amp;ancmCd=&amp;q=" target="_blank"><img class="pc" src="/common/images/icon/2024_memories/pc/btn_info_detail2.png" /> <img class="mo" src="/common/images/icon/2024_memories/mo/btn_info_detail2.png" /> <span class="hide-txt">자세히 보기</span> </a></div>
</div>
</div>
<!--  설 맞이 민속 농악대 & 민속 놀이 한마당 -->

<div class="tabCont" id="content-2">
<div>
<div class="swiperBox">
<div class="swiper-container">
<div class="swiper-wrapper">
<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont03_02_02.jpg" /></div>

<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont03_02_01.jpg" /></div>

<div class="swiper-slide"><img src="/common/images/icon/2024_memories/slide_image/cont03_02_03.jpg" /></div>
</div>

<div class="swiper-pagination">&nbsp;</div>
</div>
</div>
</div>

<div class="slide-content">
<div class="tit"><span>설 맞이 민속 농악대 &amp;<br class="mo" />
민속 놀이 한마당 </span></div>

<div class="sub">설 연휴를 맞아 펼쳐지는<br />
민속 농악대 공연 및 민속놀이 한마당!<br />
윷놀이, 제기차기, 투호, 줄넘기 등<br />
재밌는 민속놀이를 즐겨봐요!</div>

<div class="location-info">
<ul>
	<li><span class="place">장소</span> <span class="txt">어드벤처 1층 퍼레이드 코스</span></li>
	<li><span class="time">시간</span> <span class="txt">2.9(금) ~ 2.12(월) 오후 4시</span></li>
</ul>
</div>

<div class="info-detail"><a href="https://adventure.lotteworld.com/kor/enjoy/performance/view.do?detailsKey=1243&amp;planDate=20231222&amp;planCsfCd=" target="_blank"><img class="pc" src="/common/images/icon/2024_memories/pc/btn_info_detail2.png" /> <img class="mo" src="/common/images/icon/2024_memories/mo/btn_info_detail2.png" /> <span class="hide-txt">자세히 보기</span> </a></div>
</div>
</div>
</div>
</div>
</div>
</div>
<!-- 굿즈&푸드 -->

<div class="festivalCont sc5" id="menu">
<div class="inner">
<div class="titWrap">
<p class="contTit">굿즈&amp;푸드</p>
</div>

<div class="tabSt2Wrap">
<div class="tabList">
<ul>
	<li class="goods on"><a href="#"><span>시즌 굿즈</span> </a></li>
	<li class="food"><a href="#"><span>시즌 푸드</span> </a></li>
</ul>
</div>

<div class="tabcont goods active">
<ul>
	<li>
	<div class="imgWrap"><img alt="드래곤 헤어밴드" src="/common/images/icon/2024_memories/pc/img_goods01.jpg" /></div>

	<p>드래곤 헤어밴드</p>
	</li>
	<li>
	<div class="imgWrap"><img alt="드래곤 코스튬 키링" src="/common/images/icon/2024_memories/pc/img_goods02.jpg" /></div>

	<p>드래곤 코스튬 키링</p>
	</li>
	<li>
	<div class="imgWrap"><img alt="드래곤 후드 목도리" src="/common/images/icon/2024_memories/pc/img_goods03.jpg" /></div>

	<p>드래곤 후드 목도리</p>
	</li>
	<li>
	<div class="imgWrap"><img alt="드래곤 키링" src="/common/images/icon/2024_memories/pc/img_goods04.jpg" /></div>

	<p>드래곤 키링</p>
	</li>
	<li>
	<div class="imgWrap"><img alt="드래곤 인형" src="/common/images/icon/2024_memories/pc/img_goods05.jpg" /></div>

	<p>드래곤 인형</p>
	</li>
	<li>
	<div class="imgWrap"><img alt="드래곤 빅헤드 모자" src="/common/images/icon/2024_memories/pc/img_goods06.jpg" /></div>

	<p>드래곤 빅헤드 모자</p>
	</li>
</ul>
</div>

<div class="tabcont food">
<ul>
	<li>
	<div class="tag"><span>어드벤처 1F</span></div>

	<div class="imgWrap"><img alt="" src="/common/images/icon/2024_memories/pc/img_food01.jpg" /></div>

	<p>트리블스낵<em>붕어빵꼬치</em></p>
	</li>
	<li>
	<div class="tag"><span>어드벤처 1F</span></div>

	<div class="imgWrap"><img alt="" src="/common/images/icon/2024_memories/pc/img_food02.jpg" /></div>

	<p>스쿨푸드<em>눈꽃치즈 떡볶이</em></p>
	</li>
	<li>
	<div class="tag"><span>어드벤처 1F</span></div>

	<div class="imgWrap"><img alt="" src="/common/images/icon/2024_memories/pc/img_food03.jpg" /></div>

	<p>칠링스테이션<em>미라클 스노우 츄</em></p>
	</li>
	<li>
	<div class="tag"><span>매직아일랜드</span></div>

	<div class="imgWrap"><img alt="" src="/common/images/icon/2024_memories/pc/img_food05.jpg" /></div>

	<p>로이스낵<em>스노우퐁듀 파닭</em></p>
	</li>
	<li>
	<div class="tag"><span>어드벤처 1F</span></div>

	<div class="imgWrap"><img alt="" src="/common/images/icon/2024_memories/pc/img_food04.jpg" /></div>

	<p>크리스탈팰리스(TGIF)<em>스노우맨 피자</em></p>
	</li>
	<!-- <li>
        <div class="tag"><span>매직아일랜드</span></div>
    
        <div class="imgWrap"><img alt="" src="/common/images/icon/2024_memories/pc/img_food06.jpg" /></div>
    
        <p>로티로리빵 카트<em>산타 로티로리빵</em></p>
        </li> -->
	<li>
	<div class="tag"><span>매직아일랜드</span></div>

	<div class="imgWrap"><img alt="" src="/common/images/icon/2024_memories/pc/img_food07.jpg" /></div>

	<p>레이크푸드(스쿨스토어)<em>트윙클 스노우치즈<br />
	김치날치볶음밥</em></p>
	</li>
	<!-- <li>
        <div class="tag"><span>오버브릿지</span></div>
    
        <div class="imgWrap"><img alt="" src="/common/images/icon/2024_memories/pc/img_food08.jpg" /></div>
    
        <p>짤즈빵 젤라또<em>소금빵 젤라또</em></p>
        </li> -->
</ul>
</div>
</div>
</div>
</div>
</div>

<div class="rightQuick">
<div class="box"><a class="homeTxt on" href="#home" title="Home"><span>Home</span></a> <a class="mappingTxt" href="#mapping" title="mapping"><span>35주년 맵핑쇼</span></a><a class="showTxt" href="#show" title="공연안내"><span>공연안내</span></a> <a class="photoTxt" href="#photo" title="포토존"><span>포토존</span></a> <a class="eventTxt" href="#event" title="이벤트&amp;핫플레이스"><span>이벤트&amp;<br />
핫플레이스</span></a> <a class="menuTxt" href="#menu" title="굿즈&amp;푸드"><span>굿즈&amp;푸드</span></a></div>
</div>
</div>
<!-- // 2024 memories --></div>
			</div>


<script>
	$(document).ready(function () {
            // LWCBFsvlHtmlView.jsp
            $(".rightQuick").addClass("none");
            // 퀵메뉴 position 변경
            $(window).scroll(function () {
                var height = $(document).scrollTop();
                    $(".rightQuick").addClass("none");
                if (height > 200) {
                    $(".rightQuick").addClass("fixed");
                    $(".rightQuick").removeClass("none");
                } else if (height < 200) {
                    $(".rightQuick").addClass("none");
                    $(".rightQuick").removeClass("fixed");
                }
            });


		// 퀵메뉴 ON
		var quickList = $('.rightQuick').find('a');

		function onScroll() {
			$(window).scroll(function (event) {
				var scrollPos = $(document).scrollTop();

				//HOME, 공연안내, 핫플레이스, 메뉴&상품 각각의 구간에 도달하면 동작하는 조건문
				
				// s : 20240109 35주년 임시
				if (scrollPos > $('.festivalMain').offset().top - $('#header').outerHeight() &&
					scrollPos <= $('.sc6').offset().top - $('#header').outerHeight()) {
					quickList.removeClass('on');
					quickList.eq(0).addClass('on');
					console.log($('.festivalMain').offset().top);
				} else if (scrollPos > $('.sc6').offset().top - $('#header').outerHeight() && 
						scrollPos <= $('.sc2').offset().top - $('#header').outerHeight()) {
					quickList.removeClass('on');
					quickList.eq(1).addClass('on');
				} else if (scrollPos > $('.sc2').offset().top - $('#header').outerHeight() && 
						scrollPos <= $('.sc3').offset().top - $('#header').outerHeight()) {
					quickList.removeClass('on');
					quickList.eq(2).addClass('on');
				} else if (scrollPos > $('.sc3').offset().top - $('#header').outerHeight() && 
						scrollPos <= $('.sc4').offset().top - $('#header').outerHeight()) {
					quickList.removeClass('on');
					quickList.eq(3).addClass('on');
				} else if (scrollPos > $('.sc4').offset().top - $('#header').outerHeight() && 
						scrollPos <= $('.sc5').offset().top - $('#header').outerHeight()) {
					quickList.removeClass('on');
					quickList.eq(4).addClass('on');
				} else if (scrollPos > $('.sc5').offset().top - $('#header').outerHeight() && 
						scrollPos <= $('#footer').offset().top - $('#header').outerHeight()) {
					quickList.removeClass('on');
					quickList.eq(5).addClass('on');
				}
				// e : 20240109 35주년 임시

			});
		}

		// 스크롤 이동
		function smoothScroll() {
			// .sc1, .sc2, .sc3, .sc4 해당 section 이 같은 형제가 아니므로 배열에 담아 둔다.
			var arr = [];
			// s : 20240109 35주년 임시
			arr.push($('.festivalMain'), $('.sc6'), $('.sc2'), $('.sc3'), $('.sc4'), $('.sc5'));
			// e : 20240109 35주년 임시

			$('.rightQuick .box a').on('click', function (e) {
				e.preventDefault();

				// 각 .sc1~4의 offset().top + padding-top 값
				$('html, body').stop().animate({
					scrollTop: arr[$(this).index()].offset().top - 98
				}, 500);


			});
		}




		onScroll();
		smoothScroll();
	})
</script></div><!-- // subWrap -->
				</div><!-- // cBody -->


			<div id="footer">
				<div class="container">
					<div class="top">
						<div class="links">
							<a href="/kor/lotteworld/introduce/esg/contentsid/711/index.do">롯데월드 소개</a>
							<a href="/kor/lotteworld/introduce/esg/contentsid/715/index.do">ESG</a>
							<a href="/kor/lotteworld/introduce/alliance/contentsid/353/index.do">기업 제휴 및 입점 문의</a>
							<a href="/kor/lotteworld/agreement-of-utilization/homepage/contentsid/356/index.do">이용약관</a>
							<a href="/kor/lotteworld/processing-of-personal-information/homepage/index.do" class="cRed">개인정보처리방침</a>
							<a href="javascript:getEmailTermsPop();">이메일무단수집거부</a>
							<a href="https://recruit.lotteworld.com/" target="_blank">인재채용</a>
							<a href="/kor/lotteworld/sitemap/index.do">사이트맵</a>
							<a href="http://www.hotellotte.com/" target="_blank">㈜호텔롯데 소개</a>
						</div>


					</div>
					<div class="bottom">
						<div class="left">
							<p class="logo"><img src="/common/images/icon/footer_logo.png" alt=""></p>
							<div>
								<p><span>서울특별시 송파구 올림픽로 240 호텔롯데 롯데월드</span><span>대표자 : 최홍훈</span></p>
								<p><span>사업자등록번호 : 219-85-00014</span><span>통신판매업신고번호 : 송파 제5513호</span><span>전화 : 1661-2000</span></p>
								<p class="copyright">COPYRIGHT 2018 LOTTEWORLD. ALL RIGHTS RESERVED.</p>
							</div>
						</div>
						<div class="isms">
							<a href="https://isms.kisa.or.kr/main/ispims/issue/?certificationMode=list&crtfYear=&searchCondition=2&searchKeyword=%EB%A1%AF%EB%8D%B0%EC%9B%94%EB%93%9C&__encrypted=U8oaEwTLg12yqNDZuCwRPMiDRLgcrZjlbxomU5uctoZc1kXWONBhXaf0KhG%2BaV6wpp2zSeTry6yKT1QpQPP4n6Wl4JbzPyTKSn7s1FoRr90UnnwTp%2BW928V1TpyMuwFVMU8D270RkIg564CRAF0bUnkvpnfyAxjhbyn0pSpjvw%2BMlXuoQnR3oJUfvVi%2B1dac8Gnd7jHhSmiDLOX09CuWhVRPx40RuMcaT%2FHbItyyZvQECWvcAvRb36C1zB%2FnwnWRJNfv74iaCKBgpNE%2BERnypNyBfcqQSKf%2BfDsW9aHcpTOO1K747YgBrg%3D%3D" target="_blank">
								<p>
									<span>인증범위</span><span>롯데월드 예매서비스</span>
								</p>
								<p>
									<span>유효기간</span><span>2023.11.01 ~ 2026.10.31</span>
								</p>
							</a>
						</div>
						<div class="isms newST">
							<p>
								<span>한국서비스대상 명예의전당</span>
							</p>
						</div>
						<div class="familySite">
							<select id="selectFamilySite" title="계열사 관련 사이트 새창열기">
								<option value="">계열사 관련 사이트</option>
								<option value="https://www.lotte.co.kr/main.do">LOTTE Family</option>
								<option value="https://www.lottewellfood.com/">롯데웰푸드</option>
								<option value="https://mall.lottechilsung.co.kr/display/displayShop.lecs?displayNo=CF1A07A01&stonType=P">롯데칠성음료(음료BG)</option>
								<option value="https://company.lottechilsung.co.kr/kor/main/index.do">롯데칠성음료(주류BG)</option>
								<option value="https://www.lotteshopping.com/main">롯데백화점</option>
								<option value="https://company.lottemart.com/">롯데마트</option>
								<option value="https://www.lotteon.com/p/display/main/lottefresh">롯데슈퍼</option>
								<option value="https://www.7-eleven.co.kr/">코리아세븐</option>
								<option value="https://www.e-himart.co.kr/app/display/showDisplayShop?originReferrer=himartindex">롯데하이마트</option>
								<option value="https://www.lottehomeshopping.com/user/main/index.lotte">롯데홈쇼핑</option>
								<option value="https://www.lotteon.com/p/display/main/lotteon">롯데쇼핑e-커머스</option>
								<option value="https://www.lottecinema.co.kr/NLCHS">롯데시네마</option>
								<option value="https://store-kr.uniqlo.com/">FRL코리아</option>
								<option value="https://www.lottecon.co.kr/">롯데건설</option>
								<option value="https://www.lottecm.com/ko/main.do">롯데건설 CM사업본부</option>
								<option value="https://www.lotteglogis.com/">롯데글로벌로지스</option>
								<option value="https://www.lotterentacar.net/hp/kor/main/index.do">롯데렌탈</option>
								<option value="http://www.lottemembers.com/">롯데멤버스</option>
								<option value="https://kr.lottedfs.com/main/index.do">롯데면세점</option>
								<option value="https://kr.lottedfs.com/main/index.do">롯데면세점부산</option>
								<option value="https://kr.lottedfs.com/main/index.do">롯데면세점제주</option>
								<option value="https://www.lottepnd.com/main.do">롯데물산</option>
								<option value="https://www.lottemuseum.com/">롯데뮤지엄</option>
								<option value="http://www.lotteineos.com/">롯데이네오스화학</option>
								<option value="https://www.lotte.co.kr/csv/main.do">롯데사회공헌사이트</option>
								<option value="https://www.lotteintl.com/">롯데상사</option>
								<option value="https://www.lotteskyhill.com/">롯데스카이힐 C.C</option>
								<option value="https://www.asahibeerk.com/">롯데아사히주류</option>
								<option value="https://www.lotteal.co.kr/">롯데알미늄</option>
								<option value="https://www.lottemcc.com/index.do">롯데엠시시</option>
								<option value="https://www.lotteworld.com/gate.html">롯데월드</option>
								<option value="https://www.lottelmsc.com/">롯데피플네트웍스</option>
								<option value="https://www.lotteacademy.co.kr/login/loginForm.do">롯데인재개발원</option>
								<option value="http://www.lottedevelop.com/">롯데자산개발</option>
								<option value="https://www.giantsclub.com/html/">롯데자이언츠</option>
								<option value="https://www.lottefinechem.com/">롯데정밀화학</option>
								<option value="https://www.ldcc.co.kr/">롯데정보통신</option>
								<option value="https://www.lottejtb.com/">롯데제이티비</option>
								<option value="https://www.lotternd.com/kor/main/main.html">롯데중앙연구소 </option>
								<option value="https://www.lottegrs.com/main.jsp">롯데지알에스</option>
								<option value="https://recruit.lotte.co.kr/">롯데채용사이트</option>
								<option value="https://www.lottecap.com/ma/ma/MAMA00100">롯데캐피탈</option>
								<option value="https://www.lottechem.com/">롯데케미칼</option>
								<option value="https://www.lotteconcerthall.com/kor">롯데콘서트홀</option>
								<option value="https://www.lottehotel.com/global/ko.html">롯데호텔</option>
								<option value="https://www.daehong.com/">대홍기획</option>
								<option value="https://www.lottehotel.com/busan-hotel/ko.html">부산롯데호텔</option>
								<option value="https://kr.canon/main">캐논코리아 주식회사</option>
								<option value="https://www.fujifilm.co.kr/main.do">한국후지필름</option>
							</select>
						</div>
						<div class="sns">
							<a href="https://www.facebook.com/happylotteworld" target="_blank"><img src="/common/images/btn/sns_btn1.png" alt="롯데월드 페이스북 바로가기" /></a>
							<a href="http://instagram.com/happylotteworld" target="_blank"><img src="/common/images/btn/sns_btn2.png" alt="롯데월드 인스타그램 바로가기" /></a>
							<a href="http://www.youtube.com/user/happylotteworld?blend=21&ob=5" target="_blank"><img src="/common/images/btn/sns_btn3.png" alt="롯데월드 유튜브 바로가기" /></a>
						</div>
					</div>
				</div>
			</div><!-- // footer -->


		<!-- Channel Plugin Scripts -->
		<script>
		    (function() {
		        var w = window;
		        if (w.ChannelIO) {
		            return (window.console.error || window.console.log || function() {})('ChannelIO script included twice.');
		        }
		        var ch = function() {
		            ch.c(arguments);
		        };
		        ch.q = [];
		        ch.c = function(args) {
		            ch.q.push(args);
		        };
		        w.ChannelIO = ch;

		        function l() {
		            if (w.ChannelIOInitialized) {
		                return;
		            }
		            w.ChannelIOInitialized = true;
		            var s = document.createElement('script');
		            s.type = 'text/javascript';
		            s.async = true;
		            s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
		            s.charset = 'UTF-8';
		            var x = document.getElementsByTagName('script')[0];
		            x.parentNode.insertBefore(s, x);
		        }
		        if (document.readyState === 'complete') {
		            l();
		        } else if (window.attachEvent) {
		            window.attachEvent('onload', l);
		        } else {
		            window.addEventListener('DOMContentLoaded', l, false);
		            window.addEventListener('load', l, false);
		        }
		    })();
		    ChannelIO('boot', {
		        "pluginKey": "c06de1c8-cd49-4e78-be3f-50ced236efa4",
		        "customLauncherSelector": "#adv_chat_foot",
		        "hideChannelButtonOnBoot": true
		    	}
		    );
		</script>
		<!-- End Channel Plugin -->
			<!-- 퀵버튼 -->
			<div class="quickArea" style="opacity:1; right: 50px;">
				<a href="javascript:ChannelIO('openChat');" id="adv_chat_foot" class="chatbot" title="채팅상담"><span>채팅상담</span></a>

		<a href="javascript:" class="quickBtn" title="퀵메뉴"><span>QUICK</span></a>
				<div class="quickOpen scrollbox mCustomScrollbar">
					<div class="quickInner">
						<div class="topArea">
							<div class="time">
								<p class="tit"><a href="/kor/usage-guide/service/index.do">운영시간</a></p>
								<p class="txt">
									10:00 - 21:00</p>
							</div>
						</div>
						<div class="links">
							<a href="/kor/price/benefit/information/list.do" class="link1"><span>이달의 할인</span></a>
							<!-- <a href="javascript:SSO_COMMON.GoMticket('https://mticket.lotteworld.com/web/pdt/productList.do');" class="link2"><span>온라인 예매</span></a> -->
							<a href="javascript:goBTicket();" class="link2"><span>온라인 예매</span></a>
							<a href="/kor/enjoy/festival/view.do" class="link3"><span>페스티벌</span></a>
							<a href="/kor/enjoy/performance/list.do" class="link4"><span>금주의 공연</span></a>
						</div>
						<div class="btn"><a href="/kor/usage-guide/service/convenient-facilities/app/contentsid/390/index.do" title="앱 다운로드">앱 다운로드</a></div>
						<div class="appDown">
							<a href="javascript:setAppDownload();" title="APP 설치 새창 열림">
								<p class="tit"><span>앱 다운로드</span>로<br/> 더 스마트하게!</p>
								<ul>
									<li>모바일 예매</li>
									<li>모바일 티켓발권</li>
									<li>매직패스 예약</li>
								</ul>
								<strong class="arrowBg"></strong>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="topBtn"><a href="javascript:"><img src="/common/images/btn/top_btn.png" alt="" /></a></div>
			<!-- <div class="loading"></div> -->
		</div>
		<!-- 그룹pr팝업 -->
			<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
			<div class="moviepop-dim" style="display: none;">
			  <div class="moviepop-warap">
			    <h3>영상으로 만나는 LOTTE의 이야기</h3>

			    <ul>
					<li>
						<div class="movie-link">
							<a href="https://youtu.be/FG_C18OZZWY" target="_blank" title="LOTTE with U 챌린지 영상보러가기">
							<div class="lottemovie">
								<div class="back-img four"></div>
								<span class="play-btn"></span>
							</div>
							</a>
							<p>LOTTE WITH U 챌린지,
								당신의 추억이 롯데그룹의 광고가 된다!!</p>
						</div>
					</li>
			      <li>
			        <div class="movie-link">
			          <a href="https://youtu.be/Z8HbfjY43pI" target="_blank" title="남성육아휴직 영상보러가기">
			            <div class="lottemovie">
			              <div class="back-img one"></div>
			              <span class="play-btn"></span>
			            </div>
			          </a>
			          <p>남성육아휴직 - 육아휴직이 가족에게 준 선물
			          (30초)</p>
			        </div>
			      </li>
			      <li>
			        <div class="movie-link">
			          <a href="https://youtu.be/XyPgsoPwhwk " target="_blank" title="롯데엔젤스&서울스카이 영상보러가기">
			            <div class="lottemovie">
			              <div class="back-img two"></div>
			              <span class="play-btn"></span>
			            </div>
			          </a>
			          <p> [롯데위드유챌린지] 롯데엔젤스&서울스카이</p>
			        </div>
			      </li>
			      <!-- <li>
			        <div class="movie-link">
			          <a href="https://youtu.be/BKCQJ4C49oM" target="_blank" title="롯데 인도네시아 사생대회 영상보러가기">
			            <div class="lottemovie">
			              <div class="back-img three"></div>
			              <span class="play-btn"></span>
			            </div>
			          </a>
			          <p>롯데 인도네시아 사생대회</p>
			        </div>
				  </li> -->


			    </ul>
			    <div class="close-btn">
			      <img src="/common/images/icon/pop_close_btn.png">
			    </div>
			  </div>
			</div>
			<script type="text/javascript">
				$(document).ready(function(){
						// 그룹PR팝업 OPEN
						$('.links .prpopup').click(function(){
						    $('.moviepop-dim').show();
						    $('html').css("overflow", "hidden");
						})
						    // 그룹PR팝업 CLOSE
						$('.moviepop-dim').find('.close-btn').click(function(){
						    $('.moviepop-dim').hide();
						    $('html').css("overflow", "auto");

						})


					});

						</script>
					<!-- // 그룹pr팝업 -->
		<p class="blackBg" ></p>
		<div class="ajaxLoader" style="display:none;z-index:10001;">
   			<img src="/common/images/ajax-loader.gif" style="position:fixed;">
		</div>

		<div class="layerPop termsPop" id="emailTermsPopContainer" style="display:none;"><!--  layerPop은 blackBg 다음에 넣어주세요. -->
			<div class="popHead">이메일무단수집거부</div>
			<div class="popBody">
				<p class="icon"><img src="/common/images/icon/termsPop_icon.png" alt="" /></p>
				<p class="tit">롯데월드는 이메일무단수집을 거부합니다.</p>
				<p class="txt">롯데월드 회원에게 무차별적으로 보내지는 타사의 메일을 차단하기 위해, 본 웹사이트에 게시된 이메일 주소가 전자우편 수집프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며, <span class="fBold">이를 위반시 정보통신망법에 의해 형사처벌됨을 유념</span>하시기 바랍니다.<br/></br>[게시일 2007년 7월 25일]</p>
			</div>
			<a href="javascript:" class="popClose"><img src="/common/images/btn/popClose_icon2.png" alt=""></a><!-- layerPop 팝업 닫기 버튼 -->
		</div>

		<div class="layerPop infoPop"><!-- 2018-06-12 추가 -->
			<div class="popCon">
				<p><img src="/common/images/icon/infoPop_tit.png" alt="모바일 앱을 이용하면 더 편리합니다."></p>
				<p class="txt">
					모바일 앱으로 티켓 구매하고<br> 롯데월드로 바로 입장하세요!
				</p>
				<a href="javascript:setAppDownload();" class="whiteBtn">롯데월드 어드벤처 앱으로 보기</a>
				<p class="img"><img src="/common/images/icon/infoPop_bot_img.png" alt=""></p>
			</div>

			<a href="javascript:" class="popClose" id="infoPopClose"><img src="/common/images/btn/popClose_icon3.png" alt=""></a><!-- layerPop 팝업 닫기 버튼 -->
		</div>





		<script type="text/javascript">
			//APP다운로드
			function setAppDownload()
			{
				
						location.href = "/kor/usage-guide/service/convenient-facilities/app/contentsid/390/index.do";
					
			}

			function GoMticket(){
			 	SSO_COMMON.GoMticket('https://mticket.lotteworld.com/web/pdt/productList.do?ei_gsber=1210&amp;ei_bukrs=1200', 'pop');
			}

			//이메일무단수집거부
			function getEmailTermsPop()
			{
				$(".blackBg").stop().fadeIn(300);
				$("#emailTermsPopContainer").fadeIn(300);
			}

			$(document).ready(function(){
				//계열사 관련 사이트
				$("#selectFamilySite").change(function(){
					var siteUrl = $(this).val() || '';
					if(siteUrl != ''){
						SSO_COMMON.GoFamilySite(siteUrl);
					}
				});
			});

			//예매 팝업 닫을 시 이동
			$(".infoPop #infoPopClose").click(function(){
				// GoMticket();
			});

			$(".infoPop .popCon").click(function(){
				goBTicket();
			});

			$(".infoPop .popCon a").click(function(e){
				event.stopPropagation();
			});

		</script>
		<script data-main="/common/js/site_2" type="text/javascript" src="/common/js/lib/requireJs/require.js"></script>

		<script>
		   (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			   (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			   m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			   })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
			   ga('create', 'UA-120902673-1', 'auto');
			   ga('send', 'pageview');

			   /**
				* Function that tracks a click on an outbound link in Google Analytics.
				* This function takes a valid URL string as an argument, and uses that
				* URL string as the event label.
				*/
				var trackOutboundLink = function(url) {
				   ga('send', 'event', 'outbound', 'click', url, {'hitCallback':
				     function () {
				     document.location = url;
				     }
				   });
				}
	   </script>


	   <link rel="stylesheet" href="https://adventure.lotteworld.com/common/css/lotteworld_pop.css">
	</body>
</html>