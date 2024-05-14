import { ref, computed } from "vue";
import { defineStore } from "pinia";
import { useRouter } from "vue-router";

export const useCommunityStore = defineStore("community", () => {
  const router = useRouter();

  const postList = ref([]);

  const nowPost = ref({
    id: 1,
    title: "test",
    content: "test",
    writer: "admin",
    regDate: new Date().toLocaleString(),
    likeCount: 1,
    viewCount: 10,
    category: "notice",
    commentCnt: 3,
  });

  const createPost = function (post) {
    post.regDate = new Date().toLocaleString();
    postList.value.push(post);
  };

  const getPostList = function () {
    // axios~ 해서 postList 가져오기
    postList.value = [
      {
        id: 1,
        title: "test",
        content: "test",
        writer: "admin",
        regDate: new Date().toLocaleString(),
        likeCount: 1,
        viewCount: 10,
        category: "notice",
        commentCnt: 3,
      },
      {
        id: 2,
        title: "게시판 테스트입니다",
        content: "Test2",
        writer: "ssafy",
        regDate: new Date().toLocaleString(),
        likeCount: 1,
        viewCount: 10,
        category: "free",
        commentCnt: 5,
      },
    ];
  };

  const getPostById = function (id) {
    postList.value.map((el) => {
      if (el.id === id) {
        nowPost.value = el;
      }
    });
  };

  const updatePost = function (post) {
    postList.value.map((el) => {
      if (el.id === post.id) {
        el = post;
      }
    });
  };

  const deletePost = function (id) {
    const idx = postList.value.findIndex((post) => post.id === id);
    if (idx !== -1) {
      postList.value.splice(idx, 1);
    }
  };

  return {
    postList,
    nowPost,
    createPost,
    getPostList,
    getPostById,
    updatePost,
    deletePost,
  };
});
