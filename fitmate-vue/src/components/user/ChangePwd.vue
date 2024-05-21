<template>
  <div>
    <p>현재 비밀번호</p>
    <input type="password" v-model="user.nowPw" />
    <p>새 비밀번호</p>
    <input type="password" v-model="user.changePw" />
    <p>새 비밀번호 확인</p>
    <input type="password" v-model="repChangePw" />
    <p v-if="isPassword && repChangePw" style="color: green">
      비밀번호가 일치합니다.
    </p>
    <p v-if="!isPassword && repChangePw" style="color: red">
      비밀번호가 일치하지 않습니다.
    </p>
    <button @click="changePw()">비밀번호 변경</button>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user";
import { ref, computed } from "vue";

const store = useUserStore();
const idChecked = ref(false);

const user = ref({
  id: sessionStorage.getItem("id"),
  nowPw: "",
  changePw: "",
});
const repChangePw = ref("");

const isPassword = computed(() => {
  return repChangePw.value === user.value.changePw;
});

const changePw = async () => {
  if (!isPassword) return;

  if (await store.checkPw(user.value)) {
    store.changePw(user.value);
  } else {
    alert("현재 비밀번호가 틀립니다.");
  }
};
</script>

<style scoped></style>
