<template>
  <div>
    <div>
      <!-- 프로필 이미지 영역 -->
      <img
        :src="profilePictureUrl"
        alt="Profile Picture"
        @click="showModal = true"
        class="profile-picture"
      />
      <input
        type="file"
        ref="fileInput"
        @change="onFileChange"
        style="display: none"
      />

      <!-- 모달 -->
      <div v-if="showModal" class="modal">
        <div class="modal-content">
          <span class="close" @click="closeModal">&times;</span>
          <input type="file" @change="onFileChange" ref="fileInput" />
          <img v-if="previewImage" :src="previewImage" alt="Profile Preview" />
          <button @click="saveProfilePicture">Save</button>
          <button @click="closeModal">Cancel</button>
        </div>
      </div>
    </div>
    <div>
      <p>{{ userStore.loginUser.image }}</p>
      <p>{{ userStore.loginUser.id }}</p>
      <p>{{ userStore.loginUser.name }}</p>
      <p>{{ userStore.loginUser.nickname }}</p>
    </div>
    <br />
    <div>
      <p>나의 활동</p>
      <div>
        <p>좋아요한 영상</p>
        <RouterLink to="video/liked">더보기 -></RouterLink>
        <div style="display: flex">
          <div v-for="video in videoStore.nowList" :key="video.id">
            <RouterLink :to="`/video/${video.id}`">
              <img :src="video.thumbnail" />
            </RouterLink>
          </div>
        </div>
      </div>
      <div>
        <p>작성한 글</p>
        <div v-for="post in userStore.loginUser.myPost" :key="post.id">
          <RouterLink :to="`community/${post.id}`">
            <p>{{ post.title }}</p>
          </RouterLink>
        </div>
      </div>
      <div>
        <p>작성한 댓글</p>
        <div v-for="com in userStore.loginUser.myComment" :key="com.id">
          <RouterLink :to="`community/${com.communityId}`">
            <p>{{ com.content }}</p>
          </RouterLink>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useUserStore } from "@/stores/user";
import { useVideoStore } from "@/stores/video";
import { useCommunityStore } from "@/stores/community";
import { useCommentStore } from "@/stores/comment";
import { onMounted, ref, computed } from "vue";

const userStore = useUserStore();
const videoStore = useVideoStore();
const communityStore = useCommunityStore();
const commentStore = useCommentStore();

const selectedFile = ref(null);
const previewImage = ref(null);
const showModal = ref(false);

const onFileChange = (event) => {
  selectedFile.value = event.target.files[0];
  previewImage.value = URL.createObjectURL(selectedFile.value);
};

const saveProfilePicture = async () => {
  if (!selectedFile.value) {
    alert("No file selected");
    return;
  }

  // 업로드 로직 실행 후, 이미지 업데이트
  userStore.loginUser.image = previewImage.value;

  // 모달 닫기
  closeModal();
};

const closeModal = () => {
  showModal.value = false;
  // 선택된 파일과 프리뷰 초기화
  selectedFile.value = null;
  previewImage.value = null;
};

const profilePictureUrl = computed(() => {
  return userStore.loginUser.image ? userStore.loginUser.image : "";
});

const openFileSelector = () => {
  if (!fileInput.value) return;
  fileInput.value.click();
};

onMounted(() => {
  videoStore.nowList = [];
  videoStore.videoList.forEach((video) => {
    if (userStore.loginUser.likedVideos.includes(video.id)) {
      videoStore.nowList.push(video);
    }
  });

  userStore.loginUser.myPost = [];
  communityStore.postList.forEach((post) => {
    if (userStore.loginUser.id === post.writer) {
      userStore.loginUser.myPost.push(post);
    }
  });

  userStore.loginUser.myComment = [];
  commentStore.allCommentList.forEach((com) => {
    if (userStore.loginUser.id === com.writer) {
      userStore.loginUser.myComment.push(com);
    }
  });

  // fileInput.value = document.createElement("input");
  // fileInput.value.type = "file";
  // fileInput.value.style.display = "none";
  // document.body.appendChild(fileInput.value);
});
</script>

<style scoped>
.modal {
  display: block; /* Hidden by default */
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

img {
  max-width: 300px;
  height: auto;
}
</style>
