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
    
      <title>리뷰 작성 │ Ondo</title>
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

      <!-- 폰트 -->
      <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>

      <style>
        @font-face {
          font-family: "Spoqa Han Sans Neo"; /* 폰트 이름 지정 */
          src: url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css) format("woff2"); /* WOFF2 형식 */
        }
        body {
          font-family: 'Spoqa Han Sans Neo', 'sans-serif';
        }
        li {
          list-style: none;
        }
        a {
          text-decoration-line: none;
        }
        .bar {
        display: inline-block;
        width: 1px;
        height: 10px;
        margin: 0 5px;
        background-color: #ccc;
        vertical-align: middle;
        }
        .global-nav {
          display: flex;
          justify-content: space-between;
          margin-left: 15%;
          margin-right: 15%;
        }
        .global-nav-btn {
          display: inline-flex;
        }
        .global-nav-link {
          display: flex;
          align-items: center;
          margin: 0 10px;
        }
        .global-nav-s {
          display: flex;
        }
        #btnLogin {
          margin-right: 20px;
        }
        .main-div {
          width: 60%;
          height: 100vh;
          margin: 0 auto;
          position: relative;
        }
        /* /////////////////////////////// */

        .main-container {
          display: flex;
          flex-direction: column;
          align-items: center;
          width: 100%;
          height: 300px;
          margin-top: 100px;
        }

        .main-img {
          margin-bottom: 50px;
        }

        .hr-box {
          width: 75%;
        }

        /* /////////////////////////// */

        .book-container {
          width: 75%;
          height: 1400px;            
          margin: 0 auto;
        }
        .book-summary {
          display: flex;
          background-color: rgb(243, 243, 243);
          border-radius: 10px;
          height: 260px;           
          justify-content: center;
          margin-top: 100px;
        }
        .image-container {
          display: flex;
          width: 25%;
          align-items: center;
          justify-content: center;
        }
        .summary-container {
          width: 60%;
          margin-top: 50px;
        }
        .summary-tbl {
          width: 100%;
          text-align: center;
        }
        .sum-tbl-row {
            padding: 7px 0;
            color: #888;
            font-size: 105%;
        }
        .summary-tbl th, .summary-tbl td {
          padding: 10px;
        }
        .summary-btn {
          display: flex;
          margin-top: 20px;
          justify-content: right;
        }
        #desc {
            color: #666;
            text-align: left;
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
        #summary-title {
            font-size: 135%;
            text-align: left;
            color: #555;
            font-weight: bold;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1; /* 라인수 */
            height: 1.5em; /* 라인수에 맞춰 길이 정해줘야함 */
            -webkit-box-orient: vertical;
        }

        /* ////////////////////////// */

        .tabmenu {
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .tabmenu a {
            color: black;
        }
        .tab_active {
                background-color: #ccc;
        }
        .tab_body {
            display: none;
        }
        .tab_body.active {
            display: block;
        }
        .tab_body h2 {
            font-size: 20px;
        }

        #book_info > a {
            font-size : 15px
        }
        #bookImage {
            box-shadow: 7px 7px 7px #898989;
        }
        /* ////////////////////////////////////// */

        .write-post {
            width: 100%;
            margin-top: 50px;
        }
        .input-title {
            width: 100%;
            height: 100px;
            border: none;
            outline: none;
            font-size: 50px;
            font-weight: 900;
            line-height: 52px;
            letter-spacing: -.6px;
            word-break: break-word;
            border-bottom: 2px solid;
            border-bottom-color: #f6f4ee;
            color: #555;
        }
        .input-title::placeholder {
          color: rgb(193, 193, 193);
        }
        .count-title {
          margin-top: 10px;
          margin-bottom: 20px;
          text-align: right;
          color: #8b8b8b;
        }
        .write-content {
          width: 100%;
          height: 800px;
        }
        textarea {
          width: 100%;
          height: 100%;
          border: none;
          resize: none;
          font-size: 22px;
          font-weight: 400;
        }
        textarea:focus {
          outline: none;
        }
        textarea::-webkit-scrollbar {
            width: 15px;
        }
        
        textarea::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
            border-radius: 10px;
        }
        
        textarea::-webkit-scrollbar-thumb {
            border-radius: 10px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5); 
        }
        .btns {
          display: flex;
          justify-content: right;
        }
        #btnWrite {
          margin-left: 10px;
        }

      </style>
    </head>
      
    <body class="" data-bs-spy="scroll" data-bs-target="#navmenu">
    
      <!-- ======= Header ======= -->
      <header id="header" class="header fixed-top">
        <div class="global-nav">
          <div class="global-nav-s global-nav-logo">
            <a href="index" class="logo d-flex align-items-center me-auto me-xl-0 global-nav-link">
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
            <button type="button" class="btn btn-outline-light dropdowns" id="btnLogin"></button>
            <button type="button" class="btn btn-outline-light" id="btnMyLibrary">내 서재</button>
          </div>

        </div>
      </header><!-- End Header -->
      
        <main id="main">

            <div class="main-div">

                <section id="bookinfo-main" class="">

                    <% String isbn = request.getParameter("isbn"); %>

                    <div class="book-container">
                        <!-- 상단부 : 책 요약 -->
                        <div class="book-summary">
                            <!-- 이미지 & 요약 -->
                            <div class="summary-container">

                                <table class="summary-tbl">
                                    <tr class="sum-tbl-row">
                                        <td>
                                            <span id="summary-title"><strong>${book.title}</strong></span>
                                        </td>
                                    </tr>
                                </table>

                                <table class="summary-tbl">
                                <tr class="sum-tbl-row">
                                    <td style="text-align: left;">${book.author}</td>
                                    <td><span class="bar">&nbsp;</span></td>
                                    <td>${book.publisher}</td>
                                    <td><span class="bar">&nbsp;</span></td>
                                    <td style="text-align: right;">${book.pubdate}</td>
                                </tr>
                                </table>

                                <!-- 요약 정보 --> 
                                <table class="summary-tbl">
                                <tr class="sum-tbl-row">
                                    <td>
                                        <span id="desc">${book.description}</span>
                                    </td>
                                </tr>
                                </table>

                            </div>

                            <div class="image-container">
                                <img src="${book.image}" alt="${book.title}" style="width:110px;" id="bookImage">
                                <!-- 이미지 -->
                            </div>
                        </div>
                        <div class="write-post">
                            <div>
                              <input class="input-title" id="txtTitle" type="text" placeholder="제목을 입력하세요">
                            <div class="count-title">0 / 150</div>

                            <div class="write-content">
                              <textarea name="" id="txtContent" class="" placeholder="오늘의 독서는 어땠나요? 다양한 생각을 남겨보세요"></textarea>
                            </div>

                            <div class="btns">
                              <button type="button" class="btn btn-lg btn-outline-secondary" id="btnIndex">목록으로</button>
                              <button type="button" class="btn btn-lg btn-outline-dark" id="btnWrite">발행하기</button>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </main>

      

      
        <!-- Scroll Top Button -->
        <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
      
        <!-- Preloader -->
        <div id="preloader">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
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
      
      </body>
<script>
(()=>{

    let isbn = '<%= isbn %>';
    let sessionState = false;
    
    const btns = document.querySelectorAll('.btns');
    const btnLogin = document.querySelector('#btnLogin');
    const btnMyLibrary = document.querySelector('#btnMyLibrary');

    const btnBorrow = document.querySelector('#btnBorrow');
    const btnReserve = document.querySelector('#btnReserve');
    const btnReturn = document.querySelector('#btnReturn');

    const txtComment = document.querySelector('#txtComment');
    const btnComment = document.querySelector('#button-addon2');

    const btnSearchBook = document.querySelector('#btnSearchBook');
    
    const txtTitle = document.querySelector('#txtTitle');
    const txtContent = document.querySelector('#txtContent');
    
    const btnIndex = document.querySelector('#btnIndex');
    const btnWrite = document.querySelector('#btnWrite');

    const setsessionState = function()
    {
        if('${session.userId}' == '')
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

    const setBtnDisplay = function()
    {
      btnLogin.classList.remove('btn-outline-light');
      btnLogin.classList.add('btn-outline-dark');
      btnMyLibrary.classList.remove('btn-outline-light');
      btnMyLibrary.classList.add('btn-outline-dark');
    }






  ////////////////////////////////////////////////////////////////////////////


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
        location.href = '/borrowlist';
  });

  btnIndex.addEventListener('click', ()=>{
    location.href = '/review/reviewMain';
  });

  btnWrite.addEventListener('click', ()=>{

    let xhr = new XMLHttpRequest();

    xhr.open('POST', '/review/writeReview', true);
    xhr.setRequestHeader('Content-Type', 'application/json');

    xhr.onreadystatechange = function () 
    {
        if (xhr.readyState === XMLHttpRequest.DONE)
        {
            if (xhr.status === 200) 
            {
              let rowCount = Number(xhr.responseText);

              if (rowCount > 0)
              {
                  alert("등록되었습니다.");
                  let newPage = Math.ceil(rowCount / 5) - 1;
                  location.href = '/review/reviewMain?page=' + newPage;
              }
              else
              {
                  alert("등록에 실패하였습니다.");
              }
            } 
            else
            {
                console.error('Request failed with status: ' + xhr.status);
            }
        }
    };

    let requestData = {
        title : txtTitle.value,
        content : txtContent.value,
        userId : '${session.userId}',
        isbn : isbn
    };

    console.log(requestData);

    xhr.send(JSON.stringify(requestData));
  });



  //////////////////////////////////////////////////////
  setsessionState();
  setLoginButton();
  setMyPageBtn();
  setBtnDisplay();


        
})(); 
</script>
</html>