<template>
  <div class="mypage">
    <v-card elevation="10" class="pa-16">
      <!-- 프로필 영역 -->
      <div class="user-info">
        <!-- 사진 -->
        <div class="img-section">
          <img
            :src="`http://localhost:8080${profilePictureUrl}`"
            alt="프로필사진"
            @click="showModal = true"
            class="user-picture"
          />
          <input
            type="file"
            ref="fileInput"
            @change="onFileChange"
            style="display: none"
          />
          <div v-if="showModal" class="modal">
            <div class="modal-content">
              <span class="close" @click="closeModal">&times;</span>
              <input type="file" @change="onFileChange" ref="fileInput" />
              <img
                v-if="previewImage"
                :src="previewImage"
                alt="Profile Preview"
              />
              <button @click="saveProfilePicture">저장</button>
              <button @click="closeModal">취소</button>
            </div>
          </div>
        </div>
        <!-- 프로필 우측 -->
        <div>
          <div class="mypage-msg">
            <span>{{ userStore.loginUser.nickname }}님, 반가워요!</span>
          </div>
          <div class="change-user-info">
            <v-btn
              prepend-icon="mdi-account-details"
              variant="outlined"
              size="small"
              @click="navigateToChangeInfo"
              class="change-info"
            >
              내 정보 수정
            </v-btn>
            <v-btn
              prepend-icon="mdi-lock"
              variant="outlined"
              size="small"
              @click="navigateToChangePwd"
              class="change-pwd"
            >
              비밀번호 변경
            </v-btn>
          </div>
        </div>
      </div>
      <!--  -->
      <div class="mylog">
        <div class="mylog-title">
          <span>나의 활동</span>
          <!-- <span class="mdi mdi-chevron-up"></span> -->
        </div>
        <div class="mylog-video">
          <div class="video-menu">
            <span class="menu-liked">좋아요한 영상</span>
            <v-btn rounded="xl" size="small" @click="navigateToLikeVideo"
              >모두 보기</v-btn
            >
          </div>
          <!-- 비디오 나열 -->
          <div class="video-list">
            <!-- 비디오 -->
            <div v-for="video in videoStore.nowList" :key="video.id">
              <RouterLink :to="`/video/${video.id}`">
                <img :src="video.thumbnail" />
              </RouterLink>
              <div class="video-title">
                <!-- 제목 -->
                <div class="title-box">
                  <div class="v-title">
                    <span>{{ video.title }}</span>
                  </div>
                  <div class="v-channel">
                    <span>{{ video.channelName }}</span>
                  </div>
                </div>
                <div class="video-tooltip">
                  <!-- 삭제 -->
                  <v-btn
                    icon="mdi-delete"
                    size="x-small"
                    @click="unlikeMyVideo(video.id)"
                  ></v-btn>
                </div>
              </div>
              <div>
                <!-- 채널이름 -->
              </div>
            </div>
          </div>
        </div>
        <div class="mylog-post">
          <div class="post-menu">
            <span class="menu-liked">작성한 글</span>
            <v-btn rounded="xl" size="small" @click="navigateToLikeVideo"
              >모두 보기</v-btn
            >
          </div>
          <!-- 비디오 나열 -->
          <div class="video-list">
            <!-- 비디오 -->
            <ol>
              <li
                v-for="(post, index) in userStore.loginUser.myRecentPost"
                :key="index"
                class="post-li"
              >
                <RouterLink :to="`community/${post.id}`"
                class="post-link">
                  <div class="wrap-info">
                    <span class="post-idx">{{ index + 1 }}</span>
                    <div class="wrap-title">
                      <span class="post-title">{{ post.title }}</span>
                    </div>
                  </div>
                  <div class="wrap-cmt">
                    <span>
                      댓글
                      <span class="post-cmt-cnt">
                        {{ post.commentCnt }}
                      </span>
                    </span>
                  </div>
                </RouterLink>
              </li>
            </ol>
          </div>
        </div>
      </div>
    </v-card>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user";
import { useVideoStore } from "@/stores/video";
import { useCommunityStore } from "@/stores/community";
import { useCommentStore } from "@/stores/comment";
import { onBeforeMount, ref, computed } from "vue";
import { useRouter } from "vue-router";
import axios from "axios";

const userStore = useUserStore();
const videoStore = useVideoStore();
const communityStore = useCommunityStore();
const commentStore = useCommentStore();
const router = useRouter();

const selectedFile = ref(null);
const previewImage = ref(null);
const showModal = ref(false);

const unlikeMyVideo = (videoId) => {
  if (confirm("좋아요한 영상 목록에서 삭제하시겠습니까?")) {
    userStore.unlikeVideo(videoId);
    videoStore.nowList = [];
    videoStore.videoList.forEach((video) => {
      if (userStore.loginUser.likedVideos.includes(video.id)) {
        videoStore.nowList.push(video);
      }
    });
  }
};

const navigateToChangeInfo = () => {
  setTimeout(() => {
    router.push({ name: "changeMyInfo" });
  }, 260);
};

const navigateToChangePwd = () => {
  setTimeout(() => {
    router.push({ name: "changePwd" });
  }, 260);
};

const navigateToLikeVideo = () => {
  setTimeout(() => {
    router.push({ path: "video", query: { liked: true } });
  }, 260);
};

const onFileChange = (event) => {
  selectedFile.value = event.target.files[0];
  previewImage.value = URL.createObjectURL(selectedFile.value);
};

const saveProfilePicture = async () => {
  if (!selectedFile.value) {
    alert("파일이 선택되지 않았습니다.");
    return;
  }

  try {
    const formData = new FormData();
    formData.append("file", selectedFile.value);
    formData.append("userId", userStore.loginUser.id);

    const response = await axios.post(
      "http://localhost:8080/user/image",
      formData,
      {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      }
    );

    if (response.data.message === "success") {
      // 프로필 이미지 경로 업데이트
      userStore.loginUser.image = response.data.imageUrl;
      closeModal();
    } else {
      alert("프로필 이미지 업로드에 실패했습니다.");
    }
  } catch (error) {
    console.log(error);
    alert("프로필 이미지 업로드에 실패했습니다.");
  }
};

const closeModal = () => {
  showModal.value = false;
  selectedFile.value = null;
  previewImage.value = null;
};

const profilePictureUrl = computed(() => {
  return userStore.loginUser.image ? userStore.loginUser.image : "";
});

// const openFileSelector = () => {
//   if (!fileInput.value) return;
//   fileInput.value.click();
// };

onBeforeMount(async () => {
  await videoStore.getAllVideoList();
  await communityStore.getPostList();
  await commentStore.getAllCommentList();
  videoStore.nowList = [];
  videoStore.videoList.forEach((video) => {
    if (userStore.loginUser.likedVideos.includes(video.id)) {
      videoStore.nowList.push(video);
    }
  });
  // 1. 사용자의 게시글을 모아 myPost 배열에 저장
  userStore.loginUser.myPost = [];
  communityStore.postList.forEach((post) => {
    if (userStore.loginUser.id === post.writer) {
      userStore.loginUser.myPost.push(post);
    }
    // 2. myPost 배열의 길이가 6개 이상인지 확인
    if (userStore.loginUser.myPost.length >= 6) {
      // 3. myPost 배열을 post.regDate 기준으로 내림차순 정렬
      userStore.loginUser.myPost.sort(
        (a, b) => new Date(b.regDate) - new Date(a.regDate)
      );
      // 4. 최신 5개 게시글을 myRecentPost에 저장
      userStore.loginUser.myRecentPost = userStore.loginUser.myPost.slice(0, 5);
    } else {
      // myPost 배열의 길이가 6개 미만일 경우, myRecentPost에 빈 배열 저장
      userStore.loginUser.myRecentPost = userStore.loginUser.myPost;
    }
  });
});
</script>

<style scoped>
.mypage {
  margin: 0 30%;
  padding: 50px 0;
}

.user-info {
  display: flex;
  align-items: center;
}

.img-section {
  margin-right: 40px;
}

.user-picture {
  width: 200px;
  border-radius: 100px;
}

.modal {
  display: block;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgb(0, 0, 0);
  background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
  position: relative;
  margin: auto;
  padding: 0;
  width: 80%;
  max-width: 700px;
}

.close {
  color: white;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.mypage-msg {
  font-size: 22px;
  font-weight: 600;
  margin-bottom: 20px;
}

.change-user-info {
  line-height: 20px;
}

.change-info {
  margin-right: 5px;
}
.change-info,
.change-pwd {
  text-decoration: none;
  color: black;
}

.mylog {
  margin-top: 30px;
}

.mylog-title {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 30px;
}

.mylog-video,
.mylog-post {
  border: 2px solid rgb(218, 217, 217);
  border-radius: 10px;
  padding: 20px;
  margin-bottom: 30px;
}

.video-menu,
.post-menu {
  display: flex;
  justify-content: flex-end;
  align-items: center;
}

.menu-liked {
  font-size: 16px;
  font-weight: bold;
  margin-right: auto;
}

.video-list {
  display: flex;
  margin-top: 15px;
  overflow: auto;
  overflow-y: hidden;
  width: 100%;
}

.video-list img {
  max-width: 300px;
  height: auto;
  border-radius: 10px;
  margin-right: 10px;
  margin-bottom: 5px;
}

.video-title {
  display: flex;
  margin-right: 10px;
  margin-bottom: 10px;
  line-height: 20px;
}

.title-box {
  margin-right: 5px;
}

.v-title {
  font-size: 14px;
  font-weight: bold;
}

.v-channel {
  font-size: 12px;
}

.video-tooltip {
  display: flex;
  margin-left: auto;
}

.post-li {
  display: flex;
  width: 100%;
  border-bottom: 1px solid rgb(206, 205, 205);
}

.post-li:hover {
  background-color: rgb(236, 236, 236);
}

.post-link {
  display: flex;
  height: 50px;
  width: 580px;
  justify-content: space-between;
  align-items: center;
  color: black;
  text-decoration: none;
}

.wrap-info {
  display: flex;
  width: 80%;
}

.post-idx {
  display: flex;
  justify-content: center;
  align-items: center;
  font-weight: bold;
  width: 45px;
}

.wrap-title {
  display: flex;
}

.post-title {
  line-height: 18px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  height: 1.1em;
  -webkit-box-orient: vertical;
  white-space: initial;
}

.wrap-cmt {
  display: flex;
  justify-content: end;
  font-size: 12px;
  margin-left: 4px;
  margin-right: 10px;
}

.post-cmt-cnt {
  color: red;
  font-weight: bold;
}
 
</style>
