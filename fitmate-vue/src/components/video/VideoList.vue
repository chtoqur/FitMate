<template>
  <div>
    <ul>
      <li v-for="video in store.videoList" :key="video.id">
        <hr />
        <img :src="video.thumbnail" style="width: 300px" />
        <h3>{{ video.id }}</h3>
        <p>
          ▪
          <RouterLink :to="`/video/${video.id}`">{{ video.title }}</RouterLink>
        </p>
        <p>▪{{ video.part }}</p>
        <div v-if="userStore.loginUser.id !== ''">
          <button
            @click="userStore.likeVideo(video.id)"
            v-if="!userStore.loginUser.likedVideos.includes(video.id)"
          >
            찜
          </button>
          <button
            @click="userStore.unlikeVideo(video.id)"
            v-if="userStore.loginUser.likedVideos.includes(video.id)"
          >
            찜 취소
          </button>
        </div>
      </li>
    </ul>
  </div>
</template>

<script setup>
import { useVideoStore } from "@/stores/video";
import { useUserStore } from "@/stores/user";

const store = useVideoStore();
const userStore = useUserStore();
</script>

<style scoped>
ul {
  list-style-type: none;
}
</style>
