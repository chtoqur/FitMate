import { ref } from "vue";
import { defineStore } from "pinia";
import axios from "axios";

const REST_EXERCISE_API = "http://localhost:8080/exercise";

export const useExerciseStore = defineStore("exercise", () => {
  const exerciseList = ref([]);

  const getAllExerciseList = async () => {
    try {
      const response = await axios({
        url: REST_EXERCISE_API,
        method: "GET",
      });
      exerciseList.value = response.data;
    } catch (err) {
      console.log(err);
    }
    console.log(exerciseList);
  };

  return {
    exerciseList,
    getAllExerciseList,
  };
});
