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
    commentCnt: 3,
    category: "notice",
    file: [],
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
        title: "인터넷으로는 필요한 것만 사면 끝인데 마트에 가면 사게 되는 블라블라 긴 제목 테스트",
        content: "test",
        writer: "admin",
        regDate: new Date().toLocaleString(),
        likeCount: 1,
        viewCount: 10,
        commentCnt: 13,
        category: "notice",
        file: [],
      },
      {
        id: 2,
        title: "sm 사옥 주차비 이야기가 자꾸 나와서 정리해보는 글",
        content: "Test2",
        writer: "ssafy",
        regDate: new Date().toLocaleString(),
        likeCount: 1,
        viewCount: 10,
        commentCnt: 25,
        category: "free",
        file: [],
      },
      {
        id: 3,
        title: "현 시각 감귤국 재난문자 진짜 근황",
        content: "Test3",
        writer: "ssafy",
        regDate: new Date().toLocaleString(),
        likeCount: 12,
        viewCount: 100,
        commentCnt: 59,
        category: "free",
        file: [{title: "test"}],
      },
      {
        id: 4,
        title: "석가탄신일 절에서 주는 비빔밥.jpg",
        content: "Test4",
        writer: "ssafy",
        regDate: new Date().toLocaleString(),
        likeCount: 23,
        viewCount: 201,
        commentCnt: 82,
        category: "free",
        file: [{title: "test"}],
      },
      {
        id: 5,
        title: "예상 못하게 다른 걸로 인기 많아서 당황한 LG 생활건강",
        content: "Test5",
        writer: "ssafy",
        regDate: new Date().toLocaleString(),
        likeCount: 52,
        viewCount: 57,
        commentCnt: 210,
        category: "free",
        file: [],
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
