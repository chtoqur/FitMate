<template>
  <div class="home-container">
    <section class="video-section">
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
    <section id="section-mid">
      <div class="animated-title">
        <div class="track">
          <div class="content">&nbsp;MAKE YOUR WORKOUT LIFE BETTER&nbsp;MAKE YOUR WORKOUT LIFE BETTER&nbsp;MAKE YOUR WORKOUT LIFE BETTER&nbsp;MAKE YOUR WORKOUT LIFE BETTER&nbsp;MAKE YOUR WORKOUT LIFE BETTER&nbsp;MAKE YOUR WORKOUT LIFE BETTER</div>
        </div>
      </div>
      <div class="home-subtitle">
        <p>인기글과 동영상에서</p>
        <p>트렌드를 확인해보세요.</p>
      </div>
      <div class="section-mid">
        <div class="rank-section">
          <HomePopularPost />
        </div>
        <div class="mid-video">
          <HomeRankedVideo />
        </div>
      </div>
    </section>
    <section id="section-gym">
      <div class="gym-subtitle">
        <p>피트메이트와 함께</p>
        <p>주변 헬스장에서 시작하세요.</p>
      </div>
      <div>
        <KakaoMap />
      </div>
    </section>
  </div>
</template>

<script setup>
import HomePopularPost from "@/components/home/HomePopularPost.vue";
import HomeRankedVideo from "@/components/home/HomeRankedVideo.vue";
import KakaoMap from "@/components/kakao/KakaoMap.vue";
import { ref, onMounted, onUnmounted } from "vue";

const message = " 여기에 원하는 텍스트를 입력하세요. ";
const offset = ref(0);
const speed = 2;
const repeatCount = 3; // 텍스트 반복 횟수
const marqueeContainer = ref(null);

const animate = () => {
  offset.value -= speed;
  requestAnimationFrame(animate);
};

const showMsgA = ref(true);
const showMsgB = ref(false);
const showMsgC = ref(false);

onMounted(() => {
  setTimeout(() => {
    showMsgA.value = false;
    showMsgB.value = true;
  }, 5300); // 5.3초 후에 msg-a 숨기고 msg-b 표시
  setTimeout(() => {
    showMsgB.value = false;
    showMsgC.value = true;
  }, 11500); // 11.5초 후에 msg-b 숨기고 msg-c 표시
  
  requestAnimationFrame(animate);
});

onUnmounted(() => {
  cancelAnimationFrame(animate);
});
</script>

<style scoped>
* {
  user-select: none;
}

.video-section {
  position: relative;
  top: -100px; /* 네브바의 높이만큼 위로 이동 */
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

.section-mid {
  display: flex;
  justify-content: space-between;
  margin: 0 19%;
  height: 400px;
}

.rank-section {
  width: 47%;
}

.mid-video {
  width: 44%;
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
  font-size: 6rem;
  font-weight: bold;
  color: #f0fdff;
  letter-spacing: 0.3rem;
  animation: text-fadein 1.5s;
}

.msg-c {
  line-height: 120px;
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

.section-mid {
  margin-bottom: 200px;
}

.animated-title {
  position: relative;
  width: 100%;
  max-width:100%;
  height: auto;
  font-size:60px;
  font-weight:300;
  padding:100px 0;
  overflow-x: hidden;
  overflow-y: hidden;
  color: rgb(196, 209, 235);
}

.animated-title .track {
  position: absolute;
  white-space: nowrap;
  will-change: transform;
  animation: marquee 60s linear infinite;
}

@keyframes marquee {
  from {
    transform: translateX(0);
  }
  to {
    transform: translateX(-50%);
  }
}

@media (hover: hover) and (min-width: 700px) {
  .animated-title .content {
    -webkit-transform: translateY(calc(100% - 8rem));
    transform: translateY(calc(100% - 8rem));
  }
}

#section-gym {
  margin-bottom: 100px;
}

.home-subtitle {
  text-align: center;
  font-size: 40px;
  font-weight: bold;
  line-height: 55px;
  margin-bottom: 50px;
}

.gym-subtitle {
  text-align: center;
  font-size: 40px;
  font-weight: bold;
  line-height: 55px;
  margin-bottom: 70px;
}
</style>
