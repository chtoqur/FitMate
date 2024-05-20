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

  const createReview = function (review, video, user) {
    videoReviewList.value.push({
      id: reviewId,
      videoId: video,
      writer: user,
      content: review,
      regDate: new Date().toLocaleString(),
    });

    videoAllReviewList.value.push({
      id: reviewId++,
      videoId: video,
      writer: user,
      content: review,
      regDate: new Date().toLocaleString(),
    });
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
    try {
      const response = await axios({
        url: `${REST_VIDEO_REVIEW_API}/${id}`,
        method: "PUT",
        data: review,
      });
      getReviewList(review.videoId);
    } catch (err) {
      console.log(err);
    }
  };

  const deleteReview = async (id, videoId) => {
    try {
      const response = await axios({
        url: `${REST_VIDEO_REVIEW_API}/${videoId}`,
        method: "DELETE",
      });
      getReviewList(videoId);
    } catch (err) {
      console.log(err);
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
