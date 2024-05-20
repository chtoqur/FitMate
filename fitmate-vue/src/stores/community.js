import { ref, computed } from "vue";
import { defineStore } from "pinia";
import { useRouter } from "vue-router";
import axios from "axios";

const REST_COMMUNITY_API = "http://localhost:8080/community";

export const useCommunityStore = defineStore("community", () => {
  const router = useRouter();

  const postList = ref([]);

  const nowPost = ref({});

  const createPost = function (post) {
    post.regDate = new Date().toLocaleString();
    postList.value.push(post);
  };

  const getPostList = async () => {
    try {
      const response = await axios({
        url: REST_COMMUNITY_API,
        method: "GET",
      });
      postList.value = response.data;
    } catch (err) {
      console.log(err);
    }
  };

  const getPostById = async (id) => {
    try {
      const response = await axios({
        url: `${REST_COMMUNITY_API}/${id}`,
        method: "GET",
      });
      nowPost.value = response.data;
    } catch (err) {
      console.log(err);
    }
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
