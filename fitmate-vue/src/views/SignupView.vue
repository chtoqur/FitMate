<template>
  <div>
    <h3>SignupView</h3>
    <p>이름</p>
    <input type="text" v-model="user.name" />
    <p>아이디</p>
    <input type="text" v-model="user.id" />
    <p>비밀번호</p>
    <input type="password" v-model="user.password" />
    <p>연령대</p>
    <select v-model="user.age">
      <option>20대 이하</option>
      <option>20대</option>
      <option>30대</option>
      <option>40대</option>
      <option>50대 이상</option>
    </select>
    <p>운동 경험 수준?</p>
    <select v-model="user.ability">
      <option>상</option>
      <option>중</option>
      <option>하</option>
    </select>
    <p>주소</p>
    <input type="text" v-model="user.address" />
    <button @click="store.signUp(user)">회원가입</button>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user";
import { ref } from "vue";

const store = useUserStore();

const user = ref({
  name: "",
  id: "",
  password: "",
  age: "",
  ability: "",
  address: "",
});
</script>

<style scoped></style>
