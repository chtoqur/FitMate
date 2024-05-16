<template>
  <div class="rank-section">
    <HomePopularPost />
  </div>
  <div>
    <KakaoMap />
  </div>
</template>

<script setup>
import HomePopularPost from "@/components/home/HomePopularPost.vue";
import KakaoMap from "@/components/kakao/KakaoMap.vue";
</script>

<style scoped>
* {
  text-align: center;
}

.rank-section {
  margin: 0 19%;
}
</style>