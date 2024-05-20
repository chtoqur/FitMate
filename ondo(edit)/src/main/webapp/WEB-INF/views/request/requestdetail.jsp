<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트 스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

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
<link href="../css/requestdetail.css" rel="stylesheet">

</head>
<body>
    <!-- ======= Header ======= -->
    <header id="header" class="header fixed-top">
        <div class="global-nav">
          <div class="global-nav-s global-nav-logo">
            <a href="/index" class="logo d-flex align-items-center me-auto me-xl-0 global-nav-link">
              <!-- Uncomment the line below if you also wish to use an image logo -->
              <!-- <img src="assets/img/logo.png" alt=""> -->
              <h1>cis-ljw</h1>
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
            <button type="button" class="btn btn-outline-dark" id="btnMyLibrary">내 서재</button>
          </div>

        </div>
    </header><!-- End Header -->

    <div id="tbl-container">
        <table id="tblDetail">
            <tr>
                <th>신청일</th>
                <td>${reqdate.split(' ')[0]}</td>
            </tr>
            <tr>
                <th>서명</th>
                <td>${title}</td>
            </tr>
            <tr>
                <th>저자</th>
                <td>${author}</td>
            </tr>
            <tr>
                <th>발행처</th>
                <td>${publisher}</td>
            </tr>
            <tr>
                <th>발행일</th>
                <td>${pubdate.split(' ')[0]}</td>
            </tr>
            <tr>
                <th>ISBN</th>
                <td>${isbn}</td>
            </tr>
            <tr>
                <th>가격</th>
                <td>${discount}</td>
            </tr>
            <tr>
                <th>비고</th>
                <td>${note}</td>
            </tr>
        </table>

        <div id="btns">
            <a href="#" id="btnCancelRequest">신청취소</a>
            <a href="#" id="btnList">목록</a>
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

    const btnLogin = document.querySelector('#btnLogin');
    const btnMyLibrary = document.querySelector('#btnMyLibrary');

    const btnList = document.querySelector('#btnList');
    const btnCancelRequest = document.querySelector('#btnCancelRequest');

    //////////////////////////////////////////////////////////////////////////
    // 함수

    const setSessionState = function()
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

    const setMyPageBtn = function()
    {
        if (sessionState == true)
        {
            btnMyLibrary.style.display = 'block';
        }
        else
        {
            btnMyLibrary.style.display = 'none';
        }
    }


    ///////////////////////////////////////////////////////////
    // 이벤트 핸들러

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

    btnMyLibrary.addEventListener('click', ()=>{
        location.href = '/mypage/borrowlist';
    });

    btnList.addEventListener('click', ()=>{
        location.href = '/request/requestbbs';
    });

    btnCancelRequest.addEventListener('click', ()=>{
        if (confirm('신청을 취소하시겠습니까?'))
        {
            let httpRequest = new XMLHttpRequest();
            httpRequest.open('POST', '/cancelrequest', true);
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
                        alert("신청이 취소되었습니다.");
                        location.href = "/request/requestbbs";
                    }
                    else if (result === "$OVERLAP")
                    {
                        alert("이미 신청취소된 도서입니다.");
                    }
                    else
                    {
                        alert("신청취소에 실패하였습니다.");
                    }
                }
                else
                {
                    console.error(httpRequest.status, httpRequest.statusText);
                }
            }
    
            let requestData = {
                title : '${title}',
                author : '${author}',
                publisher : '${publisher}',
                pubdate : '${pubdate}',
                isbn : '${isbn}',
                discount : '${discount}',
                note : '${note}',
                userId : '${vo.userId}',
                procResult : 'UC'
            }
    
            httpRequest.send(JSON.stringify(requestData));
            
        }
    });


    ///////////////////////////////////////////////////////////
    // 호출부

    setSessionState();  // 세션이 있는지 없는지 상태값 저장
    setLoginButton();
    setMyPageBtn();

})(); 
</script>
        
</body>
</html>