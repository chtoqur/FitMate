<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link href="../css/navigator.css" rel="stylesheet">
    <link href="../css/login.css" rel="stylesheet">
    
    <title>Login</title>
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
          </div>

        </div>
    </header><!-- End Header -->
    
    <h1>LOGIN</h1>
    <div class="login-container">
        <div class="form-floating mb-2">
            <input type="text" class="form-control" name="userId" id="txtUserId" placeholder="#">
            <label for="txtUserId">ID</label>
        </div>
        <div class="form-floating mb-2">
            <input type="password" class="form-control" name="userPw" id="txtUserPw" placeholder="#">
            <label for="txtUserPw">Password</label>
        </div>

        <button type="button" class="btn btn-success my-button" id="btnLogin">LOGIN</button>
    </div>

    <div class="d-flex justify-content-between sub-container">
        <button type="button" class="btn btn-link" id="btnFindPw">비밀번호 찾기</button>
        <li></li>
        <button type="button" class="btn btn-link" id="btnFindId">아이디 찾기</button>
        <li></li>
        <button type="button" class="btn btn-link" id="btnJoin">회원가입</button>
    </div>

    <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

   
<script src="/JS/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
(()=>{

    // 메세지 핸들러

    // 버튼에 대한 DOM 로딩
    const btnLogin = document.querySelector('#btnLogin');
    const btnIndex = document.querySelector('#btnIndex');
    const btnJoin = document.querySelector('#btnJoin');
    const btnFindId = document.querySelector('#btnFindId');
    const btnFindPw = document.querySelector('#btnFindPw');
    
    const frmLogin = document.querySelector('#frmLogin');
    const userId = document.querySelector('#txtUserId');
    const userPw = document.querySelector('#txtUserPw');
    
    const checkInputStatus = function()
    {
        if((userId.value.length > 0) && (userPw.value.length > 0))
        {
            return true;
        }
        else
        {
            alert("아이디와 패스워드를 입력해주세요.")
            return false;
        }
    }

    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////// 이벤트 핸들러 영역 //////////////////////////////

    btnLogin.addEventListener('click', ()=>{

        if (false === checkInputStatus())
            return;

        let requestData = {
            userId : userId.value,
            userPw : userPw.value
        };

        let xhr = new XMLHttpRequest();

        xhr.open('POST', '/login', true);
        // setRequestHeader에 이 정보들을 저장(세팅)
        xhr.setRequestHeader('Content-Type', 'application/json');

        xhr.onreadystatechange = function () 
        {
            // 서버와 통신하는 객체의 상태가 바뀌었다. ==> 서버에서 새로운 데이터가 왔다.
            if (xhr.readyState === XMLHttpRequest.DONE)
            {
                if (xhr.status === 200) 
                {
                    if (xhr.responseText === 'OK')
                    {
                        // 뒤로가기 후 새로고침
                        location.href = document.referrer;
                    }
                    else 
                    {
                        alert('로그인 실패');
                        userId.value = '';
                        userPw.value = '';
                        userId.focus();
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

    btnJoin.addEventListener('click', ()=>{
        location.href = '/join';
    });

    btnFindId.addEventListener('click', ()=>{
        console.log("btnFindId");
        location.href = '/idinquiry';
    });

    btnFindPw.addEventListener('click', ()=>{
        location.href = '/pwinquiry';
    });


        
})(); 
</script>
        
</body>
</html>