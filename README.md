# ✨FITMATE PJT✨

## 0. TEAM MEMBER
- 🍅 이강현
- 🍮 최이서

### ☘ 목적
- 웹 프론트 아키텍처를 이해하고 이를 활용하여 프로젝트에 적용할 수 있다.
- 수업을 하며 배운 Vue와 Spring을 사용하여 하나의 프로젝트를 구현해낼 수 있다.
- Vue의 다양한 라이브러리를 이용하여 SPA 방식으로 프로젝트를 구성한다. 
- 헬스 초보자를 위한 가이드 영상과 루틴을 볼 수 있으며 운동 커뮤니티를 사용해 유저 간 소통이 가능하다.

## 1. FILE TREE
```
💻 02팀_이서나라_강현공주
fitmate-spring
├─src
│  ├─ main
│  │  ├─ java
│  │  │  └─ com
│  │  │     └─ ssafy
│  │  │        └─ fitmate
│  │  │           ├─ config
│  │  │           │  ├─ DBConfig.java
│  │  │           │  ├─ SwaggerConfig.java
│  │  │           │  └─ WebConfig.java
│  │  │           ├─ controller
│  │  │           │  ├─ CommunityCommentRestController.java
│  │  │           │  ├─ CommunityRestController.java
│  │  │           │  ├─ ExerciseRestController.java
│  │  │           │  ├─ RoutineRestController.java
│  │  │           │  ├─ UserRestController.java
│  │  │           │  ├─ VideoCommentRestController.java
│  │  │           │  └─ VideoRestController.java
│  │  │           ├─ interceptor
│  │  │           │  ├─ AdminPageInterceptor.java
│  │  │           │  └─ JwtInterceptor.java
│  │  │           ├─ model
│  │  │           │  ├─ dao
│  │  │           │  │  ├─ CommunityCommentDao.java
│  │  │           │  │  ├─ CommunityDao.java
│  │  │           │  │  ├─ ExerciseDao.java
│  │  │           │  │  ├─ RoutineDao.java
│  │  │           │  │  ├─ UserDao.java
│  │  │           │  │  ├─ VideoCommentDao.java
│  │  │           │  │  └─ VideoDao.java
│  │  │           │  ├─ dto
│  │  │           │  │  ├─ Community.java
│  │  │           │  │  ├─ CommunityComment.java
│  │  │           │  │  ├─ Exercise.java
│  │  │           │  │  ├─ Routine.java
│  │  │           │  │  ├─ User.java
│  │  │           │  │  ├─ Video.java
│  │  │           │  │  └─ VideoComment.java
│  │  │           ├─ service
│  │  │           │  ├─ CommunityCommentService.java
│  │  │           │  ├─ CommunityCommentServiceImpl.java
│  │  │           │  ├─ CommunityService.java
│  │  │           │  ├─ CommunityServiceImpl.java
│  │  │           │  ├─ ExerciseService.java
│  │  │           │  ├─ ExerciseServiceImpl.java
│  │  │           │  ├─ RoutineService.java
│  │  │           │  ├─ RoutineServiceImpl.java
│  │  │           │  ├─ UserService.java
│  │  │           │  ├─ UserServiceImpl.java
│  │  │           │  ├─ VideoCommentService.java
│  │  │           │  ├─ VideoCommentServiceImpl.java
│  │  │           │  ├─ VideoService.java
│  │  │           │  └─ VideoServiceImpl.java
│  │  │           └─ FitMateRestApiApplication.java
│  │  ├─ resources
│  │  │  └─ mappers
│  │  │     ├─ communityCommentMapper.xml
│  │  │     ├─ communityMapper.xml
│  │  │     ├─ exerciseMapper.xml
│  │  │     ├─ routineMapper.xml
│  │  │     ├─ userMapper.xml
│  │  │     ├─ videoCommentMapper.xml
│  │  │     └─ videoMapper.xml
│  │  ├─ static/users
│  │  └─ application.properties
fitmate-vue
├─ src
│  ├─ assets
│  │  ├─ css
│  │  │  └─ reset.css
│  │  ├─ img
│  │  ├─ lib
│  │  └─ video
│  ├─ components
│  │  ├─ common
│  │  │  ├─ TheFooter.vue
│  │  │  └─ TheHeaderNav.vue
│  │  ├─ community
│  │  │  ├─ CommentList.vue
│  │  │  ├─ CommentThread.vue
│  │  │  ├─ CommunityDetail.vue
│  │  │  ├─ CommunityEditPost.vue
│  │  │  ├─ CommunityList.vue
│  │  │  └─ CommunityWritePost.vue
│  │  ├─ exercise
│  │  │  └─ ExerciseDetail.vue
│  │  ├─ home
│  │  │  ├─ HomePopularPost.vue
│  │  │  └─ HomeRankedVideo.vue
│  │  ├─ kakao
│  │  │  └─ KakaoMap.vue
│  │  ├─ routine
│  │  │  ├─ RoutineCard.vue
│  │  │  ├─ RoutineDetail.vue
│  │  │  └─ RoutineList.vue
│  │  ├─ user
│  │  │  ├─ ChangeMyInfo.vue
│  │  │  ├─ ChangePwd.vue
│  │  │  ├─ LoginAndSignUpForm.vue
│  │  │  ├─ MyPage.vue
│  │  │  └─ MyPostList.vue
│  │  └─ video
│  │     └─ VideoDetail.vue
│  ├─ router
│  │  ├─ index.js
│  │  ├─ community.js
│  │  ├─ exercise.js
│  │  ├─ home.js
│  │  ├─ routine.js
│  │  ├─ user.js
│  │  └─ video.js
│  ├─ stores
│  │  ├─ comment.js
│  │  ├─ community.js
│  │  ├─ exercise.js
│  │  ├─ home.js
│  │  ├─ routine.js
│  │  ├─ user.js
│  │  └─ video.js
│  ├─ views
│  │  ├─ CommunityView.vue
│  │  ├─ HomeView.vue
│  │  ├─ LoginView.vue
│  │  ├─ MyPageView.vue
│  │  ├─ RoutineView.vue
│  │  ├─ SignupView.vue
│  │  └─ VideoView.vue
│  ├─ App.vue
│  ├─ main.js
│  ├─ .env.local
│  ├─ .gitignore
│  ├─ index.html
│  ├─ jsconfig.json
│  ├─ package-lock.json
│  ├─ package.json
│  ├─ README.md
│  ├─ vite.config.js
│  ├─ fitmate_dummy_data.sql
│  └─ fitmate_schema.sql
```

## 2. 실행 화면

#### - 메인 화면1
![main](/readmeIMG/main.PNG)

#### - 메인 화면2
![main2](/readmeIMG/main2.PNG)

#### - 메인 화면3
![main3](/readmeIMG/main3.PNG)

#### - 메인 화면4
![main4](/readmeIMG/main4.PNG)

#### - 로그인
![login](/readmeIMG/login.PNG)

#### - 회원 가입
![signup](/readmeIMG/signup.PNG)

#### - 회원 가입 전체 화면
![signup2](/readmeIMG/signup2.PNG)

#### - 운동 가이드
![videolist1](/readmeIMG/videolist1.PNG)

#### - 좋아요한 운동 영상
![videolist2](/readmeIMG/videolist2.PNG)

#### - 부위 선택 & 좋아요한 운동 영상
![videolist3](/readmeIMG/videolist3.PNG)

#### - 운동 가이드 페이지네이션
![videolistpagenation](/readmeIMG/videolistpagination.PNG)

#### - 루틴
![routine1](/readmeIMG/routine1.PNG)

#### - 저장한 루틴
![routine2](/readmeIMG/routine2.PNG)

#### - 루틴 - 부위 난이도 선택
![routine3](/readmeIMG/routine3.PNG)

#### - 커뮤니티
![community1](/readmeIMG/community1.PNG)

#### - 커뮤니티 검색 기능
![community2](/readmeIMG/community2.PNG)

#### - 게시글 상세
![communityDetail1](/readmeIMG/communityDetail1.PNG)

#### - 댓글 답글 달기
![communityDetail2](/readmeIMG/communityDetail2.PNG)

#### - 댓글 답글
![communityDetail3](/readmeIMG/communityDetail3.PNG)

#### - 답글 수정하기
![communityDetail4](/readmeIMG/communityDetail4.PNG)

#### - 답글 수정
![communityDetail5](/readmeIMG/communityDetail5.PNG)

#### - 게시글 좋아요
![likePost](/readmeIMG/likePost.PNG)

#### - 게시글 작성
![writepost](/readmeIMG/writepost.PNG)

#### - 게시글 작성 완료
![writepost2](/readmeIMG/writepost2.PNG)

#### - 게시글 수정
![updatepost1](/readmeIMG/updatepost1.PNG)

#### - 게시글 수정 완료
![updatepost2](/readmeIMG/updatepost2.PNG)

#### - 마이페이지
![mypage1](/readmeIMG/mypage1.PNG)

#### - 마이페이지 - 좋아요한 영상, 작성한 글
![mypage2](/readmeIMG/mypage2.PNG)

#### - 프로필 사진 수정
![changeProfileIMG](/readmeIMG/changeProfileIMG.png)

#### - 프로필 사진 수정 (사진 선택)
![changeProfileIMG2](/readmeIMG/changeProfileIMG2.png)


## 3. PJT REVIEW

👸🏻 이강현
> 단기간 프로젝트이다보니 한정된 시간을 적절히 분배하는 것이 중요하다는 것을 배웠습니다. 계획대로 작업을 해내갈때마다 성취감을 느꼈고, 오류도 많이 마주쳤지만 결국에는 목표로 한 기능들을 다 만들어 본 것 같아 완성 후 뿌듯한 프로젝트였습니다. css 고수 이서 누나 최고


🤴🏻 최이서
> 다소 빠듯한 일정이었지만 기획 단계에서 구상했던 것들을 모두 구현해서 뿌듯했습니다. 이론적인 부분의 한계로 작업이 더뎌질 때 아쉬운 마음이 들었어서 2학기 시작하기 전 부족한 부분을 열심히 보충해야겠다 느꼈습니다.


