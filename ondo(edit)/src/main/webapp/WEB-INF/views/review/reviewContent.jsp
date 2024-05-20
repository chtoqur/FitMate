<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- 부트 스트랩 -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        
        <title>${vo.title} │ Ondo</title>
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
        <link href="../css/reviewContent.css" rel="stylesheet">

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
                            <li><a href="/review/reviewMain">리뷰 게시판</a></li>
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
                <div class="inner-view">

                    <!-- 상단부 : 책 요약 -->
                    <div class="book-summary">
                        <div class="text-summary">

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

                        <div class="book-cover-container">
                            <img src="${book.image}" alt="${book.title}" id="bookCover">
                        </div>
                    </div>

                    <!-- 하단부 : 리뷰 -->
                    <div class="book-review">
                        <div>
                            <input class="book-title" id="txtTitle" type="text" value="${vo.title}">
                        </div>

                        <div class="review-content">
                            <textarea name="" id="txtContent" class="">${vo.content}</textarea>
                        </div>

                        <div class="btns">
                            <button type="button" class="btn btn-outline-secondary" id="btnIndex">목록으로</button>
                            <button type="button" class="btn btn-outline-dark" id="btnEdit">수정하기</button>
                            <button type="button" class="btn btn-outline-dark" id="btnDelete">삭제하기</button>
                        </div>
                    </div>

                    <div class="comments-section">
                        <div class="register-box input-group">
                            <div class="register-comment-box">
                                <div class="register-comment">
                                    <img src="../assets/img/comment.png" alt="">
                                    <span>댓글</span>
                                    <textarea class="form-control txtComment" placeholder="내용 입력" rows="3" aria-label="With textarea"></textarea>
                                    <div class="count-comment-letters">
                                        <span>0/1000</span>
                                    </div>
                                </div>
                            </div>
                            <div class="register-btn">
                                <button type="button" class="btn btn-secondary regComment">등록</button>
                            </div>
                        </div>
                        <div class="display-comment">

                            <div>
                                <span class="">리뷰 댓글</span><span class="count-comments"><strong>${commentCount}</strong></span>
                                <hr>
                            </div>

                            <!-- 댓글 리스트 -->
                            <div class="comment-list">
                                <c:forEach items="${comments}" var="comment">
                                    <div class="comment-box">
                                        <div class="full-comment-area">
                                
                                            <!-- 대댓글인 경우 기호 표시 -->
                                            <c:if test="${comment.replyLev ne '0'}">
                                                <div class="ico-reply-box">
                                                    <span class="ico_reply"></span>
                                                </div>
                                            </c:if>
                                
                                            <div class="comment-section">
                                                <div class="writer-info">
                                                    <span>
                                                        <span><strong><c:out value="${comment.userId}"/></strong></span>
                                                    </span>
                                                    <!-- 글 작성자인 경우 작성자 표시 -->
                                                    <c:if test="${comment.userId eq vo.userId}">
                                                        <span class="writer-mark-icon">
                                                            <span class="writer-mark">작성자</span>
                                                        </span>
                                                    </c:if>
                                                </div>
                                                <div class="cmt-content-area">
                                                    <span class="cmt-content-box">
                                                        <!-- 대댓글에 댓글을 남긴경우 @로 대상 표시 -->
                                                        <c:if test="${comment.replyToUserId ne null}">
                                                            <span><strong>@${comment.replyToUserId}</strong></span>
                                                        </c:if> 
                                                        <span class="cmt-content">${comment.comments}</span>
                                                    </span>
                                                    <div class="cmt-edit-box hidden">
                                                        <textarea class="form-control cmt-textarea" rows="2" aria-label="With textarea">${comment.comments}</textarea>
                                                    </div>
                                                </div>
                                                <div class="cmt-date">
                                                    <span>${comment.regDate}</span>
                                                </div>
                                                <div class="cmt-button-aria" data-seq="${comment.seq}" data-regOrder="${comment.regOrder}" data-sortOrder="${comment.sortOrder}" data-replyLev="${comment.replyLev}">
                                                    <div class="cmt-button-aria-before">
                                                        <button type="button" class="btn btn-sm btn-outline-secondary" id="btnCmtReply">답글</button>
                                                        <!-- 작성자 본인인 경우 수정/삭제 버튼 -->
                                                        <c:if test="${comment.userId eq session.userId}">
                                                            <button type="button" class="btn btn-sm btn-outline-secondary" id="btnCmtEdit">수정</button>
                                                            <button type="button" class="btn btn-sm btn-outline-secondary" id="btnCmtDelete">삭제</button>
                                                        </c:if>                    
                                                    </div>
                                                    <div class="cmt-button-aria-after hidden">
                                                        <button type="button" class="btn btn-sm btn-outline-secondary" id="btnCmtCancle">취소</button>
                                                        <button type="button" class="btn btn-sm btn-outline-secondary" id="btnCmtRealEdit">수정</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- 대댓글 영역 -->
                                        <div class="cmt-reply-area hidden">
                                            <div class="full-reply-area">
                                                <div class="ico-reply-box">
                                                    <span class="ico_reply"></span>
                                                </div>
                                                <div class="comment-section">
                                                    <div class="writer-info">
                                                        <span>
                                                            <span><strong>${session.userId}</strong></span>
                                                        </span>
                                                    </div>
                                                    <div class="cmt-content-area">
                                                        <div class="cmt-reply-edit-box">
                                                            <textarea class="form-control cmt-reply-textarea" rows="3" aria-label="With textarea"></textarea>
                                                        </div>
                                                    </div>
        
                                                    <div class="cmt-reply-button-aria" data-seq="${comment.seq}" data-regOrder="${comment.regOrder}" data-sortOrder="${comment.sortOrder}" data-replyTo="">
                                                        <div class="cmt-reply-count">
                                                            <span>0/1000</span>
                                                        </div>
                                                        <div class="cmt-button-aria-before">
                                                            <button type="button" class="btn btn-sm btn-outline-secondary" id="btnCmtRealReply">등록</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${comment.sortOrder ne fn:length(comments)}">
                                            <div>
                                                <hr>
                                            </div>
                                        </c:if>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
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

    let sessionState = false;
    
    const btns = document.querySelectorAll('.btns');
    const btnLogin = document.querySelector('#btnLogin');
    const btnMyLibrary = document.querySelector('#btnMyLibrary');

    const btnBorrow = document.querySelector('#btnBorrow');
    const btnReserve = document.querySelector('#btnReserve');
    const btnReturn = document.querySelector('#btnReturn');

    const txtComment = document.querySelector('.txtComment');
    const btnComment = document.querySelector('.regComment');

    const btnSearchBook = document.querySelector('#btnSearchBook');
    
    const txtTitle = document.querySelector('#txtTitle');
    const txtContent = document.querySelector('#txtContent');
    const contentBox = document.querySelector('.review-content');
    
    const btnIndex = document.querySelector('#btnIndex');
    const btnEdit = document.querySelector('#btnEdit');
    const btnDelete = document.querySelector('#btnDelete');

    const countCmt = document.querySelector('.count-comments');

    const cmtContentBox = document.querySelector('.cmt-content-box');
    const cmtEditBox = document.querySelector('.cmt-edit-box');
    
    const cmtContentBoxList = document.querySelectorAll('.cmt-content-box');
    const cmtReplyAreaList = document.querySelectorAll('.cmt-reply-area');
    const cmtEditBoxList = document.querySelectorAll('.cmt-edit-box');

    const cmtButtonAriaBefore = document.querySelectorAll('.cmt-button-aria-before');
    const cmtButtonAriaAfter = document.querySelectorAll('.cmt-button-aria-after');


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

    const setReviewPage = function()
    {
        // 로그인 유저가 글 작성 유저와 동일한 경우
        if('${session.userId}' === '${vo.userId}')
        {
            // 1. 수정/삭제 버튼 활성화
            btnEdit.classList.remove('hidden-btn');
            btnDelete.classList.remove('hidden-btn');

            // 2. input/textarea의 disabled 속성 제거
            txtTitle.removeAttribute('disabled');
            txtContent.removeAttribute('disabled');
        }
        else
        {
            btnEdit.classList.add('hidden-btn');
            btnDelete.classList.add('hidden-btn');
            txtTitle.setAttribute('disabled', 'true');
            txtContent.setAttribute('disabled', 'true');
        }
    }

    const modifyTextareaHeight = function()
    {
        contentBox.style.height = '800px';
        contentBox.style.height = contentBox.scrollHeight + 'px'; // 실제 높이로 조정
    }

    const resize = function()
    {
        let textarea = document.getElementById('txtContent');
        let textwrapper = document.querySelector('.review-content');
 
        textarea.style.height = "0px";
 
        let scrollHeight = textarea.scrollHeight;
        let style = window.getComputedStyle(textarea);
        let borderTop = parseInt(style.borderTop);
        let borderBottom = parseInt(style.borderBottom);
 
        textarea.style.height = (scrollHeight + borderTop + borderBottom)+"px";
        textwrapper.style.height = (scrollHeight + borderTop + borderBottom)+"px";
    }

    const resetCommentZone = function()
    {
        // 1. 답글 영역 hidden
        cmtReplyAreaList.forEach((replyArea)=>{
            if (!replyArea.classList.contains('hidden'))
            {
                replyArea.classList.add('hidden');
            }
        });

        // 2. 수정 상태인지 확인
        // 2-1. content-box   > 히든 제거
        cmtContentBoxList.forEach((contentBox)=>{
            if (contentBox.classList.contains('hidden'))
            {
                contentBox.classList.remove('hidden');
            }
        });
        // 2-2. edit-box      > 히든 처리
        cmtEditBoxList.forEach((editBox)=>{
            if (!editBox.classList.contains('hidden'))
            {
                editBox.classList.add('hidden');
            }
        });
        // 2-3. button-before > 히든 제거
        cmtButtonAriaBefore.forEach((btnBefore)=>{
            if (btnBefore.classList.contains('hidden'))
            {
                btnBefore.classList.remove('hidden');
            }
        });
        // 2-4. button-after  > 히든 처리
        cmtButtonAriaAfter.forEach((btnAfter)=>{
            if (!btnAfter.classList.contains('hidden'))
            {
                btnAfter.classList.add('hidden');
            }
        });
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

    btnEdit.addEventListener('click', ()=>{

        if (confirm("리뷰를 수정하시겠습니까?"))
        {
            let xhr = new XMLHttpRequest();
    
            xhr.open('POST', '/editReview', true);
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
                            alert("수정되었습니다.");
                            let newPage = Math.ceil(rowCount / 5) - 1;
                            location.href = '/review/reviewMain?page=' + newPage;
                        }
                        else
                        {
                            alert("수정에 실패하였습니다.");
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
                userId : '${vo.userId}',
                seq : '${vo.seq}'
            };
    
            xhr.send(JSON.stringify(requestData));
        }
    });

    btnDelete.addEventListener('click', ()=>{

        if (confirm("삭제된 리뷰는 복구가 불가능합니다. 리뷰를 삭제하시겠습니까?"))
        {
            let xhr = new XMLHttpRequest();
    
            xhr.open('POST', '/deleteReview', true);
            xhr.setRequestHeader('Content-Type', 'application/json');
    
            xhr.onreadystatechange = function () 
            {
                if (xhr.readyState === XMLHttpRequest.DONE)
                {
                    if (xhr.status === 200) 
                    {
                        let responseText = xhr.responseText;
        
                        if (responseText === "OK")
                        {
                            alert("삭제되었습니다.");
                            location.href = '/review/reviewMain';
                        }
                        else
                        {
                            alert("삭제에 실패하였습니다.");
                        }
                    } 
                    else
                    {
                        console.error('Request failed with status: ' + xhr.status);
                    }
                }
            };
    
            let requestData = {
                userId : '${vo.userId}',
                seq : '${vo.seq}'
            };
    
            xhr.send(JSON.stringify(requestData));
        }

    });

    btnComment.addEventListener('click', ()=>{
        
        if (sessionState == false)
        {
            alert("로그인 후 이용 가능합니다.");
            return;
        }

        if (confirm("댓글을 등록하시겠습니까?"))
        {
            const xhr = new XMLHttpRequest();
    
            xhr.open('POST', '/writeReviewComment', true);
            xhr.setRequestHeader('Content-Type', 'application/json');
    
            xhr.onreadystatechange = function () 
            {
                if (xhr.readyState === XMLHttpRequest.DONE)
                {
                    if (xhr.status === 200) 
                    {
                        let responseText = xhr.responseText;
        
                        if (responseText === "OK")
                        {
                            alert("댓글을 등록하였습니다.");
                            location.reload();
                        }
                        else
                        {
                            alert("댓글 등록에 실패하였습니다.");
                        }
                    } 
                    else
                    {
                        console.error('Request failed with status: ' + xhr.status);
                    }
                }
            };
    
            let requestData = {
                userId : '${session.userId}',
                reviewCode : '${vo.seq}' + '-' + '${vo.userId}',
                comments : txtComment.value,
                // replyLev : "0"
            };
    
            xhr.send(JSON.stringify(requestData));
        }

    });


    window.addEventListener("load", resize);
    window.onresize = resize;   // 브라우저 크기 변경 시 함수 실행

    //////////////////////////////////////////////////////
    setsessionState();
    setLoginButton();
    setMyPageBtn();
    setBtnDisplay();

    setReviewPage();
    modifyTextareaHeight();

    // setReviewComment() 실행 이후 댓글 버튼 제어 가능

    const btnCmtReplyList = document.querySelectorAll('#btnCmtReply');
    const btnCmtRealReplyList = document.querySelectorAll('#btnCmtRealReply');

    const btnCmtEditList = document.querySelectorAll('#btnCmtEdit');
    const btnCmtDeleteList = document.querySelectorAll('#btnCmtDelete');

    const btnCmtCancleList = document.querySelectorAll('#btnCmtCancle');
    const btnCmtRealEditList = document.querySelectorAll('#btnCmtRealEdit');

    const cmtEditAreaList = document.querySelectorAll('.cmt-edit-box');

    btnCmtReplyList.forEach((btnCmtReply)=>{
        btnCmtReply.addEventListener('click', ()=>{

            if ('${session.userId}' == '')
            {
                alert("로그인 후 이용 가능합니다.");
                return;
            }

            const cmtReplyArea = btnCmtReply.closest('.comment-box').querySelector('.cmt-reply-area');

            // 1. 댓글창 리셋 후
            resetCommentZone();

            // 2. 클릭한 대상 댓글의 답글창 display
            cmtReplyArea.classList.remove('hidden');
            
        });
    });

    btnCmtRealReplyList.forEach((btnCmtRealReply)=>{
        btnCmtRealReply.addEventListener('click', ()=>{

        const cmtReplyTextarea = btnCmtRealReply.closest('.comment-box').querySelector('.cmt-reply-textarea');
        const comments = cmtReplyTextarea.value;

        const cmtDataBox = btnCmtRealReply.closest('.comment-box').querySelector('.cmt-button-aria');
        let regOrder = cmtDataBox.getAttribute('data-regOrder');
        let replyTo = cmtDataBox.getAttribute('data-seq');

        const xhr = new XMLHttpRequest();
    
        xhr.open('POST', '/replyReviewComment', true);
        xhr.setRequestHeader('Content-Type', 'application/json');
    
        xhr.onreadystatechange = function () 
        {
            if (xhr.readyState === XMLHttpRequest.DONE)
            {
                if (xhr.status === 200) 
                {
                    let responseText = xhr.responseText;
    
                    if (responseText === "OK")
                    {
                        location.reload();
                    }
                    else
                    {
                        alert("댓글 등록에 실패하였습니다.");
                    }
                } 
                else
                {
                    console.error('Request failed with status: ' + xhr.status);
                }
            }
        };
    
        let requestData = {
            userId : '${session.userId}',
            reviewCode : '${vo.seq}' + '-' + '${vo.userId}',
            comments : comments,
            regOrder : regOrder,
            replyTo : replyTo
        };

        console.log(requestData);
    
        xhr.send(JSON.stringify(requestData));
            
        });
    });
    
    btnCmtEditList.forEach((btnCmtEdit)=>{
        btnCmtEdit.addEventListener('click', ()=>{

            // 버튼의 부모 요소를 찾은 후 그 안에서 .cmt-edit-box 검색
            const cmtContentBox = btnCmtEdit.closest('.comment-section').querySelector('.cmt-content-box');
            const cmtEditBox = btnCmtEdit.closest('.comment-section').querySelector('.cmt-edit-box');

            const cmtButtonAria = btnCmtEdit.closest('.comment-section').querySelector('.cmt-button-aria'); // 해당 버튼 그룹 선택
            const cmtButtonAriaBefore = btnCmtEdit.closest('.comment-section').querySelector('.cmt-button-aria-before'); // 버튼 그룹 중 앞 부분 선택
            const cmtButtonAriaAfter = btnCmtEdit.closest('.comment-section').querySelector('.cmt-button-aria-after'); // 버튼 그룹 중 뒷 부분 선택

            // 이미 열려있는 수정 or 답글창이 있는지 확인 후 hidden 처리
            resetCommentZone();

            // 컨텐츠-수정 박스 스위칭
            cmtContentBox.classList.add('hidden');
            cmtEditBox.classList.remove('hidden');

            // 버튼 div 스위칭
            cmtButtonAriaBefore.classList.add('hidden');
            cmtButtonAriaAfter.classList.remove('hidden');
        });
    });

    btnCmtRealEditList.forEach((btnCmtRealEdit)=>{
        btnCmtRealEdit.addEventListener('click', ()=>{

            const cmtEditBox = btnCmtRealEdit.closest('.comment-section').querySelector('.cmt-edit-box');
            const cmtTextarea = cmtEditBox.querySelector('.cmt-textarea'); // 내용이 들어있는 요소 선택
            const innerText = cmtTextarea.value;

            let dataSeq = btnCmtRealEdit.closest('.comment-section').querySelector('.cmt-button-aria');
            dataSeq = dataSeq.getAttribute('data-seq');

            const xhr = new XMLHttpRequest();
    
            xhr.open('POST', '/editReviewComment', true);
            xhr.setRequestHeader('Content-Type', 'application/json');
    
            xhr.onreadystatechange = function () 
            {
                if (xhr.readyState === XMLHttpRequest.DONE)
                {
                    if (xhr.status === 200) 
                    {
                        let responseText = xhr.responseText;
        
                        if (responseText === "OK")
                        {
                            location.reload();
                        }
                        else
                        {
                            alert("댓글 수정에 실패하였습니다.");
                        }
                    } 
                    else
                    {
                        console.error('Request failed with status: ' + xhr.status);
                    }
                }
            }

            let requestData = {
                comments : innerText,
                reviewCode : '${vo.seq}' + '-' + '${vo.userId}',
                seq : dataSeq
            };

            xhr.send(JSON.stringify(requestData));

        });
    });

    btnCmtDeleteList.forEach((btnCmtDelete)=>{
        btnCmtDelete.addEventListener('click', ()=>{
            
            if (confirm("댓글을 삭제하시겠습니까?"))
            {
                let reviewCode = '${vo.seq}' + '-' + '${vo.userId}';
                let seq = btnCmtDelete.parentNode.parentNode.getAttribute('data-seq');
                let regOrder = btnCmtDelete.parentNode.parentNode.getAttribute('data-regOrder');
                let sortOrder = btnCmtDelete.parentNode.parentNode.getAttribute('data-sortOrder');
                let replyLev = btnCmtDelete.parentNode.parentNode.getAttribute('data-replyLev');

                // console.log("seq = " + seq);
                // console.log("regOrder = " + regOrder);
                // console.log("sortOrder = " + sortOrder);
                
                const xhr = new XMLHttpRequest();
    
                xhr.open('POST', '/deleteReviewComment', true);
                xhr.setRequestHeader('Content-Type', 'application/json');
        
                xhr.onreadystatechange = function () 
                {
                    if (xhr.readyState === XMLHttpRequest.DONE)
                    {
                        if (xhr.status === 200) 
                        {
                            let responseText = xhr.responseText;
            
                            if (responseText === "OK")
                            {
                                alert("댓글을 삭제하였습니다.");
                                location.reload();
                            }
                            else
                            {
                                alert("댓글 삭제에 실패하였습니다.");
                            }
                        } 
                        else
                        {
                            console.error('Request failed with status: ' + xhr.status);
                        }
                    }
                }

                let requestData = {
                    reviewCode : reviewCode,
                    seq : seq,
                    regOrder : regOrder,
                    sortOrder : sortOrder,
                    replyLev : replyLev
                };

                xhr.send(JSON.stringify(requestData));
            }
        });
    });

        
})(); 
</script>
</html>