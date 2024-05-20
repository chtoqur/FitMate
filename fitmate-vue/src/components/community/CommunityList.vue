<template>
  <div>
    <h3>CommunityList 화면</h3>
    <div>
      <div v-for="post in store.postList" :key="post.id">
        <span>{{ post.id }} | </span>
        <span
          ><RouterLink :to="`/community/${post.id}`"
            >{{ post.title }}
          </RouterLink>
          |
        </span>
        <span>{{ post.writer }} | </span>
        <span>{{ post.regDate }} | </span>
        <span>{{ post.viewCnt }}</span>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useCommunityStore } from "@/stores/community";
import { onMounted } from "vue";
import { useRouter } from "vue-router";

const store = useCommunityStore();
const router = useRouter();

onMounted(() => {
  store.getPostList();
});
</script>

<style lang="scss" scoped></style>
