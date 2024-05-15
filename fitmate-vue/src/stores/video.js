import { ref, computed } from "vue";
import { defineStore } from "pinia";

export const useVideoStore = defineStore("video", () => {
  let reviewId = 1;
  const videoList = ref([
    {
      id: 1,
      title: "전신 다이어트 최고의 운동 [칼소폭 찐 핵핵매운맛]",
      part: "전신",
      url: "https://www.youtube.com/embed/gMaB-fG4u4g",
      thumbnail:
        "https://i.ytimg.com/vi/gMaB-fG4u4g/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLBCYL_b5RWp6EGD3vhWaugQqB-opA",
    },
    {
      id: 2,
      title: "하루 15분! 전신 칼로리 불태우는 다이어트 운동",
      part: "전신",
      url: "https://www.youtube.com/embed/swRNeYw1JkY",
      thumbnail:
        "https://i.ytimg.com/vi/swRNeYw1JkY/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLBdCntJRy-V96l8tfZNHv6f2BoE-w",
    },
    {
      id: 3,
      title:
        "상체 다이어트 최고의 운동 BEST [팔뚝살/겨드랑이살/등살/가슴어깨라인]",
      part: "상체",
      url: "https://www.youtube.com/embed/54tTYO-vU2E",
      thumbnail:
        "https://i.ytimg.com/vi/54tTYO-vU2E/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLDxWlfWshc8D0IBhLDgV_oy_9u31A",
    },
    {
      id: 4,
      title: "상체비만 다이어트 최고의 운동 [상체 핵매운맛]",
      part: "상체",
      url: "https://www.youtube.com/embed/QqqZH3j_vH0",
      thumbnail:
        "https://i.ytimg.com/vi/QqqZH3j_vH0/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLAHjpKpEBo2dH3F0U5ob8sSagiioQ",
    },
    {
      id: 5,
      title: "하체운동이 중요한 이유? 이것만 보고 따라하자 ! [하체운동 교과서]",
      part: "하체",
      url: "https://www.youtube.com/embed/tzN6ypk6Sps",
      thumbnail:
        "https://i.ytimg.com/vi/tzN6ypk6Sps/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLAAxHIjOn8ti0G7vnAhfOIu_s27tQ",
    },
    {
      id: 6,
      title: "저는 하체 식주의자 입니다",
      part: "하체",
      url: "https://www.youtube.com/embed/u5OgcZdNbMo",
      thumbnail:
        "https://i.ytimg.com/vi/u5OgcZdNbMo/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLAaopAKEGym2ylTOaiJBfajdXHjlA",
    },
    {
      id: 7,
      title: "11자복근 복부 최고의 운동 [복근 핵매운맛]",
      part: "복부",
      url: "https://www.youtube.com/embed/PjGcOP-TQPE",
      thumbnail:
        "https://i.ytimg.com/vi/u5OgcZdNbMo/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLAaopAKEGym2ylTOaiJBfajdXHjlA",
    },
    {
      id: 8,
      title: "(Sub)누워서하는 5분 복부운동!! 효과보장! (매일 2주만 해보세요!)",
      part: "복부",
      url: "https://www.youtube.com/embed/7TLk7pscICk",
      thumbnail:
        "https://i.ytimg.com/vi/7TLk7pscICk/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLCSzdQy_ZUn3NE2zk6_gtu61aShgg",
    },
  ]);

  const video = ref({});

  const getVideo = function (id) {
    videoList.value.map((el) => {
      if (el.id == id) {
        video.value = el;
      }
    });
  };

  const videoAllReviewList = ref([
    {
      id: reviewId++,
      videoId: 1,
      userId: "ssafy",
      content: "2개월 후기 10kg 빠졌어요",
      regDate: new Date().toLocaleString(),
    },
    {
      id: reviewId++,
      videoId: 1,
      userId: "ssafy",
      content: "힘들어요",
      regDate: new Date().toLocaleString(),
    },
    {
      id: reviewId++,
      videoId: 2,
      userId: "ssafy",
      content:
        "헐, 이렇게 힘들어도 운동하고 싶어요. 이 영상 보면서 뭔가 엄청난 자극을 받는 느낌이에요.",
      regDate: new Date().toLocaleString(),
    },
    {
      id: reviewId++,
      videoId: 2,
      userId: "ssafy",
      content: "와, 이 운동 영상 너무 좋아요. ",
      regDate: new Date().toLocaleString(),
    },
    {
      id: reviewId++,
      videoId: 3,
      userId: "ssafy",
      content: "운동은 스트레스를 해소시켜줘요. ",
      regDate: new Date().toLocaleString(),
    },
    {
      id: reviewId++,
      videoId: 3,
      userId: "ssafy",
      content: "운동을 통해 에너지가 생겨요. .",
      regDate: new Date().toLocaleString(),
    },
    {
      id: reviewId++,
      videoId: 4,
      userId: "ssafy",
      content: "와... 이 영상 보면서 나도 모르게 다리가 아파요. ",
      regDate: new Date().toLocaleString(),
    },
    {
      id: reviewId++,
      videoId: 4,
      userId: "ssafy",
      content:
        "운동을 통해 몸매도 예쁘게 만들 수 있어요. 운동하다가 좀 느슨해지면 이 영상을 보면 다시 힘을 얻을 것 같아요. ",
      regDate: new Date().toLocaleString(),
    },
    {
      id: reviewId++,
      videoId: 5,
      userId: "ssafy",
      content: "운동은 건강한 생활의 시작이에요.",
      regDate: new Date().toLocaleString(),
    },
    {
      id: reviewId++,
      videoId: 5,
      userId: "ssafy",
      content: "앗! 저기, 너무 힘들어보여요",
      regDate: new Date().toLocaleString(),
    },
  ]);

  const videoReviewList = ref([]);

  const createReview = function (review, video, user) {
    videoReviewList.value.push({
      id: reviewId,
      videoId: video,
      userId: user,
      content: review,
      regDate: new Date().toLocaleString(),
    });

    videoAllReviewList.value.push({
      id: reviewId++,
      videoId: video,
      userId: user,
      content: review,
      regDate: new Date().toLocaleString(),
    });
  };

  const getReviewList = function (videoId) {
    videoReviewList.value = [];
    videoAllReviewList.value.map((review) => {
      if (review.videoId == videoId) {
        videoReviewList.value.push(review);
      }
    });
  };

  const updateReview = function (review) {
    videoAllReviewList.value.map((el) => {
      if (el.id === review.id) {
        el = review;
      }
    });
  };

  const deleteReview = function (id, videoId) {
    const idx = videoAllReviewList.value.findIndex(
      (review) => review.id === id
    );

    if (idx !== -1) {
      videoAllReviewList.value.splice(idx, 1);
    }

    getReviewList(videoId);
  };

  return {
    videoList,
    video,
    getVideo,
    videoAllReviewList,
    videoReviewList,
    createReview,
    getReviewList,
    updateReview,
    deleteReview,
  };
});
