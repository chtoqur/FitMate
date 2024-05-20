<template>
  <div class="comment-list">
    <div class="full-comment-area">
      <!-- 대댓글 기호 -->
      <div v-if="review.parent !== 0" class="icon-reply-box">
        <span class="icon-reply"></span>
      </div>
      <!-- 오른쪽 댓글 섹션 -->
      <div class="comment-section">
        <!-- 작성자 정보 -->
        <div class="writer-info">
          <!-- 작성자 이름 -->
          <span>
            {{ review.writer }}
          </span>
          <!-- 로그인 유저인 경우 작성자 표시 -->
          <span
            v-if="review.writer == userStore.loginUser.id"
            class="writer-mark-icon"
          >
            <span class="writer-mark">작성자</span>
          </span>
        </div>
        <!-- 댓글 내용 -->
        <div class="cmt-content-area">
          <span class="cmt-content">{{ review.content }}</span>
          <!-- 수정 textarea hidden -->
          <div class="cmt-edit-box hidden">
            <textarea
              class="form-control cmt-textarea"
              rows="2"
              aria-label="With textarea"
            >
${comment.comments}</textarea
            >
          </div>
        </div>
        <!-- 작성일 -->
        <div class="cmt-date">
          <span>{{ review.regDate }}</span>
        </div>
        <!-- 버튼 영역 -->
        <div class="cmt-button-area">
          <!-- 일반 display -->
          <div class="cmt-button-area-before">
            <!-- v-if 대댓글 아니면 답글 -->
            <v-btn variant="tonal" v-if="review.parent == 0" size="small">
              답글
            </v-btn>
            <!-- v-if 작성자 본인이면 수정 + 삭제 -->
            <v-btn
              variant="tonal"
              v-if="review.writer == userStore.loginUser.id"
              size="small"
            >
              수정
            </v-btn>
            <v-btn
              variant="tonal"
              v-if="review.writer == userStore.loginUser.id"
              size="small"
            >
              삭제
            </v-btn>
          </div>
          <!-- 수정중 hidden -->
          <div class="cmt-button-arera-after hidden">
            <v-btn variant="tonal" size="small">취소</v-btn>
            <v-btn variant="tonal" size="small">수정</v-btn>
          </div>
        </div>
      </div>
    </div>
    <!-- <p v-else>{{ review.content }}</p>
    <button
      v-if="review.writer === userStore.loginUser.id && !review.editing"
      @click="setUpdateReview(review.id)"
    >
      수정
    </button>
    <button
      v-if="review.writer === userStore.loginUser.id && review.editing"
      @click="review.editing = false"
    >
      취소
    </button>
    <button
      v-if="review.writer === userStore.loginUser.id"
      @click="store.deleteReview(review.id, review.videoId)"
    >
      삭제
    </button> -->
  </div>
</template>

<script setup>
import { useVideoStore } from "@/stores/video";
import { useUserStore } from "@/stores/user";
import { defineProps, ref, onMounted } from "vue";

const store = useVideoStore();
const userStore = useUserStore();
const parentId = ref("");

defineProps({
  review: Object,
});

const updateReview = ref({});

const setUpdateReview = function (id) {
  store.videoReviewList.map((el) => {
    if (el.id === id) {
      updateReview.value = JSON.parse(JSON.stringify(el));
      el.editing = true;
    } else {
      el.editing = false;
    }
  });
};
</script>

<style scoped>
.comment-list {
  font-size: 14px;
  margin-bottom: 10px;
  /* 답댓글 섹션 컬러 */
  /* background-color: rgb(234, 234, 234); */
}

.full-comment-area {
  display: flex;
  width: 100%;
}

.full-reply-area {
  display: flex;
  margin-top: 20px;
}

.writer-info {
  display: flex;
  align-items: center;
  font-weight: 600;
}

.icon-reply-box {
  margin-right: 10px;
}

.icon-reply {
  display: block;
  margin-top: 5px;
  width: 12px;
  height: 12px;
  border-width: 0 0 1px 1px;
  border-style: solid;
  border-color: #898989;
  opacity: 0.4;
}

.comment-section {
  width: 100%;
}

.cmt-content-area {
  width: 100%;
  margin-top: 5px;
  margin-bottom: 5px;
}

.cmt-content {
  color: rgb(102, 102, 102);
}

.cmt-edit-box {
  width: 100%;
  margin-top: 8px;
}

.cmt-reply-edit-box {
  width: 100%;
  margin-top: 8px;
}

.cmt-textarea {
  resize: none;
  width: 100%;
  font-size: 14px;
}

.cmt-reply-textarea {
  resize: none;
  width: 100%;
  font-size: 14px;
}

.cmt-date {
  margin-top: 2px;
  font-size: 12px;
  color: rgb(168, 168, 168);
}

.cmt-button-area {
  margin-top: 5px;
}

.cmt-reply-button-area {
  display: flex;
  margin-top: 5px;
}

.cmt-reply-count {
  font-size: 13px;
}

.cmt-button-area-before {
  margin-left: auto;
}

/* .cmt-edit-button-area {
    margin-top: 5px;
} */

.writer-mark-icon {
  display: flex;
  height: 17px;
  border-width: 1px 1px 1px 1px;
  border-style: solid;
  border-radius: 17px;
  margin: 2px 0 0 3px;
  margin-left: 5px;
  padding: 0 7px;
  justify-content: center;
  align-items: center;
}

.writer-mark {
  height: 17px;
  line-height: 17px;
  margin: 0;
  font-size: 12px;
}

#btnCmtEdit {
  margin-left: 3px;
}

#btnCmtDelete {
  margin-left: 3px;
}

.hidden-span {
  visibility: hidden;
}

.hidden {
  display: none;
}

.hidden-btn {
  display: none;
}
</style>
