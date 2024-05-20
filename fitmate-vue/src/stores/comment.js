import { ref, computed } from "vue";
import { defineStore } from "pinia";
import { useRouter } from "vue-router";
import axios from "axios";

const REST_COMMENT_API = "http://localhost:8080/community/comment";

export const useCommentStore = defineStore("comment", () => {
  const router = useRouter();

  const allCommentList = ref([]);

  const nowCommentList = ref([]);

  const getAllCommentList = async () => {
    try {
      const response = await axios({
        url: REST_COMMENT_API,
        method: "GET",
      });
      allCommentList.value = response.data;
      allCommentList.value.forEach((comment) => {
        comment.editing = false;
        comment.childComment = false;
      });
    } catch (err) {
      console.log(err);
    }
  };

  const createComment = async (comment) => {
    try {
      const response = await axios.post(REST_COMMENT_API, comment);
      getNowCommentList(comment.communityId);
    } catch (err) {
      console.log(err);
    }
  };

  const getNowCommentList = async (postId) => {
    try {
      const response = await axios({
        url: `${REST_COMMENT_API}/${postId}`,
        method: "GET",
      });
      nowCommentList.value = response.data;
      nowCommentList.value.forEach((comment) => {
        comment.editing = false;
        comment.childComment = false;
      });
    } catch (err) {
      console.log(err);
    }
  };

  const updateComment = async (id, comment) => {
    try {
      const response = await axios.put(`${REST_COMMENT_API}/${id}`, comment);
      getNowCommentList(comment.communityId);
    } catch (err) {
      console.log(err);
    }
  };

  const deleteComment = async (id, communityId) => {
    if (confirm("정말 삭제하시겠습니까?")) {
      try {
        const response = await axios.delete(`${REST_COMMENT_API}/${id}`);
        getNowCommentList(communityId);
      } catch (err) {
        console.log(err);
      }
    } else {
      return;
    }
  };

  return {
    allCommentList,
    nowCommentList,
    getAllCommentList,
    createComment,
    getNowCommentList,
    updateComment,
    deleteComment,
  };
});
