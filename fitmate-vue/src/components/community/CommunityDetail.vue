<template>
  <div class="post-container">
    <div class="post-top-btn">
      <v-btn
        depressed
        text
        @click="previous"
        class="prev-post-btn"
      >
        <span class="mdi mdi-chevron-up"></span>
        이전글
      </v-btn>
      <v-btn
        depressed
        text
        @click="previous"
      >
        <span class="mdi mdi-chevron-down"></span>
        다음글
      </v-btn>
      <v-btn
        depressed
        text
        @click="previous"
      >
        목록으로
      </v-btn>
    </div>
    <div class="post-content">
      <div class="post-top">
        <div class="post-title">
          <span>{{ store.nowPost.title }}</span>
        </div>
        <div>
          <div>
            <img
            v-if="userStore.loginUser.image === undefined"
            src="@/assets/img/user/default_profile.png">
            <img
            v-else
            :src="`http://localhost:8080/${userStore.loginUser.image}`">
          </div>
          <div class="post-info">
            <div>
              <span>
                <!-- 이름 -->
                {{ store.nowPost.writer }}
              </span>
            </div>
            <div>
              {{ store.nowPost.regDate }} &nbsp; 조회 {{ store.nowPost.viewCnt }}
            </div>
          </div>
          <hr>
        </div>
      </div>
      <div class="post-mid">
        <div>
          {{ store.nowPost.content }}
        </div>
        <div>
          <!-- 좋아요 -->
        </div>
      </div>
      <!-- 댓글 섹션 -->
      <div class="post-cmt">
        
      </div>
    </div>
    <div class="post-bottom-btn">
      <v-btn
        depressed
        text
        @click="previous"
      >
        <span class="mdi mdi-lead-pencil"></span>
        글쓰기
      </v-btn>
      <v-btn
        depressed
        text
        @click="previous"
      >
        수정
      </v-btn>
      <v-btn
        depressed
        text
        @click="previous"
      >
        삭제
      </v-btn>
    </div>
    <div style="display: flex">
      <div>
        <h3>{{ store.nowPost.title }}</h3>
        <h4>{{ store.nowPost.writer }}</h4>
        <h4>{{ store.nowPost.regDate }}</h4>
      </div>
      <div>
        <RouterLink to="/community">목록</RouterLink>
        <h4>댓글 수 : {{ commentStore.nowCommentList.length }}</h4>
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
import { useUserStore } from "@/stores/user";
import { onBeforeMount } from "vue";
import { useRoute } from "vue-router";

const route = useRoute();
const store = useCommunityStore();
const commentStore = useCommentStore();
const userStore = useUserStore();

onBeforeMount(() => {
  store.getPostById(route.params.id);
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
  margin-bottom: 15px;
}

hr {
    background: rgb(204, 204, 204);
    height:1px;
    border:0;
}

.prev-post-btn {
  margin-left: auto;
}

.post-top-btn button, .post-bottom-btn button {
  margin-left: 10px;
}


.post-content {
  border: 1px solid rgb(204, 204, 204);
  border-radius: 10px;
  padding: 30px;
}

.post-bottom-btn {
  display: flex;
  justify-content: flex-end;
  margin: 20px 0;
}

</style>
