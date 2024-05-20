import { ref, computed } from "vue";
import { defineStore } from "pinia";
import { useRouter } from "vue-router";
import axios from "axios";

const REST_USER_API = "http://localhost:8080/user";

export const useUserStore = defineStore("user", () => {
  const router = useRouter();

  const userList = ref([]);

  const loginUser = ref({
    id: "",
    likedVideos: [],
  });

  const checkId = async (id) => {
    try {
      const response = await axios.get(`${REST_USER_API}/check/${id}`);
      return response.data !== null;
    } catch (error) {
      console.log(error);
      return false;
    }
  };

  const getUser = async (id) => {
    try {
      const response = await axios.get(`${REST_USER_API}/${id}`);
      loginUser.value = response.data;
      if (loginUser.value === "") {
        alert("유저 정보 부르기 실패");
      } else {
        loginUser.value.likedVideos = JSON.parse(loginUser.value.likedVideos);
      }
    } catch (err) {
      console.log(err);
      alert("만료");
    }
  };

  const login = async (user) => {
    try {
      const response = await axios.post(`${REST_USER_API}/login`, user);
      loginUser.value = response.data;
      if (loginUser.value.id === "") {
        alert("로그인 실패");
      } else {
        sessionStorage.setItem("access-token", response.data["access-token"]);
        loginUser.value.likedVideos = JSON.parse(loginUser.value.likedVideos);
        const token = response.data["access-token"].split(".");
        let id = JSON.parse(atob(token[1]))["id"];
        sessionStorage.setItem("id", id);
        alert("로그인 성공");
        router.push({ name: "home" });
      }
    } catch (err) {
      console.log(err);
      alert("로그인 실패");
    }
  };

  const logout = function () {
    loginUser.value = {
      id: "",
      name: "",
    };
    sessionStorage.clear();
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

  const likeVideo = async function (videoId) {
    loginUser.value.likedVideos.push(videoId);
    try {
      const likedVideosJson = JSON.stringify(loginUser.value.likedVideos);
      await axios.post(
        `${REST_USER_API}/${loginUser.value.id}/updatelikedvideos`,
        {
          likedVideos: likedVideosJson,
        }
      );
    } catch (err) {
      console.log(err);
    }
  };

  const unlikeVideo = async function (videoId) {
    const idx = loginUser.value.likedVideos.findIndex((id) => id === videoId);
    if (idx !== -1) {
      loginUser.value.likedVideos.splice(idx, 1);
      try {
        const likedVideosJson = JSON.stringify(loginUser.value.likedVideos);
        await axios.post(
          `${REST_USER_API}/${loginUser.value.id}/updatelikedvideos`,
          {
            likedVideos: likedVideosJson,
          }
        );
      } catch (err) {
        console.log(err);
      }
      console.log(loginUser.value.likedVideos);
    }
  };

  const saveRoutine = function (routineId) {
    loginUser.value.savedRoutine.push(routineId);
  };

  const deleteRoutine = function (routineId) {
    loginUser.value.savedRoutine = loginUser.value.savedRoutine.filter(
      (id) => id !== routineId
    );
  };

  return {
    userList,
    loginUser,
    checkId,
    getUser,
    login,
    logout,
    signUp,
    likeVideo,
    unlikeVideo,
    saveRoutine,
    deleteRoutine,
  };
});
