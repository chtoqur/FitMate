import { ref, computed } from "vue";
import { defineStore } from "pinia";
import { useRouter } from "vue-router";

export const useUserStore = defineStore("user", () => {
  const router = useRouter();

  const userList = ref([
    {
      name: "ssafy",
      id: "ssafy",
      password: "1234",
      email: "ssafy@ssafy.com",
      age: 25,
      fitnessLevel: "중",
      postCode: "08760",
      address: "서울",
    },
  ]);

  const loginUser = ref({
    id: "",
    name: "",
  });

  const login = function (id, password) {
    userList.value.map((user) => {
      if (user.id === id && user.password === password) {
        loginUser.value.id = user.id;
        loginUser.value.name = user.name;
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
    let isExistUser = false;

    userList.value.map((el) => {
      if (el.id === user.id) {
        isExistUser = true;
      }
    });

    if (isExistUser) {
      alert("이미 존재하는 아이디입니다.");
    } else {
      user.liked_videos = [];
      userList.value.push(user);
      alert("회원가입 성공!");
      router.push({ name: "login" });
    }
  };

  return {
    userList,
    loginUser,
    login,
    logout,
    signUp,
  };
});
