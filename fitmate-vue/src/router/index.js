import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import VideoView from "../views/VideoView.vue";
import VideoList from "../components/video/VideoList.vue";
import VideoDetail from "../components/video/VideoDetail.vue";
import LoginView from "../views/LoginView.vue";
import SignupView from "../views/SignupView.vue";
import RoutineView from "../views/RoutineView.vue";
import RoutineList from "../components/routine/RoutineList.vue"
import RoutineDetail from "../components/routine/RoutineDetail.vue";
import ExerciseDetail from "@/components/exercise/ExerciseDetail.vue";

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
          component: RoutineDetail
        }
      ],
    },
    {
      path: "/exercise",
      name: "exercise",
      component: ExerciseDetail
    }
  ],
});

export default router;


