<template>
  <div class="community-container">
    <div>
      <div class="community-tool">
        <div class="tool-left">
          <div class="search-condition">
            <v-combobox
              :items="['제목', '작성자', '글내용']"
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
          <v-btn
            class="ma-2"
            v-if="userStore.loginUser.id !== ''"
            @click="router.push('/writePost')"
          >
            <span class="mdi mdi-lead-pencil">&nbsp;</span>
            글작성
          </v-btn>
        </div>
      </div>
      <div></div>
    </div>
    <div class="table-wrap">
      <v-table density="default" hover class="post-table">
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
  </div>
</template>

<script setup>
import { useCommunityStore } from "@/stores/community";
import { useUserStore } from "@/stores/user";
import { onMounted, ref, computed } from "vue";
import { useRoute, useRouter } from "vue-router";

const store = useCommunityStore();
const userStore = useUserStore();
const route = useRoute();
const router = useRouter();
const searchCondition = ref({
  key: "제목",
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

// 페이지 변경 함수
const changePage = (pageNumber) => {
  if (pageNumber > 0 && pageNumber <= totalPages.value) {
    curPage.value = pageNumber;
  }
};

onMounted(async () => {
  await store.getPostList();

  if (route.query.write === "true") {
    searchCondition.value.key = "작성자";
    searchCondition.value.word = sessionStorage.getItem("id");
    search();
  }
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

.post-table {
  margin-bottom: 40px;
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
