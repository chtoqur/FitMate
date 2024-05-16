import { ref, computed } from "vue";
import { defineStore } from "pinia";
import { useCommunityStore } from '@/stores/community';

export const useHomeStore = defineStore("home", ()=>{
  
  const communityStore = useCommunityStore();
  const popularPostList = ref([]);

  const getPopularPosts = function() {
    popularPostList.value = communityStore.postList.sort((postA, postB)=>{
      return postB.commentCnt - postA.commentCnt;
    }).slice(0, 5);
  }

  return {
    popularPostList,
    getPopularPosts,
  }
})