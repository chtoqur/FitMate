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
          <span class="cmt-content"
          :class="{ hidden: isEditAreaVisible }"
          >{{ review.content }}</span>
          <!-- 수정 textarea hidden -->
          <div class="cmt-edit-box"
          :class="{ hidden: !isEditAreaVisible }">
            <textarea
              class="form-control cmt-textarea"
              v-model="editReview.content"
              rows="2"
              aria-label="With textarea"
            >{{ editReview.content }}</textarea>
          </div>
        </div>
        <!-- 작성일 -->
        <div class="cmt-date">
          <span>{{ review.regDate }}</span>
        </div>
        <!-- 버튼 영역 -->
        <div class="cmt-button-area">
          <!-- 일반 display -->
          <div class="cmt-button-area-before"
          :class="{ hidden: isEditAreaVisible }">
            <!-- v-if 대댓글 아니면 답글 -->
            <v-btn variant="tonal" class="comment-btn" v-if="userStore.loginUser.id !== '' && review.parent == 0" size="small"
              @click="toggleReplyArea(review.id)">
              답글
            </v-btn>
            <!-- v-if 작성자 본인이면 수정 + 삭제 -->
            <v-btn
              class="comment-btn"
              variant="tonal"
              v-if="review.writer == userStore.loginUser.id"
              size="small"
              @click="toggleEditArea(review.id)"
            >
              수정
            </v-btn>
            <v-btn
              class="comment-btn"
              variant="tonal"
              v-if="review.writer == userStore.loginUser.id"
              size="small"
              @click="store.deleteReview(review.id, review.videoId)"
            >
              삭제
            </v-btn>
          </div>
          <!-- 수정중 hidden -->
          <div class="cmt-button-arera-after"
          :class="{ hidden: !isEditAreaVisible }">
            <v-btn class="comment-btn" variant="tonal" size="small"
            @click="isEditAreaVisible = !isEditAreaVisible"
            >취소</v-btn>
            <v-btn class="comment-btn" variant="tonal" size="small"
            @click="updateReview"
            >수정</v-btn>
          </div>
        </div>
        <!-- 대댓글 영역 -->
        <div
          class="cmt-reply-area"
          :class="{ hidden: !isReplyAreaVisible }"
        >
          <div class="full-reply-area">
            <div class="icon-reply-box">
              <span class="icon-reply"></span>
            </div>
            <div class="comment-section">
              <div class="writer-info">
                <span>
                  <span><strong>{{ userStore.loginUser.id }}</strong></span>
                </span>
              </div>
              <div class="cmt-content-area">
                <div class="cmt-reply-edit-box">
                  <textarea class="form-control cmt-reply-textarea" rows="3" aria-label="With textarea"></textarea>
                </div>
              </div>
              <div class="cmt-reply-button-area" data-seq="${comment.seq}" data-regOrder="${comment.regOrder}" data-sortOrder="${comment.sortOrder}" data-replyTo="">
                <div class="cmt-button-area-before">
                  <v-btn variant="tonal" size="small" class="comment-btn"
                    @click="createReplyReview"
                  >
                  등록</v-btn>
                </div>
              </div>
            </div>
          </div>
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
</template>

<script setup>
import { useRoute } from "vue-router";
import { useVideoStore } from "@/stores/video";
import { useUserStore } from "@/stores/user";
import { defineProps, ref } from "vue";

const route = useRoute();
const store = useVideoStore();
const userStore = useUserStore();
const isReplyAreaVisible = ref(false);
const isEditAreaVisible = ref(false);

const editReview = ref({
  videoId: route.params.id,
  writer: sessionStorage.getItem("id")
    ? sessionStorage.getItem("id")
    : userStore.loginUser.id,
  content: "",
  parent : -1
});

const replyReview = ref({
  videoId: route.params.id,
  writer: sessionStorage.getItem("id")
    ? sessionStorage.getItem("id")
    : userStore.loginUser.id,
  content: "",
  parent: -1
});

defineProps({
  review: Object,
});

const createReplyReview = () => {
  store.createReview(replyReview.value);
  review.value.content = "";
}

const updateReview = () => {
  store.updateReview(editReview.value.videoId, editReview);
  isEditAreaVisible.value = !isEditAreaVisible.value;
}

const toggleReplyArea = (parentId) => {
  replyReview.value.parent = parentId;
  isReplyAreaVisible.value = !isReplyAreaVisible.value;
}

const toggleEditArea = (parentId) => {
  editReview.value.parent = parentId;
  isEditAreaVisible.value = !isEditAreaVisible.value;
}
</script>

<style scoped>
textarea {
  border: 1px solid rgb(189, 189, 189);
  border-radius: 8px;
}
.comment-list {
  font-size: 14px;
  margin-bottom: 10px;
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
  padding: 5px;
}

.cmt-reply-textarea {
  resize: none;
  width: 100%;
  font-size: 14px;
  padding: 10px;
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

.comment-btn {
  margin-right: 5px;
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
