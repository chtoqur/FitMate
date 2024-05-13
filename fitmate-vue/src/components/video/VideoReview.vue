<template>
  <div>
    <hr />
    <p>작성자: {{ review.userId }}</p>
    <p>작성일: {{ review.regDate }}</p>
    <p>내용: {{ review.content }}</p>
    <button
      v-if="review.userId === userStore.loginUser.id"
      @click="store.updateReview"
    >
      수정
    </button>
    <button
      v-if="review.userId === userStore.loginUser.id"
      @click="store.deleteReview(review.id, review.videoId)"
    >
      삭제
    </button>
  </div>
</template>

<script setup>
import { useVideoStore } from "@/stores/video";
import { useUserStore } from "@/stores/user";
import { defineProps } from "vue";

const store = useVideoStore();
const userStore = useUserStore();

defineProps({
  review: Object,
});
</script>

<style scoped></style>
