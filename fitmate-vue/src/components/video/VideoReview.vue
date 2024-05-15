<template>
  <div>
    <hr />
    <p>작성자: {{ review.userId }}</p>
    <p>작성일: {{ review.regDate }}</p>
    <span>내용: </span>
    <div v-if="review.editing">
      <input type="text" v-model="updateReview.content" />
      <button
        @click="store.updateReview(updateReview), (review.editing = false)"
      >
        등록
      </button>
    </div>
    <p v-else>{{ review.content }}</p>
    <button
      v-if="review.userId === userStore.loginUser.id && !review.editing"
      @click="setUpdateReview(review.id)"
    >
      수정
    </button>
    <button
      v-if="review.userId === userStore.loginUser.id && review.editing"
      @click="review.editing = false"
    >
      취소
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
import { defineProps, ref } from "vue";

const store = useVideoStore();
const userStore = useUserStore();

defineProps({
  review: Object,
});

const updateReview = ref({});

const setUpdateReview = function (id) {
  store.videoReviewList.map((el) => {
    if (el.id === id) {
      updateReview.value = el;
      el.editing = true;
    } else {
      el.editing = false;
    }
  });
};
</script>

<style scoped></style>
