<template>
  <div>
    <ul>
      <li v-for="video in store.videoList" :key="video.id">
        <hr>
        <img :src="video.thumbnail" style="width: 300px" />
        <h3>{{ video.id }}</h3>
        <p>
          ▪ <RouterLink :to="`/video/${video.id}`">{{ video.title }}</RouterLink>
        </p>
        <p>▪{{ video.part }}</p>
      </li>
    </ul>
  </div>
</template>

<script setup>
import { useVideoStore } from "@/stores/video";

const store = useVideoStore();
</script>

<style scoped>
ul {
  list-style-type: none;
}
</style>
