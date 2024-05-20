<template>
  <div class="app-container">
    <TheHeaderNav class="header-nav" />
    <RouterView class="router-view" />
    <TheFooter class="footer-section" />
  </div>
</template>

<script setup>
import { onMounted, ref } from "vue";
import TheHeaderNav from "@/components/common/TheHeaderNav.vue";
import TheFooter from "@/components/common/TheFooter.vue";
import { useUserStore } from "./stores/user";
import { useVideoStore } from "./stores/video";
import { useCommunityStore } from "./stores/community";
import { useCommentStore } from "./stores/comment";

const userStore = useUserStore();
const videoStore = useVideoStore();
const communityStore = useCommunityStore();
const commentStore = useCommentStore();

onMounted(async () => {
  const id = sessionStorage.getItem("id");
  if (id !== null) {
    await userStore.getUser(id);
  }

  await videoStore.getAllVideoList();
  await communityStore.getPostList();
  await commentStore.getAllCommentList();
});
</script>

<style scoped>
*::-webkit-scrollbar {
  display: none;
}

.app-container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.header-nav {
  height: 100px;
}

.router-view {
  flex: 1;
}

.footer-section {
  height: 100px;
}
</style>
