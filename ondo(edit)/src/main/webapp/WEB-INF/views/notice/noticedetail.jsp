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
<link href="../css/noticedetail.css" rel="stylesheet">

</head>
<body>
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
            <button type="button" class="btn btn-outline-dark dropdowns" id="btnAdmin">ADMIN</button>
            <button type="button" class="btn btn-outline-dark dropdowns" id="btnLogin"></button>
            <button type="button" class="btn btn-outline-dark" id="btnMyLibrary">내 서재</button>
        </div>

        </div>
    </header><!-- End Header -->

    <div id="detail-container">
        <div id="mainSentence">
            <img src="../assets/img/notice.jpg" alt="도서관 공지">
        </div>

        <div id="notice">
            <div id="boardInfo">
                <input type="text" id="title" value="${title}"><br>
                <span id="writer">${writer}</span>
                <span class="bar"></span>
                <span>${wrdate}</span>
                <span class="bar"></span>
                <span>조회 ${views}</span>
            </div>
            <div id="boardContent">
                <textarea name="content" id="content">${content}</textarea>
            </div>
        </div>
        
        <div id="btns">
            <button type="button" id="btnList">목록</button>
            <button type="button" id="btnUpdate">수정</button>
            <button type="button" id="btnDelete">삭제</button>
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

    const btnAdmin = document.querySelector('#btnAdmin'); 
    const btnLogin = document.querySelector('#btnLogin');
    const btnMyLibrary = document.querySelector('#btnMyLibrary');

    const title = document.querySelector('#title'); 
    const content = document.querySelector('#content');

    const btnList = document.querySelector('#btnList');
    const btnUpdate = document.querySelector('#btnUpdate');
    const btnDelete = document.querySelector('#btnDelete');
    

    ///////////////////////////////////////////////////////////////////////////

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

    const setUpdateBtn = function()
    {
        if (adminState == true)
        {
            btnUpdate.style.display = 'inline-block';
        }
        else
        {
            btnUpdate.style.display = 'none';
        }
    }

    const setDeleteBtn = function()
    {
        if (adminState == true)
        {
            btnDelete.style.display = 'inline-block';
        }
        else
        {
            btnDelete.style.display = 'none';
        }
    }

    const checkMyContent = function()
    {
        // 현재 로그인한 아이디와 글의 아이디가 같을 때
        if ('${session.userId}' === '${admin.userId}')
        {
            myContent = true;
        }
        else
        {
            myContent = false;
        }
    }

    const setUiObject = function()
    {
        // 내 컨텐츠가 아니라면 읽기만 가능
        if (myContent === false)
        {
            // 타이틀과 컨텐츠를 readOnly.
            title.setAttribute('readonly', 'readonly');
            content.setAttribute('readonly', 'readonly');
        }
    }

    ///////////////////////////////////////////////////////////////////////////

    btnLogin.addEventListener('click', ()=>{
        // 로그인 상태일 시 로그아웃
        if ((sessionState == true) || (adminState == true))
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
        location.href = '/notice/notice';
    });

    btnUpdate.addEventListener('click', ()=>{
        if (confirm('수정하시겠습니까?'))
        {
            let requestData = {
                userId : '${userId}',
                seq : '${seq}',
                title : title.value,
                content : content.value
            };

            let xhr = new XMLHttpRequest();

            xhr.open('POST', '/noticedetail', true);
            // setRequestHeader에 이 정보들을 저장(세팅)
            xhr.setRequestHeader('Content-Type', 'application/json');

            xhr.onreadystatechange = function () 
            {
                // 서버와 통신하는 객체의 상태가 바뀌었다. ==> 서버에서 새로운 데이터가 왔다.
                if (xhr.readyState === XMLHttpRequest.DONE)
                {
                    if (xhr.status === 200) 
                    {
                        let data = xhr.responseText;
                        if (data === 'OK')
                        {
                            alert('수정되었습니다.');
                            location.href = '/notice/notice';
                        } 
                        else 
                        {
                            alert('수정에 실패하였습니다.');
                        }
                    } 
                    else
                    {
                        console.error('Request failed with status: ' + xhr.status);
                    }
                }
            };

            xhr.send(JSON.stringify(requestData));
        }
    });

    btnDelete.addEventListener('click', ()=>{
        if (confirm('삭제하시겠습니까?'))
        {
            let requestData = {
                userId : '${userId}',
                seq : '${seq}'
            };

            let xhr = new XMLHttpRequest();

            xhr.open('POST', '/deletenotice', true);
            // setRequestHeader에 이 정보들을 저장(세팅)
            xhr.setRequestHeader('Content-Type', 'application/json');

            xhr.onreadystatechange = function () 
            {
                // 서버와 통신하는 객체의 상태가 바뀌었다. ==> 서버에서 새로운 데이터가 왔다.
                if (xhr.readyState === XMLHttpRequest.DONE)
                {
                    if (xhr.status === 200) 
                    {
                        let data = xhr.responseText;
                        if (data === 'OK')
                        {
                            alert('삭제되었습니다.');
                            location.href = '/notice/notice';
                        } 
                        else 
                        {
                            alert('삭제에 실패하였습니다.');
                        }
                    } 
                    else
                    {
                        console.error('Request failed with status: ' + xhr.status);
                    }
                }
            };

            xhr.send(JSON.stringify(requestData));
        }
        
    });

    ///////////////////////////////////////////////////////////////////////////

    setSessionState();
    setLoginButton();
    setMyPageBtn();
    setAdminBtn();
    setUpdateBtn();
    setDeleteBtn();
    checkMyContent();
    setUiObject();
    setViewsCount();
        
})(); 
</script>
        
</body>
</html>