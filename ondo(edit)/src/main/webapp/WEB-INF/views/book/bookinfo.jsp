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
        <link href="../css/bookinfo.css" rel="stylesheet">

        <!-- 폰트 -->
        <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>

    </head>
      
    <body class="" data-bs-spy="scroll" data-bs-target="#navmenu">
  
        <!-- Header -->
        <header id="header" class="header fixed-top">
        <div class="global-nav">

            <div class="global-nav-s global-nav-logo">
                <a href="../index" class="logo d-flex align-items-center me-auto me-xl-0 global-nav-link">
                    <h1>Ondo</h1>
                    <span>.</span>
                </a>
            </div>

            <div class="global-nav-s global-nav-links">
                <!-- Nav Menu -->
                <nav id="navmenu" class="navmenu">
                    <ul>
                    <li><a href="index.html#hero" class="active global-nav-link">Home</a></li>
                    <li><a href="index.html#about" class="global-nav-link">About</a></li>
                    <li><a href="index.html#services" class="global-nav-link">Search</a></li>
                    <li class="dropdown has-dropdown"><a href="#" class="global-nav-link"><span>Community</span> <i class="bi bi-chevron-down"></i></a>
                        <ul class="dd-box-shadow">
                        <li><a href="#">희망도서신청</a></li>
                        <li><a href="/review">리뷰 게시판</a></li>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">이용안내</a></li>
                        </ul>
                    </li>
                    <li><a href="index.html#contact" class="global-nav-link">Notice</a></li>
                    </ul>
            
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav><!-- End Nav Menu -->
            </div>
            
            <!-- Buttons -->
            <div class="global-nav-btn global-nav-s global-nav-link">
            <button type="button" class="btn btn-outline-light dropdowns" id="btnAdmin">ADMIN</button>
            <button type="button" class="btn btn-outline-light dropdowns" id="btnLogin"></button>
            <button type="button" class="btn btn-outline-light" id="btnMyLibrary">내 서재</button>
            </div>

        </div>
        </header><!-- End Header -->
        
        <main id="main">
            <div class="full-view">
                <!-- 상단 서브 이미지 -->
                <div class="sub-img-container">
                    <div class="sub-img">
                        <img src="../assets/img/bookinfo/main.png" alt="">
                    </div>
                    <div class="hr-box">
                        <hr>
                    </div>
                </div>

                <!-- 전체 메인화면 -->
                <div class="main-view">

                    <div class="book-info">

                        <!-- 좌측 : 표지 이미지 -->
                        <div class="book-image-container">
                            <img src="${book.image}" class="book-image" alt="${book.title}">
                        </div>

                        <!-- 중간 공백 -->
                        <div class="empty-box"></div>

                        <!-- 우측 : 도서 관련 정보 -->
                        <div class="book-summary-container">
                            <span class="book-title"><strong>${book.title}</strong></span>
                            <hr>

                            <table class="summary-tbl">
                                <tr class="sum-tbl-row">
                                    <td>저자</td>
                                    <td>:</td>
                                    <td><strong>${book.author}</td>
                                </tr>
                                <tr class="sum-tbl-row">
                                    <td>출판사</td>
                                    <td>:</td>
                                    <td><strong>${book.publisher}</td>
                                </tr>
                                <tr class="">
                                    <td>출간일</td>
                                    <td>:</td>
                                    <td><strong>${book.pubdate}</td>
                                </tr>
                            </table>

                            <hr>

                            <!-- 요약 정보 --> 
                            <table class="summary-tbl">
                                <tr class="sum-tbl-row">
                                    <td>대출</td>
                                    <td>:</td>
                                    <td>${brNum} / 5</td>
                                </tr>
                                <tr class="sum-tbl-row">
                                    <td>예약</td>
                                    <td>:</td>
                                    <td>${rsNum} / 5</td>
                                </tr>
                            </table>

                            <div class="book-info-btn">
                                <button type="button" class="btn btn-success" id="btnBorrow"></button>
                                <button type="button" class="btn btn-warning" id="btnReserve">예약하기</button>
                                <button type="button" class="btn btn-secondary" id="btnReturn">반납하기</button>
                            </div>
                        </div>
                    </div>

                    <!-- 하단부: 탭 메뉴 -->
                    <div>
                        <div class="tab-menu">
                            <ul class="list-group list-group-horizontal">
                                <li class="list-group-item list-group-item-action">
                                    <a href="#" data-target="book-info-menu" onclick="showTab('book-info-menu')">책 소개</a>
                                </li>
                                <li class="list-group-item list-group-item-action">
                                    <a href="#" data-target="book-review-menu" onclick="showTab('book-review-menu')">이 책의 포스트</a>
                                </li>
                                <li class="list-group-item list-group-item-action">
                                    <a href="#" data-target="book-comments-menu" onclick="showTab('book-comments-menu')">독자 한줄평</a>
                                </li>
                            </ul>
                        </div>

                        <!-- 책 소개 -->
                        <div id="book-info-menu" class="tab_body active">
                            <a>"${book.description}"</a>
                        </div>

                        <!-- 이 책의 포스트 -->
                        <div id="book-review-menu" class="tab_body">
                            <c:forEach items="${review}" var="reviewItem">
                                <!-- div에 href 설정 -->
                                <div class="review-box" onclick="location.href = '/review/reviewContent?userId=${reviewItem.userId}&seq=${reviewItem.seq}';">
                                    <div class="review-title">
                                        <span>${reviewItem.title}</span>
                                    </div>
                                    <div class="review-content">
                                        <span>${reviewItem.content}</span>
                                    </div>
                                    <div>
                                        <hr>
                                    </div>
                                    <div class="review-writer">
                                        <span>${reviewItem.userId}</span>
                                        <span class="bar">&nbsp;</span>
                                        <span>${reviewItem.regDate}</span>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="review-empty-box">
                            </div>
                        </div>
                        
                        <!-- 한줄평 남기기 -->
                        <div id="book-comments-menu" class="tab_body">
                            <div class="input-group mb-3">
                                <div class="rating-section">
                                    <span>평점</span>
                                    <div class="dropdown-rating">
                                        <select name="" id="rating">
                                            <option value="0">☆☆☆☆☆</option>
                                            <option value="1">★☆☆☆☆</option>
                                            <option value="2">★★☆☆☆</option>
                                            <option value="3">★★★☆☆</option>
                                            <option value="4">★★★★☆</option>
                                            <option value="5">★★★★★</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="comment-section">
                                    <input type="text" maxlength="200" class="form-control txt-comment" placeholder="한글 기준 150자까지 작성 가능" aria-label="Recipient's username" aria-describedby="button-addon2">
                                    <button class="btn btn-secondary reg-comment btn-sm" type="button" id="button-addon2">한줄평 남기기</button>
                                </div>
                            </div>

                            <table class="table table-hover comment-tbl">
                                <thead class="table-light">
                                    <tr>
                                        <th scope="col">평점</th>
                                        <th scope="col">작성자</th>
                                        <th scope="col">한줄평</th>
                                        <th scope="col">작성일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${comment}" var="commentItem">
                                        <tr>
                                            <td>${commentItem.rating}</td>
                                            <td>${commentItem.userId}</td>
                                            <td>${commentItem.comments}</td>
                                            <td>${commentItem.regDate}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div> <!-- 한줄평 남기기 end -->
                    </div> <!-- 탭 메뉴 end -->
                </div> <!-- 전체 메인메뉴 end -->
            </div> <!-- 상단 이미지 포함 전체 화면 end -->
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

    let sessionState = false;
    
    const btnAdmin = document.querySelector('#btnAdmin');
    const btnLogin = document.querySelector('#btnLogin');
    const btnMyLibrary = document.querySelector('#btnMyLibrary');

    const btnBorrow = document.querySelector('#btnBorrow');
    const btnReserve = document.querySelector('#btnReserve');
    const btnReturn = document.querySelector('#btnReturn');

    const txtComment = document.querySelector('.txt-comment');
    const btnComment = document.querySelector('.reg-comment');

    const rating = document.querySelector('#rating');

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

    // 대출 / 예약 / 반납 버튼 세팅
    const setBtnStatus = function()
    {

        // 이미 대출 중인 유저 : 반납하기
        if (('${brData}' != null) && ('${brData}' != ""))
        {
            btnBorrow.style.display = 'none';
            btnReserve.style.display = 'none';
            btnReturn.style.display = 'inline'
            return;
        }

        // 예약 중인 유저 : 예약 취소
        if (('${rsData}' != null) && ('${rsData}' != ""))
        {
            btnBorrow.style.display = 'none';
            btnReserve.style.display = 'inline';
            btnReserve.textContent = '예약 취소';
            btnReturn.style.display = 'none'
            return;            
        }

        // 현재 모든 책이 대출 중 > 예약버튼만 보이도록
        if ('${brNum}' == 5)
        {
            btnBorrow.style.display = 'none';
            btnReserve.style.display = 'inline';
            btnReserve.textContent = '예약하기';
            btnReturn.style.display = 'none'
            return;
        }
        // 대출 가능한 책일 경우
        else
        {
            btnBorrow.style.display = 'inline';
            btnBorrow.textContent = '대출하기';
            btnReserve.style.display = 'none';
            btnReturn.style.display = 'none'
            return;
        }
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

    btnBorrow.addEventListener('click', ()=>{

        if (sessionState == false)
        {
            alert("로그인 후 이용 가능합니다.");
            return;
        }

        if ('${brData}' != null && ('${brData}' != ""))
        {
            alert("이미 대출 중인 책입니다.");
            return;
        }

        if ('${brNum}' == 5)
        {
            alert("모든 책이 대출 중입니다.");
            return;
        }

        if (confirm("${book.title}을(를) 대출하시겠습니까?"))
        {
            let httpRequest = new XMLHttpRequest();
            httpRequest.open('POST', '/borrowBook', true);
            httpRequest.setRequestHeader('content-type', 'application/json');
                
            // httpRequest의 상태가 바뀌었을 때 콜백함수 호출
            httpRequest.onreadystatechange = function()
            {
                if(httpRequest.readyState !== XMLHttpRequest.DONE)
                    return;

                if (httpRequest.status === 200)
                {
                    let result = httpRequest.responseText;

                    if (result == "OK")
                    {
                        
                        if(confirm("대출되었습니다. 마이페이지에서 확인하시겠습니까?"))
                        {
                            location.href = '/borrowlist';
                            return;
                        }

                        location.reload();

                    }
                    else if (result == "$MAX")
                    {
                        alert("대출 가능한 최대 권수를 초과하였습니다.");
                    }
                    else if (result == "$OVERDUE")
                    {
                        alert("연체 중인 도서가 존재합니다. 반납 후 이용해주세요.");
                    }
                    else
                    {
                        alert("대출에 실패하였습니다.");
                    }
                }
                else
                {
                    console.error(httpRequest.status, httpRequest.statusText);
                }
            }

            let requestData = {
                brCode : '${book.isbn}' + "-" + "${vo.userId}",
                isbn : '${book.isbn}',
                title : '${book.title}',
                userId : '${vo.userId}',
                renew : "F"
            }

            httpRequest.send(JSON.stringify(requestData));
        }
        else
        {
            return;
        }
    });

    // 반납
    btnReturn.addEventListener('click', ()=>{

        if (sessionState == false)
        {
            alert("로그인 후 이용 가능합니다.");
            return;
        }

        let httpRequest = new XMLHttpRequest();
        httpRequest.open('POST', '/returnBook', true);
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
                    alert("반납에 성공하였습니다.");
                }
                else
                {
                    alert("반납에 실패하였습니다.");
                }
            }
            else
            {
                console.error(httpRequest.status, httpRequest.statusText);
            }
        }

        let requestData = {
            isbn : '${book.isbn}',
            userId : '${vo.userId}',
        }

        httpRequest.send(JSON.stringify(requestData));

    })

    // 예약
    btnReserve.addEventListener('click', ()=>{

        if (sessionState == false)
        {
            alert("로그인 후 이용 가능합니다.");
            return;
        }

        // 예약 취소
        if (('${rsData}' != null) && ('${rsData}' != ""))
        {
            if (confirm("${book.title}을(를) 예약취소 하시겠습니까?"))
            {
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
                    isbn : '${book.isbn}'
                }

                httpRequest.send(JSON.stringify(requestData));
            }
        }
        // 예약하기
        else
        {
            if (confirm("${book.title}을(를) 예약하시겠습니까?"))
            {
                let httpRequest = new XMLHttpRequest();
                httpRequest.open('POST', '/reserveBook', true);
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
                            if (confirm("예약되었습니다. 내 서재에서 확인하시겠습니까?"))
                            {
                            location.href = '/reservelist';
                            return;
                            }

                            location.reload();
                        }
                        else if (result === "$MAX")
                        {
                            alert("예약 가능 인원이 초과하여 예약이 불가능합니다.");
                        }
                        else if (result == "$OVERDUE")
                        {
                            alert("연체 중인 도서가 존재합니다. 반납 후 이용해주세요.");
                        }
                        else
                        {
                            alert("예약에 실패하였습니다.");
                        }
                    }
                    else
                    {
                        console.error(httpRequest.status, httpRequest.statusText);
                    }
                }

                let requestData = {
                    brCode : '${book.isbn}' + '-' + '${vo.userId}',
                    userId : '${vo.userId}',
                    isbn : '${book.isbn}'
                }

                httpRequest.send(JSON.stringify(requestData));
            }
        }
    });

    btnComment.addEventListener('click', ()=>{

        if (sessionState === false)
        {
            alert("로그인 후 이용가능합니다.");
            return;
        }

        if (rating.options[rating.selectedIndex].value == '0')
        {
            alert("평점을 선택해주세요.");
            return;
        }

        let httpRequest = new XMLHttpRequest();
        httpRequest.open('POST', '/writeComment', true);
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
                    alert("한줄평을 등록하였습니다.");
                    location.href = "/book/bookinfo?isbn=${book.isbn}";
                }
                else if (result === "$EXIST")
                {
                    alert("한줄평은 한 개만 등록 가능합니다.");
                    txtComment.value = "";
                }
                else
                {
                    alert("등록에 실패하였습니다.");
                    txtComment.value = "";
                }
            }
            else
            {
                console.error(httpRequest.status, httpRequest.statusText);
            }
        }

        let requestData = {
            userId : '${vo.userId}',
            comments : txtComment.value,
            isbn : '${book.isbn}',
            rating : rating.options[rating.selectedIndex].value
        }

        httpRequest.send(JSON.stringify(requestData));

    });

    //////////////////////////////////////////////////////
    setsessionState();
    setLoginButton();
    setMyPageBtn();
    setBtnDisplay();
    setBtnStatus();

    // const txtSearch = document.querySelector('#txtSearch');
    // const btnSearch = document.querySelector('#btnSearch');

    // btnSearch.addEventListener('click', ()=>{
    //     event.preventDefault();

    //         let queryString = "?text=" + txtSearch.value;
    //         location.href = "/booklist" + queryString;
    //     });

    // // 엔터 키 눌렀을 때 검색 화면으로 이동
    // txtSearch.addEventListener('keydown', (event) => {
    //     // event.keyCode를 사용하여 엔터 키(키코드 13)를 확인합니다.
    //     if (event.keyCode === 13) {
    //     // 엔터 키를 눌렀을 때 실행할 코드를 작성합니다.
    //     event.preventDefault();

    //     let queryString = "?text=" + txtSearch.value;
    //     location.href = "/booklist" + queryString;
    //     }
    // });
            
})(); 
</script>
<script>

    function showTab(tabId) {
        // 모든 탭 내용 숨기기
        const tabContents = document.getElementsByClassName('tab_body');
        for (let i = 0; i < tabContents.length; i++) {
            tabContents[i].classList.remove('active');
        }

        // 선택한 탭 내용 보이기
        const selectedTab = document.getElementById(tabId);
        if (selectedTab) {
            selectedTab.classList.add('active');
        }

        // 모든 탭 메뉴 클래스 초기화
        const tabLinks = document.querySelectorAll('.tab-menu a');
        for (let i = 0; i < tabLinks.length; i++) {
            tabLinks[i].classList.remove('tab_active');
        }

        // 선택한 탭 메뉴에 클래스 추가
        const selectedTabLink = document.querySelector(`[data-target="${tabId}"]`);
        if (selectedTabLink) {
            selectedTabLink.classList.add('tab_active');
        }
    }

    // <li> 태그 클릭 시 이벤트 처리
    const listItems = document.querySelectorAll('.list-group-item');
    for (let i = 0; i < listItems.length; i++) {
        listItems[i].addEventListener('click', function () {
            const target = this.querySelector('a').getAttribute('data-target');
            showTab(target);
        });
    }

</script>
</html>