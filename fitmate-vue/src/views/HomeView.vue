<template>
  <div>
    <section>
      <div>
        <video src="../assets/video/main.mp4"
        class="main-video" autoplay muted loop></video>
      </div>
      <div class="main-msg-sub">
        <span v-if="showMsgA" class="msg-a">부위별 트레이닝 가이드</span>
        <span v-if="showMsgB" class="msg-b">난이도로 선택하는 루틴</span>
      </div>
      <div class="main-msg">
        <span v-if="showMsgC" class="msg-c">당신의 fitness mate, <br>FitMate</span>
      </div>
    </section>
    <section>
      <div class="section-2">
        <div class="rank-section">
          <HomePopularPost />
        </div>
        <div>
          <HomeRankedVideo />
        </div>
      </div>
    </section>
    <section>
      <div></div>
    </section>
    <div>
      <KakaoMap />
    </div>
  </div>
</template>

<script setup>
import HomePopularPost from "@/components/home/HomePopularPost.vue";
import HomeRankedVideo from "@/components/home/HomeRankedVideo.vue";
import KakaoMap from "@/components/kakao/KakaoMap.vue";
import { ref, onMounted } from "vue";

const showMsgA = ref(true);
const showMsgB = ref(false);
const showMsgC = ref(false);

onMounted(() => {
  setTimeout(() => {
    showMsgA.value = false;
    showMsgB.value = true;
  }, 5300); // 3초 후에 msg-a 숨기고 msg-b 표시
  setTimeout(() => {
    showMsgB.value = false;
    showMsgC.value = true;
  }, 11500); // 6초 후에 msg-b 숨기고 msg-c 표시
});
</script>

<style scoped>
* {
  user-select: none;
}

.main-video {
  width: 100vw;
  height: 100vh;
  object-fit: cover;
  animation: video-fadein 2s;
}

@keyframes video-fadein {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.section-2 {
  display: flex;
  justify-content: space-between;
  margin: 0 19%;
  height: 400px;
}

.main-msg-sub {
  position: absolute;
  height: 0;
  top: 45%;
  left: 50%;
  transform: translate(-50%, -50%);
  max-width: auto;
}

.main-msg {
  position: absolute;
  height: 0;
  top: 39%;
  left: 50%;
  transform: translate(-50%, -50%);
  max-width: auto;
}

.main-msg-sub span, .main-msg span {
  display: flex;
  font-size: 5rem;
  font-weight: bold;
  color: #f0fdff;
  letter-spacing: 0.3rem;
  animation: text-fadein 1s;
}

.msg-c {
  line-height: 100px;
}

@keyframes text-fadein {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@keyframes text-fadeout {
  from {
    opacity: 1;
  }
  to {
    opacity: 0;
  }
}
</style>
