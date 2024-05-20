<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
        
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
        
        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        
        <!-- Template Main CSS File -->
        <link href="assets/css/main.css" rel="stylesheet">
        <link href="css/navigator.css" rel="stylesheet">
        <link href="../css/index.css" rel="stylesheet">
    </head>
      
    <body class="index-page" data-bs-spy="scroll" data-bs-target="#navmenu">
    
        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top">
            <div class="global-nav">
              <div class="global-nav-s global-nav-logo">
                  <a href="index" class="logo d-flex align-items-center me-auto me-xl-0 global-nav-link">
                  <!-- Uncomment the line below if you also wish to use an image logo -->
                  <!-- <img src="assets/img/logo.png" alt=""> -->
                  <h1>Ondo</h1>
                  <span>.</span>
                  </a>
              </div>

              <div class="global-nav-s global-nav-links">
                  <nav id="navmenu" class="navmenu">
                  <ul>
                      <li><a href="/index" class="active global-nav-link">Home</a></li>
                      <li><a href="#" class="global-nav-link">About</a></li>
                      <li><a href="#" class="global-nav-link">Search</a></li>
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
                  <button type="button" class="btn btn-outline-light dropdowns" id="btnAdmin">ADMIN</button>
                  <button type="button" class="btn btn-outline-light dropdowns" id="btnLogin"></button>
                  <button type="button" class="btn btn-outline-light" id="btnMyLibrary">내 서재</button>
              </div>

            </div>
        </header><!-- End Header -->
      
        <main id="main">
    
            <!-- Hero Section - Home Page -->
            <section id="hero" class="hero">
            
                <img src="assets/img/3d-books-rotation.jpg" alt="" data-aos="fade-in">
            
                <div class="container">
                    <div class="row search-book">
                    <div class="col-lg-10">
                        <h2 data-aos="fade-up" data-aos-delay="100">내 손안의 도서관, 온도</h2>
                        <p data-aos="fade-up" data-aos-delay="200">읽고 싶은 도서를 검색해보세요</p>
                    </div>
                    <div class="col-lg-5">
                        <form action="#" class="sign-up-form d-flex" data-aos="fade-up" data-aos-delay="300">
                        <input type="text" class="form-control" id="txtSearch" placeholder="검색어를 입력하세요.">
                        <input type="image" src="assets/img/search-icon.png" id="btnSearch" width="70px" class="" value="검색">
                        </form>
                    </div>
                    </div>
                </div>
            
            </section><!-- End Hero Section -->
        
            <!-- Clients Section - Home Page -->
            <section id="clients" class="clients">
        
            <div class="container-fluid" data-aos="fade-up">
        
                <div class="row gy-4">
        
                    <div class="col-xl-2 col-md-3 col-6 client-logo">
                    </div><!-- End Client Item -->
            
                    <div class="col-xl-2 col-md-3 col-6 client-logo">
                        <a href="/mypage"><img src="assets/img/icon-mypage.png" class="img-fluid" alt=""></a>
                    </div><!-- End Client Item -->
            
                    <div class="col-xl-2 col-md-3 col-6 client-logo">
                        <img src="assets/img/icon-search.png" class="img-fluid" alt="">
                    </div><!-- End Client Item -->
            
                    <div class="col-xl-2 col-md-3 col-6 client-logo">
                        <img src="assets/img/icon-wish.png" class="img-fluid" alt="">
                    </div><!-- End Client Item -->
            
                    <div class="col-xl-2 col-md-3 col-6 client-logo">
                        <img src="assets/img/icon-notice.png" class="img-fluid" alt="">
                    </div><!-- End Client Item -->
            
                    <div class="col-xl-2 col-md-3 col-6 client-logo">
                    </div><!-- End Client Item -->
        
                </div>
            </div>
            </section><!-- End Clients Section -->
        
            <!-- bookTab Section - Home Page -->
            <section id="bookTab">
        
            <div id="container" class="bookTab-box">
        
                <ul id="bookType">
                <li id="newBook"><a href="javascript:;" class="on">신간 도서</a></li>
                <li id="bestBook"><a href="javascript:;">베스트 도서</a></li>
                </ul>
    
                <div class="row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="200">
    
                <ul id="newBookList">
                    <li>
                        <a href="/bookinfo?isbn=9788994407920">
                        <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000150223M.jpg" alt="나와 평등한 말">
                        </a>
                        <span id="bookTitle">나와 평등한 말</span>
                        <span id="bookAuthor">김보미</span>
                    </li>
                    <li>
                        <a href="/bookinfo?isbn=9788969021960">
                            <img src="https://shopping-phinf.pstatic.net/main_3246692/32466929539.20230328165111.jpg" alt="스파이더맨 지퍼">
                        </a>
                        <span id="bookTitle">스파이더맨 지퍼</span>
                        <span id="bookAuthor">김점선</span>
                    </li>
                    <li>
                        <a href="/bookinfo?isbn=9791197626739">
                            <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000150840M.jpg" alt="우리 지금, 썸머">
                        </a>
                        <span id="bookTitle">우리 지금, 썸머</span>
                        <span id="bookAuthor">김다은,장경혜,류시은,박산호,이현석,박다해,하고운,이병윤</span>
                    </li>
                    <li>
                        <a href="/bookinfo?isbn=9788965464082">
                            <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000150913M.jpg" alt="메이슨 버틀이 말하는 진실">
                        </a>
                        <span id="bookTitle">메이슨 버틀이 말하는 진실</span>
                        <span id="bookAuthor">레슬리 코너</span>
                    </li>
                    <li>
                        <a href="/bookinfo?isbn=9791189467876">
                            <img src="https://shopping-phinf.pstatic.net/main_4054675/40546756725.20230801122843.jpg" alt="8월의 빛">
                        </a>
                        <span id="bookTitle">8월의 빛</span>
                        <span id="bookAuthor">박시하</span>
                    </li>
                    <li>
                        <a href="/bookinfo?isbn=9791188296606">
                            <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000151430M.jpg" alt="우아한 또라이로 살겠습니다">
                        </a>
                        <span id="bookTitle">우아한 또라이로 살겠습니다</span>
                        <span id="bookAuthor">민바람</span>
                    </li>
                    <li>
                        <a href="/bookinfo?isbn=9791197317934">
                            <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000149451M.jpg" alt="심연의 빛">
                        </a>
                        <span id="bookTitle">심연의 빛</span>
                        <span id="bookAuthor">이창재</span>
                    </li>
                </ul>

                <ul id="bestBookList">
                    <li>
                        <a href="/bookinfo?isbn=9791198146113">
                        <img src="https://shopping-phinf.pstatic.net/main_4044377/40443770625.20230725122152.jpg" alt="화가가 사랑한 바다">
                        </a>
                        <span id="bookTitle">화가가 사랑한 바다</span>
                        <span id="bookAuthor">정우철</span>
                    </li>
                    <li>
                        <a href="/bookinfo?isbn=9788937463686">
                            <img src="https://shopping-phinf.pstatic.net/main_3246693/32466939817.20230313183311.jpg" alt="여름">
                        </a>
                        <span id="bookTitle">여름</span>
                        <span id="bookAuthor">이디스 워튼</span>
                    </li>
                    <li>
                        <a href="/bookinfo?isbn=9791193024188">
                            <img src="https://shopping-phinf.pstatic.net/main_4055277/40552776618.20230711112728.jpg" alt="당신이 사랑을 하면 우리는 복수를 하지 (범유진 장편소설)">
                        </a>
                        <span id="bookTitle">당신이 사랑을 하면 우리는 복수를 하지 (범유진 장편소설)</span>
                        <span id="bookAuthor">범유진</span>
                    </li>
                    <li>
                        <a href="/bookinfo?isbn=9791156332602">
                            <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000133876M.jpg" alt="(10대를 위한) 나의 첫 소설 쓰기 수업">
                        </a>
                        <span id="bookTitle">(10대를 위한) 나의 첫 소설 쓰기 수업</span>
                        <span id="bookAuthor">문부일</span>
                    </li>
                    <li>
                        <a href="/bookinfo?isbn=9791155424742">
                            <img src="http://e-lib.sen.go.kr/OPENS/IPAPRIKA/cover/9791155424742.jpg" alt="버리는 즐거움 (7:5:1 정리 법칙으로 일상이 행복해지는 기술)">
                        </a>
                        <span id="bookTitle">버리는 즐거움 (7:5:1 정리 법칙으로 일상이 행복해지는 기술)</span>
                        <span id="bookAuthor">야마시타 히데코</span>
                    </li>
                    <li>
                        <a href="/bookinfo?isbn=9791187890164">
                            <img src="https://bookimg.bookcube.com/150/2007/200707039.jpg" alt="달콤한 나의 도시양봉">
                        </a>
                        <span id="bookTitle">달콤한 나의 도시양봉</span>
                        <span id="bookAuthor">어반비즈서울, 최우리</span>
                    </li>
                    <li>
                        <a href="/bookinfo?isbn=9791159920257">
                            <img src="http://e-lib.sen.go.kr/OPENS/IPAPRIKA/cover/9791159920370.jpg" alt="아내를 모자로 착각한 남자">
                        </a>
                        <span id="bookTitle">아내를 모자로 착각한 남자</span>
                        <span id="bookAuthor">올리버 색스,이정호</span>
                    </li>
                </ul>
                </div><!-- End bookTab Container -->
            </section>

            <div class="flow-book-title row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="300">
                <h2>
                    당신을 기다리는
                    <br>
                    14만 권의 도서
                </h2>
                <p>
                    원하는 도서와 함께
                    <br>
                    <strong>독서 온도</strong>를 높여보세요
                </p>
            </div>

            <!-- Flow Book Section -->
            <section>
                <div class="flow-book-container">
                    <div class="flow-book-01"></div>
                    <div class="flow-book-02"></div>
                    <div class="flow-book-03"></div>
                </div>
            </section>

            <section>
                <div class="today-home">
                    <h3>
                        <a>오늘의 한 문장</a>
                    </h3>
                    <div class="today-home-inner">
                        <!-- 너비 정사각형 -->
                        <div class="today-home-square">
                            <div class="today-home-title">
                                <span>비극의 가변성</span>
                            </div>
                            <div class="today-home-main">
                                <div class="icon left">
                                    <img src="assets/img/left.png" alt="">
                                </div>
                                <div class="today-home-text">
                                    <span>
                                        어떤 불행은 아주 가까운 거리에서만 감지되고 <br>
                                        어떤 불행은 지독한 원시의 눈으로만 볼 수 있으며 <br>
                                        또 어떤 불행은 어느 각도와 시점에서도 보이지 않는다.
                                    </span>
                                </div>
                                <div class="icon right">
                                    <img src="assets/img/right.png" alt="">
                                </div>
                            </div>
                            <div class="today-home-bottom">
                                <span>권여선, &lt;안녕 주정뱅이&gt;</span>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main>
      
        <!-- ======= Footer ======= -->
        <footer id="footer" class="footer">
      
          <div class="container footer-top">
            <div class="row gy-4">
              <div class="col-lg-5 col-md-12 footer-about">
                <a href="index.html" class="logo d-flex align-items-center">
                  <span>Ondo.</span>
                </a>
                <p>Cras fermentum odio eu feugiat lide par naso tierra. Justo eget nada terra videa magna derita valies darta donna mare fermentum iaculis eu non diam phasellus.</p>
                <div class="social-links d-flex mt-4">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
      
              <div class="col-lg-2 col-6 footer-links">

              </div>
      
              <div class="col-lg-2 col-6 footer-links">
                <h4>Useful Links</h4>
                <ul>
                  <li><a href="#">이용약관</a></li>
                  <li><a href="#">개인정보처리방침</a></li>
                  <li><a href="#">청소년보호정책</a></li>
                  <li><a href="#">고객센터</a></li>
                  <li><a href="#">저작권/도서오류 신고</a></li>
                </ul>
              </div>
      
              <div class="col-lg-3 col-md-12 footer-contact text-center text-md-start">
                <h4>Contact Us</h4>
                <p>A108 Adam Street</p>
                <p>New York, NY 535022</p>
                <p>United States</p>
                <p class="mt-4"><strong>Phone:</strong> <span>+82 10 2345 6789</span></p>
                <p><strong>Email:</strong> <span>ondo.library@gmail.com</span></p>
              </div>
      
            </div>
          </div>
      
          <div class="container copyright text-center mt-4">
            <p>&copy; <span>Copyright 2023</span> <strong class="px-1">Ondo</strong> <span>All Rights Reserved</span></p>
            <div class="credits">
              <!-- All the links in the footer should remain intact. -->
              <!-- You can delete the links only if you've purchased the pro version. -->
              <!-- Licensing information: https://bootstrapmade.com/license/ -->
              <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
              Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
            </div>
          </div>
      
        </footer><!-- End Footer -->
      
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
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
      
        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

        <!-- 부트스트랩 src -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
      
      </body>
<script>
(()=>{

  let sessionState = false;
  let adminState = false;

  const btnLogin = document.querySelector('#btnLogin');
  const btnMyLibrary = document.querySelector('#btnMyLibrary');
  const btnAdmin = document.querySelector('#btnAdmin');

  const newBook = document.querySelector('#newBook');
  const newBookList = document.querySelector('#newBookList');
  const bestBook = document.querySelector('#bestBook');
  const bestBookList = document.querySelector('#bestBookList');

  const txtSearch = document.querySelector('#txtSearch');
  const btnSearch = document.querySelector('#btnSearch');

  //////////////////////////// 함수 구현부 ////////////////////////////

  const setSessionState = function()
  {
    if('${vo.userId}' != '')
    {
      sessionState = true;
    }
    else
    {
      sessionState = false;
    }

    if ('${admin.userId}' != '')
    {
      adminState = true;
    }
    else
    {
      adminState = false;
    }
  }

  const setLoginButton = function()
  {
    if ((sessionState == true) || (adminState == true))
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
    if (sessionState == false)
    {
      btnMyLibrary.style.display = 'none';
    }
    else
    {
      btnMyLibrary.style.display = 'block';
    }
  }

  const setAdminBtn = function()
  {
    if (adminState == true)
    {
      btnAdmin.style.display = 'block';
    }
    else
    {
      btnAdmin.style.display = 'none';
    }
  }

  ///////////////////////////// 이벤트 리스너 ////////////////////////////

  window.addEventListener('scroll', function(){
    if (window.scrollY >= 100)
    {
      btnLogin.classList.remove('btn-outline-light');
      btnLogin.classList.add('btn-outline-dark');
      btnMyLibrary.classList.remove('btn-outline-light');
      btnMyLibrary.classList.add('btn-outline-dark');
    }
    else
    {
      btnLogin.classList.add('btn-outline-light');
      btnLogin.classList.remove('btn-outline-dark');
      btnMyLibrary.classList.add('btn-outline-light');
      btnMyLibrary.classList.remove('btn-outline-dark');
    }
  });
    
  newBook.addEventListener('click', ()=>{
    newBookList.style.display = "flex";
    bestBookList.style.display = "none";
    document.querySelector('#newBook > a').classList.add('on');
    document.querySelector('#bestBook > a').classList.remove('on');
  });

  bestBook.addEventListener('click', ()=>{
    newBookList.style.display = "none";
    bestBookList.style.display = "flex";
    document.querySelector('#bestBook > a').classList.add('on');
    document.querySelector('#newBook > a').classList.remove('on');
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

  btnMyLibrary.addEventListener('click', ()=>{
    location.href = '/borrowlist';
  });

  btnAdmin.addEventListener('click', ()=>{
    location.href = '/admin';
  })

  btnSearch.addEventListener('click', ()=>{
      event.preventDefault();

        let queryString = "?text=" + txtSearch.value;
        location.href = "/booklist" + queryString;
    });

  // 엔터 키 눌렀을 때 검색 화면으로 이동
  txtSearch.addEventListener('keydown', (event) => {
    // event.keyCode를 사용하여 엔터 키(키코드 13)를 확인합니다.
    if (event.keyCode === 13) {
      // 엔터 키를 눌렀을 때 실행할 코드를 작성합니다.
      event.preventDefault();

      let queryString = "?text=" + txtSearch.value;
      location.href = "/booklist" + queryString;
    }
  });

  ////////////////////// 호출부 ////////////////////////

  setSessionState();
  setLoginButton();
  setMyPageBtn();
  setAdminBtn();

  console.log("sessionState = " + sessionState);
  console.log("adminState = " + adminState);
        
})(); 
</script>
</html>