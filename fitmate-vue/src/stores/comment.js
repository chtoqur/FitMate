import { ref, computed } from "vue";
import { defineStore } from "pinia";
import { useRouter } from "vue-router";

export const useCommentStore = defineStore("comment", () => {
  const router = useRouter();
  let commentId = 1;

  // 사실 전체 댓글을 안 가져오고 db측에서 게시글 아이디를 받아서 리턴해서 받아오는게 이상적일듯?
  const allCommentList = ref([
    {
      id: commentId++,
      communityId: 1,
      content: "id 1",
      writer: "ssafy",
      regDate: new Date().toLocaleString(),
      parent: null,
      editing: false,
      // editing은 db에 저장하지 않고 js 측에서 받아오면서 추가해야할덧
    },
    {
      id: commentId++,
      communityId: 1,
      content: "id 2",
      writer: "ssafy",
      regDate: new Date().toLocaleString(),
      parent: null,
      editing: false,
    },
    {
      id: commentId++,
      communityId: 1,
      content: "id 1의 답글",
      writer: "ssafy",
      regDate: new Date().toLocaleString(),
      parent: 1,
      editing: false,
    },
  ]);

  const nowCommentList = ref([]);

  const createComment = function (comment) {
    comment.id = commentId++;
    comment.regDate = new Date().toLocaleString();
    allCommentList.value.push(comment);
    nowCommentList.value.push(comment);
  };

  const getNowCommentList = function (postId) {
    nowCommentList.value = [];
    allCommentList.value.map((com) => {
      if (com.communityId == postId) {
        nowCommentList.value.push(com);
      }
    });
  };

  const updateComment = function (id, content) {
    allCommentList.value.map((el) => {
      if (el.id === id) {
        el.content = content;
      }
    });

    // //getNowCommentList와 비슷..
    // nowCommentList.value.map((el) => {
    //   if (el.id === comment.id) {
    //     el = comment;
    //   }
    // });
  };

  const deleteComment = function (id) {
    const idx = allCommentList.value.findIndex((com) => com.id === id);
    if (idx !== -1) {
      allCommentList.value.splice(idx, 1);
    }

    const idx2 = nowCommentList.value.findIndex((com) => com.id === id);
    if (idx2 !== -1) {
      nowCommentList.value.splice(idx, 1);
    }
  };

  return {
    allCommentList,
    nowCommentList,
    createComment,
    getNowCommentList,
    updateComment,
    deleteComment,
  };
});
