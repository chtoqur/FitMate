<template>
  <div class="community-container">
    <div>
      <h3>CommunityList 화면</h3>
    </div>
    <div>
      <div class="community-tool">
        <div class="tool-left">
          <div class="search-condition">
            <v-combobox
              :items="['전체', '제목', '작성자', '글내용']"
              v-model="searchCondition.key"
              variant="solo"
              density="compact"
              class="search-con-box"
              placeholder="검색 기준"
            ></v-combobox>
          </div>
          <div class="search-input">
            <v-text-field
              label=""
              density="compact"
              v-model="searchCondition.word"
              @keyup.enter="search()"
            >
            </v-text-field>
          </div>
          <v-btn
            class="search-btn"
            size="32px"
            icon="mdi-magnify"
            color="rgb(235, 235, 235)"
            @click="search()"
          ></v-btn>
        </div>
        <div class="write-btn">
          <v-btn class="ma-2" @click="router.push('/writePost')">
            글작성
          </v-btn>
        </div>
      </div>
      <div></div>
    </div>
    <div class="table-wrap">
      <v-table density="default" hover="true" class="post-table">
        <thead>
          <tr>
            <th class="text-left">SEQ</th>
            <th class="text-left">제목</th>
            <th class="text-left">작성자</th>
            <th class="text-left">작성일</th>
            <th class="text-left">조회수</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(post, index) in paginatedPosts" :key="index">
            <td>{{ startIndex + index + 1 }}</td>
            <td>
              <RouterLink :to="`/community/${post.id}`">{{
                post.title
              }}</RouterLink>
            </td>
            <td>{{ post.writer }}</td>
            <td>{{ post.regDate.slice(0, 10) }}</td>
            <td>{{ post.viewCnt }}</td>
          </tr>
        </tbody>
      </v-table>
      <!-- <v-row no-gutters align="center" justify="center">
        <v-btn
          v-if="buttonDisplay"
          depressed
          text
          :class="[
            'pagination__previous-btn',
            { 'is-disabled': previousButtonDisabled },
          ]"
          :disabled="previousButtonDisabled"
          @click="prevPage"
        >
          <span class="mdi mdi-chevron-left"></span>
          이전
        </v-btn>
        <span class="pagination__divider ml-2 mr-4" v-if="buttonDisplay"></span>
        <ul class="pagination__inner">
          <li
            class="pagination__btn-con"
            v-for="number in pageList"
            :key="number"
          >
            <button
              type="button"
              :class="['pagination__btn', { 'is-active': curPage === number }]"
              @click="changePage(number)"
            >
              {{ number }}
            </button>
          </li>
        </ul>
        <span class="pagination__divider ml-4 mr-2" v-if="buttonDisplay"></span>
        <v-btn
          v-if="buttonDisplay"
          depressed
          text
          :class="[
            'pagination__next-btn',
            { 'is-disabled': nextButtonDisabled },
          ]"
          :disabled="nextButtonDisabled"
          @click="nextPage"
        >
          다음 <span class="mdi mdi-chevron-right"></span>
        </v-btn>
      </v-row> -->
      <v-pagination
        show-first-last-page
        total-visible="5"
        ellipsis="..."
        :length="totalPages"
        @prev="prevPage"
        @next="nextPage"
        @update:model-value="changePage"
      ></v-pagination>
    </div>
  </div>
</template>

<script setup>
import { useCommunityStore } from "@/stores/community";
import { onMounted, ref, computed } from "vue";
import { useRouter } from "vue-router";

const store = useCommunityStore();
const router = useRouter();
const searchCondition = ref({
  key: "전체",
  word: "",
});

const search = async function () {
  await store.searchPostList(searchCondition.value);
};

// 현재 페이지
const curPage = ref(1);

// 한 페이지당 포스트 수
const postsPerPage = 10;

// 페이지 수 계산
const totalPages = computed(() =>
  Math.ceil(store.postList.length / postsPerPage)
);

// 시작 인덱스 계산
const startIndex = computed(() => (curPage.value - 1) * postsPerPage);

// 페이지네이션된 포스트 목록
const paginatedPosts = computed(() =>
  store.postList.slice(startIndex.value, startIndex.value + postsPerPage)
);

// 페이지 목록
const pageList = computed(() => {
  const pages = [];
  for (let i = 1; i <= totalPages.value; i++) {
    pages.push(i);
  }
  return pages;
});

// 버튼 표시 여부
const buttonDisplay = computed(() => totalPages.value > 1);

// 이전 버튼 비활성화 여부
const previousButtonDisabled = computed(() => curPage.value === 1);

// 다음 버튼 비활성화 여부
const nextButtonDisabled = computed(() => curPage.value === totalPages.value);

// 페이지 변경 함수
const changePage = (pageNumber) => {
  if (pageNumber > 0 && pageNumber <= totalPages.value) {
    curPage.value = pageNumber;
  }
};

// 이전 버튼 클릭 핸들러
const prevPage = () => {
  if (curPage.value > 1) {
    curPage.value--;
  }
};

// 다음 버튼 클릭 핸들러
const nextPage = () => {
  if (curPage.value < totalPages.value) {
    curPage.value++;
  }
};

onMounted(async () => {
  await store.getPostList();
});
</script>

<style scoped>
.community-container {
  margin: 0 19%;
}

.community-tool {
  display: flex;
  width: 100%;
  margin-top: 50px;
}

.tool-left {
  display: flex;
  margin-top: 5px;
}

.search-condition {
  width: 150px;
  margin-right: 10px;
}

.search-input {
  width: 200px;
}

.search-btn {
  color: rgb(245, 245, 245);
  margin-left: 10px;
  margin-top: 4px;
}

.write-btn {
  margin-left: auto;
}

.table-wrap {
  margin-bottom: 20px;
}

.post-table th,
.post-table td {
  vertical-align: middle;
}

.post-table a {
  text-decoration: none;
  color: black;
}
</style>
