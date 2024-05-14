<template>
  <div>
    <p>아이디</p>
    <input type="text" v-model="user.id" />
    <p>비밀번호</p>
    <input type="password" v-model="user.password" />
    <p>비밀번호 확인</p>
    <input type="password" v-model="repPassword" />
    <p>{{ isPassword }}</p>
    <p>닉네임</p>
    <input type="text" v-model="user.nickname" />
    <p>이름</p>
    <input type="text" v-model="user.name" />
    <p>이메일</p>
    <input type="text" v-model="user.email" />
    <p>연령</p>
    <input type="number" v-model="user.age" />
    <p>운동 능력</p>
    <select v-model="user.fitnessLevel">
      <option>상</option>
      <option>중</option>
      <option>하</option>
    </select>
    <p>주소</p>
    <input
      type="text"
      v-model="user.postCode"
      style="width: 5%"
      placeholder="우편 번호"
      disabled
    />
    <button @click="postOpen">주소 찾기</button>
    <br />
    <input type="text" v-model="address" placeholder="도로명 주소" disabled />
    <br />
    <input type="text" v-model="detailAddress" placeholder="상세 주소" />
    <br />
    <button @click="store.signUp(user)">회원가입</button>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user";
import { ref, onMounted, watch, computed } from "vue";

const store = useUserStore();

onMounted(() => {
  const script = document.createElement("script");
  script.src = "//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js";
  script.async = true;
  document.head.appendChild(script);
});

const postOpen = () => {
  new daum.Postcode({
    oncomplete: function (data) {
      // console.log(data);
      user.value.postCode = data.zonecode;
      address.value = data.address;
    },
  }).open();
};

const address = ref("");
const detailAddress = ref("");
const repPassword = ref("");

const isPassword = computed(() => {
  return repPassword.value === user.value.password;
});

watch([address, detailAddress], ([newAddress, newDetailAddress]) => {
  user.value.address = `${newAddress} ${newDetailAddress}`;
});

const user = ref({
  name: "",
  id: "",
  password: "",
  nickname: "",
  email: "",
  age: "",
  fitnessLevel: "",
  postCode: "",
  address: "",
});
</script>

<style scoped></style>
