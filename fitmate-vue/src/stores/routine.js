import { ref, computed } from "vue";
import { defineStore } from "pinia";
import { useRouter } from "vue-router";

export const useRoutineStore = defineStore("routine", () => {
  
  const router = useRouter();
  const routineList = ref([
    {
      id: 1,
      title: "초보를 위한 전신 루틴 for men",
      level: "●○○",
      courses: [
        {
          name: "덤벨 벤치 프레스",
          set: "3",
          reps: "8~12회"
        },
        {
          name: "랫풀다운",
          set: "3",
          reps: "8~12회"
        },
        {
          name: "덤벨 숄더 프레스",
          set: "3",
          reps: "8~12회"
        },
        {
          name: "레그 프레스",
          set: "3",
          reps: "8~12회"
        },
        {
          name: "라잉 레그 컬",
          set: "3",
          reps: "8~12회"
        },
        {
          name: "크런치",
          set: "3",
          reps: "8~12회"
        },
      ]
    },
    {
      id: 2,
      title: "초보를 위한 전신 루틴 for women",
      level: "●○○",
      courses: [
        {
          name: "에어 스쿼트",
          set: "3",
          reps: "10회"
        },
        {
          name: "덤벨 벤치 프레스",
          set: "3",
          reps: "10회"
        },
        {
          name: "덤벨 루마니안 데드리프트",
          set: "3",
          reps: "10회"
        },
        {
          name: "플랭크",
          set: "3",
          reps: "30초"
        },
        {
          name: "덤벨 로우",
          set: "3",
          reps: "10회"
        },
        {
          name: "크런치",
          set: "3",
          reps: "8~12"
        },
      ]
    },
    // {
    //   id: 3,
    //   title: "코어 운동 루틴",
    //   난이도: 1,
    // },
    // {
    //   id: 4,
    //   title: "덤벨을 통한 상체 운동 루틴",
    //   난이도: 2
    // }
  ]);

  const routine = ref({});

  const getRoutine = function(id) {
    routineList.value.map((el)=>{
      if (el.id == id) {
        routine.value = el;
      }
    })
  }

  return {
    routineList,
    routine,
    getRoutine,
  }
})