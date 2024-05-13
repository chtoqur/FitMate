<template>
  <div>
    <h3>SignupView</h3>
    <p>아이디</p>
    <input type="text" v-model="id" />
    <p>이름</p>
    <input type="text" v-model="name" />
    <p>비밀번호</p>
    <input type="text" v-model="password" />
    <button @click="store.signUp(id, name, password)">회원가입</button>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user";
import { ref } from "vue";

const store = useUserStore();

const id = ref("");
const name = ref("");
const password = ref("");
</script>

<style scoped></style>
