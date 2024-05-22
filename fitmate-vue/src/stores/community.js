import { ref, computed } from "vue";
import { defineStore } from "pinia";
import { useRouter } from "vue-router";
import axios from "axios";

const REST_COMMUNITY_API = "http://localhost:8080/community";

export const useCommunityStore = defineStore("community", () => {
  const router = useRouter();

  const postList = ref([]);

  const nowPost = ref({});

  const createPost = async (post) => {
    console.log(post);
    try {
      const response = await axios.post(REST_COMMUNITY_API, post);
      getPostList();
    } catch (err) {
      console.log(err);
    }
  };

  const getPostList = async () => {
    try {
      const response = await axios({
        url: REST_COMMUNITY_API,
        method: "GET",
      });
      postList.value = response.data;
      postList.value = postList.value.sort(
        (a, b) => new Date(b.regDate) - new Date(a.regDate)
      );
    } catch (err) {
      console.log(err);
    }
  };

  const searchPostList = async (searchCondition) => {
    searchCondition = JSON.parse(JSON.stringify(searchCondition));
    if (searchCondition.key === "제목") {
      searchCondition.key = "title";
    } else if (searchCondition.key === "작성자") {
      searchCondition.key = "writer";
    } else if (searchCondition.key === "글내용") {
      searchCondition.key = "content";
    }
    try {
      const response = await axios({
        url: REST_COMMUNITY_API,
        method: "GET",
        params: {
          key: searchCondition.key,
          word: searchCondition.word,
        },
      });
      postList.value = response.data;
    } catch (err) {
      console.log(err);
    }
  };

  const searchPostListByMe = async (searchCondition, userId) => {
    console.log(userId);
    searchCondition = JSON.parse(JSON.stringify(searchCondition));
    if (searchCondition.key === "전체") {
      searchCondition.key = "none";
    } else if (searchCondition.key === "제목") {
      searchCondition.key = "title";
    } else if (searchCondition.key === "작성자") {
      searchCondition.key = "writer";
    } else if (searchCondition.key === "글내용") {
      searchCondition.key = "content";
    }
    try {
      const response = await axios({
        url: `REST_COMMUNITY_API/${userId}`,
        method: "GET",
        params: {
          key: searchCondition.key,
          word: searchCondition.word,
        },
      });
      postList.value = response.data;
    } catch (err) {
      console.log(err);
    }
  };

  const getPostById = async (id, viewCnt) => {
    try {
      const response = await axios({
        url: `${REST_COMMUNITY_API}/${id}/${viewCnt}`,
        method: "GET",
        headers: {
          "access-token": sessionStorage.getItem("access-token"),
        },
      });
      nowPost.value = response.data;
    } catch (err) {
      console.log(err);
    }
  };

  const updatePost = async (id, post) => {
    try {
      const response = await axios.put(`${REST_COMMUNITY_API}/${id}`, post);
      getPostById(id);
    } catch (err) {
      console.log(err);
    }
  };

  const deletePost = async (id) => {
    if (confirm("정말 삭제하시겠습니까?")) {
      try {
        const response = await axios.delete(`${REST_COMMUNITY_API}/${id}`);
        await getPostList();
        router.push({ path: "community" });
      } catch (err) {
        console.log(err);
      }
    } else {
      return;
    }
  };

  return {
    postList,
    searchPostList,
    searchPostListByMe,
    nowPost,
    createPost,
    getPostList,
    getPostById,
    updatePost,
    deletePost,
  };
});
