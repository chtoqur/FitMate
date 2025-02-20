<template>
  <div>
    <div class="video-title">
      <h4>
        트레이닝 가이드와 함께 <br />
        정확한 자세로 동작을 익혀보세요
      </h4>
    </div>
    <div class="video-select">
      <div class="video-part">
        <v-combobox
          multiple
          label="운동 부위를 선택하세요"
          :items="['어깨', '팔', '가슴', '복근', '등', '하체']"
          variant="solo"
          v-model="selectedParts"
          @update:modelValue="selectPart"
        ></v-combobox>
      </div>
      <div class="video-liked" v-if="userStore.loginUser.id !== ''">
        <span>좋아요한 영상</span>
      </div>
      <div class="love" v-if="userStore.loginUser.id !== ''">
        <input
          id="switch"
          type="checkbox"
          :checked="isChecked"
          @click="handleCheckboxClick"
        />
        <label class="love-heart" for="switch">
          <i class="left"></i>
          <i class="right"></i>
          <i class="bottom"></i>
          <div class="round"></div>
        </label>
      </div>
    </div>
    <div class="video-list">
      <div v-for="video in paginatedVideos" :key="video.id">
        <v-card class="mx-auto" max-width="360" height="300" hover>
          <v-card-item style="padding-bottom: 0">
            <RouterLink :to="`/video/${video.id}`" class="router-link">
              <v-img :src="video.thumbnail" style="width: 400px"> </v-img>
              <v-card-title class="vcard-title">
                {{ video.title }}
              </v-card-title>
              <v-card-subtitle>
                {{ video.channelName }} - 운동 부위 : {{ video.part }}
              </v-card-subtitle>
            </RouterLink>
          </v-card-item>
          <v-card-actions style="padding-top: 0">
            <v-spacer></v-spacer>
            <v-btn
              v-if="
                userStore.loginUser.id !== '' &&
                !userStore.loginUser.likedVideos.includes(video.id)
              "
              color="medium-emphasis"
              icon="mdi-heart"
              size="small"
              @click="userStore.likeVideo(video.id)"
            ></v-btn>
            <v-btn
              v-if="
                userStore.loginUser.id !== '' &&
                userStore.loginUser.likedVideos.includes(video.id)
              "
              color="red"
              icon="mdi-heart"
              size="small"
              @click="userStore.unlikeVideo(video.id)"
            ></v-btn>
            <v-btn
              color="medium-emphasis"
              icon="mdi-share-variant"
              size="small"
              @click="copyURL(video.youtubeVideoId)"
            ></v-btn>
          </v-card-actions>
        </v-card>
      </div>
    </div>
    <v-pagination
      show-first-last-page
      total-visible="6"
      ellipsis="..."
      :length="totalPages"
      prev
      next
      @update:model-value="changePage"
    ></v-pagination>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from "vue";
import { useRoute, useRouter } from "vue-router";
import { useVideoStore } from "@/stores/video";
import { useUserStore } from "@/stores/user";

const store = useVideoStore();
const route = useRoute();
const router = useRouter();
const userStore = useUserStore();

// 현재 페이지
const curPage = ref(1);

// 한 페이지당 비디오 수
const postsPerPage = 6;

// 전체 비디오 수 계산
const totalPages = computed(() =>
  Math.ceil(filteredVideos.value.length / postsPerPage)
);

// 시작 인덱스 계산
const startIndex = computed(() => (curPage.value - 1) * postsPerPage);

// 페이지네이션된 비디오 목록
const paginatedVideos = computed(() =>
  filteredVideos.value.slice(startIndex.value, startIndex.value + postsPerPage)
);

// 필터링된 비디오 목록
const filteredVideos = computed(() => {
  let videos = store.videoList;

  if (selectedParts.value.length > 0) {
    videos = videos.filter((video) => selectedParts.value.includes(video.part));
  }

  if (isChecked.value) {
    videos = videos.filter((video) =>
      userStore.loginUser.likedVideos.includes(video.id)
    );
  }

  return videos;
});

// 페이지 변경 함수
const changePage = (pageNumber) => {
  if (pageNumber > 0 && pageNumber <= totalPages.value) {
    curPage.value = pageNumber;
  }
};

onMounted(() => {
  store.getAllVideoList();
  store.getAllVideoReviewList();
  videoList.value = store.videoList;

  if (route.query.liked === "true") {
    isChecked.value = true;
    selectPart();
  }
});

const selectedParts = ref([]);
const isChecked = ref(false);
const videoList = ref([]);

const handleCheckboxClick = (event) => {
  if (userStore.loginUser.id === "") {
    event.preventDefault();
    if (confirm("이 기능은 회원만 사용할 수 있습니다.\n로그인 하시겠습니까?")) {
      router.push({ name: "login" });
    }
  } else {
    // 로그인 상태
    isChecked.value = event.target.checked;
    changePage(1);
    selectPart();
  }
};

const selectPart = () => {
  if (selectedParts.value.length === 0 && isChecked.value === false) {
    // 부위 미선택 && 찜목록 OFF
    videoList.value = store.videoList;
  } else if (selectedParts.value.length !== 0 && isChecked.value === false) {
    // 부위 선택 && 찜목록 OFF
    videoList.value = store.videoList.filter((el) =>
      selectedParts.value.includes(el.part)
    );
  } else if (selectedParts.value.length !== 0 && isChecked.value === true) {
    // 부위 선택 && 찜목록 ON
    videoList.value = store.videoList
      .filter((el) => userStore.loginUser.likedVideos.includes(el.id))
      .filter((el) => selectedParts.value.includes(el.part));
  } else {
    // 부위 미선택 && 찜목록 ON
    videoList.value = store.videoList.filter((el) =>
      userStore.loginUser.likedVideos.includes(el.id)
    );
  }
};

const copyURL = (videoId) => {
  navigator.clipboard.writeText(`https://www.youtube.com/watch?v=${videoId}`);
  alert("클립보드에 복사 완료!");
};
</script>

<style scoped>
.liked > .v-btn__content {
  color: red;
}

* {
  text-decoration: none;
}

ul {
  list-style-type: none;
}

.video-title {
  display: flex;
  height: 200px;
  width: 100%;
  align-items: center;
  justify-content: center;
  margin-top: 4rem;
  margin-bottom: 1rem;
  font-size: 40px;
  line-height: 60px;
  text-align: center;
}

.video-select {
  display: flex;
  width: 100%;
  height: 100px;
  justify-content: center;
  margin-bottom: 3rem;
}

.video-part {
  display: flex;
  width: 400px;
  margin-right: 50px;
}

.video-liked {
  display: flex;
  width: 140px;
  margin-top: 25px;
  color: rgb(155, 155, 155);
}

.love {
  margin-top: 2.3rem;
}

.video-list {
  display: flex;
  margin: 0 19%;
  justify-content: center;
  flex-wrap: wrap;
  gap: 2rem;
  margin-bottom: 50px;
}

.router-link {
  color: black;
}

.vcard-title {
  font-size: 18px;
  margin-top: 5px;
}

/* 찜 토글 버튼 */

.love-heart:before,
#switch {
  display: none;
}

.love-heart,
.love-heart::after {
  border-color: hsl(231deg 28% 86%);
  border: 1px solid;
  border-top-left-radius: 100px;
  border-top-right-radius: 100px;
  width: 10px;
  height: 8px;
  border-bottom: 0;
}

.round {
  position: absolute;
  z-index: 1;
  width: 8px;
  height: 8px;
  background: hsl(0deg 0% 100%);
  box-shadow: rgb(0 0 0 / 24%) 0px 0px 4px 0px;
  border-radius: 100%;
  left: 0px;
  bottom: -1px;
  transition: all 0.5s ease;
  animation: check-animation2 0.5s forwards;
}

input:checked + label .round {
  transform: translate(0px, 0px);
  animation: check-animation 0.5s forwards;
  background-color: hsl(0deg 0% 100%);
}

@keyframes check-animation {
  0% {
    transform: translate(0px, 0px);
  }

  50% {
    transform: translate(0px, 7px);
  }

  100% {
    transform: translate(7px, 7px);
  }
}

@keyframes check-animation2 {
  0% {
    transform: translate(7px, 7px);
  }

  50% {
    transform: translate(0px, 7px);
  }

  100% {
    transform: translate(0px, 0px);
  }
}

.love-heart {
  box-sizing: border-box;
  position: relative;
  transform: rotate(-45deg) translate(-50%, -33px) scale(4);
  display: block;
  border-color: hsl(231deg 28% 86%);
  cursor: pointer;
  top: 0;
}

input:checked + .love-heart,
input:checked + .love-heart::after,
input:checked + .love-heart .bottom {
  border-color: hsl(347deg 81% 61%);
  box-shadow: inset 6px -5px 0px 2px hsl(347deg 99% 72%);
}

.love-heart::after,
.love-heart .bottom {
  content: "";
  display: block;
  box-sizing: border-box;
  position: absolute;
  border-color: hsl(231deg 28% 86%);
}

.love-heart::after {
  right: -9px;
  transform: rotate(90deg);
  top: 7px;
}

.love-heart .bottom {
  width: 11px;
  height: 11px;
  border-left: 1px solid;
  border-bottom: 1px solid;
  border-color: hsl(231deg 28% 86%);
  left: -1px;
  top: 5px;
  border-radius: 0px 0px 0px 5px;
}
</style>
