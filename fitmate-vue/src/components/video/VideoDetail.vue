<template>
  <div id="container">
    <v-card style="margin: 0" elevation="16" width="100%" height="60vh">
      <div id="card-container">
        <div id="detail-left">
          <div id="detail-iframe">
            <iframe
              width="100%"
              :src="`https://www.youtube.com/embed/${store.video.youtubeVideoId}`"
              title="YouTube video player"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              referrerpolicy="strict-origin-when-cross-origin"
              allowfullscreen
            ></iframe>
          </div>
          <div>
            <!-- 영상 정보-->
            <div id="detail-info">
              <div id="video-info">
                <span id="video-title">{{ store.video.title }}</span>
                <span>{{ store.video.channelName }}</span>
              </div>
              <!-- 좋아요 -->
              <div id="like-btn">
                <button
                  :class="{ liked: isLiked }"
                  @click="toggleLike"
                  class="button-like"
                >
                  <span class="mdi mdi-heart" style="margin-left: 0"
                    >&nbsp;Like</span
                  >
                </button>
              </div>
            </div>
          </div>
        </div>
        <!-- 우측 댓글 창 -->
        <div id="detail-right">
          <!-- 댓글 리스트 -->
          <div class="register-box input-group">
            <div class="register-comment">
              <span class="mdi mdi-message-processing-outline">&nbsp;댓글</span>
              <textarea
                class="register-textarea"
                placeholder="내용을 입력하세요."
                rows="3"
                aria-label="With textarea"
                v-model="review.content"
              ></textarea>
              <div class="register-btn">
                <v-btn variant="tonal" size="small" @click="createReview()">
                  등록
                </v-btn>
              </div>
            </div>
          </div>
          <div class="comment-list-container">
            <div id="comment-list">
              <span
                >영상 댓글
                <span class="comment-count">{{
                  store.videoReviewList.length
                }}</span>
              </span>
            </div>
            <hr />
            <div>
              <VideoReview
                v-for="review in store.videoReviewList"
                :key="review.id"
                :review="review"
              />
            </div>
          </div>
        </div>
      </div>
    </v-card>
  </div>
</template>

<script setup>
import { useRoute } from "vue-router";
import { onMounted, ref } from "vue";
import { useVideoStore } from "@/stores/video";
import { useUserStore } from "@/stores/user";
import VideoReview from "./VideoReview.vue";

const store = useVideoStore();
const userStore = useUserStore();
const route = useRoute();

const review = ref({
  videoId: route.params.id,
  writer: sessionStorage.getItem("id")
    ? sessionStorage.getItem("id")
    : userStore.loginUser.id,
  content: "",
});
const isLiked = ref(false);

onMounted(() => {
  store.getVideo(route.params.id);
  store.getReviewList(route.params.id);
});

const createReview = function () {
  store.createReview(review.value);
  review.value.content = "";
};

const toggleLike = () => {
  isLiked.value = !isLiked.value;
};
</script>

<style scoped>
#container {
  display: flex;
  margin: 0 19%;
  margin-top: 5rem;
  height: 100%;
}

#card-container {
  display: flex;
  width: 100%;
  height: 100%;
  padding: 2rem;
}

#vcard {
  display: flex;
}

#detail-left {
  width: 65%;
}

#detail-iframe {
  display: flex;
  width: 100%;
  height: 80%;
  margin-bottom: 1.5rem;
}

#detail-info {
  display: flex;
  width: 100%;
  height: 100%;
}

#video-info {
  width: 81%;
  margin-right: auto;
}

#video-title {
  display: block;
  font-size: 19px;
  font-weight: 600;
  margin-bottom: 10px;
  line-height: 23px;
}

#like-btn {
  display: flex;
  width: auto;
  height: 55px;
}

#detail-right {
  width: 32%;
  margin-left: auto;
}

.register-box {
  width: 100%;
  border: 1px solid red;
}

.register-comment {
  width: 100%;
  border: 1px solid #898989;
  border-radius: 10px;
  padding: 20px;
  margin-bottom: 10px;
}

.register-textarea:focus {
  border: 1px solid red;
}

.register-comment > span {
  font-size: 15px;
}

.register-comment > textarea {
  border: none;
  resize: none;
  margin-top: 10px;
  margin-bottom: 10px;
  width: 100%;
}

.count-comment-letters {
  display: flex;
  width: 100%;
  justify-content: right;
  font-size: 13px;
}

.register-btn {
  display: flex;
  width: 100%;
  justify-content: right;
}

#comment-list {
  font-size: 19px;
  font-weight: 600;
}

.comment-list-container {
}

hr {
  margin: 8px 0;
}

.comment-count {
  color: #e84545;
  margin-left: 4px;
}

/* 좋아요 버튼 */

.button-like {
  border: 2px solid #8a8a8a;
  background-color: transparent;
  text-decoration: none;
  padding: 1rem;
  position: relative;
  vertical-align: middle;
  text-align: center;
  display: inline-block;
  border-radius: 3rem;
  color: #8a8a8a;
  transition: all ease 0.4s;
}

.button-like span {
  margin-left: 0.5rem;
}

.button-like .fa,
.button-like span {
  transition: all ease 0.4s;
}

.button-like:focus {
  background-color: transparent;
}

.button-like:focus .fa,
.button-like:focus span {
  color: #8a8a8a;
}

.button-like:hover {
  border-color: #cc4b37;
  background-color: transparent;
}

.button-like:hover .fa,
.button-like:hover span {
  color: #cc4b37;
}

.liked {
  background-color: #cc4b37;
  border-color: #cc4b37;
}

.liked .fa,
.liked span {
  color: #fefefe;
}

.liked:focus {
  background-color: #cc4b37;
}

.liked:focus .fa,
.liked:focus span {
  color: #fefefe;
}

.liked:hover {
  background-color: #cc4b37;
  border-color: #cc4b37;
}

.liked:hover .fa,
.liked:hover span {
  color: #fefefe;
}
</style>
