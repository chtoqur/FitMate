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
<title></title>
<style>
    a {
        text-decoration: none;
    }
    .header {
        padding: 0;
        box-shadow: 0 0 30px 10px rgba(0, 0, 0, 0.1);
    }
    .btn-light { 
        font-family : "Open Sans";
        font-size: 8px;
    }
    .navmenu a {
        padding: 5px 20px 0;
    }
    .global-nav {
        display: flex;
        justify-content: space-between;
        margin: 0 15%;
        padding-top: 30px;
        height: 100px;
    }

    /* /////////////////////////////// */
    #book-container {
        width: 1200px;
        margin: 0 auto;
    }
    #frm {
        padding-top: 150px;
        width: 60%;
        margin: 0 auto;
        margin-bottom: 100px;
    }
    #dropdownMenuButton1 {
        margin-right: 10px;
    }
    #txtSearch, #btnSearch {
        height: 60px;
    }
    .bar {
        display: inline-block;
        width: 1px;
        height: 10px;
        margin: 0 5px;
        background-color: #ccc;
        vertical-align: middle;
    }
    #tblBook {
        margin-top: 150px;
        border-top: 1px solid #5e6062;
    }
    #tblBook tr td {
        padding: 20px 0;
        border-bottom: 1px solid #dedede;
        height: 180px;
    }
    #thumbnail {
        float: left;
        width: 10%;
    }
    #list-body {
        width: 87%;
        float: right; 
        margin-left: 3%;
        letter-spacing: -1px;
    }
    #title {
        font-size: 120%;
        color: #555;
        font-weight: bold;
    }
    #app {
        padding: 7px 0;
        color: #888;
        font-size: 100%;
    }
    #desc {
        color: #666;
        font-size: 100%;
        width: 100%;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2; /* 라인수 */
        height: 2.6em; /* 라인수에 맞춰 길이 정해줘야함 */
        -webkit-box-orient: vertical;
        /* word-wrap:break-word; */
        line-height: 1.2em;
        padding: 3px 0;
    }
    #meta {
        padding-top: 10px;
        color: #666;
        font-size: 100%;
    }
    #meta span {
        color: #888;
    }
    .search-result {
        width: 60%;
        margin: 0 auto;
    }
</style>
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
                    <li><a href="#">Dropdown 1</a></li>
                    <li class="dropdown has-dropdown"><a href="#"><span>Deep Dropdown</span> <i class="bi bi-chevron-down"></i></a>
                      <ul class="dd-box-shadow">
                        <li><a href="#">Deep Dropdown 1</a></li>
                        <li><a href="#">Deep Dropdown 2</a></li>
                        <li><a href="#">Deep Dropdown 3</a></li>
                        <li><a href="#">Deep Dropdown 4</a></li>
                        <li><a href="#">Deep Dropdown 5</a></li>
                      </ul>
                    </li>
                    <li><a href="#">Dropdown 2</a></li>
                    <li><a href="#">Dropdown 3</a></li>
                    <li><a href="#">Dropdown 4</a></li>
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

    <div id="book-container dropdown">
        <form id="frm" class="d-flex" role="search">

            <button class="btn btn-outline-dark dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                전체
            </button>
            
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                <li><a class="dropdown-item" href="#">전체</a></li>
                <li><a class="dropdown-item" href="#">책 제목</a></li>
                <li><a class="dropdown-item" href="#">ISBN</a></li>
            </ul>

            <input id="txtSearch" class="form-control me-2" type="text" placeholder="리뷰를 작성하고 싶은 도서를 검색하세요." aria-label="Search">
            <button id="btnSearch" class="btn btn-outline-success" type="button">Search</button>
        
        </form>

        <div class="search-result">
            <div>
                <h5>검색어 : 전체(드롭박스 선택항목)[${keyword}]</h5>
                <h5>총 n건 중 n건 출력, 1/2 페이지</h5>
                <h5>항목선택 > 정확도순, 출간일순</h5>
                <h5>5, 10, 15, 20</h5>
                <h5>조회</h5>
            </div>
        
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
                                    <a href="/review/writeReview?isbn=${book.isbn}">
                                        <button type="button" class="btn btn-outline-danger btnSelectBook">리뷰작성하기</button>
                                    </a>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

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

    const btnSelectBook = document.querySelector('#btnSelectBook');

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
        location.href = "/review/searchBook" + queryString;
    });

    // 엔터 키 눌렀을 때 검색 화면으로 이동
    txtSearch.addEventListener('keydown', (event) => {
        // event.keyCode를 사용하여 엔터 키(키코드 13)를 확인합니다.
        if (event.keyCode === 13) {
        // 엔터 키를 눌렀을 때 실행할 코드를 작성합니다.
        event.preventDefault();

        let queryString = "?text=" + txtSearch.value;
        location.href = "/review/searchBook" + queryString;
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

    btnSelectBook.addEventListener('click', ()=>{

    });



    // ///////////////////////////////////

    setsessionState();
    setLoginButton();


     
})(); 
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>