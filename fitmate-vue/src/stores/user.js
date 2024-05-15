import { ref, computed } from "vue";
import { defineStore } from "pinia";
import { useRouter } from "vue-router";

export const useUserStore = defineStore("user", () => {
  const router = useRouter();

  const userList = ref([
    {
      name: "ssafy",
      nickname: "닉네임",
      id: "ssafy",
      password: "1234",
      email: "ssafy@ssafy.com",
      image: "imgSrc",
      age: 25,
      fitnessLevel: "중",
      postCode: "08760",
      address: "서울",
      likedVideos: [1],
    },
  ]);

  const loginUser = ref({
    name: "",
    nickname: "",
    id: "",
    password: "",
    email: "",
    image: "",
    age: 0,
    fitnessLevel: "",
    postCode: "",
    address: "",
    likedVideos: [],
  });

  const checkId = function (id) {
    let isExistUser = false;

    userList.value.map((el) => {
      if (el.id === id) {
        isExistUser = true;
      }
    });

    return isExistUser;
  };

  const login = function (id, password) {
    userList.value.map((user) => {
      if (user.id === id && user.password === password) {
        loginUser.value = user;
      }
    });

    if (loginUser.value.id === "") {
      alert("로그인 실패");
    } else {
      alert("로그인 성공");
      router.push({ name: "home" });
    }
  };

  const logout = function () {
    loginUser.value = {
      id: "",
      name: "",
    };
    router.push({ name: "home" });
  };

  const signUp = function (user) {
    user.liked_videos = [];
    userList.value.push(user);
    alert("회원가입 성공!");
    router.push({ name: "login" });
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
