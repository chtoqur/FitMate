<template>
  <div class="app-container">
    <TheHeaderNav class="header-nav" />
    <RouterView class="router-view" />
    <TheFooter class="footer-section" />
  </div>
</template>

<script setup>
import { onBeforeMount, ref } from "vue";
import TheHeaderNav from "@/components/common/TheHeaderNav.vue";
import TheFooter from "@/components/common/TheFooter.vue";
import { useUserStore } from "./stores/user";
import { useVideoStore } from "./stores/video";
import { useCommunityStore } from "./stores/community";
import { useCommentStore } from "./stores/comment";
import { useRoutineStore } from "./stores/routine";
import { useExerciseStore } from "./stores/exercise";

const userStore = useUserStore();
const videoStore = useVideoStore();
const communityStore = useCommunityStore();
const commentStore = useCommentStore();
const routineStore = useRoutineStore();
const exerciseStore = useExerciseStore();

onBeforeMount(async () => {
  await videoStore.getAllVideoList();
  await communityStore.getPostList();
  await commentStore.getAllCommentList();
  await routineStore.getAllRoutineList();
  await exerciseStore.getAllExerciseList();

  const id = sessionStorage.getItem("id");
  if (id !== null) {
    await userStore.getUser(id);
    videoStore.nowList = [];
    videoStore.videoList.forEach((video) => {
      if (userStore.loginUser.likedVideos.includes(video.id)) {
        videoStore.nowList.push(video);
      }
    });
    userStore.loginUser.myPost = [];
    communityStore.postList.forEach((post) => {
      if (userStore.loginUser.id === post.writer) {
        userStore.loginUser.myPost.push(post);
      }
    });
    userStore.loginUser.myComment = [];
    commentStore.allCommentList.forEach((com) => {
      if (userStore.loginUser.id === com.writer) {
        userStore.loginUser.myComment.push(com);
      }
    });
  }
  console.log(routineStore.routineList);
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
  margin-top: 100px;
}

</style>
