<template>
  <div>
    <div>
      <p>{{ userStore.loginUser.image }}</p>
      <p>{{ userStore.loginUser.id }}</p>
      <p>{{ userStore.loginUser.name }}</p>
      <p>{{ userStore.loginUser.nickname }}</p>
    </div>
    <br />
    <div>
      <p>나의 활동</p>
      <div>
        <p>좋아요한 영상</p>
        <RouterLink to="video/liked">더보기 -></RouterLink>
        <div style="display: flex">
          <div v-for="video in videoStore.nowList" :key="video.id">
            <RouterLink :to="`/video/${video.id}`">
              <img :src="video.thumbnail" />
            </RouterLink>
          </div>
        </div>
      </div>
      <div>
        <p>작성한 글</p>
        <div v-for="post in userStore.loginUser.myPost" :key="post.id">
          <RouterLink :to="`community/${post.id}`">
            <p>{{ post.title }}</p>
          </RouterLink>
        </div>
      </div>
      <div>
        <p>작성한 댓글</p>
        <div v-for="com in userStore.loginUser.myComment" :key="com.id">
          <RouterLink :to="`community/${com.communityId}`">
            <p>{{ com.content }}</p>
          </RouterLink>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user";
import { useVideoStore } from "@/stores/video";
import { useCommunityStore } from "@/stores/community";
import { useCommentStore } from "@/stores/comment";
import { onMounted } from "vue";

const userStore = useUserStore();
const videoStore = useVideoStore();
const communityStore = useCommunityStore();
const commentStore = useCommentStore();

onMounted(() => {
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
});
</script>

<style scoped>
img {
  width: 300px;
}
</style>
