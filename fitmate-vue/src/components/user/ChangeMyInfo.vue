<template>
  <div>
    <v-container>
      <v-row justify="center">
        <v-col cols="12" sm="6" h-100>
          <v-card class="elevation-6 mt-10">
            <v-window v-model="step">
              <v-window-item :value="1">
                <v-row>
                  <v-col
                    cols="12"
                    md="6"
                    class="blue rounded-br-xl signup-left"
                  >
                    <div
                      style="text-align: center; padding: 70px 0"
                      class="msg-right"
                    >
                      <v-card-text class="white--text mt-16">
                        <h3 class="text-center signup-msg">내 정보 수정</h3>
                        <div class="login-msg-sub"></div>
                      </v-card-text>
                      <div class="text-center">
                        <v-btn tile outlined dark @click="goMyInfo"
                          >MyPage</v-btn
                        >
                      </div>
                    </div>
                  </v-col>
                  <v-col cols="12" md="6">
                    <v-card-text class="mt-6 mb-8">
                      <v-row justify="center">
                        <v-col cols="12" sm="8">
                          <v-text-field
                            label="닉네임"
                            outlined
                            dense
                            color="rgb(63, 114, 175)"
                            autocomplete="false"
                            v-model="user.nickname"
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
                            @click="updateUser"
                            >수정</v-btn
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
import { useRouter } from "vue-router";

const store = useUserStore();
const router = useRouter();

const step = ref(1);

onMounted(async () => {
  const script = document.createElement("script");
  script.src = "//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js";
  script.async = true;
  document.head.appendChild(script);
  user.value = JSON.parse(JSON.stringify(store.loginUser));
  user.value.postCode = "";
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

const goMyInfo = function () {
  router.push({ name: "myInfo" });
};

const user = ref({});
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
