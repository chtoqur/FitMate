<template>
  <div>
    <div v-for="com in store.nowCommentList" :key="com.id">
      <div v-if="com.parent === 0">
        <h5>작성자</h5>
        <h5>{{ com.writer }}</h5>
        <p>내용</p>
        <div v-if="com.editing">
          <input type="text" v-model="updateComment.content" />
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
          @click="store.deleteComment(com.id, com.communityId)"
        >
          삭제
        </button>
        <button
          v-if="userStore.loginUser.id !== ''"
          @click="setChildComment(com.id)"
        >
          답글
        </button>
      </div>
      <div v-if="com.childComment">
        <input type="text" v-model="childComment.content" />
        <button @click="createChildComment(), (com.childComment = false)">
          등록
        </button>
        <button @click="com.childComment = false">취소</button>
      </div>
      <div v-for="child in store.nowCommentList" :key="child.id">
        <!-- style 부분 css로 (답글)바꿔야함 -->
        <div v-if="child.parent === com.id" style="padding-left: 1rem">
          <h5>작성자</h5>
          <h5>{{ child.writer }}</h5>
          <p>내용</p>
          <div v-if="child.editing">
            <input type="text" v-model="updateComment" />
            <button
              @click="
                store.updateComment(child.id, updateComment),
                  (child.editing = false)
              "
            >
              등록
            </button>
          </div>
          <p v-else>{{ child.content }}</p>
          <button
            v-if="child.writer === userStore.loginUser.id && !child.editing"
            @click="setUpdateComment(child.id)"
          >
            수정
          </button>
          <button
            v-if="child.writer === userStore.loginUser.id && child.editing"
            @click="child.editing = false"
          >
            취소
          </button>
          <button
            v-if="child.writer === userStore.loginUser.id"
            @click="store.deleteComment(child.id, child.communityId)"
          >
            삭제
          </button>
        </div>
      </div>
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
  writer: sessionStorage.getItem("id")
    ? sessionStorage.getItem("id")
    : userStore.loginUser.id,
  parent: null,
});

const updateComment = ref({});

const childComment = ref({
  communityId: route.params.id,
  content: "",
  writer: userStore.loginUser.id,
  parent: null,
});

const setChildComment = function (parentId) {
  childComment.value.parent = parentId;
  childComment.value.content = "";
  store.allCommentList.map((el) => {
    if (el.id === parentId) {
      el.childComment = true;
    }
  });
};

const setUpdateComment = function (id) {
  store.nowCommentList.map((el) => {
    if (el.id === id) {
      updateComment.value = JSON.parse(JSON.stringify(el));
      el.editing = true;
    } else {
      el.editing = false;
    }
  });
};

const createComment = function () {
  store.createComment(comment.value);
  comment.value = {
    communityId: route.params.id,
    content: "",
    writer: sessionStorage.getItem("id")
      ? sessionStorage.getItem("id")
      : userStore.loginUser.id,
    parent: null,
  };
};

const createChildComment = function () {
  store.createComment(childComment.value);
};
</script>

<style scoped></style>
