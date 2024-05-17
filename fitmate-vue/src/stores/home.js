import { ref, computed } from "vue";
import { defineStore } from "pinia";
import { useCommunityStore } from '@/stores/community';
import { useVideoStore } from "@/stores/video";

export const useHomeStore = defineStore("home", ()=>{
  
  const communityStore = useCommunityStore();
  const videoStore = useVideoStore();
  const popularPostList = ref([]);
  const rankedVideos = ref([]);


  const getPopularPosts = function() {
    popularPostList.value = communityStore.postList.sort((postA, postB)=>{
      return postB.commentCnt - postA.commentCnt;
    }).slice(0, 5);
  }

  const getRankedVideos = function() {
    rankedVideos.value = videoStore.videoList.sort((videoA, videoB)=>{
      return videoB.viewCnt - videoA.viewCnt;
    }).slice(0, 5);
  }

  return {
    popularPostList,
    getPopularPosts,
    rankedVideos,
    getRankedVideos,
  }
})