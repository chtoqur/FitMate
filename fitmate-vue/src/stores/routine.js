import { ref, computed } from "vue";
import { defineStore } from "pinia";

export const useRoutineStore = defineStore("routine", () => {
  const routineList = ref([
    {
      id: 1,
      title: "허벅지 집중 루틴",
      img: "url('src/assets/img/routine/1.jpg')",
      level: 2,
      part: "하체",
      courses: [
        {
          id: 5,
          set: "3",
          reps: "10회",
        },
        {
          id: 6,
          set: "3",
          reps: "10회",
        },
        {
          id: 7,
          set: "3",
          reps: "10회",
        },
        {
          id: 8,
          set: "5",
          reps: "5회",
        },
        {
          id: 9,
          set: "3",
          reps: "10회",
        },
        {
          id: 10,
          set: "5",
          reps: "10회",
        },
      ],
    },
    {
      id: 2,
      title: "어깨 집중 루틴",
      img: "url('src/assets/img/routine/2.jpg')",
      level: 2,
      part: "어깨",
      courses: [
        {
          id: 2,
          name: "랫풀다운",
          set: "3",
          reps: "10회",
        },
        {
          id: 3,
          name: "덤벨 숄더 프레스",
          set: "3",
          reps: "10회",
        },
        {
          id: 1,
          name: "덤벨 벤치 프레스",
          set: "3",
          reps: "10회",
        },
        {
          id: 4,
          name: "라잉 레그 컬",
          set: "3",
          reps: "10회",
        },
      ],
    },
    {
      id: 3,
      title: "하체 집중 루틴",
      img: "",
      level: 2,
      part: "하체",
      courses: [
        {
          id: 2,
          name: "랫풀다운",
          set: "3",
          reps: "10회",
        },
        {
          id: 3,
          name: "덤벨 숄더 프레스",
          set: "3",
          reps: "10회",
        },
        {
          id: 1,
          name: "덤벨 벤치 프레스",
          set: "3",
          reps: "10회",
        },
        {
          id: 4,
          name: "라잉 레그 컬",
          set: "3",
          reps: "10회",
        },
      ],
    },
    {
      id: 4,
      title: "복근 집중 루틴",
      img: "",

      level: 2,
      part: "복근",
      courses: [
        {
          id: 2,
          name: "랫풀다운",
          set: "3",
          reps: "10회",
        },
        {
          id: 3,
          name: "덤벨 숄더 프레스",
          set: "3",
          reps: "10회",
        },
        {
          id: 1,
          name: "덤벨 벤치 프레스",
          set: "3",
          reps: "10회",
        },
        {
          id: 4,
          name: "라잉 레그 컬",
          set: "3",
          reps: "10회",
        },
      ],
    },
    {
      id: 5,
      title: "프레임을 넓히는 등 루틴",
      level: 3,
      part: "등",
      courses: [
        {
          id: 2,
          name: "랫풀다운",
          set: "3",
          reps: "10회",
        },
        {
          id: 3,
          name: "덤벨 숄더 프레스",
          set: "3",
          reps: "10회",
        },
        {
          id: 1,
          name: "덤벨 벤치 프레스",
          set: "3",
          reps: "10회",
        },
        {
          id: 4,
          name: "라잉 레그 컬",
          set: "3",
          reps: "10회",
        },
      ],
    },
    {
      id: 6,
      title: "힙업 하체 루틴",
      level: 1,
      part: "하체",
      courses: [
        {
          id: 2,
          name: "랫풀다운",
          set: "3",
          reps: "10회",
        },
        {
          id: 3,
          name: "덤벨 숄더 프레스",
          set: "3",
          reps: "10회",
        },
        {
          id: 1,
          name: "덤벨 벤치 프레스",
          set: "3",
          reps: "10회",
        },
        {
          id: 4,
          name: "라잉 레그 컬",
          set: "3",
          reps: "10회",
        },
      ],
    },
    {
      id: 7,
      title: "단단한 코어를 위한 복근 루틴",
      level: 1,
      part: "복근",
      courses: [
        {
          id: 2,
          name: "랫풀다운",
          set: "3",
          reps: "10회",
        },
        {
          id: 3,
          name: "덤벨 숄더 프레스",
          set: "3",
          reps: "10회",
        },
        {
          id: 1,
          name: "덤벨 벤치 프레스",
          set: "3",
          reps: "10회",
        },
        {
          id: 4,
          name: "라잉 레그 컬",
          set: "3",
          reps: "10회",
        },
      ],
    },
    {
      id: 8,
      title: "덤벨로 수행하는 하체 루틴",
      level: 3,
      part: "하체",
      courses: [
        {
          id: 2,
          name: "랫풀다운",
          set: "3",
          reps: "10회",
        },
        {
          id: 3,
          name: "덤벨 숄더 프레스",
          set: "3",
          reps: "10회",
        },
        {
          id: 1,
          name: "덤벨 벤치 프레스",
          set: "3",
          reps: "10회",
        },
        {
          id: 4,
          name: "라잉 레그 컬",
          set: "3",
          reps: "10회",
        },
      ],
    },
    {
      id: 9,
      title: "팔 집중 루틴",
      level: 1,
      part: "팔",
      courses: [
        {
          id: 2,
          name: "랫풀다운",
          set: "3",
          reps: "10회",
        },
        {
          id: 3,
          name: "덤벨 숄더 프레스",
          set: "3",
          reps: "10회",
        },
        {
          id: 1,
          name: "덤벨 벤치 프레스",
          set: "3",
          reps: "10회",
        },
        {
          id: 4,
          name: "라잉 레그 컬",
          set: "3",
          reps: "10회",
        },
      ],
    },
  ]);

  const routine = ref({});

  const getRoutine = function (id) {
    routineList.value.map((el) => {
      if (el.id == id) {
        routine.value = el;
      }
    });
  };

  return {
    routineList,
    routine,
    getRoutine,
  };
});
