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
      description: "1. 허벅지 지지대의 높낮이를 알맞게 조절하고, 바를 어깨너비보다 넓게 잡고 의자에 앉습니다.\n" +
      "2. 바가 쇄골에 닿을정도로 바를 당겨줍니다. (이 때, 팔이 아닌 등(광배근)의 힘으로 바를 당겨줍니다.)\n" +
      "3. 광배근이 이완하는 것을 느끼면서 천천히 팔을 폅니다."
    },
    {
      id: 3,
      name: "덤벨 숄더 프레스",
      part: "어깨",
      gifSrc: "/src/assets/img/exercise/dumbbell_shoulder_press.gif",
      description: "1. 양손에 덤벨을 잡고 팔을 옆으로 벌려서, 덤벨을 머리와 나란히 위치시킵니다.\n" +
      "2. 어깨를 아래 방향으로 지그시 누르면서 덤벨을 수직 방향으로 밀어올립니다.\n" +
      "3. 어깨의 자극을 느끼면서, 덤벨을 내려 시작 자세로 돌아옵니다."
    },
    {
      id: 4,
      name: "라잉 레그컬",
      part: "하체",
      gifSrc: "/src/assets/img/exercise/lying_leg_curl.gif",
      description: "1. 머신에 엎드린 상태에서, 종아리 쪽의 패드가 아킬레스건 바로 위쪽에 위치하도록 머신을 조정합니다.\n" +
      "2. 발목을 세운 상태에서, 무릎을 굽혀 기구를 올려줍니다.\n" +
      "3. 허리, 엉덩이, 햄스트링에 긴장감을 유지하면서 기구를 천천히 내립니다."
    },
    {
      id: 5,
      name: "바벨 스쿼트",
      part: "하체",
      gifSrc: "/src/assets/img/exercise/barbell_squat.gif",
      description: "1. 바벨을 어깨높이에 거치한 후 다리는 어깨너비로 벌리고 발끝은 20~30도 정도 벌립니다.\n" +
      "2. 가슴을 펴고 허리를 세운 상태로 고관절부터 접어 엉덩이가 밑으로 내려가게 해줍니다.\n" +
      "3. 자연스럽게 무릎이 접히면서 허벅지가 지면과 수평이 될 때까지 내려갑니다.\n" +
      "4. 발바닥 중앙으로 강하게 밀면서 무릎과 고관절을 차례로 펴고, 시작 자세로 돌아옵니다."
    },
    {
      id: 6,
      name: "데드 리프트",
      part: "하체",
      gifSrc: "/src/assets/img/exercise/deadlift.gif",
      description: "1. 양손에 덤벨을 잡고 팔을 옆으로 벌려서, 덤벨을 머리와 나란히 위치시킵니다.\n" +
      "2. 어깨를 아래방향으로 지그시 누르면서 덤벨을 수직 방향으로 밀어올립니다.\n" +
      "3. 어깨의 자극을 느끼면서, 덤벨을 내려 시작 자세로 돌아옵니다."
    },
    {
      id: 7,
      name: "레그 프레스",
      part: "하체",
      gifSrc: "/src/assets/img/exercise/leg_press.gif",
      description: "1. 엉덩이와 허리가 의자에 완전히 붙도록 밀착하여 앉고, 두 발을 어깨 너비만큼 벌려줍니다.\n" +
      "2. 안전핀을 제거하고, 중량의 자극을 느끼며 무릎을 굽혀줍니다. 엉덩이와 허리가 뜨지않을 깊이까지 중량판을 내립니다.\n" +
      "3. 복부에 힘을 유지한채로, 중량판을 지그시 밀어 올립니다."
    },
    {
      id: 8,
      name: "레그 익스텐션",
      part: "하체",
      gifSrc: "/src/assets/img/exercise/leg_extensions.gif",
      description: "1. 기구에 앉아 발목 패드 아래에 발을 위치시킨 후, 다리를 끝까지 펴주는 동작을 수행합니다.\n" +
      "2. 허벅지에 힘을 주고, 복부에는 긴장을 유지합니다.\n" +
      "3. 다리를 펼 때는 숨을 내쉬고, 내릴 때는 들이마십니다."
    },
    {
      id: 9,
      name: "덤벨런지",
      part: "하체",
      gifSrc: "/src/assets/img/exercise/dumbbell_lunge.gif",
      description: "1. 양손에 덤벨을 들고 어깨 너비로 발을 벌린 후, 한 쪽 다리를 앞으로 내딛으면서 무릎을 90도 각도로 굽힙니다.\n" +
      "2. 이 때 상체는 곧게 유지하고, 뒤쪽 무릎이 바닥에 닿지 않도록 주의합니다.\n" +
      "3. 앞쪽 다리로 밀어준 후, 천천히 원위치로 돌아옵니다."
    },
    {
      id: 10,
      name: "에어 스쿼트",
      part: "하체",
      gifSrc: "/src/assets/img/exercise/air_squat.gif",
      description: "1. 발을 어깨 너비로 벌리고, 상체를 곧게 유지한 채 엉덩이를 뒤로 빼면서 내려갑니다.\n" +
      "2. 내려갈 때는 무릎이 발끝을 넘어가지 않도록 주의합니다.\n" +
      "3. 가능한 한 깊이 내려간 후 힘을 끝까지 발휘하여 일어섭니다."
    },
    {
      id: 11,
      name: "크런치",
      part: "복근",
      gifSrc: "/src/assets/img/exercise/crunch.gif",
      description: "1. 무릎을 굽히고 바닥에 누워, 양손은 가슴 앞이나 머리 뒤로 올려 고정합니다.\n" +
      "2. 등 전체가 아닌 상체 윗부분만 서서히 들어올려, 복근의 윗 부분의 수축감을 느낍니다.\n" +
      "3. 윗 복근의 긴장감을 느끼면서 천천히 내려옵니다."
    },

  ])

  return {
    exerciseList,
  }
})