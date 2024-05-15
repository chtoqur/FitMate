<template>
  <div>
    <h3>{{ routineStore.routine.title }}</h3>
    <hr>
    <div>
      <table>
        <thead>
          <tr>
            <th>운동이름</th>
            <th>세트</th>
            <th>횟수</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="course in routineStore.routine.courses" :key="course.id">
            <td>{{ course.name }}</td>
            <td>{{ course.set }}</td>
            <td>{{ course.reps }}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div v-for="course in routineStore.routine.courses" :key="course.id">
      <ExerciseDetail :exercise="findExercise(course.id)" />
    </div>
  </div>
</template>

<script setup>
import { useRoute } from 'vue-router';
import { useRoutineStore } from '@/stores/routine';
import { useExerciseStore } from '@/stores/exercise';
import { onMounted, ref } from 'vue';
import ExerciseDetail from '../exercise/ExerciseDetail.vue';

const routineStore = useRoutineStore();
const exerciseStore = useExerciseStore();
const route = useRoute();

const findExercise = (id) => {
  return exerciseStore.exerciseList.find(exercise => exercise.id == id);
}

onMounted(() => {
  routineStore.getRoutine(route.params.id);
})

</script>

<style scoped>

</style>