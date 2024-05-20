<template>
  <div class="routine-detail">
    <div class="routine-title">
      <h4>{{ routineStore.routine.title }}</h4>
      <div class="sub-info">
        <p>운동 부위 : {{ routineStore.routine.part }}</p>
        <p>난이도 : {{ routineStore.routine.level }}</p>
      </div>
    </div>
    <hr>
    <div class="routine-summary">
      <div class="summary-title">
        <span>루틴 요약&nbsp;&#128293;</span>
      </div>
      <div>
        <v-table class="summary-table">
          <thead>
            <th class="text-left">운동이름</th>
            <th class="text-left">세트</th>
            <th class="text-left">횟수</th>
          </thead>
          <tbody>
            <tr v-for="course in routineStore.routine.courses" :key="course.id">
              <td>{{ getExerciseName(course.id) }}</td>
              <td>{{ course.set }}</td>
              <td>{{ course.reps }}</td>
            </tr>
          </tbody>
        </v-table>
      </div>
    </div>
    <hr>
    <div>
      <div class="summary-title">
        <span>시작하기&nbsp;&#128170;</span>        
      </div>
      <div v-for="course in routineStore.routine.courses" :key="course.id">
        <ExerciseDetail :exercise="findExercise(course.id)" />
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRoute } from 'vue-router';
import { useRoutineStore } from '@/stores/routine';
import { useExerciseStore } from '@/stores/exercise';
import { onMounted, ref, computed } from 'vue';
import ExerciseDetail from '../exercise/ExerciseDetail.vue';

const routineStore = useRoutineStore();
const exerciseStore = useExerciseStore();
const route = useRoute();

const findExercise = (id) => {
  return exerciseStore.exerciseList.find(exercise => exercise.id == id);
}

const getExerciseName = (id) => {
  const exercise = exerciseStore.exerciseList.find(exercise => exercise.id == id);
  return exercise ? exercise.name : 'Unknown Exercise';
}

onMounted(() => {
  routineStore.getRoutine(route.params.id);
})

</script>

<style scoped>
.routine-detail {
  margin: 0 35%;
}

.routine-title {
  margin-top: 80px;
  height: 150px;
  align-items: center;
}

.routine-title > h4 {
  font-size: 48px;
  margin-bottom: 30px;
}

.sub-info {
  line-height: 20px;
}

hr {
  background: rgb(197, 197, 197);
  height: 1px;
  border: 0;
  margin-bottom: 50px;
}

.routine-summary {
  margin-bottom: 50px;
}

.summary-title {
  font-size: 30px;
  font-weight: 600;
  margin-bottom: 40px;
}

.summary-table {
  border: 1px solid rgb(209, 208, 208);
  font-size: 20px;
}

.summary-table thead {
  height: 60px;
  border-bottom: 1px solid rgb(195, 194, 194);
}

.summary-table td,
.summary-table th {
  align-items: center;
  vertical-align: middle;
}

.text-left {
  padding: 0 1rem;
}
</style>