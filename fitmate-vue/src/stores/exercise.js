import { ref, computed } from "vue";
import { defineStore } from "pinia";

export const useExerciseStore = defineStore("exercise", ()=>{
  
  const exerciseList = ref([
    {
      id: 1,
      name: "덤벨 벤치 프레스",
      part: "가슴",
      gifSrc: "/src/assets/img/exercise/dumbbell_bench_press.gif",
      description: "1. 덤벨을 양손에 들고 벤치에 가슴을 펴고 누운 상태에서, 덤벨을 수직으로 들어올립니다.\n" +
      "2. 덤벨이 가로로 놓이게 잡아주고, 가슴 근육의 이완을 느끼며 팔을 굽히고 덤벨을 아래로 내립니다.\n"+
      "3. 가슴 근육의 수축을 느끼며 몸의 수직방향으로 덤벨을 밀어올립니다."
    },
    {
      id: 2,
      name: "랫풀다운",
      part: "등",
      gifSrc: "/src/assets/img/exercise/lat_pull_downs.gif",
      description: "1. 허벅지를 지지대에 고정하고 가슴을 편상태로,\n" +
      "2. 바가 쇄골에 닿을정도로 바를 당겨줍니다. (이 때, 팔이 아닌 등(광배근)의 힘으로 바를 당겨줍니다.)\n" +
      "3. 광배근이 이완하는 것을 느끼면서 천천히 팔을 폅니다."
    },
    {
      id: 3,
      name: "덤벨 숄더 프레스",
      part: "어깨",
      gifSrc: "/src/assets/img/exercise/dumbbell_shoulder_press.gif",
      description: "1. 머신에 엎드린 상태에서, 종아리 쪽의 패드가 아킬레스건 바로 위쪽에 위치하도록 머신을 조정합니다.\n" +
      "2. 발목을 세운 상태에서, 무릎을 굽혀 기구를 올려줍니다.\n" +
      "3. 허리, 엉덩이, 햄스트링에 긴장감을 유지하면서 기구를 천천히 내립니다."
    },
    {
      id: 4,
      name: "라잉 레그컬",
      part: "하체",
      gifSrc: "/src/assets/img/exercise/lying_leg_curl.gif",
      description: "1. 양손에 덤벨을 잡고 팔을 옆으로 벌려서, 덤벨을 머리와 나란히 위치시킵니다.\n" +
      "2. 어깨를 아래방향으로 지그시 누르면서 덤벨을 수직 방향으로 밀어올립니다.\n" +
      "3. 어깨의 자극을 느끼면서, 덤벨을 내려 시작 자세로 돌아옵니다."
    },
  ])

  return {
    exerciseList,
  }
})