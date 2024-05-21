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
            :items="['제목', '게시글 + 댓글', '글작성자', '댓글내용', '댓글작성자']"
            variant="solo"
            density="compact"
            class="search-con-box"
            placeholder="검색 기준"
            ></v-combobox>
          </div>
          <div class="search-input">
            <v-text-field label="" density="compact">
            </v-text-field>
          </div>
          <v-btn
          class="search-btn"
          size="32px"
          icon="mdi-magnify"
          color="rgb(235, 235, 235)"
          ></v-btn>
        </div>
        <div class="write-btn">
          <v-btn class="ma-2"
          @click="router.push('/writePost')">
          글작성
          </v-btn>
        </div>
      </div>
      <div>
        
      </div>
    </div>
    <div class="table-wrap">
      <v-table density="default" hover="true"
      class="post-table">
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
          <tr v-for="post, index in store.postList" :key="index">
            <td>{{ index + 1 }}</td>
            <td>
              <RouterLink :to="`/community/${post.id}`"
              >{{ post.title }}
              </RouterLink>
            </td>
            <td>{{ post.writer }}</td>
            <td>{{ post.regDate.slice(0, 10) }}</td>
            <td>{{ post.viewCnt }}</td>
          </tr>
        </tbody>
      </v-table>
    </div>
    <div>
      <v-row no-gutters align="center" justify="center">
        <v-btn
          v-if="buttonDisplay"
          depressed
          text
          :class="['pagination__previous-btn', { 'is-disabled': previousButtonDisabled }]"
          :disabled="previousButtonDisabled"
          @click="previous"
        >
          <span class="mdi mdi-chevron-left"></span>
          이전
        </v-btn>
        <span class="pagination__divider ml-2 mr-4" v-if="buttonDisplay"></span>
        <ul class="pagination__inner">
          <li class="pagination__btn-con" v-for="number in pageList" :key="number">
            <button type="button" :class="['pagination__btn', { 'is-active': value === number }]" @click="change(number)">
              {{ number }}
            </button>
          </li>
        </ul>
        <span class="pagination__divider ml-4 mr-2" v-if="buttonDisplay"></span>
        <v-btn
          v-if="buttonDisplay"
          depressed
          text
          :class="['pagination__next-btn', { 'is-disabled': nextButtonDisabled }]"
          :disabled="nextButtonDisabled"
          @click="next"
        >
          다음 <span class="mdi mdi-chevron-right"></span>
        </v-btn>
      </v-row>
      <!-- <v-pagination :length="4"
      prev="clickPrev"
      next="clickNext"
      ></v-pagination> -->
    </div>
  </div>
</template>

<script setup>
import { useCommunityStore } from "@/stores/community";
import { onMounted, ref, computed } from "vue";
import { useRouter } from "vue-router";

const store = useCommunityStore();
const router = useRouter();

// 로우 관련 정보
let rowCount = ref(0);           // 전체 건수
   
// 페이지네이션
// 페이지 관련 정보
let pageDisplayCount = 10;        // 페이지 당 건수 (테이블에서 보여지는 최대 건수)
let totalPageCount = ref(0);      // 전체 페이지 넘버
let curPage = ref(1);             // 현재 페이지 
let page = ref(0);                // 해당 변수 넘버에 따라서 페이지 동적 변화

// 섹션 관련 정보
let curSection = 0;         // 현재 섹션 (다음 버튼 = 증가, 이전 버튼 = 감소)
let pagesPerSection = 5;    // 섹션 당 페이지 수 (버튼 수와 동일)
let totalSectionNum = 0;    // 전체 섹션 개수

// 총 페이지가 5개 이하면 이전/다음 버튼을 보여주지 않음 
const buttonDisplay = computed(() => totalPageCount.value > 5);

// 현재 페이지의 그룹 번호 (현재 페이지 / 보여줄 페이지의 수)
const currentPageGroup = computed(() => Math.ceil(curPage.value / pageDisplayCount));

// 마지막 페이지 번호
const lastPageNumber = computed(() => {
  const lastNumber = currentPageGroup.value * pageDisplayCount;
  if (lastNumber > props.totalPageCount) return props.totalPageCount;
  return lastNumber;
});

// 첫번째 페이지 번호
const firstPageNumber = computed(() => {
  // 끝 번호가 26,27 이렇게 끝날 경우 페이지를 [26,27] 이렇게 보여줘야 하기에 존재하는 로직
  if (lastPageNumber.value == props.totalPageCount) {
    const multipleOfPageDisplayCount = lastPageNumber.value % props.pageDisplayCount === 0;
    return multipleOfPageDisplayCount
      ? lastPageNumber.value - props.pageDisplayCount + 1
      : lastPageNumber.value - (lastPageNumber.value % props.pageDisplayCount) + 1;
  }
  return lastPageNumber.value - (props.pageDisplayCount - 1);
});

onMounted(async () => {
  try {
    await store.getPostList();
    rowCount.value = store.postList.length;
    totalPageCount.value = Math.ceil(rowCount.value / pageDisplayCount);

    console.log(`totalPageCount: ${totalPageCount.value}`);
  } catch (error) {
    console.error("Failed to fetch post list:", error);
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

.post-table th, .post-table td {
  vertical-align: middle;
}

.post-table a {
  text-decoration: none;
  color: black;
}

</style>