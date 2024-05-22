<template>
  <div class="post-container">
    <div class="post-top-btn">
      <v-btn
        depressed
        text
        @click="movePrevPost"
        class="prev-post-btn"
        v-if="
          store.postList.findIndex((post) => post.id === store.nowPost.id) > 0
        "
      >
        <span class="mdi mdi-chevron-up"></span>
        이전글
      </v-btn>
      <v-btn
        depressed
        text
        @click="moveNextPost"
        v-if="
          store.postList.findIndex((post) => post.id === store.nowPost.id) <
          store.postList.length
        "
      >
        <span class="mdi mdi-chevron-down"></span>
        다음글
      </v-btn>
      <v-btn depressed text @click="router.push('/community')">
        목록으로
      </v-btn>
    </div>
    <div class="post-content">
      <div class="post-top">
        <div class="post-title">
          <span>{{ store.nowPost.title }}</span>
        </div>
        <div>
          <div class="post-info">
            <div>
              <span>
                <!-- 이름 -->
                {{ store.nowPost.writer }}
              </span>
            </div>
            <div class="post-info-detail">
              {{ store.nowPost.regDate }} &nbsp; 조회
              {{ store.nowPost.viewCnt }}
            </div>
          </div>
          <hr />
        </div>
      </div>
      <div class="post-mid">
        <div
        v-html="store.nowPost.content">
        </div>
        <div class="post-react">
          <div class="comment-react">
            <button :class="{ liked: isLiked }" @click="toggleLike">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="15"
                height="15"
                viewBox="0 0 24 24"
                fill="none"
              >
                <path
                  d="M19.4626 3.99415C16.7809 2.34923 14.4404 3.01211 13.0344 4.06801C12.4578 4.50096 12.1696 4.71743 12 4.71743C11.8304 4.71743 11.5422 4.50096 10.9656 4.06801C9.55962 3.01211 7.21909 2.34923 4.53744 3.99415C1.01807 6.15294 0.221721 13.2749 8.33953 19.2834C9.88572 20.4278 10.6588 21 12 21C13.3412 21 14.1143 20.4278 15.6605 19.2834C23.7783 13.2749 22.9819 6.15294 19.4626 3.99415Z"
                  stroke="#707277"
                  stroke-width="2"
                  stroke-linecap="round"
                  fill="#707277"
                ></path>
              </svg>
            </button>
            <span>{{ store.nowPost.likeCnt }}</span>
          </div>
        </div>
      </div>
      <!-- 댓글 섹션 -->
      <div class="post-cmt">
        <div id="detail-right">
          <div class="comment-list-container">
            <div class="comment-list-wrap">
              <div id="comment-list">
                <span
                  >영상 댓글
                  <span class="comment-count">{{
                    commentStore.nowCommentList.length
                  }}</span>
                </span>
              </div>
              <hr />
              <div
                v-for="comment in commentStore.nowCommentList"
                :key="comment.id"
              >
                <CommentThread
                  v-if="comment.parent === 0"
                  :key="comment.id"
                  :comment="comment"
                />
              </div>
            </div>
          </div>
          <div class="register-box input-group">
            <div class="register-comment">
              <span class="mdi mdi-message-processing-outline">&nbsp;댓글</span>
              <textarea
                class="register-textarea"
                placeholder="내용을 입력하세요."
                rows="2"
                aria-label="With textarea"
                v-model="comment.content"
              ></textarea>
              <div class="register-btn">
                <v-btn variant="tonal" size="small" @click="createComment()">
                  등록
                </v-btn>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="post-bottom-btn">
      <v-btn depressed text @click="router.push('/writePost')">
        <span class="mdi mdi-lead-pencil"></span>
        &nbsp;글쓰기
      </v-btn>
      <v-btn :class="{ hidden: !isLoginUser }" depressed text @click="router.push('/editPost/' + userStore.loginUser.id)">
        수정
      </v-btn>
      <v-btn :class="{ hidden: !isLoginUser }" depressed text @click="previous">
        삭제
      </v-btn>
    </div>
  </div>
</template>

<script setup>
import CommentList from "./CommentList.vue";
import CommentThread from "./CommentThread.vue";
import { useCommunityStore } from "@/stores/community";
import { useCommentStore } from "@/stores/comment";
import { useUserStore } from "@/stores/user";
import { computed, onBeforeMount, ref } from "vue";
import { useRoute, useRouter } from "vue-router";

const route = useRoute();
const router = useRouter();
const store = useCommunityStore();
const commentStore = useCommentStore();
const userStore = useUserStore();

const isLiked = computed(() => {
  return userStore.loginUser.likedCommunity.some(
    (id) => id === store.nowPost.id
  );
});

const isLoginUser = computed(() => {
  return userStore.loginUser.id === store.nowPost.writer;
});

const comment = ref({
  communityId: route.params.id,
  writer: sessionStorage.getItem("id")
    ? sessionStorage.getItem("id")
    : userStore.loginUser.id,
  content: "",
});

const moveNextPost = () => {
  const nowIndex = store.postList.findIndex(
    (post) => post.id === store.nowPost.id
  );
  const nextId = store.postList.at(nowIndex + 1).id;
  store.getPostById(nextId);
  router.push(`../community/${nextId}`);
};

const movePrevPost = () => {
  const nowIndex = store.postList.findIndex(
    (post) => post.id === store.nowPost.id
  );
  const nextId = store.postList.at(nowIndex - 1).id;
  store.getPostById(nextId);
  router.push(`../community/${nextId}`);
};

const createComment = () => {
  if (userStore.loginUser.id === "") {
    if (confirm("이 기능은 회원만 사용할 수 있습니다.\n로그인 하시겠습니까?")) {
      router.push({ name: "login" });
    }
    return;
  }
  commentStore.createComment(comment.value);
  comment.value.content = "";
};

const toggleLike = () => {
  if (userStore.loginUser.id === "") {
    if (confirm("이 기능은 회원만 사용할 수 있습니다.\n로그인 하시겠습니까?")) {
      router.push({ name: "login" });
    }
    return;
  }

  if (isLiked.value) {
    // 좋아요 취소
    userStore.unlikePost(store.nowPost.id);
    store.nowPost.likeCnt--;
  } else {
    // 좋아요 추가
    userStore.likePost(store.nowPost.id);
    store.nowPost.likeCnt++;
  }
};

onBeforeMount(() => {
  store.getPostById(route.params.id);
  commentStore.getNowCommentList(route.params.id);
});
</script>

<style scoped>
.post-container {
  margin: 0 19%;
}

.post-top-btn {
  display: flex;
  justify-content: flex-end;
  margin: 20px 0;
}

.post-title {
  font-size: 26px;
  font-weight: 600;
  margin-bottom: 10px;
}

.post-info {
  margin-top: 15px;
  margin-bottom: 15px;
}

.post-info-detail {
  line-height: 25px;
}

hr {
  background: rgb(204, 204, 204);
  height: 1px;
  border: 0;
}

.prev-post-btn {
  margin-left: auto;
}

.post-top-btn button,
.post-bottom-btn button {
  margin-left: 10px;
}

.post-content {
  border: 1px solid rgb(204, 204, 204);
  border-radius: 10px;
  padding: 30px;
}

.post-mid {
  margin-top: 15px;
}

.post-cmt {
  margin-top: 20px;
}
.register-box {
  width: 100%;
  height: 20%;
}

.register-comment {
  width: 100%;
  border: 1px solid #898989;
  border-radius: 10px;
  padding: 20px;
  margin-bottom: 10px;
}

.register-textarea:focus {
  outline: none;
}

.register-comment > span {
  font-size: 15px;
}

.register-comment > textarea {
  border: none;
  resize: none;
  margin-top: 10px;
  margin-bottom: 10px;
  width: 100%;
}

.count-comment-letters {
  display: flex;
  width: 100%;
  justify-content: right;
  font-size: 13px;
}

.register-btn {
  display: flex;
  width: 100%;
  justify-content: right;
}

#comment-list {
  font-size: 19px;
  font-weight: 600;
}

.comment-list-container {
  display: flex;
  width: 100%;
  height: 80%;
}

.comment-list-wrap {
  width: 100%;
  margin-top: 20px;
}

hr {
  margin: 8px 0;
}

.comment-count {
  color: #e84545;
  margin-left: 4px;
}

.post-bottom-btn {
  display: flex;
  justify-content: flex-end;
  margin: 20px 0;
}

.hidden {
  display: none;
}

/* 좋아요 버튼 */
.post-react {
  display: flex;
  align-items: center;
  justify-content: center; /* 수평 중앙 정렬 */
  height: 100px;
}

.comment-react {
  display: flex;
  padding: 5px;
  background-color: #f1f1f1;
  border-radius: 5px;
  scale: 1.5;
  width: 70px;
  height: 30px;
}

.comment-react button {
  width: 35px;
  height: 20px;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: transparent;
  border: 0;
  outline: none;
}

.comment-react button:after {
  content: "";
  width: 30px;
  height: 30px;
  position: absolute;
  background-color: #f5356e;
  border-radius: 50%;
  z-index: 0;
  transform: scale(0);
}

.comment-react button svg {
  position: relative;
  z-index: 9;
}

.comment-react button:hover:after {
  animation: ripple 0.6s ease-in-out forwards;
}

.comment-react button:hover svg {
  fill: #f5356e;
}

.comment-react button:hover svg path {
  stroke: #f5356e;
  fill: #f5356e;
}

.comment-react hr {
  width: 80%;
  height: 1px;
  background-color: #dfe1e6;
  margin: auto;
  border: 0;
}

.comment-react span {
  height: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: auto;
  font-size: 15px;
  font-weight: 600;
  color: #707277;
  padding-right: 10px;
  text-align: center;
}

@keyframes ripple {
  0% {
    transform: scale(0);
    opacity: 0.6;
  }

  100% {
    transform: scale(2);
    opacity: 0;
  }
}

.liked svg,
.liked svg path {
  color: #f5356e;
  fill: #f5356e;
  stroke: #f5356e;
}
</style>
