import { ref, computed } from "vue";
import { defineStore } from "pinia";
import axios from "axios";

const REST_VIDEO_API = "http://localhost:8080/video";
const REST_VIDEO_REVIEW_API = "http://localhost:8080/video/comment";

export const useVideoStore = defineStore("video", () => {
  let reviewId = 1;
  const videoList = ref([]);

  const video = ref({});

  const nowList = ref([]);
  

  const getAllVideoList = async () => {
    try {
      const response = await axios({
        url: REST_VIDEO_API,
        method: "GET",
      });
      videoList.value = response.data;
    } catch (err) {
      console.log(err);
    }
  };

  const getVideo = async (id) => {
    try {
      const response = await axios({
        url: `${REST_VIDEO_API}/${id}`,
        method: "GET",
      });
      video.value = response.data;
    } catch (err) {
      console.log(err);
    }
  };

  const videoAllReviewList = ref([
    // editing은 프론트쪽에서만 관리
  ]);

  const videoReviewList = ref([]);

  const createReview = async (review) => {
    console.log(review);
    try {
      const response = await axios.post(REST_VIDEO_REVIEW_API, review);
      getReviewList(review.videoId);
    } catch (err) {
      console.log(err);
    }
  };

  const getAllVideoReviewList = async () => {
    try {
      const response = await axios({
        url: REST_VIDEO_REVIEW_API,
        method: "GET",
      });
      videoAllReviewList.value = response.data;
      videoAllReviewList.value.forEach((review) => {
        review.editing = false;
      });
    } catch (err) {
      console.log(err);
    }
  };

  const getReviewList = async (videoId) => {
    try {
      const response = await axios({
        url: `${REST_VIDEO_REVIEW_API}/${videoId}`,
        method: "GET",
      });
      videoReviewList.value = response.data;
      videoReviewList.value.forEach((review) => {
        review.editing = false;
      });
    } catch (err) {
      console.log(err);
    }
  };

  const updateReview = async (id, review) => {
    console.log(id);
    console.log(review);
    try {
      const response = await axios.put(
        `${REST_VIDEO_REVIEW_API}/${id}`,
        review
      );
      getReviewList(review.videoId);
    } catch (err) {
      console.log(err);
    }
  };

  const deleteReview = async (id, videoId) => {
    if (confirm("댓글을 삭제하시겠습니까?")) {
      try {
        const response = await axios({
          url: `${REST_VIDEO_REVIEW_API}/${id}`,
          method: "DELETE",
        });
        getReviewList(videoId);
      } catch (err) {
        console.log(err);
      }
    } else {
      return;
    }
  };

  return {
    videoList,
    video,
    nowList,
    getAllVideoList,
    getVideo,
    videoAllReviewList,
    videoReviewList,
    createReview,
    getAllVideoReviewList,
    getReviewList,
    updateReview,
    deleteReview,
  };
});
