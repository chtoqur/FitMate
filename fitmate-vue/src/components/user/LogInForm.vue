<template>
  <div>
    <p>아이디</p>
    <input type="text" v-model="id" />
    <p>비밀번호</p>
    <input type="password" v-model="password" />
    <br />
    <button @click="store.login(id, password)">로그인</button>
    <br />
    <RouterLink to="/signup">Signup</RouterLink>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user";
import { ref } from "vue";

const store = useUserStore();

const id = ref("");
const password = ref("");
</script>

<style scoped></style>
