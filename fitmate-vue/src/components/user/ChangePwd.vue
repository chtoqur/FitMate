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
                    <div style="text-align: center" class="msg-right">
                      <v-card-text class="white--text mt-16">
                        <h3 class="text-center signup-msg">비밀번호 변경</h3>
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
                            type="password"
                            label="현재 비밀번호"
                            outlined
                            dense
                            color="rgb(63, 114, 175)"
                            autocomplete="false"
                            v-model="user.nowPw"
                          />
                          <v-text-field
                            type="password"
                            label="새 비밀번호"
                            outlined
                            dense
                            color="rgb(63, 114, 175)"
                            autocomplete="false"
                            v-model="user.changePw"
                          />
                          <v-text-field
                            type="password"
                            label="새 비밀번호 확인"
                            outlined
                            dense
                            color="rgb(63, 114, 175)"
                            autocomplete="false"
                            v-model="repChangePw"
                          />
                          <p
                            v-if="isPassword && repChangePw"
                            style="color: green"
                          >
                            새 비밀번호가 일치합니다.
                          </p>
                          <p
                            v-if="!isPassword && repChangePw"
                            style="color: red"
                          >
                            새 비밀번호가 일치하지 않습니다.
                          </p>
                          <v-btn
                            color="rgb(63, 114, 175)"
                            dark
                            block
                            tile
                            @click="changePw"
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
import { ref, computed } from "vue";
import { useRouter } from "vue-router";

const store = useUserStore();
const router = useRouter();

const step = ref(1);

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
  if (!isPassword.value) {
    alert("새 비밀번호가 일치하지 않습니다.");
    return;
  }

  if (await store.checkPw(user.value)) {
    store.changePw(user.value);
  } else {
    alert("현재 비밀번호가 틀립니다.");
  }
};

const goMyInfo = function () {
  router.push({ name: "myInfo" });
};
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
  margin-top: 50px;
  padding-top: 5px;
}

.login-msg-sub {
  margin-top: 10px;
}
</style>
