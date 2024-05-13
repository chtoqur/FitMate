import { ref, computed } from "vue";
import { defineStore } from "pinia";
import { useRouter } from "vue-router";

export const useCommunityStore = defineStore("community", () => {
  const router = useRouter();

  const postList = ref([]);

  const nowPost = ref({});

  const createPost = function (post) {
    post.regDate = new Date().toLocaleString();
    postList.value.push(post);
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
    getPostById,
    updatePost,
    deletePost,
  };
});
