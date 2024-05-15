<template>
  <div>
    <div v-for="com in store.nowCommentList" :key="com.id">
      <h5>작성자</h5>
      <h5>{{ com.writer }}</h5>
      <p>내용</p>
      <div v-if="com.editing">
        <input type="text" v-model="updateComment" />
        <button
          @click="
            store.updateComment(com.id, updateComment), (com.editing = false)
          "
        >
          등록
        </button>
      </div>
      <p v-else>{{ com.content }}</p>
      <button
        v-if="com.writer === userStore.loginUser.id && !com.editing"
        @click="setUpdateComment(com.id)"
      >
        수정
      </button>
      <button
        v-if="com.writer === userStore.loginUser.id && com.editing"
        @click="com.editing = false"
      >
        취소
      </button>
      <button
        v-if="com.writer === userStore.loginUser.id"
        @click="store.deleteComment(com.id)"
      >
        삭제
      </button>
    </div>
    <div v-if="userStore.loginUser.id !== ''">
      <input type="text" v-model="comment.content" />
      <button @click="createComment">등록</button>
    </div>
  </div>
</template>

<script setup>
import { onMounted, ref } from "vue";
import { useRoute } from "vue-router";
import { useCommentStore } from "@/stores/comment";
import { useUserStore } from "@/stores/user";

const store = useCommentStore();
const userStore = useUserStore();
const route = useRoute();

onMounted(() => {
  store.getNowCommentList(route.params.id);
});

const comment = ref({
  communityId: route.params.id,
  content: "",
  writer: userStore.loginUser.id,
  parent: null,
});

const setUpdateComment = function (id) {
  store.nowCommentList.map((el) => {
    if (el.id === id) {
      updateComment.value = el.content;
      updateCommentId.value = id;
      el.editing = true;
    } else {
      el.editing = false;
    }
  });
};

const updateComment = ref("");
const updateCommentId = ref(0);

const createComment = function () {
  store.createComment(comment.value);
  comment.value = {
    communityId: route.params.id,
    content: "",
    writer: userStore.loginUser.id,
    parent: null,
  };
};
</script>

<style scoped></style>
