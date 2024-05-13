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
import { ref, onMounted, watch } from "vue";

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

watch([address, detailAddress], ([newAddress, newDetailAddress]) => {
  user.value.address = `${newAddress} ${newDetailAddress}`;
});

const user = ref({
  name: "",
  id: "",
  password: "",
  age: "",
  ability: "",
  postCode: "",
  address: "",
});
</script>

<style scoped></style>
