<template>
  <div id="container">
    <div>
      <iframe
        width="560"
        height="315"
        :src="`https://www.youtube.com/embed/${store.video.youtubeVideoId}`"
        title="YouTube video player"
        frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
        referrerpolicy="strict-origin-when-cross-origin"
        allowfullscreen
      ></iframe>
    </div>
    <div>
      <div>
        <span>{{ store.video.title }}</span>
        <br />
        <span>{{ store.video.channelName }}</span>
        <br />
        <span>{{ store.video.description }}</span>
      </div>
      <VideoReview
        v-for="review in store.videoReviewList"
        :key="review.id"
        :review="review"
      />

      <div v-if="userStore.loginUser.id !== ''">
        <input type="text" v-model="review" />
        <button @click="createReview()">등록</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRoute } from "vue-router";
import { onMounted, ref } from "vue";
import { useVideoStore } from "@/stores/video";
import { useUserStore } from "@/stores/user";
import VideoReview from "./VideoReview.vue";

const store = useVideoStore();
const userStore = useUserStore();
const route = useRoute();

const review = ref("");

onMounted(() => {
  store.getVideo(route.params.id);
  store.getReviewList(route.params.id);
});

const createReview = function () {
  store.createReview(review.value, store.video.id, userStore.loginUser.id);
  review.value = "";
};
</script>

<style scoped>
#container {
  display: flex;
}
</style>
