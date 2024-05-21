<template>
  <div>
    <p>닉네임</p>
    <input type="text" v-model="user.nickname" />
    <p>나이</p>
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
    <button @click="updateUser()">정보 수정</button>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user";
import { ref, onBeforeMount, watch, computed } from "vue";

const store = useUserStore();
const idChecked = ref(false);

onBeforeMount(async () => {
  const id = sessionStorage.getItem("id");
  if (id !== null) {
    await store.getUser(id);
    user.value = JSON.parse(JSON.stringify(store.loginUser));
    user.value.postCode = "";
  }
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

const updateUser = function () {
  if (user.value.nickname === "") {
    alert("닉네임를 입력해주세요.");
  } else if (user.value.age === "") {
    alert("나이를 입력해주세요.");
  } else if (user.value.fitnessLevel === "") {
    alert("운동 능력을 입력해주세요.");
  } else if (user.value.postCode === "") {
    alert("주소를 입력해주세요.");
  } else {
    store.updateUser(user.value);
  }
};

watch([address, detailAddress], ([newAddress, newDetailAddress]) => {
  user.value.address = `${newAddress} ${newDetailAddress}`;
});

const user = ref({});
</script>

<style scoped></style>
