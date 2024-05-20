<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <!-- 부트 스트랩 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">


    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
  
    <title>Online Library</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
  
    <!-- Favicons -->
    <link href="../assets/img/favicon.png" rel="icon">
    <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
  
    <!-- Vendor CSS Files -->
    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="../assets/vendor/aos/aos.css" rel="stylesheet">
  
    <!-- Template Main CSS File -->
    <link href="../assets/css/main.css" rel="stylesheet">
    <link href="../css/navigator.css" rel="stylesheet">
    <link href="../css/reservelist.css" rel="stylesheet">

</head>
<body class="" data-bs-spy="scroll" data-bs-target="#navmenu">

    <!-- ======= Header ======= -->
    <header id="header" class="header fixed-top">
        <div class="global-nav">
          <div class="global-nav-s global-nav-logo">
            <a href="/index" class="logo d-flex align-items-center me-auto me-xl-0 global-nav-link">
              <!-- Uncomment the line below if you also wish to use an image logo -->
              <!-- <img src="assets/img/logo.png" alt=""> -->
              <h1>Ondo</h1>
              <span>.</span>
            </a>
          </div>

          <div class="global-nav-s global-nav-links">
            <nav id="navmenu" class="navmenu">
              <ul>
                <li><a href="index.html#hero" class="active global-nav-link">Home</a></li>
                <li><a href="index.html#about" class="global-nav-link">About</a></li>
                <li><a href="index.html#services" class="global-nav-link">Search</a></li>
                <li class="dropdown has-dropdown"><a href="#" class="global-nav-link"><span>Community</span> <i class="bi bi-chevron-down"></i></a>
                    <ul class="dd-box-shadow">
                        <li><a href="/request/requestbooklist">희망도서신청</a></li>
                        <li><a href="/review/reviewMain">리뷰 게시판</a></li>
                        <li><a href="/notice/notice">공지사항</a></li>
                        <li><a href="#">이용안내</a></li>
                    </ul>
                </li>
                <li><a href="index.html#contact" class="global-nav-link">Notice</a></li>
              </ul>
      
              <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
            </nav><!-- End Nav Menu -->
          </div>
          <!-- Nav Menu -->

          <div class="global-nav-btn global-nav-s global-nav-link">
            <button type="button" class="btn btn-outline-dark dropdowns" id="btnLogin"></button>
          </div>

        </div>
    </header><!-- End Header -->

    <div id="container">
        <div id="header2">
            <div id="logo">
                <a href="/index">
                    <span>cis-ljw</span>
                    <span>.</span>
                </a>
            </div>
        
            <div id="menu">
                <div class="msg">
                    <span id="spnMyPage"></span>
                </div>
                <ul id="utilMenu">
                    <li id="logout"><a href="#">로그아웃</a></li>
                    <span class="bar">&nbsp;</span>
                    <li><a href="javascript:;">게시판</a></li>
                    <li><a href="javascript:;">이용안내</a></li>
                </ul>
            </div>
        </div>

        <div id="mainSentence">
            <img src="../assets/img/main.png" alt="온라인 도서관과 함께 하는 독서생활 가까운 곳에서 독서를 즐겨보세요!">
        </div>
        
        <div id="leftArea">
            <div id="lnbTitle">
                <a href="javascript:;">내서재</a>
            </div>
            <ul id="lnb">
                <li><a href="/mypage/borrowlist">대출 현황</a></li>
                <li><a href="/mypage/reservelist" id="rsList" class="on">예약 현황</a></li>
                <li><a href="javascript:;">등록한 리뷰</a></li>
                <li><a href="javascript:;">내 정보 관리</a></li>
            </ul>
        </div>
        
        <div id="contentArea">
            <div id="view">
                <span id="rsContent">예약중인 콘텐츠</span>
                <p id="rscComment">
                    현재 회원님이 <span>예약중인 콘텐츠</span> 목록입니다. <br>
                    예약하신 책은 대출이 가능해지면 자동대출이 되며 예약취소를 원하실 경우에는 취소도 가능합니다.
                </p>
                <div id="rsCount">
                    <span id="rsSpn">총 <strong>0</strong>권 예약중입니다.</span>
                </div>
                <div id="bookList">
                    <ul id="bookWrap">
                        <c:forEach items="${book}" var="book">
                            <li>
                                <p id="pic">
                                    <img src="${book.book.image}" alt="${book.book.title}">
                                </p>
                                <div id="bookinfo">
                                    <span id="bTitle">${book.book.title}</span>
                                    <span><strong>예약일</strong>: ${book.rsDate.split(' ')[0]}</span>
                                </div>
                                <div id="btns">
                                    <button type="button" id="btnCancelRs" data-isbn="${book.isbn}">예약취소</button>
                                    <button type="button" id="btnRsStatus" data-isbn="${book.isbn}">예약현황</button>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<script src="/JS/jquery-3.7.0.min.js"></script>

<!-- Vendor JS Files -->
<script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="../assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="../assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="../assets/vendor/aos/aos.js"></script>
<script src="../assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="../assets/js/main.js"></script>

<!-- 부트스트랩 src -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
(()=>{   
    let sessionState = false;

    const btnBack = document.querySelector('#btnBack');
    const btnRenewList = document.querySelectorAll('#btnRenew');
    const btnReturnList = document.querySelectorAll('#btnReturn');
    const logout = document.querySelector('#logout');
    const spnMyPage = document.querySelector('#spnMyPage');

    const btnLogin = document.querySelector('#btnLogin');

    const btnCancelRsList = document.querySelectorAll('#btnCancelRs');
    const btnRsStatusList = document.querySelectorAll('#btnRsStatus');

    ///////////////////////////////////////////////////////////////
    // 이벤트 핸들러

    logout.addEventListener('click', ()=>{
        location.href = '/logout';
    })

    // 예약취소
    btnCancelRsList.forEach((btnCancelRs) => {
        btnCancelRs.addEventListener('click', () => {
            const bookTitle = btnCancelRs.parentNode.parentNode.querySelector('#bTitle').textContent;

            if (confirm("["+bookTitle+"]"+"을(를)\n예약취소 하시겠습니까?"))
            {
                let isbn = btnCancelRs.getAttribute('data-isbn');

                let httpRequest = new XMLHttpRequest();
                httpRequest.open('POST', '/cancelReservation', true);
                httpRequest.setRequestHeader('content-type', 'application/json');
                    
                // httpRequest의 상태가 바뀌었을 때 콜백함수 호출
                httpRequest.onreadystatechange = function()
                {
                    if(httpRequest.readyState !== XMLHttpRequest.DONE)
                        return;
        
                    if (httpRequest.status === 200)
                    {
                        let result = httpRequest.responseText;
        
                        if (result === "OK")
                        {
                            alert("예약이 취소되었습니다. 감사합니다.");
                            location.reload();
                        }
                        else
                        {
                            alert("예약취소에 실패하였습니다.");
                        }
                    }
                    else
                    {
                        console.error(httpRequest.status, httpRequest.statusText);
                    }
                }
        
                let requestData = {
                    userId : '${vo.userId}',
                    isbn : isbn
                }
        
                httpRequest.send(JSON.stringify(requestData));
            }
            
        });
    });

    // 예약현황
    btnRsStatusList.forEach((btnRsStatus) => {
        btnRsStatus.addEventListener('click', () => {
            const bookTitle = btnRsStatus.parentNode.parentNode.querySelector('#bTitle').textContent;

            if (confirm("["+bookTitle+"]"+" 예약현황을 보시겠습니까?"))
            {
                let isbn = btnRsStatus.getAttribute('data-isbn');

                let httpRequest = new XMLHttpRequest();
                httpRequest.open('POST', '/reservationStatus', true);
                httpRequest.setRequestHeader('content-type', 'application/json');
                    
                // httpRequest의 상태가 바뀌었을 때 콜백함수 호출
                httpRequest.onreadystatechange = function()
                {
                    if(httpRequest.readyState !== XMLHttpRequest.DONE)
                        return;

                    if (httpRequest.status === 200)
                    {
                        let rsStatus = JSON.parse(httpRequest.responseText);

                        if (rsStatus.rsNum === 0)
                        {
                            console.error("btnRsStatus");
                        }
                        else
                        {
                            alert("현재 " + rsStatus.rsNum + "명 예약중입니다.\n회원님의 순번은 " + rsStatus.userSeq + "번째입니다.");
                        }
                    }
                    else
                    {
                        console.error(httpRequest.status, httpRequest.statusText);
                    }
                }

                let requestData = {
                    isbn : isbn,
                    userId : '${vo.userId}'
                }

                httpRequest.send(JSON.stringify(requestData));
            }

        });
    });

    btnLogin.addEventListener('click', ()=>{

    // 로그인 상태일 시 로그아웃
    if (sessionState == true)
    {
        location.href = '/logout';
    }
    // 로그아웃 상태일 시 로그인
    else
    {
        location.href = '/login';
    }
    });

    
    ///////////////////////////////////////////////////////////////
    // 함수

    const setMyPageMsg = function()
    {
        spnMyPage.textContent = '${vo.name}님의 서재';
    }

    const setsessionState = function()
    {
        if('${vo.userId}' == '')
        {
            sessionState = false;
        }
        else
        {
            sessionState = true;
        }
    }

    const setLoginButton = function()
    {
        if (sessionState == true)
        {
            btnLogin.textContent = 'LOGOUT'
        }
        else
        {
            btnLogin.textContent = 'LOGIN'
        }
    }

    ///////////////////////////////////////////////////////////////
    // 호출

    setMyPageMsg();
    setsessionState();
    setLoginButton();


})(); 
</script>

</body>
</html>