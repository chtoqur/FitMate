import { ref, computed } from "vue";
import { defineStore } from "pinia";
import axios from "axios";

const REST_ROUTINE_API = "http://localhost:8080/routine";

export const useRoutineStore = defineStore("routine", () => {
  const routineList = ref([]);

  const routine = ref({});

  const getAllRoutineList = async () => {
    try {
      const response = await axios({
        url: REST_ROUTINE_API,
        method: "GET",
      });
      routineList.value = response.data;
      routineList.value.forEach((el) => {
        el.courses = JSON.parse(el.courses);
        el.img = "url('src/assets/img/routine/" + el.id + ".PNG')";
      });
    } catch (err) {
      console.log(err);
    }
    console.log(routineList.value);
  };

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
    getAllRoutineList,
    getRoutine,
  };
});
