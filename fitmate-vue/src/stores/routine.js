import { ref, computed } from "vue";
import { defineStore } from "pinia";

export const useRoutineStore = defineStore("routine", ()=>{
  
  const routineList = ref([
    {
      id: 1,
      title: "초보를 위한 전신 루틴 for men",
      level: 1,
      part: "전신",
      courses: [
        {
          id: 1,
          name: "덤벨 벤치 프레스",
          set: "3",
          reps: "8~12회"
        },
        {
          id: 2,
          name: "랫풀다운",
          set: "3",
          reps: "8~12회"
        },
        {
          id: 3,
          name: "덤벨 숄더 프레스",
          set: "3",
          reps: "8~12회"
        },
        {
          id: 4,
          name: "라잉 레그 컬",
          set: "3",
          reps: "8~12회"
        }
      ]
    },
    {
      id: 2,
      title: "초보를 위한 전신 루틴 for women",
      level: 3,
      part: "전신",
      courses: [
        {
          id: 2,
          name: "랫풀다운",
          set: "3",
          reps: "10회"
        },
        {
          id: 3,
          name: "덤벨 숄더 프레스",
          set: "3",
          reps: "10회"
        },
        {
          id: 1,
          name: "덤벨 벤치 프레스",
          set: "3",
          reps: "10회"
        },
        {
          id: 4,
          name: "라잉 레그 컬",
          set: "3",
          reps: "10회"
        }
      ]
    },
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