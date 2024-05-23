import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import VideoView from "../views/VideoView.vue";
import VideoList from "../components/video/VideoList.vue";
import VideoDetail from "../components/video/VideoDetail.vue";
import LoginView from "../views/LoginView.vue";
import SignupView from "../views/SignupView.vue";
import RoutineView from "../views/RoutineView.vue";
import RoutineList from "../components/routine/RoutineList.vue";
import RoutineDetail from "../components/routine/RoutineDetail.vue";
import CommunityView from "../views/CommunityView.vue";
import CommunityList from "../components/community/CommunityList.vue";
import CommunityDetail from "../components/community/CommunityDetail.vue";
import MyPageView from "../views/MyPageView.vue";
import ExerciseDetail from "@/components/exercise/ExerciseDetail.vue";
import ChangePwd from "@/components/user/ChangePwd.vue";
import ChangeMyInfo from "@/components/user/ChangeMyInfo.vue";
import CommunityWritePost from "@/components/community/CommunityWritePost.vue";
import TheEditor from "@/components/community/CommunityWritePost.vue";
import LogInAndSignUpForm from "@/components/user/LogInAndSignUpForm.vue";
import CommunityEditPost from "@/components/community/CommunityEditPost.vue";
import MyPostList from "@/components/user/MyPostList.vue";
import MyPage from "@/components/user/MyPage.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
    },
    {
      path: "/video",
      name: "video",
      component: VideoView,
      children: [
        {
          path: "",
          name: "videoList",
          component: VideoList,
        },
        {
          path: ":id",
          name: "videoDetail",
          component: VideoDetail,
        },
      ],
    },
    {
      path: "/login",
      name: "login",
      component: LoginView,
    },
    {
      path: "/signup",
      name: "signup",
      component: SignupView,
    },
    {
      path: "/loginAndSignup",
      name: "loginAndSignup",
      component: LogInAndSignUpForm,
    },
    {
      path: "/routine",
      name: "routine",
      component: RoutineView,
      children: [
        {
          path: "",
          name: "routineList",
          component: RoutineList,
        },
        {
          path: ":id",
          name: "routineDetail",
          component: RoutineDetail,
        },
      ],
    },
    {
      path: "/community",
      name: "community",
      component: CommunityView,
      children: [
        {
          path: "",
          name: "communityList",
          component: CommunityList,
        },
        {
          path: ":id",
          name: "communityDetail",
          component: CommunityDetail,
        },
        {
          path: "/writePost",
          name: "writePost",
          component: CommunityWritePost,
        },
        {
          path: "/editPost/:id",
          name: "editPost",
          component: CommunityEditPost,
        },
      ],
    },
    {
      path: "/mypage",
      name: "mypage",
      component: MyPageView,
      children: [
        {
          path: "",
          name: "mypage",
          component: MyPage,
        },
        {
          path: "/changepwd",
          name: "changePwd",
          component: ChangePwd,
        },
        {
          path: "/changemyinfo",
          name: "changeMyInfo",
          component: ChangeMyInfo,
        },
        {
          path: "/mypost",
          name: "myPost",
          component: MyPostList,
        },
      ],
    },
    {
      path: "/exercise",
      name: "exercise",
      component: ExerciseDetail,
    },
  ],
});

export default router;
