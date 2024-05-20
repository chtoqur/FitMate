<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link href="../css/booklist.css" rel="stylesheet">
<link href="../css/navigator.css" rel="stylesheet">
<title></title>
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
          </div>

        </div>
    </header><!-- End Header -->

    <div id="book-container">
        <form id="frm" class="d-flex" role="search">
            <input id="txtSearch" class="form-control me-2" type="text" placeholder="검색어를 입력하세요." aria-label="Search">
            <button id="btnSearch" class="btn btn-outline-success" type="button">Search</button>
        </form>
    
        <table id="tblBook">
            <c:forEach items="${books}" var="book">
                <tr>
                    <td>
                        <div id="thumbnail">
                            <a href="/book/bookinfo?isbn=${book.isbn}">
                                <img src="${book.image}" alt="${book.title}" style="width:100px;">
                            </a>
                        </div>
                        <div id="list-body">
                            <div id="flexbox">
                                <!-- 책제목 -->
                                <a href="/book/bookinfo?isbn=${book.isbn}" id="title">${book.title}</a>
                                <!-- 작가, 출판사, 출간일 -->
                                <div id="app">
                                    <span>${book.author}</span>
                                    <span class="bar">&nbsp;</span>
                                    <span>${book.publisher}</span>
                                    <span class="bar">&nbsp;</span>
                                    <span>${book.pubdate}</span>
                                </div>
                                <!-- 책소개 -->
                                <span id="desc">${book.description}</span>
                            </div>
        
                            <div id="meta">
                                <label>대출가능여부: </label>
                                <span id="">${book.brCondition}</span>
                                <span class="bar">&nbsp;</span>
                                <label>예약가능여부: </label>
                                <span id="">${book.rsCondition}</span>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
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

    const txtSearch = document.querySelector('#txtSearch');
    const btnSearch = document.querySelector('#btnSearch');
    const title = document.querySelector('#title');

    // ////////////////////////////////////////////////////

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

    // ///////////////////////////////
    
    btnSearch.addEventListener('click', ()=>{
        let queryString = "?text=" + txtSearch.value;
        location.href = "/book/booklist" + queryString;
    });

    // 엔터 키 눌렀을 때 검색 화면으로 이동
    txtSearch.addEventListener('keydown', (event) => {
        // event.keyCode를 사용하여 엔터 키(키코드 13)를 확인합니다.
        if (event.keyCode === 13) {
        // 엔터 키를 눌렀을 때 실행할 코드를 작성합니다.
        event.preventDefault();

        let queryString = "?text=" + txtSearch.value;
        location.href = "/book/booklist" + queryString;
        }
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



    // ///////////////////////////////////

    setsessionState();
    setLoginButton();


     
})(); 
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>