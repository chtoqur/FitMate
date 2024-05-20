<template>
  <div>
    <div class="card">
      <div class="img"
        :style="{ backgroundImage: routine.img }"
      >
        <span>이미지 들어갈 공간</span>
        <div class="save"
          @click="saveRoutine(routine.id)">
          <svg class="svg" width="683" height="683" viewBox="0 0 683 683" fill="none" xmlns="http://www.w3.org/2000/svg">
            <g clip-path="url(#clip0_993_25)">
              <mask id="mask0_993_25" style="mask-type:luminance" maskUnits="userSpaceOnUse" x="0" y="0" width="683" height="683">
                <path d="M0 -0.00012207H682.667V682.667H0V-0.00012207Z" fill="white"></path>
              </mask>
              <g mask="url(#mask0_993_25)">
                <path d="M148.535 19.9999C137.179 19.9999 126.256 24.5092 118.223 32.5532C110.188 40.5866 105.689 51.4799 105.689 62.8439V633.382C105.689 649.556 118.757 662.667 134.931 662.667H135.039C143.715 662.667 151.961 659.218 158.067 653.09C186.451 624.728 270.212 540.966 304.809 506.434C314.449 496.741 327.623 491.289 341.335 491.289C355.045 491.289 368.22 496.741 377.859 506.434C412.563 541.074 496.752 625.242 524.816 653.348C530.813 659.314 538.845 662.667 547.308 662.667C563.697 662.667 576.979 649.395 576.979 633.019V62.8439C576.979 51.4799 572.48 40.5866 564.447 32.5532C556.412 24.5092 545.489 19.9999 534.133 19.9999H148.535Z" stroke="#CED8DE" stroke-width="40" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
              </g>
            </g>
            <defs>
              <clipPath id="clip0_993_25">
                <rect width="682.667" height="682.667" fill="white"></rect>
              </clipPath>
            </defs>
          </svg>
        </div>
      </div>
      <div class="text">
        <div class="title-desc"
          @click="navigateToDetail(routine.id)"
        >
          <p class="h3">{{ routine.title }}</p>
          <p class="p"> {{ routine.part }} - 난이도: {{ routine.level }} </p>
        </div>
        <div class="icon-box">
          <v-card-actions>
            <v-btn color="rgb(63, 114, 175)" text="시작하기"
              @click="navigateToDetail(routine.id)"
            ></v-btn>
            <v-btn color="rgb(63, 114, 175)" text="공유하기"></v-btn>
          </v-card-actions>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { defineProps, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { useUserStore } from "@/stores/user";

const props = defineProps({
  routine: Object,
})

const router = useRouter();
const userStore = useUserStore();

const navigateToDetail = function(routineId) {
  setTimeout(()=>{
    router.push({ name: 'routineDetail', params: { id: routineId }})
  }, 300);
}

const saveRoutine = (id) => {
  if (userStore.loginUser.id === '') {
    if (confirm("이 기능은 회원만 사용할 수 있습니다.\n로그인 하시겠습니까?")) {
      router.push({ name: 'login' })
    }
  } else {
    if ((userStore.loginUser.savedRoutine.length !== 0) && (userStore.loginUser.savedRoutine.find(id => id === props.routine.id))) {
      userStore.deleteRoutine(id);
    } else {

    }
  }
}

onMounted(() => {
  // if (userStore.loginUser.id !== '' && userStore.loginUser.savedRoutine.length !== 0) {
  //   if (userStore.loginUser.savedRoutine.includes(props.routine.id)) {
  //     console.log(userStore.loginUser.savedRoutine);
  //     document.querySelector('.svg').classList.add('saved-routine');
  //   }
  // }
})
</script>

<style scoped>
.card {
  width: 252px;
  height: 265px;
  background: white;
  border-radius: 30px;
  box-shadow: 15px 15px 30px #bebebe,
             -15px -15px 30px #ffffff;
  transition: 0.2s ease-in-out;
}

.img {
  width: 100%;
  height: 50%;
  border-top-left-radius: 30px;
  border-top-right-radius: 30px;
  /* background-image: url('@/assets/img/routine/1.jpg'); */
  display: flex;
  align-items: top;
  justify-content: right;
  border: 1px solid rgb(97, 137, 201);
}

.save {
  transition: 0.2s ease-in-out;
  border-radius: 10px;
  margin: 20px;
  width: 30px;
  height: 30px;
  background-color: #ffffff;
  display: flex;
  align-items: center;
  justify-content: center;
}

.text {
  margin: 15px;
  display: flex;
  flex-direction: column;
  align-items: space-around;
}

.save .svg {
  transition: 0.2s ease-in-out;
  width: 15px;
  height: 15px;
}

.saved-routine .svg {
 fill: #ced8de;
}

.title-desc {
  padding-left: 10px;
  line-height: 18px;
}

.icon-box {
  margin-top: 15px;
  width: 70%;
  /* background-color: #e3fff9; */
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: left;
}

.icon-box svg {
  width: 17px;
}

.text .h3 {
  font-family: 'Lucida Sans' sans-serif;
  font-size: 15px;
  font-weight: 600;
  color: black;
}

.text .p {
  font-family: 'Lucida Sans' sans-serif;
  color: #999999;
  font-size: 13px;
}

.icon-box .span {
  margin-left: 10px;
  font-family: 'Lucida Sans' sans-serif;
  font-size: 13px;
  font-weight: 500;
  color: #9198e5;
}

.card:hover {
  cursor: pointer;
  box-shadow: 0px 10px 20px rgba(0,0,0,0.1);
}

.save:hover {
  transform: scale(1.1) rotate(10deg);
}

.save:hover .svg {
  fill: #ced8de;
}

.v-card-actions {
  padding: 0%;
}
</style>