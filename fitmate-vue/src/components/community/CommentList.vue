<template>
  <div>
    <div v-for="com in store.nowCommentList" :key="com.id">
      <h5>작성자</h5>
      <h5>{{ com.writer }}</h5>
      <p>내용</p>
      <p>{{ com.content }}</p>
    </div>
  </div>
</template>

<script setup>
import { onMounted } from "vue";
import { useRoute } from "vue-router";
import { useCommentStore } from "@/stores/comment";

const store = useCommentStore();
const route = useRoute();

onMounted(() => {
  store.getNowCommentList(route.params.id);
});
</script>

<style scoped></style>
