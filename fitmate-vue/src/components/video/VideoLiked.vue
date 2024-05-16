<template>
  <div>
    <ul>
      <li v-for="video in videoStore.nowList" :key="video.id">
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
            @click="unlikeVideo(video.id)"
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
import { useUserStore } from "@/stores/user";
import { useVideoStore } from "@/stores/video";
import { onMounted, ref } from "vue";

const userStore = useUserStore();
const videoStore = useVideoStore();

onMounted(() => {
  videoStore.nowList = [];
  videoStore.videoList.forEach((video) => {
    if (userStore.loginUser.likedVideos.includes(video.id)) {
      videoStore.nowList.push(video);
    }
  });
});

const unlikeVideo = function (id) {
  userStore.unlikeVideo(id);
  videoStore.nowList = [];
  videoStore.videoList.forEach((video) => {
    if (userStore.loginUser.likedVideos.includes(video.id)) {
      videoStore.nowList.push(video);
    }
  });
};
</script>

<style lang="scss" scoped></style>
