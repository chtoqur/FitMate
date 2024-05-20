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
<link href="../css/writenotice.css" rel="stylesheet">

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
            <button type="button" class="btn btn-outline-dark dropdowns" id="btnAdmin">ADMIN</button>
            <button type="button" class="btn btn-outline-dark dropdowns" id="btnLogin"></button>
          </div>

        </div>
    </header><!-- End Header -->

    <div id="frm-container">
        <form class="form-floating mb-3">
            <input type="text" class="form-control" id="txtWriter" placeholder="admin" value="관리자" readonly>
            <label for="floatingInputValue">작성자</label>
        </form>
        <form class="form-floating mb-3">
            <input type="text" class="form-control" id="txtTitle" placeholder="title">
            <label for="floatingInputValue">제목</label>
        </form>
        <div class="form-floating mb-3">
            <select class="form-select" id="divi">
              <option value="C">C-일반</option>
              <option value="N">N-공지</option>
              <option value="R">R-필독</option>
            </select>
            <label for="floatingSelect">구분</label>
        </div>
        <div class="form-floating mb-3">
            <textarea class="form-control" placeholder="content" id="txtContent" style="height: 400px" maxlength="1000"></textarea>
            <label for="floatingTextarea2">내용</label>
        </div>
        <div id="btns">
            <button type="button" id="btnList">목록</button>
            <button type="button" id="btnInsert">저장</button>
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
    
    const txtWriter = document.querySelector('#txtWriter');
    const txtTitle = document.querySelector('#txtTitle');
    const divi = document.querySelector('#divi');
    const txtContent = document.querySelector('#txtContent');
    const btnList = document.querySelector('#btnList');
    const btnInsert = document.querySelector('#btnInsert'); 
    const btnAdmin = document.querySelector('#btnAdmin'); 
    const btnLogin = document.querySelector('#btnLogin');
    const btnMyLibrary = document.querySelector('#btnMyLibrary');

    //////////////////////////////////////////////////////////////////////
    // 함수

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

    const checkValues = function()
    {
        if ((txtWriter.value.length == 0) || (txtTitle.value.length == 0) || (txtContent.value.length == 0))
        {
            return false;
        }

        return true;
    }


    //////////////////////////////////////////////////////////////////////
    // 이벤트 핸들러

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

    btnAdmin.addEventListener('click', ()=>{
        location.href = '/admin';
    })

    btnList.addEventListener('click', ()=>{
        location.href = '/notice/notice';
    });

    btnInsert.addEventListener('click', ()=>{

        // 서버에 전달할 데이터를 만든다.
        if (false == checkValues())
        {
            alert('제목과 내용을 다시 확인해주세요.');
            return;
        }

        let requestData = {
            userId : '${admin.userId}',
            title : txtTitle.value,
            content : txtContent.value,
            writer : txtWriter.value,
            divi : divi.options[divi.selectedIndex].value,
            views : 0
        };

        let xhr = new XMLHttpRequest();

        xhr.open('POST', '/writenotice', true);
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
                        alert('글이 저장되었습니다.');
                        location.href = '/notice/notice';
                    } 
                    else 
                    {
                        alert('저장에 실패하였습니다.');
                    }
                } 
                else
                {
                    console.error('Request failed with status: ' + xhr.status);
                }
            }
        };

        xhr.send(JSON.stringify(requestData));

    });

    //////////////////////////////////////////////////////////////////////////
    // 호출

    setSessionState();
    setLoginButton();
    setAdminBtn();
        
})(); 
</script>
        
</body>
</html>