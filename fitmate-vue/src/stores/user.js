import { ref, computed } from "vue";
import { defineStore } from "pinia";
import { useRouter } from "vue-router";
import axios from "axios";

const REST_USER_API = "http://localhost:8080/user";

export const useUserStore = defineStore("user", () => {
  const router = useRouter();

  const userList = ref([]);

  const loginUser = ref({});

  // 바꿔야할듯 프론트쪽에 모든 유저 정보를 가져오는거부터 손해에 말이 안되는 상황,,,?
  const checkId = async (id) => {
    try {
      const response = await axios.get(`${REST_USER_API}/${id}`);
      return response.data !== null;
    } catch (error) {
      console.error("Error checking user id:", error);
      return false;
    }
  };

  const login = async (user) => {
    console.log(user);
    try {
      const response = await axios.post(`${REST_USER_API}/login`, user);
      loginUser.value = response.data;
      console.log(response.data);
      if (loginUser.value.id === "") {
        alert("로그인 실패");
      } else {
        loginUser.value.likedVideos = JSON.parse(loginUser.value.likedVideos);
        console.log(loginUser.value.likedVideos);
        alert("로그인 성공");
        router.push({ name: "home" });
      }
    } catch (error) {
      console.error("Error logging in:", error);
      alert("로그인 실패");
    }
  };

  const logout = function () {
    loginUser.value = {
      id: "",
      name: "",
    };
    router.push({ name: "home" });
  };

  const signUp = async (user) => {
    try {
      const response = await axios.post(`${REST_USER_API}/signup`, user);
      alert("회원가입 성공!");
      router.push({ name: "login" });
    } catch (error) {
      console.error("Error signing up:", error);
      alert("회원가입 실패");
    }
  };

  const likeVideo = function (videoId) {
    console.log("찜");
    loginUser.value.likedVideos.push(videoId);
    console.log(videoId);
    console.log(loginUser.value.likedVideos);
  };

  const unlikeVideo = function (videoId) {
    console.log("찜취소");
    const idx = loginUser.value.likedVideos.findIndex((id) => id === videoId);
    if (idx !== -1) {
      loginUser.value.likedVideos.splice(idx, 1);
    }
    console.log(loginUser.value.likedVideos);
  };

  return {
    userList,
    loginUser,
    checkId,
    login,
    logout,
    signUp,
    likeVideo,
    unlikeVideo,
  };
});
