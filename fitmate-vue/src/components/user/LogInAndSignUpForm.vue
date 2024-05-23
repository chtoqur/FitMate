<template>
  <div>
    <v-container>
      <v-row justify="center">
        <v-col cols="12" sm="6" h-100>
          <v-card class="elevation-6 mt-10">
            <v-window v-model="step">
              <!-- 로그인 창 -->
              <v-window-item :value="1">
                <v-row>
                  <v-col cols="12" md="6">
                    <v-card-text class="mt-16">
                      <v-row justify="center">
                        <v-col cols="12" sm="8">
                          <v-row justify="center">
                            <img
                              src="../../assets/img/logo-dark-crop.png"
                              alt=""
                              class="logo-img"
                            />
                          </v-row>
                          <!-- 아이디 입력 -->
                          <v-text-field
                            label="아이디"
                            outlined
                            dense
                            color="rgb(63, 114, 175)"
                            autocomplete="false"
                            v-model="loginUser.id"
                            class="mt-16"
                            @keyup.enter="store.login(loginUser)"
                          />
                          <!-- 비밀번호 입력 -->
                          <v-text-field
                            label="비밀번호"
                            outlined
                            dense
                            color="rgb(63, 114, 175)"
                            autocomplete="false"
                            type="password"
                            v-model="loginUser.password"
                            @keyup.enter="store.login(loginUser)"
                          />
                          <!-- 비밀번호 찾기 -->
                          <v-row>
                            <v-col cols="12" sm="12">
                              <span class="caption blue--text"
                                >비밀번호를 잊어버리셨나요?</span
                              >
                            </v-col>
                          </v-row>
                          <!-- 로그인 처리 -->
                          <v-btn
                            color="rgb(63, 114, 175)"
                            dark
                            block
                            tile
                            class="mt-6"
                            @click="store.login(loginUser)"
                            >로그인</v-btn
                          >
                        </v-col>
                      </v-row>
                    </v-card-text>
                  </v-col>
                  <v-col
                    cols="12"
                    md="6"
                    class="blue rounded-bl-xl login-right"
                  >
                    <div style="text-align: center; padding: 170px 0">
                      <v-card-text class="white--text">
                        <h3 class="text-center signup-msg">
                          아직 회원이 아니신가요?
                        </h3>
                        <div class="signup-msg-sub">
                          <span
                            >Make your workout life better<br />피트메이트와
                            함께 운동을 배워보세요</span
                          >
                        </div>
                      </v-card-text>
                      <div class="text-center mt-2">
                        <v-btn tile outlined dark @click="step++"
                          >회원가입</v-btn
                        >
                      </div>
                    </div>
                  </v-col>
                </v-row>
              </v-window-item>
              <!-- 회원가입 창 -->
              <v-window-item :value="2">
                <v-row>
                  <v-col
                    cols="12"
                    md="6"
                    class="blue rounded-br-xl signup-left"
                  >
                    <div
                      style="text-align: center; padding: 180px 0"
                      class="msg-right"
                    >
                      <v-card-text class="white--text mt-16">
                        <h3 class="text-center signup-msg">
                          이미 회원이신가요?
                        </h3>
                        <div class="login-msg-sub">
                          <span class="text-center"
                            >로그인 후 피트메이트의 다양한<br />기능들을
                            체험해보세요</span
                          >
                        </div>
                      </v-card-text>
                      <!-- 로그인 창으로 전환 -->
                      <div class="text-center">
                        <v-btn tile outlined dark @click="step--">Log in</v-btn>
                      </div>
                    </div>
                  </v-col>
                  <v-col cols="12" md="6">
                    <v-card-text class="mt-6 mb-8">
                      <v-row justify="center">
                        <v-col cols="12" sm="8">
                          <!-- 이름 -->
                          <v-row>
                            <v-col cols="12" sm="8">
                              <v-form :disabled="idChecked">
                                <v-text-field
                                  label="아이디"
                                  outlined
                                  dense
                                  color="rgb(63, 114, 175)"
                                  autocomplete="false"
                                  class="mt-4"
                                  v-model="user.id"
                                />
                              </v-form>
                            </v-col>
                            <v-col cols="12" sm="4">
                              <v-form :disabled="idChecked">
                                <v-btn
                                  class="mt-6"
                                  tile
                                  outlined
                                  dark
                                  @click="checkId(user.id)"
                                  >중복 확인</v-btn
                                >
                              </v-form>
                            </v-col>
                          </v-row>
                          <!-- 이메일 -->
                          <v-text-field
                            label="이메일"
                            outlined
                            dense
                            color="rgb(63, 114, 175)"
                            autocomplete="false"
                            v-model="user.email"
                          />
                          <v-text-field
                            label="비밀번호"
                            outlined
                            dense
                            color="rgb(63, 114, 175)"
                            autocomplete="false"
                            type="password"
                            v-model="user.password"
                          />
                          <v-text-field
                            label="비밀번호 확인"
                            outlined
                            dense
                            color="rgb(63, 114, 175)"
                            autocomplete="false"
                            type="password"
                            v-model="repPassword"
                          />
                          <p
                            v-if="isPassword && repPassword"
                            style="color: rgb(63, 114, 175)"
                          >
                            비밀번호가 일치합니다.
                          </p>
                          <p
                            v-if="!isPassword && repPassword"
                            style="color: rgb(63, 114, 175)"
                          >
                            비밀번호가 일치하지 않습니다.
                          </p>
                          <v-text-field
                            label="닉네임"
                            outlined
                            dense
                            color="rgb(63, 114, 175)"
                            autocomplete="false"
                            v-model="user.nickname"
                          />
                          <v-text-field
                            label="이름"
                            outlined
                            dense
                            color="rgb(63, 114, 175)"
                            autocomplete="false"
                            v-model="user.name"
                          />
                          <v-text-field
                            label="연령"
                            outlined
                            dense
                            color="rgb(63, 114, 175)"
                            autocomplete="false"
                            type="number"
                            v-model="user.age"
                          />
                          <v-combobox
                            label="운동능력"
                            :items="['상', '중', '하']"
                            outlined
                            dense
                            color="rgb(63, 114, 175)"
                            v-model="user.fitnessLevel"
                          ></v-combobox>
                          <v-row>
                            <v-col cols="12" sm="7">
                              <v-form disabled>
                                <v-text-field
                                  label="우편번호"
                                  outlined
                                  dense
                                  color="rgb(63, 114, 175)"
                                  autocomplete="false"
                                  v-model="user.postCode"
                                ></v-text-field>
                              </v-form>
                            </v-col>
                            <v-col cols="12" sm="5">
                              <v-btn
                                class="mt-2"
                                tile
                                outlined
                                dark
                                @click="postOpen"
                                >주소 찾기</v-btn
                              >
                            </v-col>
                          </v-row>
                          <v-form disabled>
                            <v-text-field
                              label="도로명 주소"
                              outlined
                              dense
                              color="rgb(63, 114, 175)"
                              autocomplete="false"
                              v-model="address"
                            />
                          </v-form>
                          <v-text-field
                            label="상세 주소"
                            outlined
                            dense
                            color="rgb(63, 114, 175)"
                            autocomplete="false"
                            v-model="detailAddress"
                          />
                          <v-btn
                            color="rgb(63, 114, 175)"
                            dark
                            block
                            tile
                            @click="signUp"
                            >회원가입</v-btn
                          >
                        </v-col>
                      </v-row>
                    </v-card-text>
                  </v-col>
                </v-row>
              </v-window-item>
            </v-window>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user";
import { ref, onMounted, watch, computed } from "vue";

const store = useUserStore();
const idChecked = ref(false);

const step = ref(1);

const loginUser = ref({
  id: "",
  password: "",
});

onMounted(() => {
  const script = document.createElement("script");
  script.src = "//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js";
  script.async = true;
  document.head.appendChild(script);
});

const postOpen = () => {
  new daum.Postcode({
    oncomplete: function (data) {
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
    step.value = 1;
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

<style scoped>
.logo-img {
  width: 200px;
}

.login-right {
  background-color: rgb(63, 114, 175);
  border-bottom-left-radius: 50%;
  color: white;
}

.signup-msg {
  font-size: 25px;
}

.signup-msg-sub {
  margin-top: 10px;
}

.signup-left {
  background-color: rgb(63, 114, 175);
  border-bottom-right-radius: 35%;
  color: white;
}

.msg-right {
  margin-top: 100px;
}

.login-msg-sub {
  margin-top: 10px;
}
</style>
