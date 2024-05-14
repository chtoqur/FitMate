<template>
  <div>
    <div style="display: flex">
      <div>
        <h3>{{ store.nowPost.title }}</h3>
        <h4>{{ store.nowPost.writer }}</h4>
        <h4>{{ store.nowPost.regDate }}</h4>
      </div>
      <div>
        <button>목록</button>
        <h4>댓글 수 : {{ store.nowPost.commentCnt }}</h4>
      </div>
    </div>

    <div>
      <h3>내용</h3>
      <p>{{ store.nowPost.content }}</p>
    </div>

    <div>
      <h4>댓글</h4>
      <CommentList />
    </div>
  </div>
</template>

<script setup>
import CommentList from "./CommentList.vue";
import { useCommunityStore } from "@/stores/community";
import { useCommentStore } from "@/stores/comment";
import { onMounted } from "vue";
import { useRoute } from "vue-router";

const route = useRoute();
const store = useCommunityStore();
const commentStore = useCommentStore();

onMounted(() => {
  store.getPostById(route.params.id);
});
</script>

<style scoped></style>
