<template>
  <div>
    <p>아이디</p>
    <input type="text" v-model="user.id" :disabled="idChecked" />
    <button @click="checkId(user.id)" :disabled="idChecked">중복 확인</button>
    <p>비밀번호</p>
    <input type="password" v-model="user.password" />
    <p>비밀번호 확인</p>
    <input type="password" v-model="repPassword" />
    <p v-if="isPassword && repPassword" style="color: green">
      비밀번호가 일치합니다.
    </p>
    <p v-if="!isPassword && repPassword" style="color: red">
      비밀번호가 일치하지 않습니다.
    </p>
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
    <button @click="signUp">회원가입</button>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user";
import { ref, onMounted, watch, computed } from "vue";

const store = useUserStore();
const idChecked = ref(false);

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

const checkId = async (id) => {
  if (await store.checkId(id)) {
    alert("이미 존재하는 아이디입니다.");
  } else {
    idChecked.value = confirm("사용 가능한 아이디입니다. 사용하시겠습니까?");
  }
};

const signUp = function () {
  if (!isPassword) return;

  if (user.value.name === "") {
    alert("이름을 입력해주세요.");
  } else if (user.value.id === "") {
    alert("아이디를 입력해주세요.");
  } else if (user.value.password === "") {
    alert("비밀번호를 입력해주세요.");
  } else if (user.value.nickname === "") {
    alert("닉네임를 입력해주세요.");
  } else if (user.value.email === "") {
    alert("이메일을 입력해주세요.");
  } else if (user.value.age === "") {
    alert("나이를 입력해주세요.");
  } else if (user.value.fitnessLevel === "") {
    alert("운동 능력을 입력해주세요.");
  } else if (user.value.postCode === "") {
    alert("주소를 입력해주세요.");
  } else {
    store.signUp(user.value);
  }
};

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
