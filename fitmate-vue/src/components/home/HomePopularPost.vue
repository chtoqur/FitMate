<template>
  <div class="popular-post">
    <div class="popular-title">
      <h3>커뮤니티 인기글</h3>
    </div>
    <ol>
      <li
        v-for="(post, index) in homeStore.popularPostList"
        :key="post.id"
        class="popular-li"
      >
        <!-- <RouterLink :to="`community/${post.id}`"> -->
        <a href="#" class="popular-link">
          <div class="wrap-info">
            <span class="post-idx">{{ index + 1 }}</span>
            <div class="wrap-title">
              <span class="mdi mdi-image" v-if="post.file.length !== 0"></span>
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
        </a>
        <!-- </RouterLink> -->
      </li>
    </ol>
  </div>
</template>

<script setup>
import { ref, onBeforeMount, computed } from "vue";
import { useHomeStore } from "@/stores/home";
import { useCommunityStore } from "@/stores/community";

const homeStore = useHomeStore();
const communityStore = useCommunityStore();

onBeforeMount(() => {
  communityStore.getPostList();
  homeStore.getPopularPosts();
});
</script>

<style scoped>
.popular-post {
  margin-top: 50px;
}

.popular-title {
  display: flex;
  height: 30px;
  align-items: center;
  margin-bottom: 15px;
}

.popular-title h3 {
  border: 1px solid black;
  border-radius: 7px;
  padding: 10px;
}

.popular-title h3:hover {
  cursor: default;
}

.popular-li {
  display: flex;
  width: 500px;
  border-bottom: 1px solid rgb(206, 205, 205);
}

.popular-li:hover {
  background-color: rgb(236, 236, 236);
}

.popular-link {
  display: flex;
  height: 50px;
  width: 100%;
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

.mdi-image {
  margin-right: 5px;
  color: gray;
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
