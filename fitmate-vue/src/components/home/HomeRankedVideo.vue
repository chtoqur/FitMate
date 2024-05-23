<template>
  <div class="ranked-container">
    <div class="ranked-title">
      <h3>인기 동영상</h3>
    </div>
    <div class="ranked-videos">
      <v-carousel
        v-if="homeStore.rankedVideos && homeStore.rankedVideos.length"
        hide-delimiters
        height="290px"
      >
        <v-carousel-item v-for="(video, i) in homeStore.rankedVideos" :key="i">
          <div class="d-flex fill-height justify-center align-center">
            <iframe
              width="520px"
              height="300px"
              :src="`https://www.youtube.com/embed/${video.youtubeVideoId}`"
              title="YouTube video player"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              referrerpolicy="strict-origin-when-cross-origin"
              allowfullscreen
            ></iframe>
          </div>
        </v-carousel-item>
      </v-carousel>
    </div>
  </div>
</template>

<script setup>
import { onBeforeMount, ref } from "vue";
import { useHomeStore } from "@/stores/home";

const homeStore = useHomeStore();

onBeforeMount(async () => {
  await homeStore.getRankedVideos();
});
</script>

<style scoped>
.ranked-container {
  margin-top: 50px;
}

.ranked-title {
  display: flex;
  height: 30px;
  align-items: center;
  margin-bottom: 15px;
}

.ranked-title h3 {
  border: 1px solid black;
  border-radius: 7px;
  padding: 10px;
}

.ranked-videos {
  display: flex;
  justify-content: flex-end;
  width: 100%;
  height: 100px;
}

.v-window,
.v-theme--light,
.v-carousel {
  height: 300px;
}

</style>
