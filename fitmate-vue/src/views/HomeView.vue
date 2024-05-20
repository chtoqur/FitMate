<template>
  <div>
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
      <div>
      </div>
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
</script>

<style scoped>
* {
  text-align: center;
}

.section-2 {
  display: flex;
  justify-content: space-between;
  margin: 0 19%;
  height: 400px;
}

</style>