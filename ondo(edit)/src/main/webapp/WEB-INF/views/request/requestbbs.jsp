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
<link href="../css/requestbbs.css" rel="stylesheet">

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
            <button type="button" class="btn btn-outline-dark dropdowns" id="btnLogin"></button>
            <button type="button" class="btn btn-outline-dark" id="btnMyLibrary">내 서재</button>
          </div>

        </div>
    </header><!-- End Header -->

    <div id="tbl-container">
        <div id="mainSentence">
            <img src="../assets/img/main.png" alt="온라인 도서관과 함께 하는 독서생활 가까운 곳에서 독서를 즐겨보세요!">
        </div>

        <div id="tbl-wrap">
            <table id="tblBBS">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>도서명</th>
                        <th>저자</th>
                        <th>신청일</th>
                        <th>처리결과</th>
                        <th>처리일</th>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
        </div>
        <div id="btns">
            <button type="button" id="btnPrev">이전</button>
            <button type="button" id="btn1" class="btns">1</button>
            <button type="button" id="btn2" class="btns">2</button>
            <button type="button" id="btn3" class="btns">3</button>
            <button type="button" id="btn4" class="btns">4</button>
            <button type="button" id="btn5" class="btns">5</button>
            <button type="button" id="btnNext">다음</button>
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

    // ROW
    let rowCount = 0;           // 전체 건수

    // PAGE
    let rowsPerPage = 5;        // 페이지 당 건수 (테이블에서 보여지는 최대 건수)
    let curPage = 0;            // 현재 페이지
    let page = '${page}';       // 해당 변수 넘버에 따라서 페이지 동적 변화
    let totalPage = 0;          // 전체 페이지 넘버

    // SECTION
    let curSection = 0;         // 현재 섹션
    let pagesPerSection = 5;    // 섹션 당 페이지수 (버튼의 개수와 같음) 
    let totalSectionNum = 0;    // 전체 섹션 개수

    const btnLogin = document.querySelector('#btnLogin');
    const btnMyLibrary = document.querySelector('#btnMyLibrary');

    const btnPrev = document.querySelector('#btnPrev');
    const btnNext = document.querySelector('#btnNext');
    const btn1 = document.querySelector('#btn1');
    const btn2 = document.querySelector('#btn2');
    const btn3 = document.querySelector('#btn3');
    const btn4 = document.querySelector('#btn4');
    const btn5 = document.querySelector('#btn5');
    const btns = document.querySelectorAll('.btns');

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

    const setBBS = function(page)
    {
        let requestData = {
            page : page,
            rowsPerPage : rowsPerPage,
            userId : '${vo.userId}'
        };

        $.ajax({
            url : '/request/requestbbs',
            type : 'POST',
            data : requestData,
            success : function(data)  
            {
                let bstr = '';
                const tblBody = document.querySelector('#tblBBS > tbody');

                // 전체 카운트 저장
                rowCount = data.rowCount;

                // 테이블 body를 채워준다.
                tblBody.innerHTML = '';
                 
                for (let i = 0; i < data.requestList.length; i++)
                {
                    if (data.requestList[i].procResult === 'R')
                    {
                        data.requestList[i].procResult = '신청';
                    }
                    else if (data.requestList[i].procResult === 'UC')
                    {
                        data.requestList[i].procResult = '취소(이용자취소)';
                    }

                    bstr = '';
                    bstr += '<tr>';
                    bstr += '<td>' + data.requestList[i].seq + '</td>';
                    bstr += '<td class=\"title\"><a href=\"/request/requestdetail?isbn='+data.requestList[i].isbn+
                                                    '&reqdate='+data.requestList[i].reqdate+'&title='+data.requestList[i].title+
                                                    '&author='+data.requestList[i].author+'&publisher='+data.requestList[i].publisher+
                                                    '&pubdate='+data.requestList[i].pubdate+'&discount='+data.requestList[i].discount+
                                                    '&note='+data.requestList[i].note+'\">' + data.requestList[i].title+'</a></td>';
                    bstr += '<td>' + data.requestList[i].author + '</td>';
                    bstr += '<td>' + data.requestList[i].reqdate.split(' ')[0] + '</td>';
                    bstr += '<td>' + data.requestList[i].procResult + '</td>';
                    if (data.requestList[i].procDate != null)
                        bstr += '<td>' + data.requestList[i].procDate.split(' ')[0] + '</td>';
                    else 
                        bstr += '<td></td>';
                    bstr += '</tr>';

                    tblBody.innerHTML += bstr;
                }
            }
        }); 
        
    }

    // 실제 적용해야 할 페이지를 구한다.
    const getRealPage = function(pageOffset)
    {
        return (curSection * pagesPerSection) + pageOffset;
    }

    // 글 수정 시 하단 버튼 해당 페이지에 일치하도록 설정
    const setPageBtn = function()
    {
        rowCount = '${rowCount}';
        curSection = Math.floor(page / pagesPerSection);

        setPageBtnNum();
        hiddenBtn();
    }

    // 버튼 별 넘버 설정
    const setPageBtnNum = function()
    {
        // 하단 숫자 버튼 변경
        let count = 1;

        for (let i = 0; i < btns.length; i++)
        {
            btns[i].textContent = getRealPage(count);
            count++;
        }
    }

    // const hiddenBtn = function()
    // {
    //     // 버튼 히든 처리
    //     totalPage = Math.ceil(rowCount / rowsPerPage) - 1;
    //     totalSectionNum = Math.ceil(rowCount / rowsPerPage / pagesPerSection) - 1;

    //     if (curSection == totalSectionNum)
    //     {
    //         let deleteBtn = ((totalSectionNum + 1) * pagesPerSection) - (totalPage + 1);
    //         let startIndex = pagesPerSection - deleteBtn;
            
    //         if (deleteBtn > 0)
    //         {
    //             for (let i = startIndex; i < pagesPerSection; i++)
    //             {
    //                 btns[i].style.display = 'none';
    //             }
    //         }
    //     }
    // }

    const hiddenBtn = function()
    {
        // 버튼 히든 처리
        console.log("rowCount = " + rowCount);
        console.log("rowsPerPage = " + rowsPerPage);
        console.log("pagesPerSection = " + pagesPerSection);

        totalPage = Math.ceil(rowCount / rowsPerPage) - 1;
        totalSectionNum = Math.ceil(rowCount / rowsPerPage / pagesPerSection) - 1;

        console.log("totalPage = " + totalPage);
        console.log("curSection = " + curSection);
        console.log("totalSectionNum = " + totalSectionNum);

        if (curSection == totalSectionNum)
        {
            let deleteBtn = ((totalSectionNum + 1) * pagesPerSection) - (totalPage + 1);
            let startIndex = pagesPerSection - deleteBtn;

            console.log("deleteBtn = " + deleteBtn);
            console.log("startIndex = " + startIndex);
            
            if (deleteBtn > 0)
            {
                for (let i = startIndex; i < pagesPerSection; i++)
                {
                    btns[i].style.display = 'none';
                }
            }
        }
    }

    const displayBtn = function()
    {
        // 버튼 히든 해제
        let deleteBtn = ((totalSectionNum + 1) * pagesPerSection) - (totalPage + 1);
        let startIndex = pagesPerSection - deleteBtn;

        if (deleteBtn > 0)
        {
            for (let i = startIndex; i < pagesPerSection; i++)
            {
                btns[i].style.display = 'inline';
            }
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

    btnPrev.addEventListener('click', ()=>{

        // Prev 불가능 : 첫번째 섹션에 위치해있는 경우
        if (curSection <= 0)
        {
            alert("첫번째 섹션입니다.");
            return;
        }

        // 서버에 현재 몇 건이 있는지 알아본다.
        // 코드 수정

        curSection--;
        let realPage = getRealPage(0);
        setBBS(realPage);

        setPageBtnNum();

        totalPage = Math.ceil(rowCount / rowsPerPage) - 1;
        totalSectionNum = Math.ceil(rowCount / rowsPerPage / pagesPerSection) - 1;

        // 버튼 복귀
        if (curSection == (totalSectionNum - 1))
        {
            displayBtn();
        }

    });

    btnNext.addEventListener('click', ()=>{

        // 현재 rowCount의 개수를 한 번 더 출력
        // 코드 작성란

        let rowsPerSection = rowsPerPage * pagesPerSection;
        let nextRowCount = rowCount - (rowsPerSection * (curSection + 1));
        if (nextRowCount <= 0)
        {
            alert("마지막 섹션입니다.");
            return;
        }

        curSection ++;
        let realPage = getRealPage(0);
        setBBS(realPage);

        // 하단 숫자 버튼 변경
        setPageBtnNum();

        totalPage = Math.ceil(rowCount / rowsPerPage) - 1;
        totalSectionNum = Math.ceil(rowCount / rowsPerPage / pagesPerSection) - 1;

        // 버튼 숨기기
        if (curSection == totalSectionNum)
        {
            hiddenBtn();
        }

    });

    // 숫자버튼
    btn1.addEventListener('click', ()=>{
        const offset = 0;

        const realPage = getRealPage(offset);
        setBBS(realPage);
    });

    btn2.addEventListener('click', ()=>{
        const offset = 1;

        const realPage = getRealPage(offset);
        setBBS(realPage);
    });

    btn3.addEventListener('click', ()=>{
        const offset = 2;

        const realPage = getRealPage(offset);
        setBBS(realPage);
    });

    btn4.addEventListener('click', ()=>{
        const offset = 3;

        const realPage = getRealPage(offset);
        setBBS(realPage);
    });

    btn5.addEventListener('click', ()=>{
        const offset = 4;

        const realPage = getRealPage(offset);
        setBBS(realPage);
    });

    ///////////////////////////////////////////////////////////
    // 호출부

    setSessionState();  // 세션이 있는지 없는지 상태값 저장
    setLoginButton();
    setMyPageBtn();
    setBBS(page);
    setPageBtn();


    // F5 키보드 키다운 시 GET 파라미터 제거
    // 마우스로 새로고침 시 : 코드 수정 필요
    window.onkeydown = function()
    {
        let kcode = event.keyCode;
        // 키보드 아스키 코드 '116' = F5
        if (kcode == 116)
        {
            // 파라미터 제거
            history.replaceState({}, null, location.pathname);
        }
    }

})(); 
</script>
        
</body>
</html>