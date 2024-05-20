<template>
  <div>
    <p>아이디</p>
    <input type="text" v-model="user.id" @keyup.enter="store.login(user)" />
    <p>비밀번호</p>
    <input
      type="password"
      v-model="user.password"
      @keyup.enter="store.login(user)"
    />
    <br />
    <button @click="store.login(user)">로그인</button>
    <br />
    <RouterLink to="/signup">Signup</RouterLink>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user";
import { ref } from "vue";

const store = useUserStore();

const user = ref({
  id: "",
  password: "",
});
</script>

<style scoped></style>
